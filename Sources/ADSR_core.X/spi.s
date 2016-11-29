	.file "C:\\Users\\Admin\\Documents\\Recherche\\Projet_synthe_disto\\Codes_source\\Codes_source_v6\\ADSR_core.X\\spi.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.section	.text,code
	.align	2
	.global	_SPI_send	; export
	.type	_SPI_send,@function
_SPI_send:
.LFB0:
.LSM0:
	.set ___PA___,0
	lnk	#4
	mov.b	w0,[w14]
	mov	w1,[w14+2]
.LSM1:
	bclr.b	_IFS0bits+1,#2
.LSM2:
	ze	[w14],w0
	mov	w0,_SPI1BUF
.LSM3:
	bra	.L2
.L3:
.LSM4:
; 33 "spi.c" 1
	NOP
.L2:
.LSM5:
	mov	_IFS0bits,w0
	lsr	w0,#10,w0
	and.b	w0,#1,w0
	ze	w0,w0
	add	w0,#1,[w15]
	.set ___BP___,0
	bra	nz,.L3
.LSM6:
	mov	_SPI1BUF,w0
	mov.b	w0,w1
	mov	[w14+2],w0
	mov.b	w1,[w0]
.LSM7:
	ulnk	
	return	
	.set ___PA___,0
.LFE0:
	.size	_SPI_send, .-_SPI_send
	.section	.debug_frame,info
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.byte	0
	.uleb128 0x1
	.sleb128 2
	.byte	0x25
	.byte	0x12
	.uleb128 0xf
	.sleb128 -2
	.byte	0x9
	.uleb128 0x25
	.uleb128 0xf
	.align	4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	4
.LEFDE0:
	.section	.text,code
.Letext0:
	.section	.debug_info,info
	.4byte	0x2e2
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.25) (A) Build date: Jun 30 2015"
	.byte	0x1
	.asciz	"spi.c"
	.ascii	"C:\\\\Users\\\\Admin\\\\Documents\\\\Recherche\\\\Projet_synthe_dist"
	.asciz	"o\\\\Codes_source\\\\Codes_source_v6\\\\ADSR_core.X"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.asciz	"unsigned int"
	.uleb128 0x3
	.asciz	"tagIFS0BITS"
	.byte	0x2
	.byte	0x2
	.2byte	0x1226
	.4byte	0x232
	.uleb128 0x4
	.asciz	"INT0IF"
	.byte	0x2
	.2byte	0x1227
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"IC1IF"
	.byte	0x2
	.2byte	0x1228
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"OC1IF"
	.byte	0x2
	.2byte	0x1229
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"T1IF"
	.byte	0x2
	.2byte	0x122a
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"DMA0IF"
	.byte	0x2
	.2byte	0x122b
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"IC2IF"
	.byte	0x2
	.2byte	0x122c
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"OC2IF"
	.byte	0x2
	.2byte	0x122d
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"T2IF"
	.byte	0x2
	.2byte	0x122e
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"T3IF"
	.byte	0x2
	.2byte	0x122f
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"SPI1EIF"
	.byte	0x2
	.2byte	0x1230
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"SPI1IF"
	.byte	0x2
	.2byte	0x1231
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"U1RXIF"
	.byte	0x2
	.2byte	0x1232
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"U1TXIF"
	.byte	0x2
	.2byte	0x1233
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"AD1IF"
	.byte	0x2
	.2byte	0x1234
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"DMA1IF"
	.byte	0x2
	.2byte	0x1235
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"NVMIF"
	.byte	0x2
	.2byte	0x1236
	.4byte	0xc7
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.asciz	"IFS0BITS"
	.byte	0x2
	.2byte	0x1237
	.4byte	0xd7
	.uleb128 0x6
	.byte	0x1
	.asciz	"SPI_send"
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.4byte	0x284
	.uleb128 0x7
	.asciz	"TX_data"
	.byte	0x1
	.byte	0x17
	.4byte	0x284
	.byte	0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x7
	.asciz	"RX_data"
	.byte	0x1
	.byte	0x17
	.4byte	0x295
	.byte	0x2
	.byte	0x7e
	.sleb128 2
	.byte	0x0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x8
	.byte	0x2
	.4byte	0x284
	.uleb128 0x9
	.asciz	"SPI1BUF"
	.byte	0x2
	.2byte	0x427
	.4byte	0x2ad
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.4byte	0xc7
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x1238
	.4byte	0x2c0
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.4byte	0x232
	.uleb128 0x9
	.asciz	"SPI1BUF"
	.byte	0x2
	.2byte	0x427
	.4byte	0x2ad
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x1238
	.4byte	0x2c0
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev,info
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x1b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2e6
	.4byte	0x243
	.asciz	"SPI_send"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x2b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2e6
	.4byte	0xd7
	.asciz	"tagIFS0BITS"
	.4byte	0x232
	.asciz	"IFS0BITS"
	.4byte	0x0
	.section	.debug_aranges,info
	.4byte	0x14
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_line,info
	.4byte	.LELT0-.LSLT0
.LSLT0:
	.2byte	0x2
	.4byte	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	"d:\\program files (x86)\\microchip\\xc16\\v1.25\\bin\\bin\\../..\\su"
	.ascii	"pport\\dsPIC33E\\h"
	.byte 0
	.byte	0x0
	.asciz	"spi.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"p33EV256GM106.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM0
	.byte	0x2b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM1
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM2
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM3
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM5
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM6
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,info
.LASF0:
	.asciz	"IFS0bits"
	.section	.text,code

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words

	.set ___PA___,0
	.end
