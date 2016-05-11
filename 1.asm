#Write a program, using the MIPS 32 assembly language, to calculate the sum of the first 100 numbers. 
#The result must be stored in register $v0.
.data
lim: .word 100
.text
main:
lw $t2, lim
li $t0, 2 #int i = 2;
li $t1, 1 #int num = 1;
loop:
add $t1, $t1, $t0 #num = num + i;
addi $t0, $t0, 1 #i++;
bne $t0, $t2, loop #i != 100

add $t1, $t1, $t0 #num = num + i; extra call for i == 100

move $v0, $t1 #must be stored in register $v0

#print
li $v0, 1
move $a0, $t1
syscall

#quit
li $v0, 10
syscall