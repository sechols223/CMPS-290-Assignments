.data
	array: .word 0:80 #creates an array of size "80" (it's really 80 / 4) and sets the default value of each element to 0
	newline: .asciiz "\n"
	begin: .asciiz "Enter a value between 0 and 20: "
	continue: .asciiz "Enter the desired value: "
	search: .asciiz "Enter number to search for: "
	found: .asciiz "The array does contain that number!"
	notFound: .asciiz "That number does not exist in the array"
.text
	main:
		#Prints the beginning  prompt
		li $v0, 4
		la $a0, begin
		syscall		
		
		#User Input
		li $v0, 5
		syscall
		add $s0, $0, $v0
		
		li $v0, 4
		la $a0, search
		syscall
		
		# s5 = number to search for
		li $v0, 5
		syscall
		add $s5, $0, $v0
		
		
		
		
	whileFirst: 
		beq $t7, $s0, promptWhile
		
		lw $t6, array($t0)
		addi $t7, $t7, 4
		
		li $v0, 4
		la $a0, continue
		syscall
		
		li $v0, 5
		syscall
		add $s1, $zero, $v0
		
		sw $s1, array($t0)
			addi $t0, $t0, 4
		
		
		j whileFirst
	
	promptWhile:
		beq $t0, 80, exit
		
		lw $t6, array($t0)
		
		addi $t0, $t0, 4
		
		beq $s5, $t6 equal 
		 
		j promptWhile
		
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
	