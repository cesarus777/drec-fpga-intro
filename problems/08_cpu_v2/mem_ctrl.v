module mem_ctrl(
    input clk,
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg [15:0]data_out = 16'b0
);

wire [31:0]data_in = data;
wire [15:0]ldata = data_in[15:0];

always @(posedge clk) begin
/*
*   Problem 4:
*   Drive 'data_out' register here
*/
    if (we) begin
		      data_out <= ldata;
	 end
end

endmodule
