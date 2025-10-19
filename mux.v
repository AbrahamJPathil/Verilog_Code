//4x1 mux

module 4x1Mux(input L0,L1,L2,L3,S1,S0, output S);
	wire and0, and1, and2, and3;
	and(and0,L0,~S1,~S0);
	and(and1,L1,~S1,S0);
	and(and2,L2,S1,~S0);
	and(and3,L3,S1,S0);
	or(S,and1,and2,and3,and0);
endmodule

module TestBench;
	reg L0,L1,L2,L3,S1,S0;
	wire S;
	4x1Mux instance0(.L0(L0),.L1(L1),.L2(L2),.L3(L3),.S1(S1),.S2(S2),.S(S));
	initial begin
	
	
	
