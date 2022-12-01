/*************************************************** 
  This is an example for the SHTC3 Humidity & Temp Sensor

  Designed specifically to work with the SHTC3 sensor from Adafruit
  ----> https://www.adafruit.com/products/4636

  These sensors use I2C to communicate, 2 pins are required to  
  interface
 ****************************************************/

#include "Adafruit_SHTC3.h"
#include <Arduino.h>
#include <Wire.h>    // I2C library
#define FREQUENCY_HZ        1
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

Adafruit_SHTC3 shtc3 = Adafruit_SHTC3();
static unsigned long last_interval_ms = 0;

void setup() {
  Serial.begin(115200);

  while (!Serial)
    delay(10);     // will pause Zero, Leonardo, etc until serial console opens

  Serial.println("SHTC3 test");
  if (! shtc3.begin()) {
    Serial.println("Couldn't find SHTC3");
    while (1) delay(1);
  }
  Serial.println("Found SHTC3 sensor");
}


void loop() {
    if (millis() > last_interval_ms + INTERVAL_MS) {
    last_interval_ms = millis();
  sensors_event_t humidity, temp;
  
  shtc3.getEvent(&humidity, &temp);// populate temp and humidity objects with fresh data
  
  Serial.print(temp.temperature); Serial.print(",");
  Serial.print(humidity.relative_humidity); Serial.println(" ");

}
 }
