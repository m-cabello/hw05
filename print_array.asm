# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0
.data
	# TODO: Write your initializations here
    myArray: .word 1 2 3 4 5 6 7 8 9 10
    answer: .asciiz "The contents of the array are:\n"
    nline: .asciiz " "
.text
printA:
    # TODO: Write your function code here
    bge $t0, 10, exit_printA
    # load word and go to next one
    lw $t2, 0($a1)
    addi $a1, $a1, 4
    # print value
    li $v0, 1      
    move $a0, $t2
    syscall
    # increment counter
    addi $t0, $t0, 1
    j printA
exit_printA:
    jr $ra
main:
	# TODO: Write your main function code here
    li $v0, 4
    la $a0, answer
    syscall
    li $t0, 0
    la $a1, myArray
    jal printA
exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall