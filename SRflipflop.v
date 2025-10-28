module srFF(input S,R,C, output reg Q, output Qbar);
	assign Qbar = ~Q;
	always @(posedge C) begin
		if(S == 0 && R == 1) Q <= 0;
		else if(S == 1 && R == 0) Q <= 1;
		else if(S == 0 && R == 0) Q <= Q;
		else Q <= 0;
	end
endmodule


module testBench;
	reg S,R,C;
	wire Q,Qbar;
	srFF instance0(.S(S),.R(R),.C(C),.Q(Q),.Qbar(Qbar));
	initial begin
		C = 0;
		forever #5 C = ~C;
	end
	initial begin
	$dumpfile("srFF.vcd");
	$dumpvars(0,testBench);
	S = 0; R = 1;
	$display("S | R | C | Q | Qbar");
	$monitor("%d | %d | %d | %d | %d",S,R,C,Q,Qbar);
	#10; S = 0; R = 0; // check if holding holds
	#10; S = 1; R = 0; //check for SET
	#10; S = 0; R = 0; // check for holding 
	#10; S = 0; R = 1;
	#10; S = 1; R = 1;
	#10;
	$finish;
	end
endmodule 
		
