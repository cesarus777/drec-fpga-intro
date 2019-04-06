<<<<<<< HEAD
module rom2 #(parameter LENGTH = 8, parameter WIDTH = 32)(
    input [WIDTH - 1:0]addr,
    output [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[LENGTH - 1:0];
=======
module rom_comb #(parameter ADDR_WIDTH = 3, parameter WIDTH = 32)(
    input [2**ADDR_WIDTH - 1:0]addr,
    output [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];
>>>>>>> 6c98b264888a5ff84928e8c2c628d53f8b4a88ce

initial begin
    $readmemh("program.txt", mem);
end

assign q = mem[addr];

endmodule

