#Print integer
.macro print_int(%x)
li $v0, 1
add $a0, $zero, %x
syscall
.end_macro

#Print string literal
.macro print_str(%str)
	.data
data: .asciiz %str
	.text
	li $v0, 4
	la $a0, data
	syscall
.end_macro

#print string in a register
.macro print_add(%word)
	li $v0, 4
	la $a0, (%word)
	syscall
.end_macro 

#Compares the input string to a register
.macro chk_str(%str,$x) 
	
	.data
cmpstr: .ascii %str
	.align 2	#not aligning gives error that word not aligned on indec
word:	.space 24
	
	.text
la $a0, cmpstr
la $a3,	($x)

add $t0,$zero,$zero 	#counter
add $t1,$zero,$a0   	#loop over first string
add $t2,$zero,$a3  	#loop over second string

loop:
	lb $t3($t1)  	#load a byte from each string
	lb $t4($t2)
	beqz $t3,checkt2 #str1 end
	beqz $t4,missmatch
	slt $t5,$t3,$t4  #compare two bytes
	bnez $t5,missmatch
	addi $t1,$t1,1  #t1 points to the next byte of str1
	addi $t2,$t2,1
j loop
	#Check if user input is "op"
missmatch: 
	addi $v0,$zero,-1 #set to neg 1 so we can beqzal if zero
	j end
checkt2:
	bnez $t4,missmatch
	add $v0,$zero,$zero
end:
.end_macro 

.macro choiceMade
	print_str("")
	print_str("--------------------------------------------")
	print_str("\n")
.end_macro 

.macro print_ship
	print_str("                     `. ___						\n")
	print_str("                    __,' __`.                _..----....____		\n")
	print_str("        __...--.'``;.   ,.   ;``--..__     .'            _.-'	\n")
	print_str("  _..-''-------'   `'   `'   `'     O ``-''._         _,'		\n")
	print_str(",'________________                          \`-._   ,'		\n")
	print_str(" `._              ```````````------...___   '-.._'-:			\n")
	print_str("    ```--.._      ,.                     ````--...__\-.		\n")
	print_str("            `.--. `-`                       ____    |  |`		\n")
	print_str("              `. `.                       ,'`````.  ;  ;`		\n")
	print_str("                `._`.        __________   `.      \'__/`		\n")
	print_str("                   `-:._____/______/___/____`.     \  `		\n")
	print_str("                               |       `._    `.    \		\n")
	print_str("                               `._________`-.   `.   `.___		\n")
	print_str("                                             ``  `------'`		\n")
.end_macro 
.macro print_monster
	print_str("                            ,-.				\n")
	print_str("       ___,---.__          /'|`\          __,---,___		\n")
	print_str("    ,-'    \\`    `-.____,-'  |  `-.____,-'    //    `-.	\n")
	print_str("  ,'        |           ~'\     /`~           |        `.	\n")
	print_str(" /      ___//              `. ,'          ,  , \___      \	\n")
	print_str("|    ,-'   `-.__   _         |        ,    __,-'   `-.    |	\n")
	print_str("|   /          /\\_  `   .    |    ,      _/\\          \\   |	\n")
	print_str("\  |           \\ \\`-.___ \   |   / ___,-'/ /           |  /	\n")
	print_str(" \\  \\           | `._   `\\  |  //'   _,' |           /  /	\n")
	print_str("  `-.\\         /'  _ `---'' , . ``---' _  `\         /,-'	\n")
	print_str("     ``       /     \\    ,='/ \\`=.    /     \       ''	\n")
	print_str("             |__   /|\\_,--.,-.--,--._/|\\   __|		\n")
	print_str("             /  `./  \\\`\\ |  |  | /,//' \,'  \		\n")
	print_str("            /   /     ||--+--|--+-/-|     \   \		\n")
	print_str("           |   |     /'\\_\\_\\ | /_/_/`\\     |   |		\n")
	print_str("            \   \__, \_     `~'     _/ .__/   /		\n")
	print_str("             `-._,-'   `-._______,-'   `-._,-'		\n")
.end_macro 
.macro print_win
print_str(" _  _  _____  __  __    _    _  ____  _  _ \n")
print_str("( \\/ )(  _  )(  )(  )  ( \\/\\/ )(_  _)( \\( )\n")
print_str(" \\  /  )(_)(  )(__)(    )    (  _)(_  )  ( \n")
print_str(" (__) (_____)(______)  (__/\\__)(____)(_)\\_)\n")
.end_macro
.macro intro
print_str(" .   ___  ____   __    ___  ____     \n")
print_str(" .  / __)(  _ \\ /__\\  / __)( ___)    \n")
print_str(" .  \\__ \\ )___//(__)\\( (__  )__)    \n")
print_str(" .  (___/(__) (__)(__)\\___)(____)  \n")
.end_macro
.macro intro2
print_str(" .    __    ____  _  _  ____  _  _  ____  __  __  ____  ____  \n")
print_str(" .   /__\\  (  _ \\( \\/ )( ___)( \\( )(_  _)(  )(  )(  _ \\( ___) \n")
print_str(" .  /(__)\\  )(_) )\  /  )__)  )  (   )(   )(__)(  )   / )__)  \n")
print_str(" . (__)(__)(____/  \\/  (____)(_)\\_) (__) (______)(_)\\_)(____) \n")
.end_macro 