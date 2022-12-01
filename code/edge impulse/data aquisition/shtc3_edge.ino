#include "Adafruit_SHTC3.h"

#define CONVERT_G_TO_MS2    9.80665f
#define FREQUENCY_HZ        50
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

static unsigned long last_interval_ms = 0;
Adafruit_SHTC3 shtc3 = Adafruit_SHTC3();
sensors_event_t humidity, temp;

void setup() {
    Serial.begin(115200);
    Serial.println("Started");

          if (! shtc3.begin()) {
    Serial.println("Couldn't find SHTC3");
    while (1) delay(1);
    Serial.println("Found SHTC3 sensor");
    }
}

void loop() {

    if (millis() > last_interval_ms + INTERVAL_MS) {
        last_interval_ms = millis();

      
       Serial.print(temp.temperature);
       Serial.print('\t');
       Serial.print(humidity.relative_humidity);
       Serial.print('\t');
       
    }
}
