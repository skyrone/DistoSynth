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
#define LED LATCbits.LATC4

// =============================================================================
// Functions declaration
// =============================================================================
int main(void);

void interrupt timer(void);



#endif	/* MAIN_H */

