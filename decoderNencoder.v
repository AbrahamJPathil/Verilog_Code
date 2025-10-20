// contains code for both 2x4 decoder and 4x2 encoder


module _2x4Decoder(input S1,S0, output L0,L1,L2,L3);
	wire not1,not0;
	not(not1,S1);
	not(not0,S0);
	and(L0,not1,not0);
	and(L1,not1,S0);
	and(L2,S1,not0);
	and(L3,S1,S0);
endmodule
	
module _4x2Encoder(input L0,L1,L2,L3, output S1,S0);
	wire and1,and2;
	and(and1,~L3,L2,~L1,~L0);
	and(and2,L3,~L2,~L1,~L0);
	or(S1,and1,and2);
	wire and3;
	and(and3,~L3,~L2,L1,~L0);
	or(S0,and2,and3);
endmodule


module TestBench;
	reg S1,S0;
	wire L0,L1,L2,L3;
	_2x4Decoder instance0 (.S1(S1),.S0(S0),.L0(L0),.L1(L1),.L2(L2),.L3(L3));
	reg L0_,L1_,L2_,L3_;
	wire S1_,S0_;
	_4x2Encoder instance1 (.S1(S1_),.S0(S0_),.L0(L0_),.L1(L1_),.L2(L2_),.L3(L3_));
	initial begin;
	$dumpfile("dNe.vcd");
	$dumpvars(0,TestBench);
	S1 = 0; S0 = 0;
	$display("Truth Table for 2x4 Decoder");
	$display("S1 | S0 | L0 | L1 | L2 | L3");
	$monitor("%d | %d | %d | %d | %d | %d",S1,S0,L0,L1,L2,L3);
	#10; S1 = 0; S0 = 1;
	#10; S1 = 1; S0 = 0;
	#10; S1 = 1; S0 = 1;
	#10; $monitoroff;
	L3_ = 0; L2_ = 0; L1_ = 0; L0_ = 1;
	$display("Truth Table for 4x2 Encoder");
	$display("L3 | L2 | L1 | L0 | S1 | S0");
	$monitor("%d | %d | %d | %d | %d | %d",L3_,L2_,L1_,L0_,S1_,S0_);
	$monitoron;
	#10; L3_ = 0; L2_ = 0; L1_ = 1; L0_ = 0;
	#10; L3_ = 0; L2_ = 1; L1_ = 0; L0_ = 0;
	#10; L3_ = 1; L2_ = 0; L1_ = 1; L0_ = 0;
	#10; $monitoroff;
	$finish;
	end
endmodule 
	
	
