<p align="center">
  <img width="600" height="800" src="https://github.com/dechielmobiel/environment-sensing/blob/main/pcb%20files/pictures/20221102_131505.jpg">
</p>

# Environment-sensing
this repository contains all the code and hardware designs for a environmental sensing device that measures environmental paramaters like: illuminance, VOC's, Co2, 11 channel collour, sound, humdidity, temperature and atmospheric pressure, then you can employ tinyML to classify some data with Edge impulse or use a tensorflow model.
# Repesitory contents
- bill of materials 💸
- code 📄
  - Tensorflow Lite
  - Edge impulse
  - Luxpy
  - BLE
  - ESPhome
- mechanical drawings 🔧
  - STL files
  - render pictures
- pcb files 🔋
  - Gerber files
  - project files (schematic + board)
# Prerequisites 
# Hardware
- arduino nano 33 ble sense or ESP32 devkit or ESP-EYE v2.2
- Raspberry pi or linux enabled device 
- Used sensors
  - AS7341 (10 channel color sensor)
  - VEML7700 (lux sensor)
  - SGP30 (Co2 and VOC sensor)
  - DPS310 (air pressure sensor)
  - SHTC3 (temperature and humidity sensor)
  - SPH0645LM4H-1 (I2S mems microphone)
# Software 
- edge impulse cli
- Python (latest stable version)
- tensorflow 2.11
- Jupyter notebook or Jupyter labs
- IDE of choice
  - esp idf (in the case of Tensorflow this is required for use with ESP eye)
  - arduino ide 
  - visual studio code
- git bash
- NumPy
- TensorFlow Hub
- Tensorflow_io 0.28
- nrf connect (Android or IOS)
- (optional)
  - ESPhome
  - Home assistant 
  - InfluxdB
# Edge impulse public projects
- sound classification with ESC-50 (requires a I2S microphone): https://studio.edgeimpulse.com/public/126166/latest/create-impulse
- classify the type of light ( requires AS7341 sensor): https://studio.edgeimpulse.com/studio/54747
# Use esp to capture datapoints for edge impulse
first upload the ...data_aquisition code for example (AS7341_data_aquisition).this code can be editted for your specific sensor.
Then open a commandprompt with edge impulse cli installed and type in the following command.
```cmd
edge-impulse-data-fowarder
```
then the cli will ask you to login to your edge impulse account.
next the cli will ask to wich project you want to connect the device, this can be done by using the arrowkeys.
after this the cli will detect the ammount of sensor axis from the code and asks you to name them, sperated by a comma 
(this has to be done in the exact same order as in the code). 

now you can build your impulse 

# deploy the impulse on a esp32 
the code for the deployment of your impulse on esp32 (or other adruino enabled devices) is based on the data forwarder code and can be modified to work with your sensor just as in the aquisition. To change or upgrade the model you only have to change the inference include file.
here is a example of the code for the AS7341.
```c++
// Include the Arduino library here (something like your_project_inference.h) 
// In the Arduino IDE see **File > Examples > Your project name - Edge Impulse > Static buffer** to get the exact name
#include <zonlicht_vs_kunstlicht_inferencing.h>
#include <Adafruit_AS7341.h>

#define FREQUENCY_HZ        (2)
#define INTERVAL_MS         (1000 / (FREQUENCY_HZ + 1))

Adafruit_AS7341 as7341;
static unsigned long last_interval_ms = 0;
// to classify 1 frame of data you need EI_CLASSIFIER_DSP_INPUT_FRAME_SIZE values
float features[EI_CLASSIFIER_DSP_INPUT_FRAME_SIZE];
// keep track of where we are in the feature array
size_t feature_ix = 0;

void setup() {
    Serial.begin(115200);
    Serial.println("Started");

    if (!as7341.begin()) {
        Serial.println("Failed to initialize AS7341!");
        while (1);
    }
}

void loop() {
    uint16_t readings[12];

    if (millis() > last_interval_ms + INTERVAL_MS) {
        last_interval_ms = millis();

        // read sensor data in exactly the same way as in the Data Forwarder example
         if (!as7341.readAllChannels(readings)){
         Serial.println("Error reading all channels!");
         return;
         }

        // fill the features buffer
        features[feature_ix++] = (readings[0]);
        features[feature_ix++] = (readings[1]);
        features[feature_ix++] = (readings[2]);
        features[feature_ix++] = (readings[3]);
        features[feature_ix++] = (readings[6]);
        features[feature_ix++] = (readings[7]);
        features[feature_ix++] = (readings[8]);
        features[feature_ix++] = (readings[9]);
        features[feature_ix++] = (readings[11]);

        // features buffer full? then classify!
        if (feature_ix == EI_CLASSIFIER_DSP_INPUT_FRAME_SIZE) {
            ei_impulse_result_t result;

            // create signal from features frame
            signal_t signal;
            numpy::signal_from_buffer(features, EI_CLASSIFIER_DSP_INPUT_FRAME_SIZE, &signal);

            // run classifier
            EI_IMPULSE_ERROR res = run_classifier(&signal, &result, false);
            ei_printf("run_classifier returned: %d\n", res);
            if (res != 0) return;

            // print predictions
            ei_printf("Predictions (DSP: %d ms., Classification: %d ms., Anomaly: %d ms.): \n",
                result.timing.dsp, result.timing.classification, result.timing.anomaly);

            // print the predictions
            for (size_t ix = 0; ix < EI_CLASSIFIER_LABEL_COUNT; ix++) {
                ei_printf("%s:\t%.5f\n", result.classification[ix].label, result.classification[ix].value);
            }
        #if EI_CLASSIFIER_HAS_ANOMALY == 1
            ei_printf("anomaly:\t%.3f\n", result.anomaly);
        #endif

            // reset features frame
            feature_ix = 0;
        }
    }
}

void ei_printf(const char *format, ...) {
    static char print_buf[1024] = { 0 };

    va_list args;
    va_start(args, format);
    int r = vsnprintf(print_buf, sizeof(print_buf), format, args);
    va_end(args);

    if (r > 0) {
        Serial.write(print_buf);
    }
}

```
# test the deployment code
to test of the model and code is correct open the static_buffer example in your generated library.
next go to your model in the web editor for example at live classification and load a validated sample and go to detailed results copy the raw feature to paste in the following line of the code:
```c++
static const float features[] = {
    -19.8800, -0.6900, 8.2300, -17.6600, -1.1300, 5.9700, ...
};
```
after this compare the result of the code to the model and if the same the code is working correctly.

# how to use a Tensorflow Lite model on edge devices.
for a full tutorial check the how to use tensorflow with c++.ipynb file for a tutorial on how to use a simple "Hello World" example model and convert it to a C++ tflite model. The example model that uses the ESC-50 dataset to classify cat and dog sounds can be found in the ESC-50.ipynb file.

after you have confirmed this model to be working substitute the model with the sound classifaction model.
To import the ESC-50 model use the following lines. 
```python
_ = tf.keras.utils.get_file('esc-50.zip',
                        'https://github.com/karoldvl/ESC-50/archive/master.zip',
                        cache_dir='./',
                        cache_subdir='datasets',
                        extract=True)
```
allow the model to explore the dataset with the following lines.
```python
esc50_csv = './datasets/ESC-50-master/meta/esc50.csv'
base_data_path = './datasets/ESC-50-master/audio/'

pd_data = pd.read_csv(esc50_csv)
pd_data.head()
```
Lastly choose the labels/classes you want to use and specify the correct class id which can be found in the metadata file in the ESC-50 directory.
for example the class id's for the classes i used are: 
```python
my_classes = ['coughing', 'snoring','sneezing', 'vacuum cleaner', 'train', 'thunderstorm' ]
map_class_to_id = {'coughing':24, 'snoring':28, 'sneezing':21, 'vacuum cleaner':36, 'train':45, 'thunderstorm':19}
```
If you want to use my classes copy and paste the lines above in the ESC-50 example lines below. 
```python
my_classes = ['dog', 'cat']
map_class_to_id = {'dog':0, 'cat':1}

filtered_pd = pd_data[pd_data.category.isin(my_classes)]

class_id = filtered_pd['category'].apply(lambda name: map_class_to_id[name])
filtered_pd = filtered_pd.assign(target=class_id)

full_path = filtered_pd['filename'].apply(lambda row: os.path.join(base_data_path, row))
filtered_pd = filtered_pd.assign(filename=full_path)

filtered_pd.head(10)
```
# how to convert the Tensorflow yamnet model to a tensorflow Lite model.
```python
# Convert the model to the TensorFlow Lite format without quantization
converter = tf.lite.TFLiteConverter.from_saved_model(MODEL_TF)
model_no_quant_tflite = converter.convert()

# Save the model to disk
open(MODEL_NO_QUANT_TFLITE, "wb").write(model_no_quant_tflite)

# Convert the model to the TensorFlow Lite format with quantization
def representative_dataset():
  for i in range(500):
    yield([x_train[i].reshape(1, 1)])
# Set the optimization flag.
converter.optimizations = [tf.lite.Optimize.DEFAULT]
# Enforce integer only quantization
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.int8
converter.inference_output_type = tf.int8
# Provide a representative dataset to ensure we quantize correctly.
converter.representative_dataset = representative_dataset
model_tflite = converter.convert()

# Save the model to disk
open(MODEL_TFLITE, "wb").write(model_tflite)
```
After this compare the result of the newly generated model to the original see: https://github.com/dechielmobiel/environment-sensing/blob/main/how%20to%20use%20tensorflow%20with%20c%2B%2B.ipynb for more information. 
# how to convert the model to Tensorflow Lite C++ library.
Convert the TensorFlow Lite quantized model into a C source file that can be loaded by TensorFlow Lite for Microcontrollers.

```python
# Install xxd if it is not available
!apt-get update && apt-get -qq install xxd
# Convert to a C source file, i.e, a TensorFlow Lite for Microcontrollers model
!xxd -i {MODEL_TFLITE} > {MODEL_TFLITE_MICRO}
# Update variable names
REPLACE_TEXT = MODEL_TFLITE.replace('/', '_').replace('.', '_')
!sed -i 's/'{REPLACE_TEXT}'/g_model/g' {MODEL_TFLITE_MICRO} 
```
# deploy your model 
To use your model with ESP32 run the folowing commands:
```python
make -f tensorflow/lite/micro/tools/make/Makefile third_party_downloads
make -f tensorflow/lite/micro/tools/make/Makefile "your_model.cc"
```      

                       


