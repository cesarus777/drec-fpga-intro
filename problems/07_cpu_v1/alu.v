module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,

    output reg [31:0]res
);

always @(*) begin
/*
* Problem 1:
* Write operations execution logic here.
*/

  casez (op)
    3'b000  : res <= src_a;
//      end
    3'b001  : res <= src_a + src_b; //ADDI
//      end
    3'b010  : res <= src_a ^ src_b; //XORI
//      end
    3'b011  : res <= src_a | src_b; //ORI
//      end
    3'b100  : res <= src_a & src_b; //ANDI
//      end
    default : res <= 0;
  endcase

end

endmodule
