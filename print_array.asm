# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0
.data
	# TODO: Write your initializations here
    myArray: .word 1 2 3 4 5 6 7 8 9 10
    myArraySize: .word 10
    answer: .asciiz "The contents of the array are:\n"
    nline: .asciiz "\n"

.text
printA:
    move $t5, $a0
loop:
    # TODO: Write your function code here
    bge $t0, $a1, exit_printA
    # load word and go to next one
    lw $t2, 0($t5)
    addi $t5, $t5, 4
    # print value
    li $v0, 1      
    move $a0, $t2
    syscall
    # newline
    li $v0, 4
    la $a0, nline
    syscall
    # increment counter
    addi $t0, $t0, 1
    j loop
exit_printA:
    jr $ra
main:
	# TODO: Write your main function code here
    li $v0, 4
    la $a0, answer
    syscall

    li $t0, 0
    la $a0, myArray
    lw $a1, myArraySize 
    jal printA
exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall