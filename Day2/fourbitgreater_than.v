module fourbitgreater_than
  (
    input [3:0] A, B,
    output G
  );
  
  reg g1, g2, eq1;
  
  equal inst1(A[3:2], B[3:2], eq1);
  
  greater_than inst2(A[3:2], B[3:2], g1);
  greater_than inst3(A[1:0], B[1:0], g2);
  
  assign G = g1 | (eq1 & g2);
endmodule




module equal
  (
    input [1:0] A, B,
    output eq
  );
  
  wire A0, A1, B0, B1;
  
  
  assign eq = ~(A[0] ^ B[0]) & ~(A[1] ^ B[1]);
endmodule


module greater_than
  (
    input [1:0] A, B,
    output G
  );
  
   //toggling both B bits for simplified gate equation  
  wire A0 = A[0], A1 = A[1], B0 = ~B[0], B1 = ~B[1];
  
  //simplified gate equation
  assign G = (A1 & B1) | (A0 & B0 & B1) | (A0 & A1 & B0);
  
endmodule
