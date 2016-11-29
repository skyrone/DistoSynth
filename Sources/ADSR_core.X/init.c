/* 
 * File:   init.c
 * Author: Quentin
 *
 * General initalization function
 */

// =============================================================================
// Includes
// =============================================================================
#include <xc.h>
#include "init.h"
#include "main.h"


// =============================================================================
// Defines
// =============================================================================

// ----------------------
// IO defines (see p.115)
// ----------------------

// Latch statut:
// 0 = output is at 0V
// 1 = output is at 3.3V

//                        ---210987--4--10
#define LATA_INIT       0b0000000000000000
//                        ---++++++--+--++ LATA reset (9 bits port)

//                        5432109876543210
#define LATB_INIT       0b0000000000000000
//                        ++++++++++++++++ PORTB reset (16 bits port)

//                        5-32109876543210
#define LATC_INIT       0b0000000000000000
//                        +-++++++++++++++ PORTC reset (15 bits port)

//                        -------8-65-----
#define LATD_INIT       0b0000000000000000
//                        -------+-++----- PORTD reset (3 bits port)

//                        5432------------
#define LATE_INIT       0b0000000000000000
//                        ++++------------ PORTE reset (4 bits port)

//                        --------------10
#define LATF_INIT       0b0000000000000000
//                        --------------++ PORTF reset (2 bits port)

//                        ------9876------
#define LATG_INIT       0b0000000000000000
//                        ------++++------ PORTG reset (4 bits port)

// TRIS registers (p.207)
// 0 = pin is defined as output
// 1 = pin is defined as input
// Default state is input

//                         ---210987--4--10
#define TRISA_INIT       0b0000000000000011
//                         ---++++++--+--++ TRISA

//                         5432109876543210
#define TRISB_INIT       0b0000000000000000
//                         ++++++++++++++++ TRISB

//                         5-32109876543210
#define TRISC_INIT       0b0000000000000000
//                         +-++++++++++++++ TRISC

//                         -------8-65-----
#define TRISD_INIT       0b0000000000000000
//                         -------+-++----- TRISD

//                         5432------------
#define TRISE_INIT       0b0000000000000000
//                         ++++------------ TRISE

//                         --------------10
#define TRISF_INIT       0b0000000000000001
//                         --------------++ TRISF

//                         ------9876------
#define TRISG_INIT       0b0000000000000000
//                         ------++++------ TRISG


// ANSEL registers
// 0 = pin is defined as digital IO
// 1 = pin is defined as analog IO
// Caution!!! default statut is analog for all pins! (p.209)
//                          ---2109-7--4--10
#define ANSELA_INIT       0b0000000000000011
//                          ---++++-+--+--++ ANSELA

//                          ------987---3210
#define ANSELB_INIT       0b0000000000000000
//                          ------+++---++++ ANSELB

//                          ---2109876543210
#define ANSELC_INIT       0b0000000000000000
//                          ---+++++++++++++ ANSELC

//                          5432------------
#define ANSELE_INIT       0b0000000000000000
//                          ++++------------ ANSELE

//                          ------9876------
#define ANSELG_INIT       0b0000000000000000
//                          ------++++------ ANSELG



// =============================================================================
// User functions
// =============================================================================

void Clock_init(void)
{
    // ---------------
    // Oscillator init
    // ---------------
    
    // Warning:
    // It is NOT possible to change the PLL configuration while running in PLL 
    // mode!
    // The PIC must start with the FRC only, then we set the PLL in software,
    // and then a clock switch is necessary to run in PLL mode.
    CLKDIVbits.DOZEN = 0;       // Fcy = Fosc/2
    CLKDIVbits.FRCDIV = 0;      // No postscaler on FRC
    
    // Clock PLL settings
    CLKDIVbits.PLLPRE = 0;      // PLL prescaler set at 2
    PLLFBDbits.PLLDIV = 73;     // PLL feedback set at 75
    CLKDIVbits.PLLPOST = 0;     // PLL postscaler set at 2
    
    // Thus, Fosc = ((7.37/2) x 75)/2 = 138.18 MHz
    // Fcy = Fosc/2 = 69 MHz approx. i.e. 69 MIPS :)
    
    // Switch to FRC + PLL source
    __builtin_write_OSCCONH(0x01);              // New source = FRC + PLL
    __builtin_write_OSCCONL(OSCCON | 0x01);     // Send switch request   
   
    // Wait for mode switch to be done
    while (OSCCONbits.COSC != 0b001);
    
    // Wait for PLL to lock
    while (OSCCONbits.LOCK != 1);   
}

void IO_init(void)
{
    // I/O value init
    LATA = LATA_INIT;
    LATB = LATB_INIT;
    LATC = LATC_INIT;
    LATD = LATD_INIT;
    LATE = LATE_INIT;
    LATF = LATF_INIT;
    LATG = LATG_INIT;
    
    // I/O mode init (input or output)
    TRISA = TRISA_INIT;
    TRISB = TRISB_INIT;
    TRISC = TRISC_INIT;
    TRISD = TRISD_INIT;
    TRISE = TRISE_INIT;
    TRISF = TRISF_INIT;
    TRISG = TRISG_INIT;
    
    // I/O mode init (analog or digital)
    ANSELA = ANSELA_INIT;
    ANSELB = ANSELB_INIT;
    ANSELC = ANSELC_INIT;
    ANSELE = ANSELE_INIT;
    ANSELG = ANSELG_INIT;
    
}

void Peripheral_init(void)
{   
    // ------------------------
    // Timer 1 init (see p.173)
    // ------------------------
    T1CONbits.TON = 0;          // Turn timer off
    
    T1CONbits.TSIDL = 0;        // Continue in idle mode
    T1CONbits.TGATE = 0;        // No gated time accumulation
    T1CONbits.TCKPS = 0b11;     // 1:256 prescaler    
    T1CONbits.TCS = 0;          // Timer source is Tcy (= 69 MHz)
 
    TMR1 = 0;                   // Reset timer value
    PR1 = 0xFFFF;               // Timer period = 65535 => ~4.11 Hz
    
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    
    T1CONbits.TON = 1;          // Turn timer on
    
    // ------------------------
    // Timer 2 init (see p.271)
    // ------------------------
    T2CONbits.TON = 0;          // Turn timer off
    
    T2CONbits.TSIDL = 0;        // Keep running in idle mode
    T2CONbits.TGATE = 0;        // No gated time accumulation
    T2CONbits.TCKPS = 0b10;     // 1:64 prescaler  
    T2CONbits.T32 = 0;          // 16 bits mode
    T1CONbits.TCS = 0;          // Timer source is Tcy (= 69 MHz)
    
    TMR2 = 0;                   // Reset timer value
    PR2 = 0xFFFF;               // Timer period = 65535 => ~1 kHz
    
    IFS0bits.T2IF = 0;          // Clear interrupt flag
    
    T2CONbits.TON = 1;          // Turn timer on    
    
    
    // --------------------
    // SPI init (see p.337)
    // --------------------
        
}



void Interrupts_init(void)
{
    // See p.129 & especially "Interrupts" section in the family ref. manual p.6-26 "Code example"
    // IFSO: flags registers
    // IECO: interrupt enable registers
    // IPC: priority bits
    
    // Interrupts settings
    INTCON2bits.GIE = 0;        // Disable all interrupts
    INTCON1bits.NSTDIS = 0;     // Interrupts nesting enabled
    
    // Timer 1
    IFS0bits.T1IF = 0;          // Clear TIMER1 interrupt flag
    IPC0bits.T1IP = 4;          // Priority level is set at 2    
    IEC0bits.T1IE = 1;          // Interrupts enabled
    
    // Timer 2
    IFS0bits.T2IF = 0;          // Clear TIMER1 interrupt flag
    IPC1bits.T2IP = 3;          // Priority level is set at 2    
    IEC0bits.T2IE = 1;          // Interrupts enabled
    
    // SPI
    IFS0bits.SPI1IF = 0;        // Clear SPI1 interrupt flag
    IPC3bits.U1TXIP = 3;        // Priority level is set at 0
    IEC0bits.SPI1IE = 0;        // Interrupts disabled
}


void Interrupts_enable(void)
{
    INTCON2bits.GIE = 1;
}