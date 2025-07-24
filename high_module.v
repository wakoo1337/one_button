`timescale 1ns/1ps

module high_module(input wire reset, input wire clk, inout tri1 onewire_bus);
	low_module low_mod(
		.reset(reset),
		.clk(clk),
		.onewire_bus(onewire_bus)
	);
	
endmodule;