`timescale 1ns/1ps

module low_module(input wire reset, input wire clk, inout tri1 onewire_bus, output reg [7:0]out_byte, input wire [7:0]in_byte, input wire direction, output reg finished, input wire next_strobe);
	reg bus_pulldown;
	reg counter_running;
	reg [7:0]in_buffer;
	reg [7:0]out_buffer;
	integer counter;
	integer threshold;
	integer state;
	integer in_count;
	
	assign onewire_bus = bus_pulldown;
	
	localparam STATE_1WRESET_HIGH         = 1; // Processing 1-Wire bus reset, high
	localparam STATE_1WRESET_PRESENCE_END = 2;
	localparam STATE_INITIALIZED          = 4;
	localparam STATE_BIT_RECEPTION        = 8;
	
	always @ (posedge reset) begin
		bus_pulldown <= 1'bz;
		counter_running <= 1;
		counter <= 0;
		state <= STATE_1WRESET_HIGH;
		out_byte <= 8'h00;
		finished <= 0;
		in_buffer <= 8'h00;
		in_count <= 0;
	end;
	
	always @ (posedge clk) begin
		if (counter_running == 1) begin
			counter <= counter + 1;
			if (counter == threshold) case (state)
				STATE_1WRESET_HIGH:
				begin
					counter <= 0;
					state <= STATE_1WRESET_PRESENCE_END;
					threshold <= 360;
					bus_pulldown <= 1'b0;
				end
				STATE_1WRESET_PRESENCE_END:
				begin
					bus_pulldown <= 1'bz;
					state <= STATE_INITIALIZED;
					counter <= 0;
					counter_running <= 0;
					threshold <= 0;
				end
				STATE_BIT_RECEPTION:
				begin
					bus_pulldown = 1'bz;
					in_buffer = in_buffer >> 1;
					in_buffer[7] = onewire_bus;
					in_count <= in_count + 1;
					state <= STATE_INITIALIZED;
					if (onewire_bus) begin
						counter <= 0;
						counter_running <= 0;
						threshold <= 0;
					end;
					if (in_count == 7) begin
						out_byte <= in_buffer;
						finished <= 1;
						in_count <= 0;
					end else if (in_count == 4) begin
						finished <= 0;
					end;
				end
			endcase;
		end else counter <= 0;
	end;
	
	always @ (negedge onewire_bus) begin
		if (state == STATE_INITIALIZED) begin
			counter <= 0;
			counter_running <= 1;
			threshold <= 30;
			state <= STATE_BIT_RECEPTION;
			if (direction) begin
				if (out_buffer[0]) bus_pulldown <= 1'bz;
				else bus_pulldown <= 1'b0;
				out_buffer = out_buffer >> 1;
			end;
		end;
	end;
	
	always @ (posedge onewire_bus) begin
		if (counter >= 480) begin
			state <= STATE_1WRESET_HIGH;
			counter <= 0;
			counter_running <= 1;
			threshold <= 30;
		end else if (state == STATE_INITIALIZED) begin
			counter_running <= 0;
			counter <= 0;
			threshold <= 0;
		end;
	end;
	
	always @ (posedge next_strobe) begin
		out_buffer <= in_byte;
	end;
endmodule;