import Cmp::*;

(* synthesize *)
module mkTbCmp(Empty);
   
   function testOne(Bit#(2) cfn, Bit#(1) z, Bit#(1) v, Bit#(1) n, Bit#(32) exp) = 
   action
      let got = cmp(cfn, z, v, n);
      if (got != exp)
         $display("FAIL cfn:%b, z:%b, v:%b, n:%b, got: %b, expected: %b", cfn, z, v, n, got, exp);
      else
         $display("PASS cfn:%b, z:%b, v:%b, n:%b, got: %b, expected: %b", cfn, z, v, n, got, exp);
   endaction;
   
   rule testEm;
      testOne('b01,0,0,0,0);
      testOne('b10,0,0,0,0);
      testOne('b11,0,0,0,0);
      testOne('b01,0,0,1,0);
      testOne('b10,0,0,1,1);
      testOne('b11,0,0,1,1);
      testOne('b01,0,1,0,0);
      testOne('b10,0,1,0,1);
      testOne('b11,0,1,0,1);
      testOne('b01,0,1,1,0);
      testOne('b10,0,1,1,0);
      testOne('b11,0,1,1,0);
      testOne('b01,1,0,0,1);
      testOne('b10,1,0,0,0);
      testOne('b11,1,0,0,1);
      testOne('b01,1,0,1,1);
      testOne('b10,1,0,1,1);
      testOne('b11,1,0,1,1);
      testOne('b01,1,1,0,1);
      testOne('b10,1,1,0,1);
      testOne('b11,1,1,0,1);
      
      $finish();
   endrule
endmodule
