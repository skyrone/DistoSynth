/* 
 * File:   LTC1450.c
 * Author: Quentin
 *
 * Driver for the LTC1450 12 bits DAC
 */

// =============================================================================
// Includes
// =============================================================================
#include <xc.h>
#include "main.h"
#include "init.h"
#include "LTC1450.h"


// =============================================================================
// Defines
// =============================================================================

// =============================================================================
// Functions
// =============================================================================
void DAC_reset(void)
{
    DAC_CLR_N = 0;
    asm("nop");
    asm("nop");
    asm("nop");
    
    DAC_CLR_N = 1;
    asm("nop");
    asm("nop");
    asm("nop");
    
    // Init control signals
    DAC_CS_LSB_N = 1;
    DAC_CS_MSB_N = 1;
    DAC_WR_N = 1;
    DAC_LDAC_N = 1;
}

void DAC_send(uint16 DAC_data)
{
    u8 DAC_buffer = 0;
    uint16 LATC_buffer = 0;
    
    // Init control signals
    DAC_CS_LSB_N = 1;
    DAC_CS_MSB_N = 1;
    DAC_WR_N = 1;
    DAC_LDAC_N = 1;
    
    // ==============
    // LSB processing
    // ==============
    
    // Extract LSB from data
    DAC_buffer = (u8)(0x00FF & DAC_data);
    
    // Back-up LATC status
    LATC_buffer = LATC;
    LATC_buffer = LATC_buffer & 0xFF00;
    LATC_buffer = LATC_buffer | DAC_buffer;
    
    // Put data on the register
    LATC = LATC_buffer;
    
    // Latch data (delay is required because the PIC runs way faster than the
    // DAC speed limit!)
    DAC_CS_LSB_N = 0;
    DAC_WR_N = 0;
    asm("nop");
    asm("nop");
    asm("nop");

    // Release WR before CS_LSB (as in the datasheet timings diagram)
    DAC_WR_N = 1;
    DAC_CS_LSB_N = 1;    
    asm("nop");
    asm("nop");
    asm("nop");    
    
    // ==============
    // MSB processing
    // ==============

    // Extract MSB from data
    DAC_buffer = (u8)((0x0F00 & DAC_data) >> 8);
    //DAC_buffer = 0x0F;
    
    // Back-up LATC status
    LATC_buffer = LATC;
    LATC_buffer = LATC_buffer & 0xFF00;
    LATC_buffer = LATC_buffer | DAC_buffer;
    
    // Put data on the register
    LATC = LATC_buffer;
    
    // Latch data (delay is required because the PIC runs way faster than the
    // DAC speed limit!)
    DAC_CS_MSB_N = 0;
    DAC_WR_N = 0;
    asm("nop");
    asm("nop");
    asm("nop");

    // Release WR before CS_LSB (as in the datasheet timings diagram)
    DAC_WR_N = 1;
    DAC_CS_MSB_N = 1;    
    asm("nop");
    asm("nop");
    asm("nop"); 
    
    // ==========
    // Update DAC
    // ==========
    DAC_LDAC_N = 0;
    asm("nop");
    asm("nop");
    asm("nop");
    
    DAC_LDAC_N = 1;
    asm("nop");
    asm("nop");
    asm("nop");
}

