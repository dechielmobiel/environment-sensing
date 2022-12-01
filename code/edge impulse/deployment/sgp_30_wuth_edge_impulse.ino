#include <Arduino.h>
#include <Wire.h>    // I2C library
#include "Adafruit_SGP30.h"  // CCS811 library
#define FREQUENCY_HZ        1
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))
// Initialize CCS811
Adafruit_SGP30 sgp;
static unsigned long last_interval_ms = 0;
  
void setup() {
  Serial.begin(115200);
  Serial.println("Air Quality monitoring with ML");
   // Enable I2C
  Wire.begin(); 
  
  // Enable sgp30
   bool ok= sgp.begin();
  if( !ok ) Serial.println("setup: SGP30 begin FAILED");
    
  // Start measuring
  ok= sgp.IAQmeasure();
  if( !ok ) Serial.println("setup: SGP30 start FAILED");
  
  // start measuring raw values
  ok= sgp.IAQmeasureRaw();
  if( !ok ) Serial.println("setup: SGP30 raw start FAILED");

   ok= sgp.IAQinit();
  if( !ok ) Serial.println("setup: SGP30 initialization FAILED");
  
}

int counter = 0;
void loop() {
  uint16_t TVOC, eCO2, rawH2, rawEthanol;
  if (millis() > last_interval_ms + INTERVAL_MS) {
    last_interval_ms = millis(); 
  
    Serial.print(sgp.TVOC);
    Serial.print(",");
    Serial.print(sgp.eCO2);
    Serial.print(",");
    Serial.print(sgp.rawH2);
    Serial.print(",");
    Serial.println(sgp.rawEthanol);

   counter++;
  if (counter == 30) {
    counter = 0;
  }
  
}
 }
