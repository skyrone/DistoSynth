// =============================================================================
// File:   main.h
// Author: Admin
//
// Created on August, 21
// =============================================================================

#ifndef MAIN_H
#define	MAIN_H

typedef unsigned int uint16;
typedef unsigned long uint32;
typedef unsigned char u8;

// =======
// Defines
// =======
// LEDs
#define DBG_LED_1           LATCbits.LATC13
#define DBG_LED_2           LATBbits.LATB7
#define DBG_LED_3           LATCbits.LATC10
#define ENV_FOLL_LED        LATBbits.LATB8

// Analog MUX
#define MUX_ADDR_MASK       0b0001110000000000

// =====================
// Functions declaration
// =====================
int main(void);

void __attribute__ ((interrupt, no_auto_psv)) _T1Interrupt();
void __attribute__ ((interrupt, no_auto_psv)) _T2Interrupt();

#endif	/* MAIN_H */

