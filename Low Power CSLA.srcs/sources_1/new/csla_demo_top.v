`timescale 1ns / 1ps
// Board-neutral demo: switches 7:0=A, 15:8=B; LEDs 7:0=sum, LED8=carry.
module csla_demo_top(input wire [15:0] sw, output wire [8:0] led);
 wire [15:0] result;
 wire carry_out;
 low_power_csla16 u0(
  .a({8'b0,sw[7:0]}),.b({8'b0,sw[15:8]}),.cin(1'b0),
  .sum(result),.cout(carry_out)
 );
 assign led={result[8],result[7:0]};
endmodule
