module srLatch(input S,R, reg output Q,QBar);
	nor(Q,Qbar,R);
	nor(Qbar,S,Q);
endmodule

module testBench;
	reg S,R;
	wire Q,Qbar;
	srLatch instance0(.S(S),.R(R),.Q(Q),.Qbar(Qbar));
	initial begin
	$dumpfile("latchesNffs.vcd");
	$dumpvars(0,testBench);
	S = 0; R = 0;
	$display("S | R | Q | Qbar");
	$monitor("%d | %d | %d | %d",S,R,Q,Qbar);
	#10; S = 0; R = 1;
	#10; S = 1; R = 0;
	#10; S = 0; R = 1;
	#10; $finish
	end
endmodule	
