`timescale 1ns / 1ps
module ripple_carry_adder #(parameter integer WIDTH=4)(
 input wire [WIDTH-1:0] a,b, input wire cin,
 output wire [WIDTH-1:0] sum, output wire cout
);
 wire [WIDTH:0] c;
 assign c[0]=cin;
 genvar i;
 generate for(i=0;i<WIDTH;i=i+1) begin: g
  assign sum[i]=a[i]^b[i]^c[i];
  assign c[i+1]=(a[i]&b[i])|(a[i]&c[i])|(b[i]&c[i]);
 end endgenerate
 assign cout=c[WIDTH];
endmodule
