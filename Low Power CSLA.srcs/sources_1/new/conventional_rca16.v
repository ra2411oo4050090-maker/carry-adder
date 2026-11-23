`timescale 1ns / 1ps
// Baseline 16-bit ripple-carry adder for comparison.
module conventional_rca16(
 input wire [15:0] a,b, input wire cin,
 output wire [15:0] sum, output wire cout
);
 wire [16:0] result;
 assign result={1'b0,a}+{1'b0,b}+cin;
 assign sum=result[15:0];
 assign cout=result[16];
endmodule
