
function Bit#(32) bool (Bit#(4) bfn, Bit#(32) a, Bit#(32) b);
   Bit#(32) y = 0; // output y.
   
   for (Integer i=0; i<32; i = i+1)
      case ({b[i], a[i]}) matches
         'b00: y[i] = bfn[0];
         'b01: y[i] = bfn[1];
         'b10: y[i] = bfn[2];
         'b11: y[i] = bfn[3];
      endcase
   return y;
endfunction
