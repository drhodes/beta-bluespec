import Arith::*;

(* synthesize *)
module mkTbArith(Empty);
   function testOne (Bit#(1) afn, Bit#(32) a, Bit#(32) b, ArithOut exp) = 
   action
      let got = arith(afn, a, b);
      if (got != exp)
         $display("FAIL afn:%b, a:%h, b:%h got: %b, expected: s:%b, z:%b, v:%b, n:%b ", afn, a, b, got, exp.s, exp.z, exp.v, exp.n);
      else
         $display("PASS afn:%b, a:%h, b:%h got: %b, expected: s:%b, z:%b, v:%b, n:%b ", afn, a, b, got, exp.s, exp.z, exp.v, exp.n);

   endaction;

   rule testAll;
      testOne('b0, 'h00000000, 'h00000000, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b0, 'h00000000, 'h00000001, ArithOut{s:'h00000001, z:False, v:False, n:False});
      testOne('b0, 'h00000000, 'hFFFFFFFF, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b0, 'h00000000, 'hAAAAAAAA, ArithOut{s:'hAAAAAAAA, z:False, v:False, n:True});
      testOne('b0, 'h00000000, 'h55555555, ArithOut{s:'h55555555, z:False, v:False, n:False});
      testOne('b0, 'h00000001, 'h00000000, ArithOut{s:'h00000001, z:False, v:False, n:False});
      testOne('b0, 'h00000001, 'h00000001, ArithOut{s:'h00000002, z:False, v:False, n:False});
      testOne('b0, 'h00000001, 'hFFFFFFFF, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b0, 'h00000001, 'hAAAAAAAA, ArithOut{s:'hAAAAAAAB, z:False, v:False, n:True});
      testOne('b0, 'h00000001, 'h55555555, ArithOut{s:'h55555556, z:False, v:False, n:False});
      testOne('b0, 'hFFFFFFFF, 'h00000000, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b0, 'hFFFFFFFF, 'h00000001, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b0, 'hFFFFFFFF, 'hFFFFFFFF, ArithOut{s:'hFFFFFFFE, z:False, v:False, n:True});
      testOne('b0, 'hFFFFFFFF, 'hAAAAAAAA, ArithOut{s:'hAAAAAAA9, z:False, v:False, n:True});
      testOne('b0, 'hFFFFFFFF, 'h55555555, ArithOut{s:'h55555554, z:False, v:False, n:False});
      testOne('b0, 'hAAAAAAAA, 'h00000000, ArithOut{s:'hAAAAAAAA, z:False, v:False, n:True});
      testOne('b0, 'hAAAAAAAA, 'h00000001, ArithOut{s:'hAAAAAAAB, z:False, v:False, n:True});
      testOne('b0, 'hAAAAAAAA, 'hFFFFFFFF, ArithOut{s:'hAAAAAAA9, z:False, v:False, n:True});
      testOne('b0, 'hAAAAAAAA, 'hAAAAAAAA, ArithOut{s:'h55555554, z:False, v:True, n:False});
      testOne('b0, 'hAAAAAAAA, 'h55555555, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b0, 'h55555555, 'h00000000, ArithOut{s:'h55555555, z:False, v:False, n:False});
      testOne('b0, 'h55555555, 'h00000001, ArithOut{s:'h55555556, z:False, v:False, n:False});
      testOne('b0, 'h55555555, 'hFFFFFFFF, ArithOut{s:'h55555554, z:False, v:False, n:False});
      testOne('b0, 'h55555555, 'hAAAAAAAA, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b0, 'h55555555, 'h55555555, ArithOut{s:'hAAAAAAAA, z:False, v:True, n:True});
      testOne('b1, 'h00000000, 'h00000000, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b1, 'h00000000, 'h00000001, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b1, 'h00000000, 'hFFFFFFFF, ArithOut{s:'h00000001, z:False, v:False, n:False});
      testOne('b1, 'h00000000, 'hAAAAAAAA, ArithOut{s:'h55555556, z:False, v:False, n:False});
      testOne('b1, 'h00000000, 'h55555555, ArithOut{s:'hAAAAAAAB, z:False, v:False, n:True});
      testOne('b1, 'h00000001, 'h00000000, ArithOut{s:'h00000001, z:False, v:False, n:False});
      testOne('b1, 'h00000001, 'h00000001, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b1, 'h00000001, 'hFFFFFFFF, ArithOut{s:'h00000002, z:False, v:False, n:False});
      testOne('b1, 'h00000001, 'hAAAAAAAA, ArithOut{s:'h55555557, z:False, v:False, n:False});
      testOne('b1, 'h00000001, 'h55555555, ArithOut{s:'hAAAAAAAC, z:False, v:False, n:True});
      testOne('b1, 'hFFFFFFFF, 'h00000000, ArithOut{s:'hFFFFFFFF, z:False, v:False, n:True});
      testOne('b1, 'hFFFFFFFF, 'h00000001, ArithOut{s:'hFFFFFFFE, z:False, v:False, n:True});
      testOne('b1, 'hFFFFFFFF, 'hFFFFFFFF, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b1, 'hFFFFFFFF, 'hAAAAAAAA, ArithOut{s:'h55555555, z:False, v:False, n:False});
      testOne('b1, 'hFFFFFFFF, 'h55555555, ArithOut{s:'hAAAAAAAA, z:False, v:False, n:True});
      testOne('b1, 'hAAAAAAAA, 'h00000000, ArithOut{s:'hAAAAAAAA, z:False, v:False, n:True});
      testOne('b1, 'hAAAAAAAA, 'h00000001, ArithOut{s:'hAAAAAAA9, z:False, v:False, n:True});
      testOne('b1, 'hAAAAAAAA, 'hFFFFFFFF, ArithOut{s:'hAAAAAAAB, z:False, v:False, n:True});
      testOne('b1, 'hAAAAAAAA, 'hAAAAAAAA, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b1, 'hAAAAAAAA, 'h55555555, ArithOut{s:'h55555555, z:False, v:True, n:False});
      testOne('b1, 'h55555555, 'h00000000, ArithOut{s:'h55555555, z:False, v:False, n:False});
      testOne('b1, 'h55555555, 'h00000001, ArithOut{s:'h55555554, z:False, v:False, n:False});
      testOne('b1, 'h55555555, 'hFFFFFFFF, ArithOut{s:'h55555556, z:False, v:False, n:False});
      testOne('b1, 'h55555555, 'hAAAAAAAA, ArithOut{s:'hAAAAAAAB, z:False, v:True, n:True});
      testOne('b1, 'h55555555, 'h55555555, ArithOut{s:'h00000000, z:True, v:False, n:False});
      testOne('b1, 'h7FFFFFFF, 'hFFFFFFFF, ArithOut{s:'h80000000, z:False, v:True, n:True});
      testOne('b1, 'h3FFFFFFF, 'hFFFFFFFF, ArithOut{s:'h40000000, z:False, v:False, n:False});
      testOne('b1, 'h1FFFFFFF, 'hFFFFFFFF, ArithOut{s:'h20000000, z:False, v:False, n:False});
      testOne('b1, 'h0FFFFFFF, 'hFFFFFFFF, ArithOut{s:'h10000000, z:False, v:False, n:False});
      testOne('b1, 'h07FFFFFF, 'hFFFFFFFF, ArithOut{s:'h08000000, z:False, v:False, n:False});
      testOne('b1, 'h03FFFFFF, 'hFFFFFFFF, ArithOut{s:'h04000000, z:False, v:False, n:False});
      testOne('b1, 'h01FFFFFF, 'hFFFFFFFF, ArithOut{s:'h02000000, z:False, v:False, n:False});
      testOne('b1, 'h00FFFFFF, 'hFFFFFFFF, ArithOut{s:'h01000000, z:False, v:False, n:False});
      testOne('b1, 'h007FFFFF, 'hFFFFFFFF, ArithOut{s:'h00800000, z:False, v:False, n:False});
      testOne('b1, 'h003FFFFF, 'hFFFFFFFF, ArithOut{s:'h00400000, z:False, v:False, n:False});
      testOne('b1, 'h001FFFFF, 'hFFFFFFFF, ArithOut{s:'h00200000, z:False, v:False, n:False});
      testOne('b1, 'h000FFFFF, 'hFFFFFFFF, ArithOut{s:'h00100000, z:False, v:False, n:False});
      testOne('b1, 'h0007FFFF, 'hFFFFFFFF, ArithOut{s:'h00080000, z:False, v:False, n:False});
      testOne('b1, 'h0003FFFF, 'hFFFFFFFF, ArithOut{s:'h00040000, z:False, v:False, n:False});
      testOne('b1, 'h0001FFFF, 'hFFFFFFFF, ArithOut{s:'h00020000, z:False, v:False, n:False});
      testOne('b1, 'h0000FFFF, 'hFFFFFFFF, ArithOut{s:'h00010000, z:False, v:False, n:False});
      testOne('b1, 'h00007FFF, 'hFFFFFFFF, ArithOut{s:'h00008000, z:False, v:False, n:False});
      testOne('b1, 'h00003FFF, 'hFFFFFFFF, ArithOut{s:'h00004000, z:False, v:False, n:False});
      testOne('b1, 'h00001FFF, 'hFFFFFFFF, ArithOut{s:'h00002000, z:False, v:False, n:False});
      testOne('b1, 'h00000FFF, 'hFFFFFFFF, ArithOut{s:'h00001000, z:False, v:False, n:False});
      testOne('b1, 'h000007FF, 'hFFFFFFFF, ArithOut{s:'h00000800, z:False, v:False, n:False});
      testOne('b1, 'h000003FF, 'hFFFFFFFF, ArithOut{s:'h00000400, z:False, v:False, n:False});
      testOne('b1, 'h000001FF, 'hFFFFFFFF, ArithOut{s:'h00000200, z:False, v:False, n:False});
      testOne('b1, 'h000000FF, 'hFFFFFFFF, ArithOut{s:'h00000100, z:False, v:False, n:False});
      testOne('b1, 'h0000007F, 'hFFFFFFFF, ArithOut{s:'h00000080, z:False, v:False, n:False});
      testOne('b1, 'h0000003F, 'hFFFFFFFF, ArithOut{s:'h00000040, z:False, v:False, n:False});
      testOne('b1, 'h0000001F, 'hFFFFFFFF, ArithOut{s:'h00000020, z:False, v:False, n:False});
      testOne('b1, 'h0000000F, 'hFFFFFFFF, ArithOut{s:'h00000010, z:False, v:False, n:False});
      testOne('b1, 'h00000007, 'hFFFFFFFF, ArithOut{s:'h00000008, z:False, v:False, n:False});
      testOne('b1, 'h00000003, 'hFFFFFFFF, ArithOut{s:'h00000004, z:False, v:False, n:False});
      testOne('b1, 'h00000001, 'hFFFFFFFF, ArithOut{s:'h00000002, z:False, v:False, n:False});
      testOne('b1, 'h00000000, 'hFFFFFFFF, ArithOut{s:'h00000001, z:False, v:False, n:False});
      $finish();
   endrule
      
endmodule


// .group inputs AFN A[31:0] B[31:0]
// .group outputs S[31:0] Z V N

// .mode gate

// .cycle assert inputs tran 99n sample outputs tran 1n

