module halfAdder(input A,B,output C_out,S);
	wire and1,and2;
	and(and1,A,~B);
	and(and2,~A,B);
	or(S,and1,and2);
	and(C_out,A,B);
endmodule

module fullAdder(input A,B,C_in, output C_out,S);
	wire and1,and2,or1;
	xor(S,A,B,C_in);
	or(or1,A,B);
	and(C_in,or1);
	and(and2,A,B);
	or(C_out,and1,and2);
endmodule


module TestBench;
	reg A,B;
	wire C_out,S;
	halfAdder instance0(.A(A),.B(B),.C_out(C_out),.S(S));
	initial begin
	A = 0; B = 0;
	$dumpfile("brats.vcd");
	$dumpvars(0,TestBench);
	$display(" // Truth Table for Half Adder || ");
	$display("A | B | C_out | S ");
	$monitor("%d | %d |   %d | %d ",A,B,C_out,S);
	#10; A = 0; B = 1;
	#10; A = 1; B = 0;
	#10; A = 1; B = 1;
	$finish;
	end
	
	reg C_in;
	fullAdder instance1(A,B,C_in,C_out,S);
	initial begin
	A = 0; B = 0;
	$dumpfile("fullAdder.vcd");
	$dumpvars(0,TestBench);
	$display(" // Truth Table for Full Adder || ");
	$display("A | B | C_in | C_out | S ");
	$monitor("%d | %d |   %d  |   %d  | %d ",A,B,C_in,C_out,S);
	#10; A = 0; B = 1;
	#10; A = 1; B = 0;
	#10; A = 1; B = 1;
	$finish;
	end
	
	
	
endmodule	
	 
	
	
