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
	and(and1,C_in,or1);
	and(and2,A,B);
	or(C_out,and1,and2);
endmodule

module halfSubtractor(input A,B, output B_in,D);
	xor(D,A,B);
	and(B_in,~A,B);
endmodule

module fullSubtractor(input A,B,B_in, output B_out,D);
	xor(D,B_in,A,B);
	wire and1,and2,or1;
	and(and1,~A,B);
	or(or1,~A,B);
	and(and2,B_in,or1);
	or(B_out,and1,and2);
endmodule

module TestBenchHA;
	reg A,B;
	wire C_out,S;
	halfAdder instance0(.A(A),.B(B),.C_out(C_out),.S(S));
	reg C; //created the additional i/p line for full adder
	wire D,E;	// created the new o/p lines for full adder to prevent race condition, if prev used
	fullAdder instance1(.A(A),.B(B),.C_in(C),.C_out(D),.S(E));
	wire F,G;
	halfSubtractor instance2(.A(A),.B(B),.B_in(F),.D(G));
	initial begin
	A = 0; B = 0;
	$dumpfile("brats.vcd");
	$dumpvars(0,TestBenchHA);
	$display(" // Truth Table for Half Adder || ");
	$display("A | B | C_out | S ");
	$monitor("%d | %d |   %d | %d ",A,B,C_out,S);
	#10; A = 0; B = 1;
	#10; A = 1; B = 0;
	#10; A = 1; B = 1;
	#11; $monitoroff;
	A = 0; B = 0; C = 0;
	$display(" // Truth Table for Full Adder || ");
	$display("A | B | C_in | C_out | S ");
	$monitor("%d | %d | %d | %d | %d",A,B,C,D,E);
	$monitoron;
	#10; A = 0; B = 0; C = 0;
	#10; A = 0; B = 0; C = 1;
	#10; A = 0; B = 1; C = 0;
	#10; A = 0; B = 1; C = 1;
	#10; A = 1; B = 0; C = 0;
	#10; A = 1; B = 0; C = 1;
	#10; A = 1; B = 1; C = 0;
	#10; A = 1; B = 1; C = 1;
	#10; $monitoroff;
	A = 0; B = 0;
	$display(" // Truth Table for Half Subtractor || ");
	$display("A | B | B_in | D ");
	$monitor("%d | %d |   %d | %d ",A,B,F,G);
	$monitoron;
	#10; A = 0; B = 0;
	#10; A = 0; B = 1;
	#10; A = 1; B = 0;
	#10; A = 1; B = 1;
	#10; $monitoroff;
	
	
	$finish;		// ends the simulation at all initial blocks, in all modules, enters cleanup mode
	end	
endmodule	
	 

	
