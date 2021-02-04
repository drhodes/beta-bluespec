function Bit#(32) signExtend16(Bit#(16) xs);
   Bit#(16) temp = 0;
   for (Integer i = 15; i >= 0; i = i-1) temp[i] = xs[15];
   return {temp, xs};
endfunction

interface ProgramCounter;
   method Action reset_unit();
   method Bit#(32) read_pc();
   method Action next (Bit#(1) reset, Bit#(3) pc_sel, Bit#(16) id, Bit#(32) jt);
endinterface

module mkPc (ProgramCounter); 
   Reg#(Bit#(32)) pc <- mkReg('h8000_0000);
   
   method Bit#(32) read_pc(); return pc; endmethod
   
   method Action reset_unit;
	  pc <= 'h8000_0000;
   endmethod
   
   method Action next (Bit#(1) reset, Bit#(3) pc_sel, Bit#(16) id, Bit#(32) jt);
      let reset_mux = ?;
      let super_bit = pc[31] & jt[31];
   
	  Bit#(1) zero = 'b0;
	  Bit#(32) pc_inc = {pc[31], {pc[30:2], 'b00} + 4};
   
	  let a = id[15];
	  // this is awful, need to find a better way to repeat signals.
	  // hmm TODO: build a recursive repeat function with parameterized width
	  Bit#(32) inA = {a,a,a,a,a, a,a,a,a,a, a,a,a,a, id, zero, zero};
	  let sum = inA + pc_inc[31:0];
   
	  Bit#(32) pc_offset = {pc[31], sum[30:0]};

      if (reset == 1) 
         reset_mux = 'h8000_0000;
      else 
         case (pc_sel) matches
            'b000: reset_mux = pc_inc; 
            'b001: reset_mux = pc_offset; 
            'b010: reset_mux = {super_bit, jt[30:2], 'b00};
            'b011: reset_mux = 'h80000004; // illegal opcode
            'b100: reset_mux = 'h80000008; // interrupt            
         endcase
   
      // this update is appears in the next clock cycle.
      pc <= {reset_mux[31:2], 'b00};
   
   endmethod   
endmodule

