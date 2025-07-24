`timescale 1ns/1ps

module tb_high;
	tri1 master_bus;
	reg master_out = 1;
	reg reset = 0;
	reg clk = 1;
	
	assign master_bus = master_out;
	
	high_module hi_mod(
		.reset(reset),
		.clk(clk),
		.onewire_bus(master_bus)
	);
	
	always begin
		#(500) clk <= ~clk; // 1 MHz clock
	end;
	
	initial begin
		$dumpfile("high_test.vcd");
		$dumpvars(0);
		reset <= 1;
		#(10);
		reset <= 0;
		#(10);
		master_out <= 0;
		#(500000); // 500 us reset pulse
		master_out <= 1'bz;
		#(500000); // 500 us after reset pulse
		
		// Writing one, 100 us:
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		// Writing zero, 100 us
		master_out <= 0;
		#(90000); // 90 us
		master_out <= 1'bz;
		#(10000); // 10 us
		
		master_out <= 0;
		#(90000); // 90 us
		master_out <= 1'bz;
		#(10000); // 10 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(90000); // 90 us
		master_out <= 1'bz;
		#(10000); // 10 us
		
		master_out <= 0;
		#(90000); // 90 us
		master_out <= 1'bz;
		#(10000); // 10 us
		
		// Writing ones 64 times, so master could read value
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		master_out <= 0;
		#(10000); // 10 us
		master_out <= 1'bz;
		#(90000); // 90 us
		
		$finish;
	end;
endmodule;