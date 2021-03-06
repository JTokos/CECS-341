# Harold Agnote 
# Professor Joshua Hayter
# CECS 341 - Sec. 07
# 2/9/2017

# A: $s0; B: $s1; C: $s2; D: $s3; E: $s4; F: $s5; G: $s6; H: $s7

# Exercise 1

addi $s0, $0, 200		# A = 200
addi $s1, $0, 600		# B = 600
addi $s2, $0, -1200		# C = -1200
addi $s3, $0, -1500		# D = -1500
addi $s4, $0, -2000		# E = -2000

# F = (A - (B+C)) - (D + E);

add $t2, $s1, $s2		# B + C = 600 + (-1200) = -600
add $t3, $s3, $s4		# D + E = -1500 + (-2000) = -3500
sub $t1, $s0, $t2		# A - (B + C) = 200 - (-600) = 800
sub $s5, $t1, $t3		# (A - (B + C)) - (D + E) = 800 - (-3500) = 4300

# Exercise 2

addi $s3, $0, 2000		# D = 2000
addi $s4, $0, 6000		# E = 6000
add $s5, $0, $0			# F = 0

# F = -D - (E + 32)

sub $t0, $0, $s3		# -D = 0 - 2000 = -2000
addi $t1, $s4, 32		# E + 32 = 6000 + 32 = 6032
sub $s5, $t0, $t1		# -D - (E + 32) = -2000 - 6032 = -8032

# Exercise 3

addi $s7, $0, 500		# H = 500
addi $s6, $0, 250		# G = 250

# F = (H > G) ? 1 : 0

slt $s5, $s6, $s7		# (H > G) ? 1 : 0 = 1

# Exercise 4

addi $s5, $0, 0x30		# F = 0x30 = 48

# H = F * 5 = (F + F) + (F + F) + F

add $t0, $s5, $s5		# (F + F) = 48 + 48 = 96
add $t1, $t0, $t0		# (F + F) + (F + F) = 96 + 96 = 192
add $s7, $t1, $s5		# (F + F) + (F + F) + F = 192 + 48 = 240

# Exercise 4 Extra

addi $s5, $0, 0x30		# F = 0x30 = 48

# H = F * 5 = (F * 4) + F

sll $t0, $s5, 2			# (F * 4) = 192
add $s7, $t0, $s5		# (F * 4) + F = 192 + 48 = 240

# Exercise 5

addi $s6, $0, 10000		# G = 10,000
addi $s7, $0, 20000		# G = 20,000

# F = ~(G+H)+1

add $t0, $s6, $s7		# G + H = 10000 + 20000 = 30000 = 0b111010100110000
nor $t1, $t0, $0		# ~(G + H) = ~0b111010100110000 = 0b000101011001111 = 2767
addi $s5, $t1, 1		# ~(G + H) = 2767 + 1 = 2768