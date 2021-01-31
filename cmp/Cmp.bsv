

// conditional balance in optimization
// depending on units operating in a system

// if A is going to be slow, then try to make sure B is fast

// if A is going to be fast, then it's ok if B is a little slow.

// datapath dependent clock, which is to say perhaps barely
// asynchronous.  the least amount of asynchrony as possible, how to
// generate ready signal quickly?


function Bit#(32) cmp (Bit#(2) cfn, Bool z, Bool v, Bool n);
   Bit#(32) out = 0;
   case (cfn) matches
      'b00: out[0] = 0; // bad input. consider using this for !=
      'b01: out[0] = pack(z);
      'b10: out[0] = pack(n) ^ pack(v);
      'b11: out[0] = pack(z) | (pack(n) ^ pack(v));
   endcase
   return out;
endfunction
