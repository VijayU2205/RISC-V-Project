.section .text
.global _start
_start:
    li a0, 5        # Load immediate 5
    li a1, 3        # Load immediate 3
    add a2, a0, a1  # a2 = a0 + a1
    ebreak          # Stop execution
