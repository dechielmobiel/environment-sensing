#if defined(ESP32)
#include <WiFiMulti.h>
WiFiMulti wifiMulti;
#define DEVICE "ESP32"
#elif defined(ESP8266)
#include <ESP8266WiFiMulti.h>
ESP8266WiFiMulti wifiMulti;
#define DEVICE "ESP8266"
#endif

#include <InfluxDbClient.h>
#include <InfluxDbCloud.h>

// Import the sensor librarys, and set some constants
#include "Adafruit_VEML7700.h"
#include "Adafruit_AS7341.h"
#include "Adafruit_SHTC3.h"
#include "Adafruit_DPS310.h"
#include <Adafruit_SGP30.h>

Adafruit_AS7341 as7341;
Adafruit_VEML7700 veml = Adafruit_VEML7700();
Adafruit_DPS310 dps;
Adafruit_SHTC3 shtc3 = Adafruit_SHTC3();
Adafruit_SGP30 sgp;
Adafruit_Sensor *dps_temp = dps.getTemperatureSensor();
Adafruit_Sensor *dps_pressure = dps.getPressureSensor();


// WiFi AP SSID
#define WIFI_SSID "Ziggo3166762"
// WiFi password
#define WIFI_PASSWORD "ddnj5TqJchkr"
// InfluxDB v2 server url, e.g. https://eu-central-1-1.aws.cloud2.influxdata.com (Use: InfluxDB UI -> Load Data -> Client Libraries)
#define INFLUXDB_URL "https://westeurope-1.azure.cloud2.influxdata.com"
// InfluxDB v2 server or cloud API authentication token (Use: InfluxDB UI -> Data -> Tokens -> <select token>)
#define INFLUXDB_TOKEN "bMICiv8IfTZJpLlICxWTu0HZ_9Pk8He5csVmoXMaHSYnrpQ-bhmgSPtwsfcGf7k7isd-oOTjlv0XuuIQc_v3QA=="
// InfluxDB v2 organization id (Use: InfluxDB UI -> User -> About -> Common Ids )
#define INFLUXDB_ORG "chiel_hoogenkamp@hotmail.com"
// InfluxDB v2 bucket name (Use: InfluxDB UI ->  Data -> Buckets)
#define INFLUXDB_BUCKET "moodsense"

// Set timezone string according to https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html
// Examples:
//  Pacific Time: "PST8PDT"
//  Eastern: "EST5EDT"
//  Japanesse: "JST-9"
//  Central Europe: "CET-1CEST,M3.5.0,M10.5.0/3"
#define TZ_INFO "CET-1CEST,M3.5.0,M10.5.0/3"

// InfluxDB client instance with preconfigured InfluxCloud certificate
InfluxDBClient client(INFLUXDB_URL, INFLUXDB_ORG, INFLUXDB_BUCKET, INFLUXDB_TOKEN, InfluxDbCloud2CACert);

// Data point
Point sensor("omgevingsparameters");

//recieve serial messages from arduino nano 33 ble sense
#define RXp2 16
#define TXp2 17

void setup() {
  Serial.begin(115200);
  Serial2.begin(115200, SERIAL_8N1, RXp2, TXp2);

  // Initialize the sensors
  as7341.begin();
  dps.begin_I2C();
  shtc3.begin();
  veml.begin();
  sgp.begin();

  Serial.print(F("Gain: "));
  switch (veml.getGain()) {
    case VEML7700_GAIN_1: Serial.println("1"); break;
    case VEML7700_GAIN_2: Serial.println("2"); break;
    case VEML7700_GAIN_1_4: Serial.println("1/4"); break;
    case VEML7700_GAIN_1_8: Serial.println("1/8"); break;
  }

  Serial.print(F("Integration Time (ms): "));
  switch (veml.getIntegrationTime()) {
    case VEML7700_IT_25MS: Serial.println("25"); break;
    case VEML7700_IT_50MS: Serial.println("50"); break;
    case VEML7700_IT_100MS: Serial.println("100"); break;
    case VEML7700_IT_200MS: Serial.println("200"); break;
    case VEML7700_IT_400MS: Serial.println("400"); break;
    case VEML7700_IT_800MS: Serial.println("800"); break;
  }

  dps.configurePressure(DPS310_64HZ, DPS310_64SAMPLES);
  dps.configureTemperature(DPS310_64HZ, DPS310_64SAMPLES);
  as7341.setATIME(100);
  as7341.setASTEP(999);
  as7341.setGain(AS7341_GAIN_256X);

  // Setup wifi
  WiFi.mode(WIFI_STA);
  wifiMulti.addAP(WIFI_SSID, WIFI_PASSWORD);

  Serial.print("Connecting to wifi");
  while (wifiMulti.run() != WL_CONNECTED) {
    Serial.print(".");
    delay(100);
  }
  Serial.println();

  // Add tags
  sensor.addTag("device", DEVICE);
//  sensor.addTag("SGP30_TVOC", sgp.TVOC );

  // Accurate time is necessary for certificate validation and writing in batches
  // For the fastest time sync find NTP servers in your area: https://www.pool.ntp.org/zone/
  // Syncing progress and the time will be printed to Serial.
  timeSync(TZ_INFO, "pool.ntp.org", "time.nis.gov");

  // Check server connection
  if (client.validateConnection()) {
    Serial.print("Connected to InfluxDB: ");
    Serial.println(client.getServerUrl());
  } else {
    Serial.print("InfluxDB connection failed: ");
    Serial.println(client.getLastErrorMessage());
  }
}

void loop() {

  uint16_t TVOC, eCO2, rawH2, rawEthanol;
  uint16_t readings[12];
  sensors_event_t temp_event, pressure_event;
  dps.getEvents(&temp_event, &pressure_event);
  sensors_event_t humidity, temp;
  shtc3.getEvent(&humidity, &temp);
  
  // Clear fields for reusing the point. Tags will remain untouched
  sensor.clearFields();

 //initializeer alle sensor metingen
//  if (! sgp.IAQmeasure()&& !as7341.readAllChannels(readings)&& !dps.temperatureAvailable() || !dps.pressureAvailable()&& ! sgp.IAQmeasureRaw()) {
//  Serial.println("Measurements failed");
//  return;

 (sgp.IAQmeasure()&& as7341.readAllChannels(readings)&& dps.pressureAvailable()&& sgp.IAQmeasureRaw());
    
  // Store measured value into point
  // Report RSSI of currently connected network
  sensor.addField("rssi", WiFi.RSSI());
  sensor.addField("TVOC", sgp.TVOC);
  sensor.addField("eCO2", sgp.eCO2);
  sensor.addField("rawH2", sgp.rawH2);
  sensor.addField("rawEthanol",sgp.rawEthanol);
  sensor.addField("violet", readings[0]);
  sensor.addField("indigo", readings[1]);
  sensor.addField("blauw", readings[2]);
  sensor.addField("cyaan", readings[3]);
  sensor.addField("groen", readings[6]);
  sensor.addField("geel", readings[7]);
  sensor.addField("oranje", readings[8]);
  sensor.addField("rood", readings[9]);
  sensor.addField("NIR", readings[11]);
  sensor.addField("lux", veml.readLux());
  sensor.addField("ALS", veml.readALS());
  sensor.addField("pressure", pressure_event.pressure);
  sensor.addField("temperatuur", temp.temperature);
  sensor.addField("luchtvochtigheid", humidity.relative_humidity );
  sensor.addField("ML classificatie", Serial2.readString() );
  

  // Print what are we exactly writing
  Serial.print("Writing: ");
  Serial.println(sensor.toLineProtocol());

  // If no Wifi signal, try to reconnect it
  if ((WiFi.RSSI() == 0) && (wifiMulti.run() != WL_CONNECTED)) {
    Serial.println("Wifi connection lost");
  }

  // Write point
  if (!client.writePoint(sensor)) {
    Serial.print("InfluxDB write failed: ");
    Serial.println(client.getLastErrorMessage());
  }

  //Wait 10s
  Serial.println("Wait 10s");
  delay(10000);
}
