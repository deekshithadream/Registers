module barrel_shift_register( 
  input clk, 
  input reset, 
  input [3:0] data_in, 
  input [1:0] shift_amount, 
  output reg [3:0] data_out 
); 
 
  always @(posedge clk) begin 
    if (reset) begin 
      data_out <= 4'b0000; 
    end else begin 
      case (shift_amount) 
        2'b00: data_out <= data_in; 
        2'b01: data_out <= {data_in[2:0], 
data_in[3]}; 
        2'b10: data_out <= {data_in[1:0], 
data_in[3:2]}; 
        2'b11: data_out <= {data_in[3], 
data_in[2:0]}; 
      endcase 
    end 
  end 
endmodule

//- Reset Condition (reset = 1)
// Clears the output (data_out <= 4'b0000).
// Shift Operations (case (shift_amount))
// 00: No shift → data_out = data_in
// 01: Shift left by 1 bit → {data_in[2:0], data_in[3]}
// 10: Shift left by 2 bits → {data_in[1:0], data_in[3:2]}
// 11: Shift left by 3 bits → {data_in[3], data_in[2:0]}

