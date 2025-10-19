//4x1 mux

module _4x1Mux(input L0,L1,L2,L3,S1,S0, output S);
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
	_4x1Mux instance0(.L0(L0),.L1(L1),.L2(L2),.L3(L3),.S1(S1),.S0(S0),.S(S));
	initial begin
	$dumpfile("mux.vcd");
	$dumpvars(0,TestBench);
	L0 = 0;L1 = 0;L2 = 0;L3 = 0;
	S0 = 0; S1 = 0;
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
	$finish;
	end
endmodule
	
	
	
	
