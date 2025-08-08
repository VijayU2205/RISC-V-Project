module riscv_soc (
    input clk, reset,
    output [31:0] gpio_out
);
    wire [31:0] mem_addr, mem_wdata, mem_rdata;
    wire mem_we;
    
    pipelined_core cpu (
        .clk(clk),
        .reset(reset),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_rdata(mem_rdata),
        .mem_we(mem_we)
    );
    
    memory mem (
        .clk(clk),
        .addr(mem_addr),
        .wdata(mem_wdata),
        .we(mem_we),
        .rdata(mem_rdata)
    );
    
    assign gpio_out = (mem_addr == 32'h1000) ? mem_wdata : 0;
endmodule
