# Write MALP for:
# length = 10
# array[10] = {1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554};
# for (i = 0 ; i< length; i++)
#   printf("%d\n",array[i]);

.data 
array: .word 1, 2, 3, 4
length: .word 4

.text
main:
la $s0, array    # base address
li $t0, 0        # loop variable
lw $t1, length   # no. of elements

loop: 
bge $t0, $t1, exit
lw $t2, 0($s0)   # fetch element
addi $s0, $s0, 4 # move by 4 locations
addi $t0, $t0, 1 # increment loop

# print int 
li $a0, $t2
syscall
j loop

exit: 
li $v0, 10
syscall