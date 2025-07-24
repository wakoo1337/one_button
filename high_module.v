`timescale 1ns/1ps

module high_module(input wire reset, input wire clk, inout tri1 onewire_bus);
	wire [7:0]readed_byte;
	wire finished;
	reg direction;
	reg [7:0]writing_byte;
	integer state;
	integer byte_num;
	reg next_strobe;
	
	low_module low_mod(
		.reset(reset),
		.clk(clk),
		.onewire_bus(onewire_bus),
		.out_byte(readed_byte),
		.direction(direction),
		.finished(finished),
		.next_strobe(next_strobe),
		.in_byte(writing_byte)
	);
	
	localparam STATE_READING_CMD = 1;
	localparam STATE_WRITING = 2;
	
	always @ (posedge reset) begin
		direction <= 0;
		state <= STATE_READING_CMD;
		byte_num <= 0;
		next_strobe <= 0;
	end;
	
	always @ (posedge finished) begin
		case (state)
			STATE_READING_CMD:
			begin
				if (readed_byte == 8'h33) begin
					state <= STATE_WRITING;
					direction <= 1;
					byte_num <= 0;
					writing_byte <= 8'h12;
					next_strobe <= 1;
				end;
			end
			STATE_WRITING:
			begin
				if (byte_num == 0) begin
					writing_byte <= 8'h34;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 1) begin
					writing_byte <= 8'h56;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 2) begin
					writing_byte <= 8'h78;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 3) begin
					writing_byte <= 8'h9a;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 4) begin
					writing_byte <= 8'hbc;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 5) begin
					writing_byte <= 8'hde;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 6) begin
					writing_byte <= 8'hf1;
					next_strobe <= 1;
					byte_num = byte_num + 1;
				end else if (byte_num == 7) begin
					direction <= 0;
					byte_num <= 0;
					state <= STATE_READING_CMD;
					writing_byte <= 8'd0;
				end;
			end
		endcase;
	end;
	
	always @ (negedge finished) begin
		next_strobe <= 0;
	end;
	
endmodule;