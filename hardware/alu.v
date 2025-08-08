module alu (
    input [31:0] a, b,
    input [2:0] op,
    output reg [31:0] result
);
    always @(*) begin
        case(op)
            3'b000: result = a + b;    // ADD
            3'b001: result = a - b;    // SUB
            3'b010: result = a & b;    // AND
            default: result = 0;
        endcase
    end
endmodule
