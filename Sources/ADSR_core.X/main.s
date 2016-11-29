	.file "C:\\Users\\Admin\\Documents\\Recherche\\Projet_synthe_disto\\Codes_source\\Codes_source_v6\\ADSR_core.X\\main.c"
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.section	.debug_info,info
.Ldebug_info0:
	.section	.debug_line,info
.Ldebug_line0:
	.section	.text,code
.Ltext0:
	.global	_MUX_addr	; export
	.section	.nbss,bss,near
	.align	2
	.type	_MUX_addr,@object
	.size	_MUX_addr, 2
_MUX_addr:
	.skip	2
	.section	.text,code
	.align	2
	.global	_main	; export
	.type	_main,@function
_main:
.LFB0:
.LSM0:
	.set ___PA___,1
	lnk	#0
.LSM1:
	rcall	_Clock_init
.LSM2:
	rcall	_IO_init
.LSM3:
	rcall	_Peripheral_init
.LSM4:
	rcall	_Interrupts_init
.LSM5:
	rcall	_Interrupts_enable
.LSM6:
	bset.b	_LATCbits+1,#5
.LSM7:
	bclr.b	_LATBbits,#7
.LSM8:
	bset.b	_LATCbits+1,#2
.L2:
.LSM9:
	bra	.L2
.LFE0:
	.size	_main, .-_main
	.align	2
	.global	__T1Interrupt	; export
	.type	__T1Interrupt,@function
__T1Interrupt:
.LFB1:
.LSM10:
	.set ___PA___,1
	mov.d	w0,[w15++]
	mov	w2,[w15++]
	lnk	#0
.LSM11:
	mov	_LATCbits,w0
	lsr	w0,#13,w0
	and.b	w0,#1,w0
	com.b	w0,w0
	and.b	w0,#1,w0
	ze	w0,w0
	and	w0,#1,w0
	sl	w0,#13,w0
	mov	_LATCbits,w2
	mov	#-8193,w1
	and	w2,w1,w1
	ior	w0,w1,w0
	mov	w0,_LATCbits
.LSM12:
	mov	_LATBbits,w0
	lsr	w0,#7,w0
	and.b	w0,#1,w0
	com.b	w0,w0
	and.b	w0,#1,w0
	ze	w0,w0
	and	w0,#1,w0
	sl	w0,#7,w0
	mov	_LATBbits,w2
	mov	#-129,w1
	and	w2,w1,w1
	ior	w0,w1,w0
	mov	w0,_LATBbits
.LSM13:
	mov	_LATCbits,w0
	lsr	w0,#10,w0
	and.b	w0,#1,w0
	com.b	w0,w0
	and.b	w0,#1,w0
	ze	w0,w0
	and	w0,#1,w0
	sl	w0,#10,w0
	mov	_LATCbits,w2
	mov	#-1025,w1
	and	w2,w1,w1
	ior	w0,w1,w0
	mov	w0,_LATCbits
.LSM14:
	ulnk	
	mov	[--w15],w2
	mov.d	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE1:
	.size	__T1Interrupt, .-__T1Interrupt
	.align	2
	.global	__T2Interrupt	; export
	.type	__T2Interrupt,@function
__T2Interrupt:
.LFB2:
.LSM15:
	.set ___PA___,1
	mov.d	w0,[w15++]
	lnk	#0
.LSM16:
	mov	_MUX_addr,w0
	sub	w0,#6,[w15]
	.set ___BP___,0
	bra	gtu,.L5
.LSM17:
	mov	_MUX_addr,w0
	inc	w0,w0
	mov	w0,_MUX_addr
	bra	.L6
.L5:
.LSM18:
	clr	_MUX_addr
.L6:
.LSM19:
	mov	_LATB,w1
	mov	#-7169,w0
	and	w1,w0,w1
	mov	_MUX_addr,w0
	sl	w0,#10,w0
	ior	w0,w1,w0
	mov	w0,_LATB
.LSM20:
	ulnk	
	mov.d	[--w15],w0
	retfie	
	.set ___PA___,0
.LFE2:
	.size	__T2Interrupt, .-__T2Interrupt
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
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.align	4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	4
.LEFDE4:
	.section	.text,code
.Letext0:
	.section	.debug_info,info
	.4byte	0x4a9
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.asciz	"GNU C 4.5.1 (XC16, Microchip v1.25) (A) Build date: Jun 30 2015"
	.byte	0x1
	.asciz	"main.c"
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
	.asciz	"tagLATBBITS"
	.byte	0x2
	.byte	0x2
	.2byte	0x1ec4
	.4byte	0x234
	.uleb128 0x4
	.asciz	"LATB0"
	.byte	0x2
	.2byte	0x1ec5
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB1"
	.byte	0x2
	.2byte	0x1ec6
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB2"
	.byte	0x2
	.2byte	0x1ec7
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB3"
	.byte	0x2
	.2byte	0x1ec8
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB4"
	.byte	0x2
	.2byte	0x1ec9
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB5"
	.byte	0x2
	.2byte	0x1eca
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB6"
	.byte	0x2
	.2byte	0x1ecb
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB7"
	.byte	0x2
	.2byte	0x1ecc
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB8"
	.byte	0x2
	.2byte	0x1ecd
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB9"
	.byte	0x2
	.2byte	0x1ece
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB10"
	.byte	0x2
	.2byte	0x1ecf
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB11"
	.byte	0x2
	.2byte	0x1ed0
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB12"
	.byte	0x2
	.2byte	0x1ed1
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB13"
	.byte	0x2
	.2byte	0x1ed2
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB14"
	.byte	0x2
	.2byte	0x1ed3
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATB15"
	.byte	0x2
	.2byte	0x1ed4
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.asciz	"LATBBITS"
	.byte	0x2
	.2byte	0x1ed5
	.4byte	0xd8
	.uleb128 0x3
	.asciz	"tagLATCBITS"
	.byte	0x2
	.byte	0x2
	.2byte	0x1f84
	.4byte	0x38c
	.uleb128 0x4
	.asciz	"LATC0"
	.byte	0x2
	.2byte	0x1f85
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC1"
	.byte	0x2
	.2byte	0x1f86
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC2"
	.byte	0x2
	.2byte	0x1f87
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC3"
	.byte	0x2
	.2byte	0x1f88
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC4"
	.byte	0x2
	.2byte	0x1f89
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC5"
	.byte	0x2
	.2byte	0x1f8a
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC6"
	.byte	0x2
	.2byte	0x1f8b
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC7"
	.byte	0x2
	.2byte	0x1f8c
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC8"
	.byte	0x2
	.2byte	0x1f8d
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC9"
	.byte	0x2
	.2byte	0x1f8e
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC10"
	.byte	0x2
	.2byte	0x1f8f
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC11"
	.byte	0x2
	.2byte	0x1f90
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC12"
	.byte	0x2
	.2byte	0x1f91
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC13"
	.byte	0x2
	.2byte	0x1f92
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.asciz	"LATC15"
	.byte	0x2
	.2byte	0x1f94
	.4byte	0xc8
	.byte	0x2
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.asciz	"LATCBITS"
	.byte	0x2
	.2byte	0x1f95
	.4byte	0x245
	.uleb128 0x6
	.asciz	"uint16"
	.byte	0x3
	.byte	0xb
	.4byte	0xc8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.asciz	"long unsigned int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.asciz	"unsigned char"
	.uleb128 0x7
	.byte	0x1
	.asciz	"main"
	.byte	0x1
	.byte	0x61
	.byte	0x1
	.4byte	0x3e9
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.asciz	"int"
	.uleb128 0x8
	.byte	0x1
	.asciz	"_T1Interrupt"
	.byte	0x1
	.byte	0x84
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5e
	.uleb128 0x8
	.byte	0x1
	.asciz	"_T2Interrupt"
	.byte	0x1
	.byte	0x8e
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5e
	.uleb128 0x9
	.asciz	"LATB"
	.byte	0x2
	.2byte	0x1ec3
	.4byte	0x437
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.4byte	0xc8
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x1ed6
	.4byte	0x44a
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.4byte	0x234
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x2
	.2byte	0x1f96
	.4byte	0x45d
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.4byte	0x38c
	.uleb128 0xc
	.4byte	.LASF2
	.byte	0x1
	.byte	0x57
	.4byte	0x39d
	.byte	0x1
	.byte	0x1
	.uleb128 0x9
	.asciz	"LATB"
	.byte	0x2
	.2byte	0x1ec3
	.4byte	0x437
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF0
	.byte	0x2
	.2byte	0x1ed6
	.4byte	0x44a
	.byte	0x1
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x2
	.2byte	0x1f96
	.4byte	0x45d
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.4byte	.LASF2
	.byte	0x1
	.byte	0x57
	.4byte	0x39d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	_MUX_addr
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
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0xc
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,info
	.4byte	0x46
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4ad
	.4byte	0x3d1
	.asciz	"main"
	.4byte	0x3f0
	.asciz	"_T1Interrupt"
	.4byte	0x40c
	.asciz	"_T2Interrupt"
	.4byte	0x49a
	.asciz	"MUX_addr"
	.4byte	0x0
	.section	.debug_pubtypes,info
	.4byte	0x53
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4ad
	.4byte	0xd8
	.asciz	"tagLATBBITS"
	.4byte	0x234
	.asciz	"LATBBITS"
	.4byte	0x245
	.asciz	"tagLATCBITS"
	.4byte	0x38c
	.asciz	"LATCBITS"
	.4byte	0x39d
	.asciz	"uint16"
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
	.asciz	"main.c"
	.uleb128 0x0
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"p33EV256GM106.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.asciz	"main.h"
	.uleb128 0x0
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
	.byte	0x75
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM1
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM2
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM3
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM5
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM6
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM8
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM9
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM10
	.byte	0x98
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM11
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM13
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM14
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE1
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM15
	.byte	0xa2
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM16
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM17
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM18
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM19
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LSM20
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LFE2
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,info
.LASF0:
	.asciz	"LATBbits"
.LASF1:
	.asciz	"LATCbits"
.LASF2:
	.asciz	"MUX_addr"
	.section	.text,code

	.section __c30_signature, info, data
	.word 0x0001
	.word 0x0000
	.word 0x0000

; MCHP configuration words
; Configuration word @ 0x0002abc4
	.section	.config_CTXT2, code, address(0x2abc4), keep
__config_CTXT2:
	.pword	65535
; Configuration word @ 0x0002abc0
	.section	.config_ALTI2C1, code, address(0x2abc0), keep
__config_ALTI2C1:
	.pword	65535
; Configuration word @ 0x0002abbc
	.section	.config_DMTEN, code, address(0x2abbc), keep
__config_DMTEN:
	.pword	65534
; Configuration word @ 0x0002abb8
	.section	.config_DMTCNTH, code, address(0x2abb8), keep
__config_DMTCNTH:
	.pword	65535
; Configuration word @ 0x0002abb4
	.section	.config_DMTCNTL, code, address(0x2abb4), keep
__config_DMTCNTL:
	.pword	65535
; Configuration word @ 0x0002abb0
	.section	.config_DMTIVTH, code, address(0x2abb0), keep
__config_DMTIVTH:
	.pword	65535
; Configuration word @ 0x0002abac
	.section	.config_DMTIVTL, code, address(0x2abac), keep
__config_DMTIVTL:
	.pword	65535
; Configuration word @ 0x0002aba8
	.section	.config_ICS, code, address(0x2aba8), keep
__config_ICS:
	.pword	65533
; Configuration word @ 0x0002aba4
	.section	.config_BOREN0, code, address(0x2aba4), keep
__config_BOREN0:
	.pword	65535
; Configuration word @ 0x0002aba0
	.section	.config_WDTWIN, code, address(0x2aba0), keep
__config_WDTWIN:
	.pword	65439
; Configuration word @ 0x0002ab9c
	.section	.config_PLLKEN, code, address(0x2ab9c), keep
__config_PLLKEN:
	.pword	65471
; Configuration word @ 0x0002ab98
	.section	.config_IESO, code, address(0x2ab98), keep
__config_IESO:
	.pword	65400
; Configuration word @ 0x0002ab90
	.section	.config_BSLIM, code, address(0x2ab90), keep
__config_BSLIM:
	.pword	65535
; Configuration word @ 0x0002ab80
	.section	.config_AIVTDIS, code, address(0x2ab80), keep
__config_AIVTDIS:
	.pword	65535

	.set ___PA___,0
	.end
