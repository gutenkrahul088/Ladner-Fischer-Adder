//Module to generate '(g,p) pair'
module gen_and_pro(input [7:0] a,b,output [7:0] gen,pro);
assign gen=a&b;
assign pro=a^b;
endmodule