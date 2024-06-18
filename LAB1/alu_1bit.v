module alu_1bit(output result, output cout, input src1, input src2, input cin, input [3:0]opr, input less);
	



	wire aout, bout, andout, orout, addout, out1, out2, out3, nsrc1, nsrc2;
	


	not N1(nsrc1, src1);
	not N2(nsrc2, src2);
	
	multiplexer_1bit M1(aout, {nsrc1, src1}, opr[3]);
	multiplexer_1bit M2(bout, {nsrc2, src2}, opr[2]);
	
	and G1(andout, aout, bout);
	or G2(orout, aout, bout);

	xor Gadd0(addout, aout, bout, cin);
	and Gadd1(out1, aout, bout);
	and Gadd2(out2, aout, cin);
	and Gadd3(out3, bout, cin);
	or Gadd4(cout, out1, out2, out3);

	multiplexer_2bit M3(result, {less, addout, orout, andout}, opr[1:0]);





endmodule 