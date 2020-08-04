`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 00:45:12
// Design Name: 
// Module Name: ladfisch5bit
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


module ladfisch5bit(a,b,s);
input [4:0]a,b;
output [5:0]s;
wire [4:0]g,p;
wire [4:0]c;
assign g=a&b;
assign p=a^b;

//Since in our multiplier the Cin is anyway 0,we need not have Cin as input bit and
//We can simplify the assign statements by putting Cin =0.This reeduces the hardware.
//And since P1 to P7 all are not being used,we actually need not produce Pi for i=1,2,3,4
//,5,6,7 since they are not being used in producing carry of each column in simmplified 
//assign statements for carries.

//g1,p1
wire g1;
//diamond d11(g[1],p[1],g[0],p[0],g1,p1);
assign g1=g[1]|(p[1]&g[0]);

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
//since you will not need p4 anymore;neither p2 nor p3.
assign g4=g[4]|(p[4]&g3);

//Since Cin =0,I am removing Pi&Cin which is equal to zero.Refer to original ladner fischer8bit module to know what changes have been made.
//carry of each column
assign c[0]=g[0];
assign c[1]=g1;
assign c[2]=g2;
assign c[3]=g3;
assign c[4]=g4;

//sum of each column
assign s[0]=p[0];//originally p[0]^cin.
assign s[1]=p[1]^c[0];
assign s[2]=p[2]^c[1];
assign s[3]=p[3]^c[2];
assign s[4]=p[4]^c[3];
//there is no need of calling it carry out.
assign s[5]=c[4];
endmodule