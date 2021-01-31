import Shift::*;
import Bool::*;
import Arith::*;
import Cmp::*;

function Bit#(32) alu(Bit#(6) fn, Bit#(32) a, Bit#(32) b);
   let sh = shift(fn[1:0], a, b[4:0]);
   //function Bit#(32) bool (Bit#(4) bfn, Bit#(32) a, Bit#(32) b);
   let bo = bool(fn[3:0], a, b);
   // function ArithOut arith (Bit#(1) afn, Bit#(32) a, Bit#(32) b);   
   let ar = arith(fn[0], a, b);
   let cm = cmp(fn[2:1], ar.z, ar.v, ar.n);
   
   case (fn[5:4]) matches 
      'b00: return cm;
      'b01: return ar.s;
      'b10: return bo;
      'b11: return sh;
   endcase
endfunction
