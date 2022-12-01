// This example shows how to read temperature/pressure

#include <Adafruit_DPS310.h>
#include <Arduino.h>
#include <Wire.h>    // I2C library
#define FREQUENCY_HZ        1
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

Adafruit_DPS310 dps;

// Can also use SPI!
#define DPS310_CS 10
static unsigned long last_interval_ms = 0;
void setup() {
  Serial.begin(115200);
  while (!Serial) delay(10);

  Serial.println("DPS310");
  if (! dps.begin_I2C()) {             // Can pass in I2C address here
  //if (! dps.begin_SPI(DPS310_CS)) {  // If you want to use SPI
    Serial.println("Failed to find DPS");
    while (1) yield();
  }
  Serial.println("DPS OK!");

  dps.configurePressure(DPS310_64HZ, DPS310_64SAMPLES);
  dps.configureTemperature(DPS310_64HZ, DPS310_64SAMPLES);
}

void loop() {
  sensors_event_t temp_event, pressure_event;
    if (millis() > last_interval_ms + INTERVAL_MS) {
    last_interval_ms = millis();
  
  while (!dps.temperatureAvailable() || !dps.pressureAvailable()) {
    return; // wait until there's something to read
  }

  dps.getEvents(&temp_event, &pressure_event);
  Serial.print(pressure_event.pressure); 

  Serial.println();
 }
}
