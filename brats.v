module halfAdder(input A,B output C_out,S);
	wire and1,and2;
	and(and1,A,~B);
	and(and2,~A,B);
	or(S,and1,and2);
	and(C_out,A,B);
endmodule

module TestBench;
	reg A,B;
	wire C_out,S;
	halfAdder instance0(.A(A),.B(B),.C_out(C_out),.S(S));
	initial begin;
	$dumpfile("brats.vcd");
	$dumpvars(TestBench,0);
	$display("A | B | C_out | S ");
	$monitor("%d | %d |   %d | %d ",A,B,C_out,S);
	#10; A = 0; B = 0;
	#10; A = 0; B = 1;
	#10; A = 1; B = 0;
	#10; A = 1; B = 1;
	end
endmodule
	 
	
	
