# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0
.text
conv:
    # TODO: Write your function code here
    li $v0, 0 # v0 = z
	li $t0, 0 # t0 = iterator i
	li $t1, 5 # t1 = where loop ends
loop:
	# first operation
	li $t3, 2
	mult $a0,$t3
	mflo $t4
    add $v0, $t4, $v0
	sub $v0, $v0, $a1
	# if statement
	li $t5, 3
	bge $a0, $t5, branch1 # if t2 >= t0
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	slt $t2, $t0, $t1 # t2 will be 1 if t0 < t1
	bne $t2, $zero, loop
	jr $ra
branch1:
	addi $a1, $a1, -1
	addi $a0, $a0, 1
	addi $t0, $t0, 1
	slt $t2, $t0, $t1 # t2 will be 1 if t0 < t1
	bne $t2, $zero, loop
	jr $ra
main:
	# TODO: Write your main function code here
    li $a0, 5
	li $a1, 7
    jal conv
    # Print Result
    move $a0, $v0
    li $v0, 1
    syscall
exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall