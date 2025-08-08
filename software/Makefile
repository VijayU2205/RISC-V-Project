# Build firmware
firmware: firmware/simple_add.S
    riscv32-unknown-elf-as -march=rv32i -o simple_add.o firmware/simple_add.S
    riscv32-unknown-elf-ld -Ttext=0x0 -o simple_add.elf simple_add.o

# Run simulation
sim: 
    iverilog -o sim hardware/rv32i_core.v hardware/tb/core_tb.v
    vvp sim

clean:
    rm -f *.o *.elf *.vcd sim
