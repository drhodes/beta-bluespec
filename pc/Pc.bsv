typedef struct {
   Bit#(32) pc;
   Bit#(32) pc_inc;
   Bit#(32) pc_offset;
} PcOut deriving (Bits, Eq);

interface ProgramCounter;
   method Action reset_unit();
   method PcOut read();
   method Action next (Bit#(1) reset, Bit#(3) pc_sel, Bit#(16) id, Bit#(32) jt);
endinterface

function Bit#(32) signExtend16(Bit#(16) xs);
   Bit#(16) temp = 0;
   for (Integer i = 15; i >= 0; i = i-1) temp[i] = xs[15];
   return {temp, xs};
endfunction


(* synthesize *)   
module mkPc (ProgramCounter); 
   Reg#(Bit#(32)) pc <- mkReg('h8000_0000);
   Wire#(Bit#(32)) pc_inc <- mkWire();
   Wire#(Bit#(32)) pc_offset <- mkWire();
   Wire#(Bit#(16)) id <- mkWire();

   Wire#(Bool) do_update_pc_inc <- mkWire();
   Wire#(Bool) do_update_pc_offset <- mkWire();
   Wire#(Bool) do_update_id <- mkWire();

   rule update_pc_inc(do_update_pc_inc);
      pc_inc <= {pc[31:2], 'b00} + 4;
   endrule
   
   rule update_pc_offset(do_update_pc_offset);
      Bit#(32) sum = (pc + 4) + 4 * signExtend16(id);
      pc_offset <= {pc[31], sum[30:0]};
   endrule
   
   method PcOut read();
      return PcOut{pc:pc, pc_inc:pc_inc, pc_offset:pc_offset};
   endmethod
   
   method Action reset_unit;
      pc <= 'h8000_0000;
   endmethod
   
   method Action next (Bit#(1) reset, Bit#(3) pc_sel, Bit#(16) _id, Bit#(32) jt);
      id <= _id;
      let reset_mux = ?;
   
      let super_bit = pc[31] & jt[31];

      if (reset == 1) 
         reset_mux = 'h8000_0000;
      else 
         case (pc_sel) matches
            0: reset_mux = pc_inc;
            1: reset_mux = pc_offset;
            2: reset_mux = {super_bit, jt[31:2], 'b00};
            3: reset_mux = 'h80000004; // illegal opcode
            4: reset_mux = 'h80000008; // interrupt            
         endcase
   
      // this update is appears in the next clock cycle.
      pc <= {reset_mux[31:2], 'b00};
   
   endmethod   
endmodule

