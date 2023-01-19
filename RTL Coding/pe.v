//processing element
module pe(input [1:0] pair1,pair2,output [1:0] result);
assign result[1]=pair1[1]|(pair1[0]&pair2[1]);//A+BC
assign result[0]=pair1[0]&pair2[0];//BD
endmodule
