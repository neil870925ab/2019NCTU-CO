//0613246
//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o,
	  jr_o
          );
          
//I/O ports 
input      [5:0] funct_i;
input      [2:0] ALUOp_i;

output     [3:0] ALUCtrl_o; 
output     jr_o;   
     
//Internal Signals
reg        [3:0] ALUCtrl_o;
reg        jr_o;

//Parameter

       
//Select exact operation

always @(funct_i, ALUOp_i) begin
	case (ALUOp_i)

		3'b010: ALUCtrl_o = 4'b0010; // addi / load / store
		3'b011: ALUCtrl_o = 4'b0110; // J & B
		3'b100: ALUCtrl_o = 4'b0000; // andi
		3'b101: ALUCtrl_o = 4'b0001; // ori
		3'b110: ALUCtrl_o = 4'b1111; // xori
		3'b111: ALUCtrl_o = 4'b0111; // slti
		3'b000: begin // R-type
			case (funct_i)
				6'b001000: ALUCtrl_o = 4'b0000; // jr
				6'b100000: ALUCtrl_o = 4'b0010; // add
				6'b100010: ALUCtrl_o = 4'b0110; // sub
				6'b100100: ALUCtrl_o = 4'b0000; // and
				6'b100101: ALUCtrl_o = 4'b0001; // or
				6'b100110: ALUCtrl_o = 4'b1111; // xor
				6'b101010: ALUCtrl_o = 4'b0111; // slt
			endcase
		end
	endcase

	if(ALUOp_i == 3'b000 && funct_i == 6'b001000) begin
		jr_o = 1;
	end
	else begin
		jr_o = 0;
	end
end

endmodule        
                    