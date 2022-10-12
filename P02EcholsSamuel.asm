.data
	array: .space 20
	newline: .asciiz "\n"
	begin: .asciiz "Enter a value between 0 and 20: "
	continue: .asciiz "Enter the next value: "
	search: .asciiz "Enter number to search for: "
	found: .asciiz "The array does contain that number!"
	notFound: .asciiz "That number does not exist in the array"
	
.text
	main:
		#Prints a prompt
		li $v0, 4
		la $a0, begin
		syscall		
		
		#User Input
		li $v0, 5
		syscall
		add $s0,$0, $v0
		
		li $v0, 4
		la $a0, continue
		syscall
		
		#User Input
		li $v0, 5
		syscall
		add $s1, $0, $v0
		
		li $v0, 4
		la $a0, continue
		syscall
		
		#User Input
		li $v0, 5
		syscall
		add $s2, $0, $v0
		
		li $v0, 4
		la $a0, continue
		syscall
		
		#User Input
		li $v0, 5
		syscall
		add $s3, $0, $v0
		
		li $v0, 4
		la $a0, continue
		syscall
		
		#User Input
		li $v0, 5
		syscall
		add $s4, $0, $v0
		
		sw $s0, array($t0)
			addi $t0, $t0, 4
		sw $s1, array($t0)
			addi $t0, $t0, 4
		sw $s2, array($t0)
			addi $t0, $t0, 4
		sw $s3, array($t0)
			addi $t0, $t0, 4
		sw $s4, array($t0)
			addi $t0, $t0, 4
		
		#Resets index to 0
		addi $t0, $0, 0
		
		li $v0, 4
		la $a0, search
		syscall
		
		# s5 = number to search for
		li $v0, 5
		syscall
		add $s5, $0, $v0
	
	while:
		beq $t0, 20, exit
		
		lw $t6, array($t0)
		
		addi $t0, $t0, 4
		
		beq $s5, $t6 equal 
		 
		j while
		
	exit:
		li $v0, 4
		la $a0, notFound
		syscall
				
		li $v0, 10
		syscall
		
	equal:
		li $v0, 4
		la $a0, found
		syscall
		
		li $v0, 10
		syscall
	