#include <Wire.h>
#include "Adafruit_SGP30.h"
#include <Adafruit_AS7341.h>
#include "Adafruit_VEML7700.h"
#include <Adafruit_DPS310.h>
#include "Adafruit_TCS34725.h"
#define FREQUENCY_HZ        1
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

Adafruit_SGP30 sgp;
Adafruit_AS7341 as7341;
Adafruit_VEML7700 veml = Adafruit_VEML7700();
Adafruit_DPS310 dps;
Adafruit_TCS34725 tcs = Adafruit_TCS34725();


static unsigned long last_interval_ms = 0;

/* return absolute humidity [mg/m^3] with approximation formula
* @param temperature [°C]
* @param humidity [%RH]
*/
//uint32_t getAbsoluteHumidity(float temperature, float humidity) {
//    // approximation formula from Sensirion SGP30 Driver Integration chapter 3.15
//    const float absoluteHumidity = 216.7f * ((humidity / 100.0f) * 6.112f * exp((17.62f * temperature) / (243.12f + temperature)) / (273.15f + temperature)); // [g/m^3]
//    const uint32_t absoluteHumidityScaled = static_cast<uint32_t>(1000.0f * absoluteHumidity); // [mg/m^3]
//    return absoluteHumidityScaled;


void setup() {
  Serial.begin(115200);
  while (!Serial) { delay(10); } // Wait for serial console to open!

  Serial.println("alles test");

  if (! sgp.begin()&& ! as7341.begin()&& ! veml.begin()&& ! dps.begin_I2C()&& ! tcs.begin() ){
    Serial.println("Sensors not found :(");
    while (1);
  }
//  Serial.print("Found SGP30 serial #");
//  Serial.print(sgp.serialnumber[0], HEX);
//  Serial.print(sgp.serialnumber[1], HEX);
//  Serial.println(sgp.serialnumber[2], HEX);
  
  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);
  veml.setGain(VEML7700_GAIN_1);
  veml.setIntegrationTime(VEML7700_IT_800MS);
  dps.configurePressure(DPS310_64HZ, DPS310_64SAMPLES);
  dps.configureTemperature(DPS310_64HZ, DPS310_64SAMPLES);

//  Serial.print(F("Gain: "));
//  switch (veml.getGain()) {
//    case VEML7700_GAIN_1: Serial.println("1"); break;
//    case VEML7700_GAIN_2: Serial.println("2"); break;
//    case VEML7700_GAIN_1_4: Serial.println("1/4"); break;
//    case VEML7700_GAIN_1_8: Serial.println("1/8"); break;
//  }

//  Serial.print(F("Integration Time (ms): "));
//  switch (veml.getIntegrationTime()) {
//    case VEML7700_IT_25MS: Serial.println("25"); break;
//    case VEML7700_IT_50MS: Serial.println("50"); break;
//    case VEML7700_IT_100MS: Serial.println("100"); break;
//    case VEML7700_IT_200MS: Serial.println("200"); break;
//    case VEML7700_IT_400MS: Serial.println("400"); break;
//    case VEML7700_IT_800MS: Serial.println("800"); break;


  // If you have a baseline measurement from before you can assign it to start, to 'self-calibrate'
  //sgp.setIAQBaseline(0x8E68, 0x8F41);  // Will vary for each sensor!
}
//}

int counter = 0;

void loop() {
  uint16_t TVOC, eCO2, rawH2, rawEthanol;
  uint16_t readings[12];
  uint16_t r, g, b, c, colorTemp, lux;
  sensors_event_t temp_event, pressure_event;
  tcs.getRawData(&r, &g, &b, &c);
  
  if (millis() > last_interval_ms + INTERVAL_MS) {
    last_interval_ms = millis(); 
  // If you have a temperature / humidity sensor, you can set the absolute humidity to enable the humditiy compensation for the air quality signals
  //float temperature = 22.1; // [°C]
  //float humidity = 45.2; // [%RH]
  //sgp.setHumidity(getAbsoluteHumidity(temperature, humidity));

  if (! sgp.IAQmeasure()&& !as7341.readAllChannels(readings)&& !dps.temperatureAvailable() || !dps.pressureAvailable()&& ! sgp.IAQmeasureRaw()) {
    Serial.println("Measurements failed");
    return;
  }
  dps.getEvents(&temp_event, &pressure_event);
  colorTemp = tcs.calculateColorTemperature_dn40(r, g, b, c);
  lux = tcs.calculateLux(r, g, b);
   
   Serial.print(sgp.TVOC);Serial.print(",");
   Serial.print(sgp.eCO2);Serial.print(",");
   Serial.print(sgp.rawH2);Serial.print(",");
   Serial.println(sgp.rawEthanol);Serial.print(",");
  
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
  Serial.print(",");

  Serial.print(veml.readLux()); Serial.print(",");
  Serial.println(veml.readALS());Serial.print(",");

  Serial.print(pressure_event.pressure);Serial.print(",");

  Serial.print(colorTemp, DEC); Serial.print(",");
  Serial.print(lux, DEC); Serial.print(",");
  Serial.print(r, DEC); Serial.print(",");
  Serial.print(g, DEC); Serial.print(",");
  Serial.print(b, DEC); Serial.print(",");
  Serial.println(" ");

  }
}
