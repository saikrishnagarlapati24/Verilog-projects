`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 00:46:19
// Design Name: 
// Module Name: ladfisch7bit
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


module ladfisch8bit(a,b,s);
input [7:0]a,b;
//you will need only 7bit sum since carry out of this 7bit addition is S2's 6th sum
//bit

//The above statement is the mistake I have done.
output [7:0]s;
wire [7:0]g,p;

//wire [5:0]c;
wire [6:0]c;
assign g=a&b;
assign p=a^b;

//g1,p1
wire g1;
//diamond d11(g[1],p[1],g[0],p[0],g1,p1);
assign g1=g[1]|(p[1]&g[0]);

//since you will not need p1,p2,p3,p4,p5,p6 anymore.
//g2,p2
wire g2;
//diamond d21(g[2],p[2],g1,p1,g2,p2);
assign g2=g[2]|(p[2]&g1);

//g3,p3
wire gw3,pw3,g3;
//diamond d31(g[3],p[3],g[2],p[2],gw3,pw3);
assign gw3=g[3]|(p[3]&g[2]);
assign pw3=p[3]&p[2];
//diamond d32(gw3,pw3,g1,p1,g3,p3);
assign g3=gw3|(pw3&g1);

//g4,p4
wire g4;
//diamond d41(g[4],p[4],g3,p3,g4,p4);
assign g4=g[4]|(p[4]&g3);

//g5,p5
wire gw5,pw5,g5;
//diamond d51(g[5],p[5],g[4],p[4],gw5,pw5);
assign gw5=g[5]|(p[5]&g[4]);
assign pw5=p[5]&p[4];
//diamond d52(gw5,pw5,g3,p3,g5,p5);
assign g5=gw5|(pw5&g3);

//g6,p6
wire gw6,pw6,g6;
//diamond d61(g[6],p[6],gw5,pw5,gw6,pw6);
assign gw6=g[6]|(p[6]&gw5);
assign pw6=p[6]&pw5;
//diamond d62(gw6,pw6,g3,p3,g6,p6);
assign g6=gw6|(pw6&g3);

//Since Cin =0,I am removing Pi&Cin which is equal to zero.Refer to original ladner fischer8bit module to know what changes have been made.
//carry of each column
assign c[0]=g[0];
assign c[1]=g1;
assign c[2]=g2;
assign c[3]=g3;
assign c[4]=g4;
assign c[5]=g5;
assign c[6]=g6;
//Anyway carry out of this 7 bit addition must be 0.

//sum of each column
assign s[0]=p[0];//originally p[0]^cin.
assign s[1]=p[1]^c[0];
assign s[2]=p[2]^c[1];
assign s[3]=p[3]^c[2];
assign s[4]=p[4]^c[3];
assign s[5]=p[5]^c[4];
assign s[6]=p[6]^c[5];
assign s[7]=p[7]^c[6];
endmodule