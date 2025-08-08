module pipelined_core (
    input clk, reset,
    output [31:0] pc
);
    // Pipeline registers
    reg [31:0] IF_ID_inst, IF_ID_pc;
    reg [31:0] ID_EX_rs1, ID_EX_rs2, ID_EX_imm;
    reg [4:0]  ID_EX_rd;
    reg        ID_EX_mem_write;
    
    // Control signals
    wire [31:0] inst;
    wire [31:0] alu_out;
    
    // Instruction Fetch
    always @(posedge clk) begin
        if (reset) IF_ID_pc <= 0;
        else IF_ID_pc <= IF_ID_pc + 4;
    end
    
    // Instruction Decode
    always @(posedge clk) begin
        ID_EX_rs1 <= register_file[inst[19:15]];
        ID_EX_rs2 <= register_file[inst[24:20]];
        ID_EX_imm <= {{20{inst[31]}}, inst[31:20]}; // Sign-extend
    end
    
    // Execute (ALU)
    assign alu_out = ID_EX_rs1 + ID_EX_imm; // Simple ADD
    
    // Memory + Writeback stages omitted for brevity
endmodule
