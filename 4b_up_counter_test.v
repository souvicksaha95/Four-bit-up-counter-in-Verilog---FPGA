`timescale 10ns/1ns
module test_counter;
	reg clk,clear;
	wire [3:0] out;
	
	four_up_counter DUT(.clock(clk), .clear(clear), .q(out));
	
	initial
		begin
			clk = 1'b0;
			//repeat(100)
			//#10 clk = ~clk;
		end
	
	initial
		begin
			#400 $finish;
		end
		
	initial
		begin
			clear = 1'b1;
			#34 clear = 1'b0;
			#200 clear = 1'b0;
			#50 clear = 1'b0;
		end
		
	initial
		begin
			$dumpfile("4_bit_counter.vcd");
			$dumpvars(0, test_counter);
			$monitor($time, " Count = %h, Clk = %b, Clear = %b", out, clk, clear);
		end
		
	always
		#10 clk = ~clk;
endmodule