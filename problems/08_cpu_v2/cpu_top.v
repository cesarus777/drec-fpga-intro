module cpu_top(
    input clk,

    output [15:0]data_out
);

wire [31:0]instr_addr;
wire [31:0]instr_data;
rom rom(.clk(clk), .addr(instr_addr), .q(instr_data));

wire [31:0]mem_addr;
wire [31:0]mem_data;
wire mem_we;
/*
*   Problem 4:
*   Instantiate memory controller here
*/
mem_ctrl mem_ctrl(
    .clk(clk),
	 .addr(mem_addr),
	 .data(mem_data),
	 .we(mem_we),
	 .data_out(data_out)
);


core core(
    .clk(clk),
    .instr_data(instr_data), .last_pc(32'h7),
    .instr_addr(instr_addr),
    /*
    *   Problem 2:
    *   Connect address, data and write-enable buses here
    */
    .mem_addr(mem_addr),
    .mem_data(mem_data),
    .mem_we(mem_we)
);

endmodule