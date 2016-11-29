/*
 * File:   main.c
 * Author: Admin
 *
 * Source code for the VCO processor (PIC16F18324)
 */

// =============================================================================
// Pragmas
// =============================================================================
// CONFIG1
#pragma config FEXTOSC = ECH    // FEXTOSC External Oscillator mode Selection bits (EC (external clock) above 8 MHz;)
#pragma config RSTOSC = HFINT32 // Power-up default value for COSC bits (HFINTOSC with 2x PLL (32MHz))
#pragma config CLKOUTEN = OFF   // Clock Out Enable bit (CLKOUT function is disabled; I/O or oscillator function on OSC2)
#pragma config CSWEN = OFF      // Clock Switch Enable bit (The NOSC and NDIV bits cannot be changed by user software)
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is enabled)

// CONFIG2
#pragma config MCLRE = ON       // Master Clear Enable bit (MCLR/VPP pin function is MCLR; Weak pull-up enabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config WDTE = OFF       // Watchdog Timer Enable bits (WDT disabled; SWDTEN is ignored)
#pragma config LPBOREN = OFF    // Low-power BOR enable bit (ULPBOR disabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bits (Brown-out Reset enabled, SBOREN bit ignored)
#pragma config BORV = LOW       // Brown-out Reset Voltage selection bit (Brown-out voltage (Vbor) set to 2.45V)
#pragma config PPS1WAY = ON     // PPSLOCK bit One-Way Set Enable bit (The PPSLOCK bit can be cleared and set only once; PPS registers remain locked after one clear/set cycle)
#pragma config STVREN = ON      // Stack Overflow/Underflow Reset Enable bit (Stack Overflow or Underflow will cause a Reset)
#pragma config DEBUG = OFF      // Debugger enable bit (Background debugger disabled)

// CONFIG3
#pragma config WRT = OFF        // User NVM self-write protection bits (Write protection off)
#pragma config LVP = ON         // Low Voltage Programming Enable bit (Low Voltage programming enabled. MCLR/VPP pin function is MCLR. MCLRE configuration bit is ignored.)

// CONFIG4
#pragma config CP = OFF         // User NVM Program Memory Code Protection bit (User NVM code protection disabled)
#pragma config CPD = OFF        // Data NVM Memory Code Protection bit (Data NVM code protection disabled)



// =============================================================================
// Includes
// =============================================================================
#include <xc.h>
#include "init.h"
#include "main.h"

// =============================================================================
// Variables
// =============================================================================
uint16 Freq_step = 10000;



// ---------------------
// Look-up tables
// ---------------------


// =============================================================================
// User functions
// =============================================================================
int main(void)
{    
    // Initialisation
    IO_init();
    Peripheral_init();
    
    Interrupts_init();
    Interrupts_enable();
    

    // Main code
    while(1)
    {
        //LATCbits.LATC0 = 1;
        //LATCbits.LATC0 = 0;
    }
    
    
    return(0);
}

// =============================================================================
// Interrupts handling
// =============================================================================

// Remark:
// To get the name of every interrupt vector, click on the icon (?) on the right
// named "Compiler help". Then click on "Interrupt Vector Tables Reference - HTML"
void interrupt timer(void)
{
    if (PIR0bits.TMR0IF == 1)
    {
        PIR0bits.TMR0IF = 0;
        LED = ~LED;
        return;
    }
    
    if (PIR1bits.ADIF == 1)
    {
        PIR1bits.ADIF = 0;
        
        // Do some processing here...
        Freq_step = ADRESH << 8;
        NCO1INCLbits.NCO1INCL = Freq_step & 0x00FF;
        NCO1INCHbits.NCO1INCH = (Freq_step & 0xFF00) >> 8;
        NCO1INCUbits.NCO1INCU = 0;
        
        
        
        return;
    }
    
}
