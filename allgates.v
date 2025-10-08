module andGate(input A,B, output Y);
assign Y = A & B;
endmodule


module orGate(input A,B, output Y);
	assign Y = A | B;
endmodule 

module notGate(input A, output Y);
	assign Y = ~A;
endmodule

module nandGate(input A,B, output Y);
	assign Y = ~(A & B);
endmodule


module testBench;
reg A,B;	// register the input lines
wire Y;			// declare the output lines

//INSTATNTIATE the modules

andGate instance0(A,B,Y);
orGate instance1(A,B,Y);
notGate instance2(A,Y);
nandGate instance3(A,B,Y);

initial begin
$dumpfile("orgate.vcd");
$dumpvars(1);
$display("OR gate Realisation \nA B Y");
$monitor(A," ",B," ",Y);
A = 0; B = 0; #1;
A = 0; B = 1; #2;
A = 1; B = 0; #3;
A = 1; B = 1; #4;
end
endmodule

