`include "pe.v"
`include "gen_and_pro.v"
module top(input [7:0]num1,num2,output [8:0] sum,input carry_in);
    wire [7:0] gen,pro;
    wire [1:0] temp_pair;
    reg [1:0] temp_pair_reg;
    wire [8:0] carry;
    wire [1:0] gp_temp0,gp_temp1,gp_temp2,gp_temp3,gp_temp4,gp_temp5,gp_temp6,gp_temp7,
    stage1_temp0,stage1_temp1,stage1_temp2,stage1_temp3,stage1_temp4,stage1_temp5,stage1_temp6,stage1_temp7,
    stage2_temp0,stage2_temp1,stage2_temp2,stage2_temp3,stage2_temp4,stage2_temp5,stage2_temp6,stage2_temp7,
    stage3_temp0,stage3_temp1,stage3_temp2,stage3_temp3,stage3_temp4,stage3_temp5,stage3_temp6,stage3_temp7;//end of statement with semicolon.
    initial begin 
        if(carry_in==1'b1)
            temp_pair_reg=2'b11;
        else
            temp_pair_reg=2'b00;
        end
    assign temp_pair=temp_pair_reg; 
    gen_and_pro i_gap1 (.a(num1), .b(num2), .gen(gen), .pro(pro));
    //final (G,P) pair
    assign gp_temp0={gen[0],pro[0]};
    assign gp_temp1={gen[1],pro[1]};
    assign gp_temp3={gen[3],pro[3]};
    assign gp_temp2={gen[2],pro[2]};
    assign gp_temp5={gen[5],pro[5]};
    assign gp_temp4={gen[4],pro[4]};
    assign gp_temp6={gen[6],pro[6]};
    assign gp_temp7={gen[7],pro[7]};
    initial begin
        #1 $display("Time:[%0t], GP pair->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b), carry_in=%b, temp_pair=(%b,%b)",$time,gp_temp7[1],gp_temp7[0],gp_temp6[1],gp_temp6[0],gp_temp5[1],gp_temp5[0],gp_temp4[1],gp_temp4[0],gp_temp3[1],gp_temp3[0],gp_temp2[1],gp_temp2[0],gp_temp1[1],gp_temp1[0],gp_temp0[1],gp_temp0[0],carry_in,temp_pair[1],temp_pair[0]);
    end
    //Stage 1
    pe i_pe1 (.pair1(gp_temp1),.pair2(temp_pair_reg),.result(stage1_temp1));
    pe i_pe2 (.pair1(gp_temp3),.pair2(gp_temp2),.result(stage1_temp3));
    pe i_pe3 (.pair1(gp_temp5),.pair2(gp_temp4),.result(stage1_temp5));
    pe i_pe4 (.pair1(gp_temp7),.pair2(gp_temp6),.result(stage1_temp7));
    assign stage1_temp0=temp_pair_reg;  
    assign stage1_temp2=gp_temp2;
    assign stage1_temp4=gp_temp4;
    assign stage1_temp6=gp_temp6;
    //Stage 1 completed, display of stage 1.
    initial begin
        #2 $display("Time:[%0t], Stage 1->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time, stage1_temp7[1],stage1_temp7[0],stage1_temp6[1],stage1_temp6[0],stage1_temp5[1],stage1_temp5[0],stage1_temp4[1],stage1_temp4[0],stage1_temp3[1],stage1_temp3[0],stage1_temp2[1],stage1_temp2[0],stage1_temp1[1],stage1_temp1[0],stage1_temp0[1],stage1_temp0[0]);
    end

    //Stage 2
    pe i_pe5 (.pair1(stage1_temp2),.pair2(stage1_temp1),.result(stage2_temp2));
    pe i_pe6 (.pair1(stage1_temp3),.pair2(stage1_temp1),.result(stage2_temp3));
    pe i_pe7 (.pair1(stage1_temp6),.pair2(stage1_temp5),.result(stage2_temp6));
    pe i_pe8 (.pair1(stage1_temp7),.pair2(stage1_temp5),.result(stage2_temp7));
    assign stage2_temp0=stage1_temp0;
    assign stage2_temp1=stage1_temp1;
    assign stage2_temp4=stage1_temp4;
    assign stage2_temp5=stage1_temp5;
    //Stage 2 completed, display of stage 2.
    initial begin
        #3 $display("Time:[%0t], Stage 2->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time,stage2_temp7[1],stage2_temp7[0],stage2_temp6[1],stage2_temp6[0],stage2_temp5[1],stage2_temp5[0],stage2_temp4[1],stage2_temp4[0],stage2_temp3[1],stage2_temp3[0],stage2_temp3[1],stage2_temp3[0],stage2_temp1[1],stage2_temp1[0],stage2_temp0[1],stage2_temp0[0]);
        
    end

    //Stage 3
    pe i_pe9 (.pair1(stage2_temp4),.pair2(stage2_temp3),.result(stage3_temp4));
    pe i_pe10 (.pair1(stage2_temp5),.pair2(stage2_temp3),.result(stage3_temp5));
    pe i_pe11 (.pair1(stage2_temp6),.pair2(stage2_temp3),.result(stage3_temp6));
    pe i_pe12 (.pair1(stage2_temp7),.pair2(stage2_temp3),.result(stage3_temp7));
    assign stage3_temp0=stage2_temp0;
    assign stage3_temp1=stage2_temp1;
    assign stage3_temp2=stage2_temp2;
    assign stage3_temp3=stage2_temp3;
    //Stage 3 completed, display of stage 3.
    initial begin
        #4 $display("Time:[%0t], Stage 3->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time,stage3_temp7[1],stage3_temp7[0],stage3_temp6[1],stage3_temp6[0],stage3_temp5[1],stage3_temp5[0],stage3_temp4[1],stage3_temp4[0],stage3_temp3[1],stage3_temp3[0],stage3_temp2[1],stage3_temp2[0],stage3_temp1[1],stage3_temp1[0],stage3_temp0[1],stage3_temp0[0]);
    end
    //All three stages done. Now carry[8:0]={}
    assign carry={stage3_temp7[1],stage3_temp6[1],stage3_temp5[1],stage3_temp4[1],stage3_temp3[1],stage3_temp2[1],stage3_temp1[1],stage3_temp0[1],carry_in};
    //generating sum
    assign sum[0]=gp_temp0[0]^carry[0];
    assign sum[1]=gp_temp1[0]^carry[1];
    assign sum[2]=gp_temp2[0]^carry[2];
    assign sum[3]=gp_temp3[0]^carry[3];
    assign sum[4]=gp_temp4[0]^carry[4];
    assign sum[5]=gp_temp5[0]^carry[5];
    assign sum[6]=gp_temp6[0]^carry[6];
    assign sum[7]=gp_temp7[0]^carry[7];
    assign sum[8]=carry[8];
endmodule