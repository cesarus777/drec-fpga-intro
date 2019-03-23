module rom2 #(parameter LENGTH = 8, parameter WIDTH = 32)(
    input [WIDTH - 1:0]addr,
    output [WIDTH - 1:0]q
);

reg [WIDTH - 1:0]mem[LENGTH - 1:0];

initial begin
    $readmemh("program.txt", mem);
end

assign q = mem[addr];

endmodule

