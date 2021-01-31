import Bool::*;

(* synthesize *)
module mkTbBool(Empty);
   function testOne (Bit#(4) bfn, Bit#(32) a, Bit#(32) b, Bit#(32) exp) = 
   action
      let got = bool(bfn, a, b);
      if (got != exp)
         $display("FAIL bfn:%h, a:%h, b:%h, got: %h, expected: %h", bfn, a, b, got, exp);
      else
         $display("PASS bfn:%h, a:%h, b:%h, got: %h, expected: %h", bfn, a, b, got, exp);
   endaction;

   rule testAll;
      testOne('b0000, 'hff00ff00, 'hffff0000, 'h00000000);
      testOne('b0001, 'hff00ff00, 'hffff0000, 'h000000ff);
      testOne('b0010, 'hff00ff00, 'hffff0000, 'h0000ff00);
      testOne('b0011, 'hff00ff00, 'hffff0000, 'h0000ffff);
      testOne('b0100, 'hff00ff00, 'hffff0000, 'h00ff0000);
      testOne('b0101, 'hff00ff00, 'hffff0000, 'h00ff00ff);
      testOne('b0110, 'hff00ff00, 'hffff0000, 'h00ffff00);
      testOne('b0111, 'hff00ff00, 'hffff0000, 'h00ffffff);
      testOne('b1000, 'hff00ff00, 'hffff0000, 'hff000000);
      testOne('b1001, 'hff00ff00, 'hffff0000, 'hff0000ff);
      testOne('b1010, 'hff00ff00, 'hffff0000, 'hff00ff00);
      testOne('b1011, 'hff00ff00, 'hffff0000, 'hff00ffff);
      testOne('b1100, 'hff00ff00, 'hffff0000, 'hffff0000);
      testOne('b1101, 'hff00ff00, 'hffff0000, 'hffff00ff);
      testOne('b1110, 'hff00ff00, 'hffff0000, 'hffffff00);
      testOne('b1111, 'hff00ff00, 'hffff0000, 'hffffffff);
      $finish();
   endrule
endmodule
