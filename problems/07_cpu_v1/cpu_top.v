module cpu_top(
    input clk
);

wire [31:0]instr_addr;
wire [31:0]instr_data;
rom rom(.clk(clk), .addr(/* Problem 5 */instr_addr), .q(/* Problem 5 */instr_data));

core core(
    .clk(clk),
    .instr_data(/* Problem 5 */instr_data), .last_pc(32'h7),
    .instr_addr(/* Problem 5 */instr_addr)
);

endmodule
