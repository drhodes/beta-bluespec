// import Cmp::*;
// import Shift::*;
// import Bool::*;


typedef struct {
   Bool z;
   Bool v;
   Bool n;
   Bit#(32) s;
} ArithOut deriving (Bits, Eq);

// How to remove the pack/unpack code.
function ArithOut arith (Bit#(1) afn, Bit#(32) a, Bit#(32) b);   
   let q = afn;
   Bit#(32) as = {q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q,q};
   Int#(32) xa = unpack(a);
   Int#(32) xb = unpack(as ^ b);
   
   Bit#(32) s = 0;
   if (afn == 'b1) s = pack(1 + xa + xb);
   else s = pack(xa + xb);
   
   Bit#(32) xbb = pack(xb);
   
   let z = (s == 'h00000000);
   let v = unpack((a[31] & xbb[31] & (~s[31])) | (~(a[31]) & ~(xbb[31]) & s[31]));
   let n = s[31] == 'b1;

   return ArithOut{z:z, v:v, n:n, s:s};
endfunction
