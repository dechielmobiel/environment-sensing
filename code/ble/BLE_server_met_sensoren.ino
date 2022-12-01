/*
    Based on Neil Kolban example for IDF: https://github.com/nkolban/esp32-snippets/blob/master/cpp_utils/tests/BLE%20Tests/SampleServer.cpp
    Ported to Arduino ESP32 by Evandro Copercini
    updates by chegewara
*/

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include "Adafruit_SHTC3.h"
#include "Adafruit_VEML7700.h"

// See the following for generating UUIDs:
// https://www.uuidgenerator.net/

#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHARACTERISTIC_UUID "beb5483e-36e1-4688-b7f5-ea07361b26a8"
#define CHARACTERISTIC2_UUID "c9abc0b5-2796-4abf-a36e-4f5b50f1a2b0"
#define CHARACTERISTIC3_UUID "763d5eec-c5c5-4497-b7fd-577cf2c7a3ac"
                              

Adafruit_SHTC3 shtc3 = Adafruit_SHTC3();
Adafruit_VEML7700 veml = Adafruit_VEML7700();
 sensors_event_t humidity, temp;
//float temp = temp.temperature;
//float Humidity;
float lux = veml.readLux();


void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE work!");

   
  if (! shtc3.begin()) {
    Serial.println("Couldn't find SHTC3");
    while (1) delay(1);
    Serial.println("Found SHTC3 sensor");
  }
    if (! veml.begin()) {
    Serial.println("Couldn't find VEML7700");
    while (1) delay(1);
   Serial.println("Found VEML7700 sensor");
   delay(20);
  }

  BLEDevice::init("ESP32 env device");
  BLEServer *pServer = BLEDevice::createServer();
  BLEService *pService = pServer->createService(SERVICE_UUID);
  BLECharacteristic *pCharacteristic = pService->createCharacteristic(
                                         CHARACTERISTIC_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE|
                                         BLECharacteristic::PROPERTY_NOTIFY
                                       );              

  BLECharacteristic *pCharacteristic1 = pService->createCharacteristic(
                                         CHARACTERISTIC2_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE|
                                         BLECharacteristic::PROPERTY_NOTIFY
                                       );
   pCharacteristic1->setValue(humidity.relative_humidity); 
   delay(5);                                    
                                       
    BLECharacteristic *pCharacteristic2 = pService->createCharacteristic(
                                         CHARACTERISTIC3_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE
                                       ); 
   pCharacteristic2->setValue("char 3");
   delay(5);
 
 
  pService->start();
  // BLEAdvertising *pAdvertising = pServer->getAdvertising();  // this still is working for backward compatibility
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(true);
  pAdvertising->setMinPreferred(0x06);  // functions that help with iPhone connections issue
  pAdvertising->setMinPreferred(0x12);
  BLEDevice::startAdvertising();
  Serial.println(" 3 Characteristics defined! Now you can read it in your phone!");
  delay(20);

  while(1)
  {
    shtc3.getEvent(&humidity, &temp);// populate temp and humidity objects with fresh data  pCharacteristic->setValue(temp.temperature);
    int temperature = (int)(temp.temperature * 100);
    pCharacteristic->setValue(temperature);
    pCharacteristic->notify();
    Serial.print("Temperature: "); Serial.print(temperature); Serial.println(" degrees C");
    Serial.print("Humidity: "); Serial.print(humidity.relative_humidity); Serial.println("% rH");
  Serial.print("LUX: "); Serial.print(lux); Serial.println("lmn/m2");
    delay(2000);
  }
}

void loop() {
  // put your main code here, to run repeatedly:
 
 
//  shtc3.getEvent(&humidity, &temp);// populate temp and humidity objects with fresh data  pCharacteristic->setValue(temp.temperature);
//  Serial.print("Temperature: "); Serial.print(temp.temperature); Serial.println(" degrees C");
//  Serial.print("Humidity: "); Serial.print(humidity.relative_humidity); Serial.println("% rH");
//  Serial.print("LUX: "); Serial.print(lux); Serial.println("lmn/m2");
//  delay(2000);
}
