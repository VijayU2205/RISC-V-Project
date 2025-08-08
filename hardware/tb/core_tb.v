`timescale 1ns/1ps
module core_tb;
    reg clk = 0;
    reg reset = 1;
    wire [31:0] pc;

    rv32i_core uut (.clk(clk), .reset(reset), .pc(pc));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, core_tb);
        #10 reset = 0;
        #100 $finish;
    end
endmodule
