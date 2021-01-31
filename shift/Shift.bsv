
function Bit#(32) shift (Bit#(2) sfn, Bit#(32) a, Bit#(5) b);
   case (sfn) matches
      'b00: return a << b;
      'b01: return a >> b;
      'b11: return signedShiftRight(a, b);
      default: return 'hDEADBEEF;
   endcase
endfunction

