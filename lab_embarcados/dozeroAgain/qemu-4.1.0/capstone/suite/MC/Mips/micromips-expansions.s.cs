# CS_ARCH_MIPS, CS_MODE_MIPS32+CS_MODE_MICRO, None
0xa0,0x50,0x7b,0x00 = ori $5, $zero, 123
0xc0,0x30,0xd7,0xf6 = addiu $6, $zero, -2345
0xa7,0x41,0x01,0x00 = lui $7, 1
0xe7,0x50,0x02,0x00 = ori $7, $7, 2
0x80,0x30,0x14,0x00 = addiu $4, $zero, 20
0xa7,0x41,0x01,0x00 = lui $7, 1
0xe7,0x50,0x02,0x00 = ori $7, $7, 2
0x85,0x30,0x14,0x00 = addiu $4, $5, 20
0xa7,0x41,0x01,0x00 = lui $7, 1
0xe7,0x50,0x02,0x00 = ori $7, $7, 2
0x07,0x01,0x50,0x39 = addu $7, $7, $8
0x8a,0x00,0x50,0x51 = addu $10, $10, $4
0x21,0x01,0x50,0x09 = addu $1, $1, $9
0xaa,0x41,0x0a,0x00 = lui $10, 10
0x8a,0x00,0x50,0x51 = addu $10, $10, $4
0x4a,0xfd,0x7b,0x00 = lw $10, 123($10)
0xa1,0x41,0x02,0x00 = lui $1, 2
0x21,0x01,0x50,0x09 = addu $1, $1, $9
0x41,0xf9,0x40,0xe2 = sw $10, 57920($1)
