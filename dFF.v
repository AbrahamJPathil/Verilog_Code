module dFF(input D,C ,output reg Q, output Qbar);
	assign Qbar = ~Q;
	always @(posedge C) begin
		if(D == 1) Q <= 1;
		else 	Q <= 0;
	end
endmodule


module testBench;
	reg D,C;
	wire Q,Qbar;
	dFF instance0(.D(D),.C(C),.Q(Q),.Qbar(Qbar));
	initial begin
		C = 0;
		forever #5 C = ~C;
	end
	
	initial begin
	$dumpfile("dFF.vcd");
	$dumpvars(0,testBench);
	D = 0;
	$display("D | C | Q | Qbar");
	$monitor("%d | %d | %d | %d",D,C,Q,Qbar);
	#10; D = 1;
	#10; D = 0;
	#10; $finish;
	end
endmodule
