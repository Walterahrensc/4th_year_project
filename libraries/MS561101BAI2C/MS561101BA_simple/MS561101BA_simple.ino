/*
MS561101BA_demo.pde - Example code for using the MS561101BA library.
Displays temperature and pression readings from the sensor

Copyright (C) 2011 Fabio Varesano <fvaresano@yahoo.it>

Development of this code has been supported by the Department of Computer Science,
Universita' degli Studi di Torino, Italy within the Piemonte Project
http://www.piemonte.di.unito.it/


This program is free software: you can redistribute it and/or modify
it under the terms of the version 3 GNU General Public License as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/


//#define DEBUG_V

#include <Wire.h>
//#include <DebugUtils.h>
#include <MS561101BA.h>
#include <I2Cdev.h>

MS561101BA baro = MS561101BA(MS561101BA_ADDRESS_CSB_LOW,MS561101BA_OSR_1024);

void setup() {
  Wire.begin();
  Serial.begin(115200);
  delay(1000);

  // Suppose that the CSB pin is connected to GND.
  // You'll have to check this on your breakout schematics
  baro.initialize();
  Serial.print("baro connection test : ");
  Serial.println(baro.testConnection());
  
}

void loop() {
  float temperature = NULL, pressure = NULL;
  bool success;
  success = baro.readValues(& pressure, & temperature);
  Serial.print(success);
  Serial.print("temp: ");
  Serial.print(temperature); 
  Serial.print(" degC pres: ");
  Serial.print(pressure);
  Serial.println(" mbar");
}
