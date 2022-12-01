/* This example will read all channels from the AS7341 and print out reported values */

#include <Adafruit_AS7341.h>
#include <Arduino.h>
#include <Wire.h>    // I2C library
#define FREQUENCY_HZ        1
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

Adafruit_AS7341 as7341;
static unsigned long last_interval_ms = 0;


void setup() {
  Serial.begin(115200);

  // Wait for communication with the host computer serial monitor
  while (!Serial) {
    delay(1);
  }
  
  if (!as7341.begin()){
    Serial.println("Could not find AS7341");
    while (1) { delay(10); }
  }
  
  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);
}

void loop() {
  uint16_t readings[12];
 
  if (millis() > last_interval_ms + INTERVAL_MS) {
    last_interval_ms = millis();

  if (!as7341.readAllChannels(readings)){
    Serial.println("Error reading all channels!");
    return;
  }
  Serial.print(readings[0]);//415nm violet
  Serial.print(",");
  Serial.print(readings[1]);//445nm indigo
  Serial.print(",");
  Serial.print(readings[2]);//480nm blauw
  Serial.print(",");
  Serial.print(readings[3]);//515nm cyaan
  Serial.print(",");

  /* 
  // we skip the first set of duplicate clear/NIR readings
  Serial.print("ADC4/Clear-");
  Serial.println(readings[4]);
  Serial.print("ADC5/NIR-");
  Serial.println(readings[5]);
  */
  
  Serial.print(readings[6]);//555nm groen
  Serial.print(",");
  Serial.print(readings[7]);//590nm geel
  Serial.print(",");
  Serial.print(readings[8]);//630nm oranje
  Serial.print(",");
  Serial.print(readings[9]);//680nm rood
  Serial.print(",");
  Serial.print(readings[11]);//NIR +- 900nm
  Serial.println();
}
 }
