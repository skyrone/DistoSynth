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
// 1 = output is at 5V
//                         --543210
#define PORTA_INIT       0b00000000
//                         --++++++ PORTA reset

//                         --543210
#define PORTC_INIT       0b00000000
//                         --++++++ PORTC reset

//                        --543210
#define LATA_INIT       0b00000000
//                        --++++++ LATA reset

//                        --543210
#define LATC_INIT       0b00000000
//                        --++++++ LATC reset

// ANSEL registers
// 0 = pin is defined as digital IO
// 1 = pin is defined as analog IO
// Caution!!! default statut is analog for all pins! (p.138)
//                          --543210
#define ANSELA_INIT       0b00010000
//                          --++++++ ANSELA reset

//                          --543210
#define ANSELC_INIT       0b00000000
//                          --++++++ ANSELC reset

// TRIS registers (p.137)
// 0 = pin is defined as output
// 1 = pin is defined as input
// Default state is input
//                         --54-210
#define TRISA_INIT       0b00010000
//                         --++-+++ TRISA reset (RA3 is read-only)

//                         --543210
#define TRISC_INIT       0b00000000
//                         --++++++ TRISC reset

// Weak pull-up
// 1 = weak pull-up enabled
// 0 = weak pull-up disabled
//                        --543210
#define WPUA_INIT       0b00000000
//                        --++++++ WPUA reset

//                        --543210
#define WPUC_INIT       0b00000000
//                        --++++++ WPUC reset

// Open-drain
// 1 = open-drain mode
// 0 = push-pull mode
//                          --54-210
#define ODCONA_INIT       0b00000000
//                          --++-+++ ODCONA reset

//                          --543210
#define ODCONC_INIT       0b00000000
//                          --++++++ ODCONC reset

// Slew rate control
// 1 = limited slew rate
// 0 = max slew rate
//                           --54-210
#define SLRCONA_INIT       0b00000000
//                           --++-+++ SLRCONA reset

//                           --543210
#define SLRCONC_INIT       0b00000000
//                           --++++++ SLRCONC reset

// Input levels
// 1 = ST levels (CMOS + Schmitt trigger)
// 0 = TTL levels
//                          --543210
#define INLVLA_INIT       0b00111111
//                          --++++++ INLVLA reset

//                          --543210
#define INLVLC_INIT       0b00111111
//                          --++++++ INLVLC reset
         


// =============================================================================
// User functions
// =============================================================================

void IO_init(void)
{
    // I/O value init
    PORTA = PORTA_INIT;
    PORTC = PORTC_INIT;
    
    LATA = LATA_INIT;
    LATC = LATC_INIT;
    
    // I/O mode init (analog or digital)
    ANSELA = ANSELA_INIT;
    ANSELC = ANSELC_INIT;
    
    // I/O mode init (input or output)
    TRISA = TRISA_INIT;
    TRISC = TRISC_INIT;

    // I/O weak pull-ups
    WPUA = WPUA_INIT;
    WPUC = WPUC_INIT;
    
    // I/O output type 
    ODCONA = ODCONA_INIT;
    ODCONC = ODCONC_INIT;
    
    // I/O slew rate selection
    SLRCONA = SLRCONA_INIT;
    SLRCONC = SLRCONC_INIT;
    
    // I/O input levels selection
    INLVLA = INLVLA_INIT;
    INLVLC = INLVLC_INIT;
}

void Peripheral_init(void)
{   
    // ------------------------
    // Timer 0 init (see p.272)
    // ------------------------
    T0CON0bits.T0EN = 0;            // Disable TIMER0
    T0CON0bits.T016BIT = 1;         // 16 bits mode
    T0CON0bits.T0OUTPS = 0b0000;    // 1:1 postscaler
    
    T0CON1bits.T0CS = 0b011;        // TIMER0 source is HFINTOSC (32 MHz)
    T0CON1bits.T0ASYNC = 1;         // No sync  
    T0CON1bits.T0CKPS = 0b0101;     // 1:32 prescaler
    
    T0CON0bits.T0EN = 1;            // Enable TIMER0
    
    // -----------------------------------
    // UART1 init - MIDI input (see p.353)
    // -----------------------------------
     
    // --------
    // ADC init
    //
    ADCON0bits.ADON = 0;            // Disable ADC
    
    ADCON0bits.CHS = 0b000100;      // Source is RA4 (p.240)
    ADCON1bits.ADFM = 0;            // Left-justified result
    ADCON1bits.ADCS = 0b110;        // TAD = 2µs
    ADCON1bits.ADNREF = 0;          // Negative ref is VSS
    ADCON1bits.ADPREF = 0;          // Positive ref is VDD
    ADACTbits.ADACT = 0b0011;       // Start conversion on TIMER0 interrupt
    
    ADCON0bits.ADON = 1;            // Enable ADC
    
    // --------
    // NCO init
    // -------
    NCO1CONbits.N1EN = 0;           // Disable NCO
    
    NCO1CONbits.N1PFM = 0;          // 50% duty cycle
    NCO1CLKbits.N1CKS = 0b00;       // 16 MHz input
    
    NCO1INCLbits.NCO1INCL = 0b00110011;
    NCO1INCHbits.NCO1INCH = 0b00110011; // Increment value is set to 13107
    NCO1INCUbits.NCO1INCU = 0;
    
    NCO1CONbits.N1EN = 1;           // Enable NCO
    
    // -------------------
    // Peripherals routing
    // -------------------
    RA2PPSbits.RA2PPS = 0b11101;    // Route NCO output to RA2
    
}



void Interrupts_init(void)
{
    
    // Interrupts settings
    INTCONbits.GIE = 0;         // Disable all interrupts
    INTCONbits.PEIE = 0;        // Disable all peripheral interrupts
    
    // Timer 0
    PIE0bits.TMR0IE = 1;        // Interrupts enabled
    
    // ADC
    PIE1bits.ADIE = 1;
    
}


void Interrupts_enable(void)
{
    INTCONbits.GIE = 1; 
    INTCONbits.PEIE = 1; 
}