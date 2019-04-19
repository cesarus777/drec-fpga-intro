module control(
    input [31:0]instr,

    output reg [11:0]imm12,
    output reg rf_we,
    output reg is_imm;
    output reg [2:0]alu_op
);

wire [6:0]opcode = instr[6:0]; /* Problem 3: extract field 'opcode' from instruction. */
wire [2:0]funct3 = instr[14:12]; /* Problem 3: extract field 'funct3' from instruction. */
wire [4:0]funct5 = instr[31:27]; /* extract field 'funct5' from instructio */

always @(*) begin
    rf_we = 1'b0;
    alu_op = 3'b0;
    imm12 = 12'b0;

    casez ({funct5, funct3, opcode})
        15'b?????_000_0010011: begin // ADDI
            rf_we = 1'b1;
            is_imm = 1'b1;
            alu_op = 3'b1;
            imm12 = instr[31:20];
        end
        15'b?????_100_0010011: begin // XORI
            rf_we = 1'b1;
            is_imm = 1'b1;
            alu_op = 3'b10;
            imm12 = instr[31:20];
        end
        15'b?????_110_0010011: begin // ORI
            rf_we = 1'b1;
            is_imm = 1'b1;
            alu_op = 3'b11;
            imm12 = instr[31:20];
        end
        15'b?????_111_0010011: begin // ANDI
            rf_we = 1'b1;
            is_imm = 1'b1;
            alu_op = 3'b100;
            imm12 = instr[31:20];
        end
        15'b00000_000_0110011: begin // ADD
            rf_we = 1'b1;
            is_imm = 1'b0;
            alu_op = 3'b1;
        end
        15'b00000_100_0110011: begin // XOR
            rf_we = 1'b1;
            is_imm = 1'b0;
            alu_op = 3'b10;
        end
        15'00000_110_0110011: begin // OR
            rf_we = 1'b1;
            is_imm = 1'b0;
            alu_op = 3'b11;
        end
        15'00000_111_0110011: begin // AND
            rf_we = 1'b1;
            is_imm = 1'b0;
            alu_op = 3'b100;
        end
        default: ;
    endcase
end

endmodule
