/*
 * File:   main.c
 * Author: Admin
 *
 * Created on 28 décembre 2015, 14:10
 */

// =============================================================================
// Includes
// =============================================================================
#include <xc.h>
#include "init.h"
#include "main.h"
#include "spi.h"


// =============================================================================
// Pragmas
// =============================================================================
// FGS
#pragma config GWRP = OFF               // General Segment Write-Protect bit (General Segment may be written)
#pragma config GSS = OFF                // General Segment Code-Protect bit (General Segment Code protect is disabled)
#pragma config GSSK = OFF               // General Segment Key bits (General Segment Write Protection and Code Protection is Disabled)

// FOSCSEL
#pragma config FNOSC = FRC              // Initial Oscillator Source Selection bits (Internal Fast RC (FRC))
#pragma config IESO = OFF               // Two-speed Oscillator Start-up Enable bit (Start up with user-selected oscillator source)

// FOSC
#pragma config POSCMD = HS              // Primary Oscillator Mode Select bits (HS Crystal Oscillator Mode)
#pragma config OSCIOFNC = OFF           // OSC2 Pin Function bit (OSC2 is clock output)
#pragma config IOL1WAY = ON             // Peripheral pin select configuration (Allow only one reconfiguration)
#pragma config FCKSM = CSECMD           // Clock Switching Mode bits (Clock switching is enabled,Fail-safe Clock Monitor is disabled)

// FWDT
#pragma config WDTPOST = PS32768        // Watchdog Timer Postscaler bits (1:32,768)
#pragma config WDTPRE = PR128           // Watchdog Timer Prescaler bit (1:128)
#pragma config PLLKEN = ON              // PLL Lock Wait Enable bit (Clock switch to PLL source will wait until the PLL lock signal is valid.)
#pragma config WINDIS = OFF             // Watchdog Timer Window Enable bit (Watchdog Timer in Non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable bit (Watchdog timer enabled/disabled by user software)

// FPOR
#pragma config FPWRT = PWR128           // Power-on Reset Timer Value Select bits (128ms)
#pragma config BOREN = ON               // Brown-out Reset (BOR) Detection Enable bit (BOR is enabled)
#pragma config ALTI2C1 = OFF            // Alternate I2C pins for I2C1 (SDA1/SCK1 pins are selected as the I/O pins for I2C1)

// FICD
#pragma config ICS = PGD2               // ICD Communication Channel Select bits (Communicate on PGEC2 and PGED2)
#pragma config RSTPRI = PF              // Reset Target Vector Select bit (Device will obtain reset instruction from Primary flash)
#pragma config JTAGEN = OFF             // JTAG Enable bit (JTAG is disabled)

// FAS
#pragma config AWRP = OFF               // Auxiliary Segment Write-protect bit (Aux Flash may be written)
#pragma config APL = OFF                // Auxiliary Segment Code-protect bit (Aux Flash Code protect is disabled)
#pragma config APLK = OFF               // Auxiliary Segment Key bits (Aux Flash Write Protection and Code Protection is Disabled)


// =============================================================================
// Variables
// =============================================================================
uint16 DAC_data = 0;
u8 Update_done = 0;

// Arbitrary waveform generator
uint16 LUT_index_a = 0;    
uint16 LUT_index_b = 0; 
uint16 phi = 0;
uint16 d_phi = 0;
uint16 f = 1760;

uint16 r_a = 0;
uint16 r_b = 0;

uint16 y_a = 0;
uint16 y_b = 0;

uint32 mult_temp = 0;

const uint16 C_phi_t = 699;

// ---------------------
// Look-up tables
// ---------------------
uint16 LUT[1024] = 
{
    #include "LUT_organ.txt"
};

uint16 f_notes[128] = 
{
    #include "LUT_freq.txt"
};

// =============================================================================
// User functions
// =============================================================================
int main(void)
{    
    // Initialisation
    Clock_init();
    
    IO_init();
    Peripheral_init();
    
    Interrupts_init();
    Interrupts_enable();
    
    // Main code
    DBG_LED_6 = 0;  // Red LED off
    DBG_LED_5 = 0;  // Yellow LED off

    // DAC init
    DAC_CLOCK = 0;
    DAC_data = LUT[0];
    
    while(1)
    {
        if(Update_done == 1)
        {
            // Output oscillator
            mult_temp = (uint32)C_phi_t*f;
            d_phi = (uint16)(mult_temp >> 16);
            
            // Align phi and d_phi decimal point add cum-sum phase
            phi += (d_phi << 2); 
            
            // Perform modulo operation on the result
            LUT_index_a = ((phi >> 6) & 0x03FF);
            LUT_index_b = ((LUT_index_a+1) & 0x03FF);
            
            // Read both points in the LUT
            y_a = LUT[LUT_index_a];
            y_b = LUT[LUT_index_b];
            
            // Apply linear interpolation.
            // Linear interpolation is like barycenter calculus:
            // y_interp = (1-lambda)*y_a + lambda*y_b

            // Keep the fractionnal part only (= lambda)
            r_a = (phi & 0x003F);
            
            // Compute (1-lambda)
            r_b = 64-r_a;
                    
            // Compute interpolated value
            mult_temp = (uint32)y_a*r_b;
            mult_temp += (uint32)y_b*r_a;
            
            // Result correction (integer -> fixed point multiplication adj.)
            DAC_data = (uint16)(mult_temp >> 6);
                     
            // Clear up-to-date flag
            Update_done = 0;            
        }
    }
    
    
    return(0);
}

// =============================================================================
// Interrupts handling
// =============================================================================

// Remark:
// To get the name of every interrupt vector, click on the icon (?) on the right
// named "Compiler help". Then click on "Interrupt Vector Tables Reference - HTML"

// Timer 1 interrupt - Signal output update
void __attribute__ ((interrupt, no_auto_psv)) _T1Interrupt(void)
{    
    // Update DAC port with the new data
    LATB = DAC_data;
    
    // Apply rising edge on DAC clock
    DAC_CLOCK = 1;
    
    // Falling edge
    DAC_CLOCK = 0;
    
    // Inform main program that the DAC is up to date
    Update_done = 1;
    
    IFS0bits.T1IF = 0;
}

// Timer 2 interrupt
void __attribute__ ((interrupt, no_auto_psv)) _T2Interrupt(void)
{
    // Blink green LED
    DBG_LED_5 = ~DBG_LED_5;
    
    IFS0bits.T2IF = 0;
}



// UART RX interrupt
void __attribute__ ((interrupt, no_auto_psv)) _U1RXInterrupt(void)
{
    unsigned char RX_buffer = 0;
    static u8 state = 0;
    static u8 next_state = 0;
    
    RX_buffer = U1RXREG;
       
    /*
    if(RX_buffer  == '+')
    {
        d_f += 8;
    }
    
    if(RX_buffer  == '-')
    {
        d_f -= 8;
    }
   
    if(RX_buffer  == '8')
    {
        if(f_index <= 58)
        {
            f_index++; 
        }
    }
    
    if(RX_buffer  == '2')
    {
        if(f_index >= 1)
        {
            f_index--; 
        }
    }    
    */
    if(state == 0)
    {
        if((RX_buffer & 0xF0) == 0x90)      // NOTE ON message
        {
            next_state = 1;
        }
    }
    
    if(state == 1)
    {
        // Note value reception
        f = f_notes[RX_buffer];
        
        next_state = 2;
    }
    
    if(state == 2)
    {
        // Velocity
        next_state = 0;                     // Velocity
        DBG_LED_6 = ~DBG_LED_6;             // Notify MIDI event on debug LED
    }
       
    state = next_state;                     // Update state machine

    // Clear flag
    IFS0bits.U1RXIF = 0;
}
