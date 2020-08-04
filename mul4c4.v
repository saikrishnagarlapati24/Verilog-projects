`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 00:47:19
// Design Name: 
// Module Name: mul4c4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mul4c4(a,b,out);//,p1,p2,p3,p4,l51,l52);
input [3:0]a,b;
output [7:0]out;
//output [3:0]p1,p2,p3,p4;
//output [5:0]l51,l52;
wire [3:0]pp1,pp2,pp3,pp4;

mul4c1 m1(a,b[0],pp1);
mul4c1 m2(a,b[1],pp2);
mul4c1 m3(a,b[2],pp3);
mul4c1 m4(a,b[3],pp4);

wire [5:0]S1,S2;
ladfisch5bit lf51({1'b0,pp1},{pp2,1'b0},S1);
ladfisch5bit lf52({1'b0,pp3},{pp4,1'b0},S2);

ladfisch8bit lf8({2'b00,S1},{S2,2'b00},out[7:0]);
//assign out[7]=S2[5];

//assign p1=pp1;
//assign p2=pp2;
//assign p3=pp3;
//assign p4=pp4;
//assign l51=S1;
//assign l52=S2;

endmodule