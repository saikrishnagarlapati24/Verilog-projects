`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 00:42:51
// Design Name: 
// Module Name: mul4c1
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


module mul4c1(a,b,o);
input [3:0]a;
input b;
output [3:0]o;
genvar i;
for(i=0;i<4;i=i+1)
begin
assign o[i]=a[i]&b;
end
endmodule