module rv32i_core (
    input clk,
    input reset,
    output [31:0] pc
);
    reg [31:0] pc_reg;
    always @(posedge clk or posedge reset) begin
        if (reset) pc_reg <= 0;
        else pc_reg <= pc_reg + 4;
    end
    assign pc = pc_reg;
endmodule
