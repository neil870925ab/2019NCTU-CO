module multiplexer_1bit(output out, input [1:0]in, input op);



	assign out = (in[0]&&(!op)) || (in[1]&&op);




endmodule 

