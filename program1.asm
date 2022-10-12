leaf_example:
    addi $sp, $sp, -12
    sw $t1, 8($sp)
    sw $t0, 4($sp)
    sw $s0, 0($sp)

    add	$t0, $s1, $s2		# $t0 = $s1 + $s2 | $t0 = g + h
    add	$t1, $s3, $s4		# $t1 = $s3 + $s4 | t1 = i + j
    sub $s0, $t0, $t1       # $s0 = $t0 - $t1 

    lw $s0, 0($sp)
    lw $t0, 4($sp)
    lw $t1, 8($sp)
    addi $sp,$sp,12

    jr $ra