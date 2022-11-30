# Environment-sensing
this repository contains all the code and hardware designs for a environemntal sensing divice that measures environmental paramaters ike: illuminance, VOC's, Co2, 10 channel collour, sound, humdidity, temperature and atmospheric pressure and can employ tinyML to classify some data.
# Repesitory contents
- bill of materials 💸
- code 📄
- mechanical drawings 🔧
- pcb files 🔋
# Pre requisites 
# Hardware
- arduino nano 33 ble sense
- esp32 (devkit)
# Software 
- edge impulse cli
- esp idf/arduino ide/visual studio code
- git bash
- nrf connect (Android or IOS)

# Use esp to capture datapoints for edge impulse
first upload the ...data_aquisition code for example (AS7341_data_aquisition) this code can be editted for your specific sensor
then open a commandprompt with edge impulse cli installed and type in the following command.
```
edge-impulse-data-fowarder
```


