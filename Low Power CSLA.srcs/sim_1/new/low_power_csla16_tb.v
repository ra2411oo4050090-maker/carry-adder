`timescale 1ns / 1ps
module low_power_csla16_tb;
 reg [15:0] a,b;
 reg cin;
 wire [15:0] sum;
 wire cout;
 reg [16:0] expected;
 integer i;
 low_power_csla16 dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
 task check;
  begin
   #5; expected={1'b0,a}+{1'b0,b}+cin;
   if({cout,sum} !== expected) begin
    $display("FAIL a=%h b=%h cin=%b got=%h expected=%h",a,b,cin,{cout,sum},expected);
    $fatal;
   end
  end
 endtask
 initial begin
  $display("Testing 16-bit BEC-based CSLA");
  a=0;b=0;cin=0;check;
  a=16'hffff;b=1;cin=0;check;
  a=16'hffff;b=16'hffff;cin=1;check;
  a=16'h0fff;b=1;cin=0;check;
  for(i=0;i<1000;i=i+1) begin
   a=$random;b=$random;cin=$random;check;
  end
  $display("PASS: all test vectors matched.");
  $finish;
 end
endmodule
