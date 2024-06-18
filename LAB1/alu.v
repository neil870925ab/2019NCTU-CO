`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
			  //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

genvar		i;
wire     [32:1] co;
wire		set;
wire		over;
wire    [32-1:0] re;


always@( posedge clk or negedge rst_n ) 
begin
	if(!rst_n) begin
		result = 0;
		zero = 1;
		cout = 0;
		overflow = 0;
	end
	else begin
		result = re;
		zero = (re)? 0:1;
		cout = co[32]&&ALU_control[1]&&(!ALU_control[0]);
		overflow = over;
	end
end

generate
	for(i = 0; i < 32; i = i + 1) begin
		if(i == 0) begin
			alu_1bit alu1(re[i], co[i+1], src1[i], src2[i], ALU_control[2], ALU_control[3:0], set);
		end
		else if(i == 31) begin
			alu_1bit_last alu31(re[i], co[i+1], set, over, src1[i], src2[i], co[i], ALU_control[3:0], 1'b0);
		end
		else begin
			alu_1bit alue(re[i], co[i+1], src1[i], src2[i], co[i], ALU_control[3:0], 1'b0);
		end
	end
endgenerate

endmodule
