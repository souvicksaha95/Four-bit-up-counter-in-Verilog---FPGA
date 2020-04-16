module four_up_counter (clock, clear, q);
	input clock, clear;
	output [3:0] q;
	
	t_flipflop tff0(.clk(clock), .reset(clear), .out(q[0]));
	t_flipflop tff1(.clk(q[0]), .reset(clear), .out(q[1]));
	t_flipflop tff2(.clk(q[1]), .reset(clear), .out(q[2]));
	t_flipflop tff3(.clk(q[2]), .reset(clear), .out(q[3]));
endmodule