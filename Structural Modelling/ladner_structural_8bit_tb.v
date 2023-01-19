`include "ladner_structural_8bit.v"
module ladner_structural_8bit_tb;
 reg a7,a6,a5,a4,a3,a2,a1,a0,b7,b6,b5,b4,b3,b2,b1,b0;
 wire s8,s7,s6,s5,s4,s3,s2,s1,s0;
 ladner_structural_8bit uut(s8,s7,s6,s5,s4,s3,s2,s1,s0,a7,a6,a5,a4,a3,a2,a1,a0,b7,b6,b5,b4,b3,b2,b1,b0);
 initial
 begin
  $dumpfile("dump file.vcd");
  $dumpvars(0,ladner_structural_8bit_tb);
  #0
  {a7,a6,a5,a4,a3,a2,a1,a0}=8'b0101_1000;
  {b7,b6,b5,b4,b3,b2,b1,b0}=8'b1011_1011;//Result:1_0001_0011
 end
 initial 
  #4 $monitor("Time:[%0t], Number1: %b%b%b%b_%b%b%b%b Number2: %b%b%b%b_%b%b%b%b Result: %b_%b%b%b%b_%b%b%b%b",$time,a7,a6,a5,a4,a3,a2,a1,a0,b7,b6,b5,b4,b3,b2,b1,b0,s8,s7,s6,s5,s4,s3,s2,s1,s0);
endmodule