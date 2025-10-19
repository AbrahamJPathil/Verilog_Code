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
	wire and3,and4;
	and(and3,~L3,~L2,L1,~L0);
	or(S0,and2,and3);
endmodule
