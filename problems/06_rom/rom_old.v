module rom #(parameter LENGTH = 8, parameter WIDTH = 32)(
    input [WIDTH - 1:0]addr,

module rom #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(

    input [2**ADDR_WIDTH - 1:0]addr,
    input [ADDR_WIDTH - 1:0]addr,
    input clk,
    output reg [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[LENGTH - 1:0];
reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin
    $readmemh("program.txt", mem);
end

always @(posedge clk) begin
    q <= mem[addr];
end

endmodule

