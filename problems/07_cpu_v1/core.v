module core(
    input clk,
    input [31:0]instr_data,
    input [31:0]last_pc,

    output [31:0]instr_addr
);

reg [31:0]pc = 32'hFFFFFFFF;
wire [31:0]pc_next = (pc == last_pc) ? pc : pc + 1;

always @(posedge clk) begin
    pc <= pc_next;
    $strobe("CPUv1: [%h] %h", pc, instr);
end

wire is_imm;

wire [31:0]instr = instr_data;
assign instr_addr = pc_next;

wire [4:0]rd = instr_data[11:7]; /* Problem 4: extract field 'rd' from instruction */
wire [4:0]rs1 = instr_data[19:15]; /* Problem 4: extract field 'rs1' from instruction */
wire [4:0]rs2 = instr_data[24:20]; /* Problem 4: extract field 'rs2' from instruction */

wire [31:0]rf_rdata0;
wire [4:0]rf_raddr0 = rs1;

wire [31:0]rf_rdata1;
wire [4:0]rf_raddr1 = rs2;

wire [31:0]rf_wdata = alu_result;
wire [4:0]rf_waddr = rd;
wire rf_we;

wire [31:0]alu_result;
wire [31:0]alu_b_src;

always @(posedge clk) begin
    if (is_imm)
        [31:0]alu_b_src = [31:0]imm32;
    if (~is_imm)
        [31:0]alu_b_src = [31:0]rf_rdata1;
end

wire [2:0]alu_op;
alu alu(
    .src_a(rf_rdata0), .src_b(alu_b_src),
    .op(alu_op),
    .res(alu_result)
);

reg_file rf(
    .clk(clk),
    .raddr0(rf_raddr0), .rdata0(rf_rdata0),
    .raddr1(rf_raddr1), .rdata1(rf_rdata1),
    .waddr(rf_waddr), .wdata(rf_wdata), .we(rf_we)
);

wire [11:0]imm12;

/*
* Problem 4:
* Write sign extension logic for imm12 and imm32.
*/

wire [31:0]imm32 = {{20{imm12[11]}}, imm12};

control control(
    .instr(instr),
    .imm12(imm12),
    .rf_we(rf_we),
    .is_imm(is_imm),
    .alu_op(alu_op)
);

endmodule
