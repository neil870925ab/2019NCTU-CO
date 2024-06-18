module multiplexer_2bit(output out, input [3:0]in, input [1:0]op); 




	assign out = (in[0]&&(!op[0])&&(!op[1])) || (in[1]&&op[0]&&(!op[1])) || (in[2]&&(!op[0])&&op[1]) || (in[3]&&op[0]&&op[1]);




endmodule 