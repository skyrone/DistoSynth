/* 
 * File:   LTC1450.h
 * Author: Administrateur
 *
 * Created on 2 novembre 2016, 19:00
 */

#ifndef LTC1450_H
#define	LTC1450_H

// =======
// Defines
// =======
#define DAC_WR_N            LATEbits.LATE14
#define DAC_CLR_N           LATEbits.LATE15
#define DAC_CS_LSB_N        LATEbits.LATE13
#define DAC_CS_MSB_N        LATEbits.LATE12
#define DAC_LDAC_N          LATAbits.LATA8

void DAC_reset(void);
void DAC_send(uint16);

#endif	/* LTC1450_H */

