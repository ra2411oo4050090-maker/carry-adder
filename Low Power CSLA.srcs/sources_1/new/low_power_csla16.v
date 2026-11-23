`timescale 1ns / 1ps
// 16-bit BEC-based modified Carry Select Adder: four 4-bit blocks.
module low_power_csla16(
 input wire [15:0] a,b, input wire cin,
 output wire [15:0] sum, output wire cout
);
 wire [4:0] carry;
 assign carry[0]=cin;
 ripple_carry_adder #(.WIDTH(4)) first_block(
  .a(a[3:0]),.b(b[3:0]),.cin(carry[0]),.sum(sum[3:0]),.cout(carry[1])
 );
 genvar k;
 generate for(k=1;k<4;k=k+1) begin: blocks
  wire [3:0] sum0;
  wire carry0;
  wire [4:0] inc_result;
  ripple_carry_adder #(.WIDTH(4)) rca0(
   .a(a[k*4 +: 4]),.b(b[k*4 +: 4]),.cin(1'b0),.sum(sum0),.cout(carry0)
  );
  // Increment the combined carry+sum to form the carry-in-one result.
  assign inc_result={carry0,sum0}+5'd1;
  assign sum[k*4 +: 4]=carry[k] ? inc_result[3:0] : sum0;
  assign carry[k+1]=carry[k] ? inc_result[4] : carry0;
 end endgenerate
 assign cout=carry[4];
endmodule
