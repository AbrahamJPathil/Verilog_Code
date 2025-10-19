//4x1 mux

module _4x1Mux(input L0,L1,L2,L3,S1,S0, output S);
	wire and0, and1, and2, and3;
	and(and0,L0,~S1,~S0);
	and(and1,L1,~S1,S0);
	and(and2,L2,S1,~S0);
	and(and3,L3,S1,S0);
	or(S,and1,and2,and3,and0);
endmodule

module _4x1Demux(input I,S1,S0, output L0,L1,L2,L3);
	and(L0,I,~S1,~S0);
	and(L1,I,~S1,S0);
	and(L2,I,S1,~S0);
	and(L3,I,S1,S0);
endmodule

module TestBench;
	reg L0,L1,L2,L3,S1,S0;
	wire S;
	_4x1Mux instance0(.L0(L0),.L1(L1),.L2(L2),.L3(L3),.S1(S1),.S0(S0),.S(S));
	
	reg I,S1_,S0_;
	wire A,B,C,D;
	_4x1Demux(.I(I),.S1(S1_),.S0(S0_),.L0(A),.L1(B),.L2(C),.L3(D));
	
	initial begin
	$dumpfile("mux.vcd");
	$dumpvars(0,TestBench);
	L0 = 0;L1 = 0;L2 = 0;L3 = 0;
	S0 = 0; S1 = 0;
	$display("|| Truth Table for 4x1 MUX ||");
	$display("L0 | L1 | L2 | L3 | S1 | S0 | S ");
	$monitor("%d | %d | %d | %d | %d | %d | %d ",L0,L1,L2,L3,S1,S0,S);
	#10; L0 = 1;L1 = 0;L2 = 0;L3 = 0; S1 = 0; S0 = 0;
	
	#10; L0 = 0;L1 = 0;L2 = 0;L3 = 0; S1 = 0; S0 = 1;
	#10; L0 = 0;L1 = 1;L2 = 0;L3 = 0; S1 = 0; S0 = 1;
	
	#10; L0 = 0;L1 = 0;L2 = 0;L3 = 0; S1 = 1; S0 = 0;
	#10; L0 = 0;L1 = 0;L2 = 1;L3 = 0; S1 = 1; S0 = 0;
	
	#10; L0 = 0;L1 = 0;L2 = 0;L3 = 0; S1 = 1; S0 = 1;
	#10; L0 = 0;L1 = 0;L2 = 0;L3 = 1; S1 = 1; S0 = 1;
	
	#10; $monitoroff;
	S1_ = 0; S0_ = 0; I = 1;
	$display("|| Truth Table for 4x1 De-MUX ||");
	$display("I | S1 | S0 | L0 | L1 | L2 | L3 ");
	$monitor("%d | %d | %d | %d | %d | %d | %d ",I,S1_,S0_,L0,L1,L2,L3);
	$monitoron;
	#10; S1_ = 0; S0_ = 1; I = 1;
	#10; S1_ = 1; S0_ = 0; I = 1;
	#10; S1_ = 1; S0_ = 1; I = 1;			
	$finish;
	end
endmodule
	
	
	
	
