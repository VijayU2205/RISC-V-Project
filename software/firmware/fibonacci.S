.section .text
.global _start
_start:
    li a0, 0        # F(0)
    li a1, 1        # F(1)
    li t0, 10       # Counter
    li t1, 0x1000   # GPIO address
    
loop:
    add a2, a0, a1  # F(n) = F(n-1) + F(n-2)
    sw a2, 0(t1)    # Output to GPIO
    mv a0, a1
    mv a1, a2
    addi t0, t0, -1
    bnez t0, loop
    
    ebreak
