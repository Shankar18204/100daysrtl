module four_to_16
  (
    input [3:0] A,
    input en,
    output wire [15:0] B
  );
  
  wire [3:0] I;
  reg [15:0] out;
  
  two_to_4 inst1(A[3:2], en, I);
  
  two_to_4 inst2(A[1:0], I[0], out[3:0]);
  two_to_4 inst3(A[1:0], I[1], out[7:4]);
  two_to_4 inst4(A[1:0], I[2], out[11:8]);
  two_to_4 inst5(A[1:0], I[3], out[15:12]);
  
  assign B = out;
endmodule

module two_to_4
  (
    input [1:0] A,
    input en,
    output reg [3:0] B 
  );
  
  always@(*) begin
    if(en) begin
      B[0] <= (~A[0] & ~A[1]);
      B[1] <= (A[0] & ~A[1]);
      B[2] <= (~A[0] & A[1]);
      B[3] <= (A[0] & A[1]);
    end
    else 
      B <= 4'b0000;
  end
endmodule
