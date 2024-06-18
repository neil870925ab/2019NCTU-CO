//0613246
//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        2010/8/16
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
	instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	BranchType_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o
	);
     
//I/O ports
input  [6-1:0]  instr_op_i;

output	        RegWrite_o;
output [3-1:0]  ALU_op_o;
output		ALUSrc_o;
output [2-1:0]  RegDst_o;
output		Branch_o;
output [2-1:0]  BranchType_o;
output [2-1:0]	Jump_o;
output		MemRead_o;
output		MemWrite_o;
output [2-1:0]  MemtoReg_o;
 
//Internal Signals
reg    [3-1:0]  ALU_op_o;
reg		ALUSrc_o;
reg		RegWrite_o;
reg    [2-1:0]  RegDst_o;
reg		Branch_o;
reg    [2-1:0]  BranchType_o;
reg    [2-1:0]	Jump_o;
reg		MemRead_o;
reg		MemWrite_o;
reg    [2-1:0]  MemtoReg_o;

//Parameter


//Main function
always @(instr_op_i) begin
	case (instr_op_i[5:0])
		6'b000000:begin// R-type
			ALU_op_o = 3'b000;
			ALUSrc_o = 0;
			RegWrite_o = 1;
			RegDst_o = 1;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
		end
		6'b000010:begin// j
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;
			Jump_o = 1;
			RegWrite_o = 0;
		end
		6'b000011:begin// jal
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;			
			Jump_o = 1;
			RegWrite_o = 1;
			RegDst_o = 2'd2;
			MemtoReg_o = 2'd3;
		end
		6'b000100:begin// beq
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;			
			BranchType_o = 2'd0;
			Jump_o = 0;
			RegWrite_o = 0;
		end
		6'b000101:begin// bne
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;			
			BranchType_o = 2'd3;
			Jump_o = 0;
			RegWrite_o = 0;
		end
		6'b000001:begin// bge
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;			
			BranchType_o = 2'd2;
			Jump_o = 0;
			RegWrite_o = 0;
		end	
		6'b000111:begin// bgt
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			Branch_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;			
			BranchType_o = 2'd1;
			Jump_o = 0;
			RegWrite_o = 0;
		end	
		6'b001000:begin//addi
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b010;
		end
		6'b001010:begin// slti
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b111; 
		end
		6'b001100:begin// andi
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b100; 
		end
		6'b001101:begin// ori
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b101; 
		end
		6'b001110:begin// xori
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b110; 
		end
		6'b001111:begin// lui
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			ALU_op_o = 3'b010; 
		end
		6'b100011: begin // load
			ALU_op_o = 3'b010;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 1;
			MemWrite_o = 0;
			MemtoReg_o = 1;
		end
		6'b101011: begin // store
			ALU_op_o = 3'b010;
			ALUSrc_o = 1;
			RegWrite_o = 0;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 1;
		end
	endcase
end
endmodule
