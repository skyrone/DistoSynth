/* 
 * File:   spi.c
 * Author: Quentin
 *
 * SPI functions
 */

// =============================================================================
// Includes
// =============================================================================
#include <xc.h>
#include "spi.h"


// =============================================================================
// Defines
// =============================================================================


// =============================================================================
// User functions
// =============================================================================
void SPI_send(unsigned char TX_data, unsigned char* RX_data)
{
    IFS0bits.SPI1IF = 0;
    
    // Send data
    SPI1BUF = TX_data;

    // Wait until whole data has been transmitted
    while(~IFS0bits.SPI1IF)
    {
        asm("NOP");
    }

    // Lecture du buffer de réception
    *RX_data = SPI1BUF;
}