`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2024 20:02:42
// Design Name: 
// Module Name: jkfllipflop_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module jkff_tb;  // Testbench module
  reg [1:0] jk;  // Declare jk as a 2-bit reg
  reg clk;       // Declare clk as a reg
  wire q, qb;    // Declare q and qb as wires

  // Instantiate the JK flip-flop module (assuming you have a module named jkff)
  jkff dut (
    .jk(jk),     // Connect inputs
    .clk(clk),   // Connect clock
    .q(q),       // Connect outputs
    .qb(qb)
  );

  // Clock generation
  initial begin
    clk = 0;     // Initialize clock to 0
    forever #2 clk = ~clk;  // Clock toggles every 2 time units
  end

  // Dump file for waveform
  initial begin
    $dumpfile("jkff.vcd");   // VCD file for waveform
    $dumpvars(1, jkff_tb);   // Dump variables for the testbench
  end

  // Test stimulus for JK flip-flop
  initial begin
    jk = 2'b00;  // Initial state: Hold (jk = 00)
    #5;
    
    jk = 2'b01;  // Reset (jk = 01)
    #5;

    jk = 2'b10;  // Set (jk = 10)
    #5;
    
    jk = 2'b11;  // Toggle (jk = 11)
    #5;

    $finish();   // End simulation
  end
endmodule
