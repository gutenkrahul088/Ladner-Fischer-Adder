`include "top.v"
module testbench;
reg [7:0] a,b;
reg carry_in;
wire [8:0] sum;
wire carry_out;
top i_top1 (.num1(a),.num2(b),.sum(sum),.carry_in(carry_in));
initial begin
    $dumpfile("dump file.vcd");
    $dumpvars(0,testbench);
    a=8'b0101_1000; //58
    b=8'b1011_1011; //BB
    carry_in=0; //result should be 113
end
initial 
    #5 $monitor("Time:[%0t], a=%h, b=%h, sum=%h",$time,a,b,sum);
endmodule