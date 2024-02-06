module twoby1mux (

  input   wire [7:0]    a_i,   // First leg of the mux
  input   wire [7:0]    b_i,   // Second leg of the mux
  input   wire          sel_i, // Mux select
  output  reg [7:0]    y_o   // Mux output
);
  
  always@(*) begin 
    y_o = (sel_i) ? b_i : a_i;
  end
  
endmodule
