/* 
 * File:   main.h
 * Author: Admin
 *
 * Created on 28 décembre 2015, 14:14
 */

#ifndef MAIN_H
#define	MAIN_H

typedef unsigned int uint16;
typedef unsigned long uint32;
typedef unsigned char u8;

// =============================================================================
// Defines
// =============================================================================
#define DBG_LED_4           LATFbits.LATF0
#define DBG_LED_5           LATFbits.LATF1
#define DBG_LED_6           LATDbits.LATD2

// DAC I/O
#define DAC_CLOCK           LATFbits.LATF2

// =============================================================================
// Functions declaration
// =============================================================================
int main(void);
//void __attribute__((interrupt(auto_psv))) _T1Interrupt(void);
//void __attribute__((interrupt,auto_psv)) _T1Interrupt(void);
void __attribute__ ((interrupt, no_auto_psv)) _T1Interrupt();
void __attribute__ ((interrupt, no_auto_psv)) _U1RXInterrupt();



#endif	/* MAIN_H */

