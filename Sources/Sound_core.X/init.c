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


// =============================================================================
// Defines
// =============================================================================

// ----------------------
// IO defines (see p.115)
// ----------------------

// Latch statut:
// 0 = output is at 0V
// 1 = output is at 3.3V
//                        5432109876543210
#define LATB_INIT       0b0000000000000000
//                        ++++++++++++++++ PORTB reset (16 bits port)

//                        5432------------
#define LATC_INIT       0b0000000000000000
//                        ++++------------ PORTC reset (4 bits port)


//                        ----109876543210
#define LATD_INIT       0b0000000000000000
//                        ----++++++++++++ PORTD reset (12 bits port)


//                        --------76543210
#define LATE_INIT       0b0000000000000000
//                        --------++++++++ PORTE reset (8 bits port)


//                        ---------6543210
#define LATF_INIT       0b0000000000000000
//                        ---------+++++++ PORTF reset (7 bits port)

//                        ------9876--32--
#define LATG_INIT       0b0000000000000000
//                        ------++++--++-- PORTG reset (6 bits port)

// TRIS registers (p.207)
// 0 = pin is defined as output
// 1 = pin is defined as input
// Default state is input
//                        5432109876543210
#define TRISB_INIT      0b0000000000000000
//                        ++++++++++++++++ Ouputs

//                        5432------------
#define TRISC_INIT      0b1111000000000000
//                        ++++------------ Inputs

//                        ----109876543210
#define TRISD_INIT      0b0000100001001000
//                        -----++++-++-+++ Ouputs
//                        ----+----+--+--- Inputs

//                        --------76543210
#define TRISE_INIT      0b0000000011111111
//                        --------++++++++ Inputs

//                        ---------6543210
#define TRISF_INIT      0b0000000000001000
//                        ---------+++-+++ Ouputs
//                        ------------+--- Inputs

//                        ------9876--32--
#define TRISG_INIT      0b0000001010000000
//                        ------+--+--++-- Ouputs
//                        ------+-+------- Inputs


// ANSEL registers
// 0 = pin is defined as digital IO
// 1 = pin is defined as analog IO
// Caution!!! default statut is analog for all pins! (p.209)
//                        5432109876543210
#define ANSELB_INIT     0b0000000000000000
//                        ++++++++++++++++ Digital

//                        5432------------
#define ANSELC_INIT     0b0000000000000000
//                        ++++------------ Digital

//                        ----109876543210
#define ANSELD_INIT     0b0000000000000000
//                        ----++++++++++++ Digital

//                        --------76543210
#define ANSELE_INIT     0b0000000011111110
//                        ---------------+ Digital
//                        --------+++++++- Analog

//                        ------9876--32--
#define ANSELG_INIT     0b0000000000000000
//                        ------++++--++-- Digital                      


// =============================================================================
// User functions
// =============================================================================

void Clock_init(void)
{
    // ---------------
    // Oscillator init
    // ---------------
    CLKDIVbits.DOZEN = 0;       // Disable Fcy reduction
    CLKDIVbits.FRCDIV = 0;      // No postscaler on FRC

    // Configure PLL prescaler, PLL postscaler, PLL divisor
    CLKDIVbits.PLLPRE = 0;      // PLL prescaler set at 2
    PLLFBDbits.PLLDIV = 54;     // PLL feedback set at 56
    CLKDIVbits.PLLPOST = 0;     // PLL postscaler set at 2
    // Thus, Fosc = ((10.00/2) x 56)/2 = 140 MHz
    // Fcy = Fosc/2 = 70 MHz  i.e. 70 MIPS :)
    
    // Select Xtal with PLL as the new source
    __builtin_write_OSCCONH(0x03);              // Osc. source = Xtal + PLL
    __builtin_write_OSCCONL(OSCCON | 0x01);     // Send switch request   
   
    // Wait for mode switch to be done
    while (OSCCONbits.COSC != 0b011);
    
    // Wait for PLL to lock
    while (OSCCONbits.LOCK != 1);    
}

void IO_init(void)
{
    // I/O value init
    LATB = LATB_INIT;
    LATC = LATC_INIT;
    LATD = LATD_INIT;
    LATE = LATE_INIT;
    LATF = LATF_INIT;
    LATG = LATG_INIT;
    
    // I/O mode init (input or output)
    TRISB = TRISB_INIT;
    TRISC = TRISC_INIT;
    TRISD = TRISD_INIT;
    TRISE = TRISE_INIT;
    TRISF = TRISF_INIT;
    TRISG = TRISG_INIT;
    
    // I/O mode init (analog or digital)
    ANSELB = ANSELB_INIT;
    ANSELC = ANSELC_INIT;
    ANSELD = ANSELD_INIT;
    ANSELE = ANSELE_INIT;
    ANSELG = ANSELG_INIT;
    
}

void Peripheral_init(void)
{   
    // ------------------------
    // Timer 1 init (see p.271)
    // ------------------------
    T1CONbits.TON = 0;          // Turn timer off
    T1CONbits.TSIDL = 0;        // Continue in idle mode
    T1CONbits.TGATE = 0;        // No gated time accumulation
    T1CONbits.TCKPS = 0b00;     // 1:1 prescaler    
    T1CONbits.TCS = 0;          // Timer source is Tcy (= 70 MHz)
 
    TMR1 = 0;                   // Reset timer value
    PR1 = 1459;                 // Timer period = 1459 => ~48 kHz
    
    IFS0bits.T1IF = 0;          // Clear interrupt flag
    
    T1CONbits.TON = 1;          // Turn timer on
    
    // ------------------------
    // Timer 2 init (see p.271)
    // ------------------------
    T2CONbits.TON = 0;          // Turn timer off
    T2CONbits.TSIDL = 0;        // Keep running in idle mode
    T2CONbits.TGATE = 0;        // No gated time accumulation
    T2CONbits.TCKPS = 0b11;     // 1:256 prescaler  
    T2CONbits.T32 = 0;          // 16 bits mode
    T1CONbits.TCS = 0;          // Timer source is Tcy (= 70 MHz)
    
    TMR2 = 0;                   // Reset timer value
    PR2 = 0xFFFF;               // Timer period = 65535 => ~4.2 Hz
    
    IFS0bits.T2IF = 0;          // Clear interrupt flag
    
    T2CONbits.TON = 1;          // Turn timer on    
    
    
    
    
    // -----------------------------------
    // UART1 init - MIDI input (see p.353)
    // -----------------------------------
    // UART routing
    // 'RPINR18' register is dedicated to UART1.
    // On this register, we write the pin we want to use for each function
    RPINR18bits.U1RXR = 75;     // Route UART1 RX to RPI75 pin (see p.213 & 238)
    
    U1BRG = 139;                // Baudrate is 31250 = Fp/(16*(U1BRG+1))
    
    // UART settings (see p.355)
    U1MODEbits.STSEL = 0;       // 1 stop bit
    U1MODEbits.PDSEL = 0;       // 8 bits data, no parity
    U1MODEbits.BRGH = 0;        // No High Speed mode
    U1MODEbits.RXINV = 0;       // RX idle state is '1'
    U1MODEbits.ABAUD = 0;       // No auto-baud
    U1MODEbits.LPBACK = 0;      // No loopback (ie RX internally linked to TX)
    U1MODEbits.IREN = 0;        // Disable IrDA module
    U1MODEbits.UEN = 0;         // No RTS and CTS
    U1MODEbits.WAKE = 1;        // Wake-up on RX
    U1MODEbits.USIDL = 0;       // Keep operating in idle mode
    
    U1STAbits.URXISEL = 0;      // Interrupt on every incoming character
    
    U1MODEbits.UARTEN = 1;      // Start UART1
    
    // Warning! UART can control TX pins only if UART module is already started!
    // (see Family reference manual :D p.17-14)
    //U1STAbits.UTXEN = 1;        // Allow UART to control TX pin   
  
    
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
    
    // UART
    IFS0bits.U1RXIF = 0;        // Clear UART1 RX interrupt flag
    IPC2bits.U1RXIP = 3;        // Priority level is set at 1    
    IEC0bits.U1RXIE = 1;        // Interrupts enabled   
    
    IFS0bits.U1TXIF = 0;        // Clear UART1 TX interrupt flag
    IPC3bits.U1TXIP = 0;        // Priority level is set at 0
    IEC0bits.U1TXIE = 0;        // Interrupts disabled

    // SPI
    IFS0bits.SPI1IF = 0;        // Clear SPI1 interrupt flag
    IPC3bits.U1TXIP = 3;        // Priority level is set at 0
    IEC0bits.SPI1IE = 0;        // Interrupts disabled
}


void Interrupts_enable(void)
{
    INTCON2bits.GIE = 1;
}