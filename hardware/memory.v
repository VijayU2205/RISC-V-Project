module memory (
    input clk,
    input [31:0] addr,
    input [31:0] wdata,
    input we, // Write enable
    output [31:0] rdata
);
    reg [31:0] mem [0:1023]; // 4KB memory
    
    always @(posedge clk) begin
        if (we) mem[addr[11:2]] <= wdata;
    end
    
    assign rdata = mem[addr[11:2]]; // Word-aligned
endmodule
