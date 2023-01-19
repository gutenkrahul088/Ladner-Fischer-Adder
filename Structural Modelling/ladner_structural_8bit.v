module ladner_structural_8bit(s8,s7,s6,s5,s4,s3,s2,s1,s0,a7,a6,a5,a4,a3,a2,a1,a0,b7,b6,b5,b4,b3,b2,b1,b0);
//port declaration
  input a7,a6,a5,a4,a3,a2,a1,a0,b7,b6,b5,b4,b3,b2,b1,b0;
  wire cin;
  buf(cin,0);//initial carry initialization
  output s8,s7,s6,s5,s4,s3,s2,s1,s0;
//wire declaration
  wire g8,g7,g6,g5,g4,g3,g2,g1,g0,p8,p7,p6,p5,p4,p3,p2,p1,p0;
  wire G7,G6,G5,G4,G3,G2,G1,G0,P7,P6,P5,P4,P3,P2,P1,P0;
  wire s1g7,s1g6,s1g5,s1g4,s1g3,s1g2,s1g1,s1g0;
  wire s1p7,s1p6,s1p5,s1p4,s1p3, s1p2,s1p1,s1p0;
  wire s2g7,s2g6,s2g5,s2g4,s2g3,s2g2,s2g1,s2g0;
  wire s2p7,s2p6,s2p5,s2p4,s2p3,s2p2,s2p1,s2p0;
  wire s3g7,s3g6,s3g5,s3g4,s3g3,s3g2,s3g1,s3g0;
  wire s3p7,s3p6,s3p5,s3p4,s3p3,s3p2,s3p1,s3p0;
//(g0,p0) as initial carry
  buf n1(g0,cin);
  buf n2(p0,cin);
//Generation of (g,p) pair
  genprop n3(g1,p1,a0,b0);
  genprop n4(g2,p2,a1,b1);
  genprop n5(g3,p3,a2,b2);
  genprop n6(g4,p4,a3,b3);
  genprop n7(g5,p5,a4,b4);
  genprop n8(g6,p6,a5,b5);
  genprop n9(g7,p7,a6,b6);
  genprop n10(g8,p8,a7,b7);
  initial
    #1 $display("Time:[%0t], GP pair->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b), cin=%b",$time,g8,p8,g7,p7,g6,p6,g5,p5,g4,p4,g3,p3,g2,p2,g1,p1,g0,p0,cin);
//Generated (g,p) given to processing element using buf(output,input) 
  buf n11(G7,g8);
  buf n12(G6,g7);
  buf n13(G5,g6);
  buf n14(G4,g5);
  buf n15(G3,g4);
  buf n16(G2,g3);
  buf n17(G1,g2);
  buf n18(P7,p8);
  buf n19(P6,p7);
  buf n20(P5,p6);
  buf n21(P4,p5);
  buf n22(P3,p4);
  buf n23(P2,p3);
  buf n24(P1,p2);
//Stage 1
  CGP pe11(G0,P0,g1,g0,p1,p0);
  buf s11(s1p0,P0);
  buf s12(s1g0,G0);
  CGP pe13(s1g1,s1p1,G1,G0,P1,P0);
  buf s13(s1p2,P2);
  buf s14(s1g2,G2);
  CGP pe15(s1g3,s1p3,G3,G2,P3,P2);
  buf s15(s1p4,P4);
  buf s16(s1g4,G4);
  CGP pe17(s1g5,s1p5,G5,G4,P5,P4);
  buf s17(s1p6,P6);
  buf s18(s1g6,G6);
  CGP pe19(s1g7,s1p7,G7,G6,P7,P6);
  initial
    #2 $display("Time:[%0t], Stage 1->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time,s1g7,s1p7,s1g6,s1p6,s1g5,s1p5,s1g4,s1p4,s1g3,s1p3,s1g2,s1p2,s1g1,s1p1,s1g0,s1p0);
//Stage 1 completed. Stage 2 started.
  buf s21(s2p0,s1p0);
  buf s22(s2p1,s1p1);
  buf s23(s2g0,s1g0);
  buf s24(s2g1,s1g1);
  CGP pe25(s2g2,s2p2,s1g2,s1g1,s1p2,s1p1);
  CGP pe26(s2g3,s2p3,s1g3,s1g1,s1p3,s1p1);
  buf s25(s2p4,s1p4);
  buf s26(s2p5,s1p5);
  buf s27(s2g4,s1g4);
  buf s28(s2g5,s1g5);
  CGP pe29(s2g6,s2p6,s1g6,s1g5,s1p6,s1p5);
  CGP pe30(s2g7,s2p7,s1g7,s1g5,s1p7,s1p5);
  initial
    #3 $display("Time:[%0t], Stage 2->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time, s2g7,s2p7,s2g6,s2p6,s2g5,s2p5,s2g4,s2p4,s2g3,s2p3,s2g2,s2p2,s2g1,s2p1,s2g0,s2p0);
//Stage 2 completed. Stage 1 started.
  buf s31(s3p0,s2p0);
  buf s32(s3p1,s2p1);
  buf s33(s3p2,s2p2);
  buf s34(s3p3,s2p3);
  buf s35(s3g0,s2g0);
  buf s36(s3g1,s2g1);
  buf s37(s3g2,s2g2);
  buf s38(s3g3,s2g3);
  CGP pe39(s3g4,s3p4,s2g4,s2g3,s2p4,s2p3);
  CGP pe40(s3g5,s3p5,s2g5,s2g3,s2p5,s2p3);
  CGP pe41(s3g6,s3p6,s2g6,s2g3,s2p6,s2p3);
  CGP pe42(s3g7,s3p7,s2g7,s2g3,s2p7,s2p3);
  initial
    #4 $display("Time:[%0t], Stage 3->(%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b) (%b,%b)",$time, s3g7,s3p7,s3g6,s3p6,s3g5,s3p5,s3g4,s3p4,s3g3,s3p3,s3g2,s3p2,s3g1,s3p1,s3g0,s3p0);
//Stage 3 completed.
//Generation of Sum bit.
  xor s41(s0,p1,cin);
  xor s42(s1,p2,s3g0);
  xor s43(s2,p3,s3g1);
  xor s44(s3,p4,s3g2);
  xor s45(s4,p5,s3g3);
  xor s46(s5,p6,s3g4);
  xor s47(s6,p7,s3g5);
  xor s48(s7,p8,s3g6);
  buf s49(s8,s3g7);
endmodule
 
//Processing Element->(A,B)(C,D)->(A+BC,BD)
module CGP(G,P,g1,g0,p1,p0);
 input g1,g0,p1,p0;
 output G,P;
 wire w;
 and n1(P,p0,p1);
 and n2(w,p1,g0);
 or n3(G,w,g1);
endmodule

//Carry generation and propagation block
module genprop(output g,p,input a,b);
xor n1(p,a,b);
and n2(g,a,b);
endmodule


