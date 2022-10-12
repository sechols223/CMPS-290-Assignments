# if(i==j) g=h+i;
# else g=h-i;

li $s1, 5 #g
li $s2, 5 #h
li $s3, 10 #i
li $s4, 10 #j

bne $s3, $s4, else #if($s3!=$s4) go to else
add $s0, $s1, $s2 #$s0 = $s1 + $s2
j Exit #unconditional jump to Exit

else:
sub $s0, $s1, $s2 #$s0 = $s1 - $s2

 #print our result and exit the program
Exit:
li $v0, 1
move $a0, $s0
syscall

li $v0, 10
syscall

