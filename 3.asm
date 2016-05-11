#Write a program that reads two integer numbers A and B. 
#The program must to indicate if one of these numbers is multiple of the other one.
.data
m1:
.asciiz "Enter integer: "
m2:
.asciiz "Will check if integer A (larger) is a multiple of integer B (smaller).\n"
m3:
.asciiz " is a multiple of " 
m4:
.asciiz " is not a multiple of " 

.text
main:
la $a0, m2 #load parameter
jal printString 

jal read #call read function
move $t0, $v0 #store read value into $t0
jal read
move $t1, $v0

div $t0, $t1
mfhi $t2 #hi contains remainder of division

move $a0, $t0
jal printInt

beqz $t2 is

#not
la $a0, m4
jal printString
j quit

is:
la $a0, m3
jal printString

quit:
move $a0, $t1
jal printInt
li $v0, 10
syscall

read:
sub $sp,$sp,4 #push
sw $ra,($sp) #store ra into the address that sp points to
la $a0, m1 #load parameter
jal printString 
lw $ra,($sp) #pop, restore $ra register
addiu $sp,$sp,4 #pop, restore stack pointer

li $v0, 5
syscall #read int
jr $ra #jump to return address that was stored by jal

printString:
li $v0, 4
syscall #print m1
jr $ra

printInt:
li $v0, 1
syscall
jr $ra