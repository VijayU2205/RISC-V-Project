all: firmware sim

firmware: firmware/fibonacci.S
    riscv32-unknown-elf-as -march=rv32i -o fibonacci.o firmware/fibonacci.S
    riscv32-unknown-elf-ld -Ttext=0x0 -o fibonacci.elf fibonacci.o
    riscv32-unknown-elf-objcopy -O verilog fibonacci.elf firmware.hex

sim:
    iverilog -o sim -I hardware hardware/riscv_soc.v hardware/tb/advanced_tb.v
    vvp sim

view:
    gtkwave wave.vcd

clean:
    rm -f *.o *.elf *.vcd sim firmware.hex
