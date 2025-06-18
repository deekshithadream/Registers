module barrel_shift_register_tb; 
 
  // Inputs 
  reg clk = 0; 
  reg reset = 0; 
  reg [3:0] data_in = 4'b0000; 
  reg [1:0] shift_amount = 2'b00; 
 
  // Outputs 
  wire [3:0] data_out; 
 
  // Instantiate the barrel shift register 
  barrel_shift_register shift_reg( 
    .clk(clk), 
    .reset(reset), 
    .data_in(data_in), 
    .shift_amount(shift_amount), 
    .data_out(data_out) 
  ); 
 
  // Clock generator 
  always #5 clk = ~clk; 
 
  // Test case 
  initial begin 
    // Reset the shift register 
    reset = 1; 
    #10 reset = 0; 
 
    // Test shifting with different values 
    data_in = 4'b1010; 
    shift_amount = 2'b01; 
    #10 shift_amount = 2'b10; 
 
    data_in = 4'b1100; 
    shift_amount = 2'b11; 
    #10 shift_amount = 2'b00; 
 
    // End simulation 
    #10 $finish; 
  end 
endmodule 

// data_in = 1010, shift by 1 (01) → Left shift once.
// Wait 10 time units.
// Shift by 2 (10) → Left shift twice.
// Change data_in = 1100, shift by 3 (11) → Left shift three times.
// Wait 10 time units, shift by 0 (00) → No shift.
// Simulation End ($finish)
// Ends the test after 10 more time units
