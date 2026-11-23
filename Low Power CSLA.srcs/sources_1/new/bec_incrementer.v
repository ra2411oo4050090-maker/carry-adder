`timescale 1ns / 1ps
module bec_incrementer #(parameter integer WIDTH=4)(
 input wire [WIDTH-1:0] x, output wire [WIDTH-1:0] y, output wire overflow
);
 wire [WIDTH:0] c;
 assign c[0]=1'b1;
 genvar i;
 generate for(i=0;i<WIDTH;i=i+1) begin: g
  assign y[i]=x[i]^c[i];
  assign c[i+1]=x[i]&c[i];
 end endgenerate
 assign overflow=c[WIDTH];
endmodule
