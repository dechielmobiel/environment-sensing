# Environment-sensing
this repository contains all the code and hardware designs for a environnmental sensing device that measures environmental paramaters like: illuminance, VOC's, Co2, 11 channel collour, sound, humdidity, temperature and atmospheric pressure, then you can employ tinyML to classify some data with Edge impulse or use a tensorflow model.
# Repesitory contents
- bill of materials 💸
- code 📄
- mechanical drawings 🔧
- pcb files 🔋
# Prerequisites 
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
then the cli will ask you to login to your edge impulse account.
next the cli will ask to wich project you want to connect the device, this can be done by using the arrowkeys.
after this the cli will detect the ammount of sensor axis form the code and asks you to name them sperated by a comma 
(this has to be done in the exact same order as in the code). 

now you can build your impulse 

# deploy the impulse on a esp32 
the code for the deployment of your impulse on esp32 (or other adruino enabled devices) is based on the data forwarder code and can be modified to work with your sensor just as in the aquisition. to change or upgrade the model you only have to change the infernence include.
here is a example of the code for the AS7341.
```
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
next go to your model for exaple at live classification and load a validated sample and go to detailed results copy the raw feature to paste in the following line of the code:
```arduino
static const float features[] = {
    -19.8800, -0.6900, 8.2300, -17.6600, -1.1300, 5.9700, ...
};
```
after this compare the result of the code to the model and if the same the code is working correctly.

# how to use a Tensorflow Lite model on edge devices.
```python

Train a Simple TensorFlow Lite for Microcontrollers model
This notebook demonstrates the process of training a 2.5 kB model using TensorFlow and converting it for use with TensorFlow Lite for Microcontrollers.

Deep learning networks learn to model patterns in underlying data. Here, we're going to train a network to model data generated by a sine function. This will result in a model that can take a value, x, and predict its sine, y.

The model created in this notebook is used in the hello_world example for TensorFlow Lite for MicroControllers.

Run in Google Colab	View source on GitHub
Configure Defaults

# Define paths to model files
import os
MODELS_DIR = 'models/'
if not os.path.exists(MODELS_DIR):
    os.mkdir(MODELS_DIR)
MODEL_TF = MODELS_DIR + 'model'
MODEL_NO_QUANT_TFLITE = MODELS_DIR + 'model_no_quant.tflite'
MODEL_TFLITE = MODELS_DIR + 'model.tflite'
MODEL_TFLITE_MICRO = MODELS_DIR + 'model.cc'
     
Setup Environment
Install Dependencies


! pip install tensorflow==2.4.0
     
Requirement already satisfied: tensorflow==2.4.0rc0 in /usr/local/lib/python3.6/dist-packages (2.4.0rc0)
Requirement already satisfied: termcolor~=1.1.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.1.0)
Requirement already satisfied: gast==0.3.3 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (0.3.3)
Requirement already satisfied: astunparse~=1.6.3 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.6.3)
Requirement already satisfied: absl-py~=0.10 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (0.10.0)
Requirement already satisfied: keras-preprocessing~=1.1.2 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.1.2)
Requirement already satisfied: six~=1.15.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.15.0)
Requirement already satisfied: tensorboard~=2.3 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (2.3.0)
Requirement already satisfied: tensorflow-estimator~=2.3.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (2.3.0)
Requirement already satisfied: flatbuffers~=1.12.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.12)
Requirement already satisfied: google-pasta~=0.2 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (0.2.0)
Requirement already satisfied: protobuf~=3.13.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (3.13.0)
Requirement already satisfied: grpcio~=1.32.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.32.0)
Requirement already satisfied: h5py~=2.10.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (2.10.0)
Requirement already satisfied: wrapt~=1.12.1 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.12.1)
Requirement already satisfied: opt-einsum~=3.3.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (3.3.0)
Requirement already satisfied: numpy~=1.19.2 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (1.19.4)
Requirement already satisfied: typing-extensions~=3.7.4 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (3.7.4.3)
Requirement already satisfied: wheel~=0.35 in /usr/local/lib/python3.6/dist-packages (from tensorflow==2.4.0rc0) (0.35.1)
Requirement already satisfied: werkzeug>=0.11.15 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (1.0.1)
Requirement already satisfied: markdown>=2.6.8 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (3.3.3)
Requirement already satisfied: google-auth-oauthlib<0.5,>=0.4.1 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (0.4.2)
Requirement already satisfied: tensorboard-plugin-wit>=1.6.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (1.7.0)
Requirement already satisfied: requests<3,>=2.21.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (2.23.0)
Requirement already satisfied: setuptools>=41.0.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (50.3.2)
Requirement already satisfied: google-auth<2,>=1.6.3 in /usr/local/lib/python3.6/dist-packages (from tensorboard~=2.3->tensorflow==2.4.0rc0) (1.17.2)
Requirement already satisfied: importlib-metadata; python_version < "3.8" in /usr/local/lib/python3.6/dist-packages (from markdown>=2.6.8->tensorboard~=2.3->tensorflow==2.4.0rc0) (2.0.0)
Requirement already satisfied: requests-oauthlib>=0.7.0 in /usr/local/lib/python3.6/dist-packages (from google-auth-oauthlib<0.5,>=0.4.1->tensorboard~=2.3->tensorflow==2.4.0rc0) (1.3.0)
Requirement already satisfied: certifi>=2017.4.17 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard~=2.3->tensorflow==2.4.0rc0) (2020.6.20)
Requirement already satisfied: urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard~=2.3->tensorflow==2.4.0rc0) (1.24.3)
Requirement already satisfied: chardet<4,>=3.0.2 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard~=2.3->tensorflow==2.4.0rc0) (3.0.4)
Requirement already satisfied: idna<3,>=2.5 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard~=2.3->tensorflow==2.4.0rc0) (2.10)
Requirement already satisfied: cachetools<5.0,>=2.0.0 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard~=2.3->tensorflow==2.4.0rc0) (4.1.1)
Requirement already satisfied: rsa<5,>=3.1.4; python_version >= "3" in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard~=2.3->tensorflow==2.4.0rc0) (4.6)
Requirement already satisfied: pyasn1-modules>=0.2.1 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard~=2.3->tensorflow==2.4.0rc0) (0.2.8)
Requirement already satisfied: zipp>=0.5 in /usr/local/lib/python3.6/dist-packages (from importlib-metadata; python_version < "3.8"->markdown>=2.6.8->tensorboard~=2.3->tensorflow==2.4.0rc0) (3.4.0)
Requirement already satisfied: oauthlib>=3.0.0 in /usr/local/lib/python3.6/dist-packages (from requests-oauthlib>=0.7.0->google-auth-oauthlib<0.5,>=0.4.1->tensorboard~=2.3->tensorflow==2.4.0rc0) (3.1.0)
Requirement already satisfied: pyasn1>=0.1.3 in /usr/local/lib/python3.6/dist-packages (from rsa<5,>=3.1.4; python_version >= "3"->google-auth<2,>=1.6.3->tensorboard~=2.3->tensorflow==2.4.0rc0) (0.4.8)
Import Dependencies


# TensorFlow is an open source machine learning library
import tensorflow as tf

# Keras is TensorFlow's high-level API for deep learning
from tensorflow import keras
# Numpy is a math library
import numpy as np
# Pandas is a data manipulation library 
import pandas as pd
# Matplotlib is a graphing library
import matplotlib.pyplot as plt
# Math is Python's math library
import math

# Set seed for experiment reproducibility
seed = 1
np.random.seed(seed)
tf.random.set_seed(seed)
     
Dataset
1. Generate Data
The code in the following cell will generate a set of random x values, calculate their sine values, and display them on a graph.


# Number of sample datapoints
SAMPLES = 1000

# Generate a uniformly distributed set of random numbers in the range from
# 0 to 2π, which covers a complete sine wave oscillation
x_values = np.random.uniform(
    low=0, high=2*math.pi, size=SAMPLES).astype(np.float32)

# Shuffle the values to guarantee they're not in order
np.random.shuffle(x_values)

# Calculate the corresponding sine values
y_values = np.sin(x_values).astype(np.float32)

# Plot our data. The 'b.' argument tells the library to print blue dots.
plt.plot(x_values, y_values, 'b.')
plt.show()
     

2. Add Noise
Since it was generated directly by the sine function, our data fits a nice, smooth curve.

However, machine learning models are good at extracting underlying meaning from messy, real world data. To demonstrate this, we can add some noise to our data to approximate something more life-like.

In the following cell, we'll add some random noise to each value, then draw a new graph:


# Add a small random number to each y value
y_values += 0.1 * np.random.randn(*y_values.shape)

# Plot our data
plt.plot(x_values, y_values, 'b.')
plt.show()
     

3. Split the Data
We now have a noisy dataset that approximates real world data. We'll be using this to train our model.

To evaluate the accuracy of the model we train, we'll need to compare its predictions to real data and check how well they match up. This evaluation happens during training (where it is referred to as validation) and after training (referred to as testing) It's important in both cases that we use fresh data that was not already used to train the model.

The data is split as follows:

Training: 60%
Validation: 20%
Testing: 20%
The following code will split our data and then plots each set as a different color:


# We'll use 60% of our data for training and 20% for testing. The remaining 20%
# will be used for validation. Calculate the indices of each section.
TRAIN_SPLIT =  int(0.6 * SAMPLES)
TEST_SPLIT = int(0.2 * SAMPLES + TRAIN_SPLIT)

# Use np.split to chop our data into three parts.
# The second argument to np.split is an array of indices where the data will be
# split. We provide two indices, so the data will be divided into three chunks.
x_train, x_test, x_validate = np.split(x_values, [TRAIN_SPLIT, TEST_SPLIT])
y_train, y_test, y_validate = np.split(y_values, [TRAIN_SPLIT, TEST_SPLIT])

# Double check that our splits add up correctly
assert (x_train.size + x_validate.size + x_test.size) ==  SAMPLES

# Plot the data in each partition in different colors:
plt.plot(x_train, y_train, 'b.', label="Train")
plt.plot(x_test, y_test, 'r.', label="Test")
plt.plot(x_validate, y_validate, 'y.', label="Validate")
plt.legend()
plt.show()

     

Training
1. Design the Model
We're going to build a simple neural network model that will take an input value (in this case, x) and use it to predict a numeric output value (the sine of x). This type of problem is called a regression. It will use layers of neurons to attempt to learn any patterns underlying the training data, so it can make predictions.

To begin with, we'll define two layers. The first layer takes a single input (our x value) and runs it through 8 neurons. Based on this input, each neuron will become activated to a certain degree based on its internal state (its weight and bias values). A neuron's degree of activation is expressed as a number.

The activation numbers from our first layer will be fed as inputs to our second layer, which is a single neuron. It will apply its own weights and bias to these inputs and calculate its own activation, which will be output as our y value.

Note: To learn more about how neural networks function, you can explore the Learn TensorFlow codelabs.

The code in the following cell defines our model using Keras, TensorFlow's high-level API for creating deep learning networks. Once the network is defined, we compile it, specifying parameters that determine how it will be trained:


# We'll use Keras to create a simple model architecture
model_1 = tf.keras.Sequential()

# First layer takes a scalar input and feeds it through 8 "neurons". The
# neurons decide whether to activate based on the 'relu' activation function.
model_1.add(keras.layers.Dense(8, activation='relu', input_shape=(1,)))

# Final layer is a single neuron, since we want to output a single value
model_1.add(keras.layers.Dense(1))

# Compile the model using the standard 'adam' optimizer and the mean squared error or 'mse' loss function for regression.
model_1.compile(optimizer='adam', loss='mse', metrics=['mae'])
     
2. Train the Model
Once we've defined the model, we can use our data to train it. Training involves passing an x value into the neural network, checking how far the network's output deviates from the expected y value, and adjusting the neurons' weights and biases so that the output is more likely to be correct the next time.

Training runs this process on the full dataset multiple times, and each full run-through is known as an epoch. The number of epochs to run during training is a parameter we can set.

During each epoch, data is run through the network in multiple batches. Each batch, several pieces of data are passed into the network, producing output values. These outputs' correctness is measured in aggregate and the network's weights and biases are adjusted accordingly, once per batch. The batch size is also a parameter we can set.

The code in the following cell uses the x and y values from our training data to train the model. It runs for 500 epochs, with 64 pieces of data in each batch. We also pass in some data for validation. As you will see when you run the cell, training can take a while to complete:


# Train the model on our training data while validating on our validation set
history_1 = model_1.fit(x_train, y_train, epochs=500, batch_size=64,
                        validation_data=(x_validate, y_validate))
     
Epoch 1/500
10/10 [==============================] - 1s 47ms/step - loss: 0.7289 - mae: 0.7120 - val_loss: 0.6401 - val_mae: 0.6504
Epoch 2/500
10/10 [==============================] - 0s 6ms/step - loss: 0.6329 - mae: 0.6488 - val_loss: 0.5587 - val_mae: 0.6031
Epoch 3/500
10/10 [==============================] - 0s 6ms/step - loss: 0.5201 - mae: 0.5735 - val_loss: 0.5014 - val_mae: 0.5763
Epoch 4/500
10/10 [==============================] - 0s 6ms/step - loss: 0.5057 - mae: 0.5760 - val_loss: 0.4632 - val_mae: 0.5615
Epoch 5/500
10/10 [==============================] - 0s 5ms/step - loss: 0.4502 - mae: 0.5459 - val_loss: 0.4386 - val_mae: 0.5536
Epoch 6/500
10/10 [==============================] - 0s 6ms/step - loss: 0.4168 - mae: 0.5332 - val_loss: 0.4227 - val_mae: 0.5490
Epoch 7/500
10/10 [==============================] - 0s 6ms/step - loss: 0.4211 - mae: 0.5341 - val_loss: 0.4125 - val_mae: 0.5464
Epoch 8/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3988 - mae: 0.5287 - val_loss: 0.4060 - val_mae: 0.5452
Epoch 9/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3901 - mae: 0.5230 - val_loss: 0.4014 - val_mae: 0.5440
Epoch 10/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3804 - mae: 0.5179 - val_loss: 0.3979 - val_mae: 0.5426
Epoch 11/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3695 - mae: 0.5150 - val_loss: 0.3950 - val_mae: 0.5412
Epoch 12/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3856 - mae: 0.5245 - val_loss: 0.3921 - val_mae: 0.5399
Epoch 13/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3744 - mae: 0.5184 - val_loss: 0.3893 - val_mae: 0.5386
Epoch 14/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3749 - mae: 0.5175 - val_loss: 0.3865 - val_mae: 0.5371
Epoch 15/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3467 - mae: 0.4993 - val_loss: 0.3837 - val_mae: 0.5354
Epoch 16/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3736 - mae: 0.5234 - val_loss: 0.3808 - val_mae: 0.5336
Epoch 17/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3655 - mae: 0.5148 - val_loss: 0.3778 - val_mae: 0.5318
Epoch 18/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3558 - mae: 0.5067 - val_loss: 0.3747 - val_mae: 0.5297
Epoch 19/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3343 - mae: 0.4908 - val_loss: 0.3716 - val_mae: 0.5275
Epoch 20/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3742 - mae: 0.5257 - val_loss: 0.3686 - val_mae: 0.5258
Epoch 21/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3296 - mae: 0.4831 - val_loss: 0.3654 - val_mae: 0.5235
Epoch 22/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3432 - mae: 0.4962 - val_loss: 0.3622 - val_mae: 0.5214
Epoch 23/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3397 - mae: 0.4951 - val_loss: 0.3589 - val_mae: 0.5191
Epoch 24/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3229 - mae: 0.4803 - val_loss: 0.3558 - val_mae: 0.5172
Epoch 25/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3562 - mae: 0.5105 - val_loss: 0.3524 - val_mae: 0.5150
Epoch 26/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3458 - mae: 0.5042 - val_loss: 0.3492 - val_mae: 0.5128
Epoch 27/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3163 - mae: 0.4764 - val_loss: 0.3459 - val_mae: 0.5106
Epoch 28/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3441 - mae: 0.5018 - val_loss: 0.3427 - val_mae: 0.5086
Epoch 29/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3062 - mae: 0.4705 - val_loss: 0.3395 - val_mae: 0.5065
Epoch 30/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3202 - mae: 0.4808 - val_loss: 0.3362 - val_mae: 0.5043
Epoch 31/500
10/10 [==============================] - 0s 7ms/step - loss: 0.3313 - mae: 0.4919 - val_loss: 0.3330 - val_mae: 0.5022
Epoch 32/500
10/10 [==============================] - 0s 18ms/step - loss: 0.3028 - mae: 0.4682 - val_loss: 0.3297 - val_mae: 0.4996
Epoch 33/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3056 - mae: 0.4670 - val_loss: 0.3264 - val_mae: 0.4972
Epoch 34/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3203 - mae: 0.4781 - val_loss: 0.3233 - val_mae: 0.4954
Epoch 35/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3256 - mae: 0.4912 - val_loss: 0.3201 - val_mae: 0.4929
Epoch 36/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3079 - mae: 0.4728 - val_loss: 0.3170 - val_mae: 0.4905
Epoch 37/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2969 - mae: 0.4641 - val_loss: 0.3139 - val_mae: 0.4885
Epoch 38/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3043 - mae: 0.4693 - val_loss: 0.3108 - val_mae: 0.4863
Epoch 39/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2902 - mae: 0.4549 - val_loss: 0.3078 - val_mae: 0.4843
Epoch 40/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3003 - mae: 0.4720 - val_loss: 0.3047 - val_mae: 0.4823
Epoch 41/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2970 - mae: 0.4678 - val_loss: 0.3017 - val_mae: 0.4804
Epoch 42/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2903 - mae: 0.4582 - val_loss: 0.2988 - val_mae: 0.4787
Epoch 43/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2853 - mae: 0.4553 - val_loss: 0.2960 - val_mae: 0.4769
Epoch 44/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2910 - mae: 0.4603 - val_loss: 0.2931 - val_mae: 0.4748
Epoch 45/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2819 - mae: 0.4533 - val_loss: 0.2902 - val_mae: 0.4727
Epoch 46/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2744 - mae: 0.4525 - val_loss: 0.2872 - val_mae: 0.4697
Epoch 47/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2707 - mae: 0.4411 - val_loss: 0.2845 - val_mae: 0.4680
Epoch 48/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2641 - mae: 0.4414 - val_loss: 0.2818 - val_mae: 0.4661
Epoch 49/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2642 - mae: 0.4378 - val_loss: 0.2793 - val_mae: 0.4647
Epoch 50/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2603 - mae: 0.4385 - val_loss: 0.2767 - val_mae: 0.4628
Epoch 51/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2684 - mae: 0.4473 - val_loss: 0.2740 - val_mae: 0.4604
Epoch 52/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2539 - mae: 0.4312 - val_loss: 0.2714 - val_mae: 0.4583
Epoch 53/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2621 - mae: 0.4417 - val_loss: 0.2690 - val_mae: 0.4568
Epoch 54/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2556 - mae: 0.4366 - val_loss: 0.2664 - val_mae: 0.4545
Epoch 55/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2524 - mae: 0.4309 - val_loss: 0.2639 - val_mae: 0.4525
Epoch 56/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2555 - mae: 0.4364 - val_loss: 0.2614 - val_mae: 0.4507
Epoch 57/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2483 - mae: 0.4264 - val_loss: 0.2589 - val_mae: 0.4485
Epoch 58/500
10/10 [==============================] - 0s 7ms/step - loss: 0.2403 - mae: 0.4212 - val_loss: 0.2564 - val_mae: 0.4460
Epoch 59/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2462 - mae: 0.4274 - val_loss: 0.2542 - val_mae: 0.4446
Epoch 60/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2364 - mae: 0.4178 - val_loss: 0.2522 - val_mae: 0.4437
Epoch 61/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2409 - mae: 0.4254 - val_loss: 0.2500 - val_mae: 0.4418
Epoch 62/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2338 - mae: 0.4172 - val_loss: 0.2478 - val_mae: 0.4400
Epoch 63/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2283 - mae: 0.4132 - val_loss: 0.2456 - val_mae: 0.4381
Epoch 64/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2438 - mae: 0.4330 - val_loss: 0.2433 - val_mae: 0.4360
Epoch 65/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2169 - mae: 0.4049 - val_loss: 0.2415 - val_mae: 0.4348
Epoch 66/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2208 - mae: 0.4087 - val_loss: 0.2393 - val_mae: 0.4329
Epoch 67/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2440 - mae: 0.4321 - val_loss: 0.2373 - val_mae: 0.4312
Epoch 68/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2250 - mae: 0.4131 - val_loss: 0.2353 - val_mae: 0.4295
Epoch 69/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2222 - mae: 0.4081 - val_loss: 0.2334 - val_mae: 0.4277
Epoch 70/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2245 - mae: 0.4138 - val_loss: 0.2316 - val_mae: 0.4261
Epoch 71/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2132 - mae: 0.3983 - val_loss: 0.2298 - val_mae: 0.4244
Epoch 72/500
10/10 [==============================] - 0s 18ms/step - loss: 0.2232 - mae: 0.4144 - val_loss: 0.2280 - val_mae: 0.4227
Epoch 73/500
10/10 [==============================] - 0s 7ms/step - loss: 0.2077 - mae: 0.3941 - val_loss: 0.2265 - val_mae: 0.4219
Epoch 74/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2116 - mae: 0.3993 - val_loss: 0.2249 - val_mae: 0.4205
Epoch 75/500
10/10 [==============================] - 0s 7ms/step - loss: 0.2227 - mae: 0.4148 - val_loss: 0.2235 - val_mae: 0.4198
Epoch 76/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2026 - mae: 0.3917 - val_loss: 0.2216 - val_mae: 0.4175
Epoch 77/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2083 - mae: 0.3966 - val_loss: 0.2200 - val_mae: 0.4157
Epoch 78/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2055 - mae: 0.3947 - val_loss: 0.2186 - val_mae: 0.4144
Epoch 79/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2069 - mae: 0.3965 - val_loss: 0.2171 - val_mae: 0.4128
Epoch 80/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1983 - mae: 0.3871 - val_loss: 0.2158 - val_mae: 0.4117
Epoch 81/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1994 - mae: 0.3876 - val_loss: 0.2146 - val_mae: 0.4109
Epoch 82/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1971 - mae: 0.3824 - val_loss: 0.2135 - val_mae: 0.4104
Epoch 83/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1965 - mae: 0.3879 - val_loss: 0.2120 - val_mae: 0.4085
Epoch 84/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2006 - mae: 0.3906 - val_loss: 0.2109 - val_mae: 0.4074
Epoch 85/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2048 - mae: 0.3979 - val_loss: 0.2096 - val_mae: 0.4057
Epoch 86/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1932 - mae: 0.3864 - val_loss: 0.2083 - val_mae: 0.4042
Epoch 87/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1916 - mae: 0.3830 - val_loss: 0.2073 - val_mae: 0.4036
Epoch 88/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1984 - mae: 0.3905 - val_loss: 0.2062 - val_mae: 0.4023
Epoch 89/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1939 - mae: 0.3874 - val_loss: 0.2052 - val_mae: 0.4010
Epoch 90/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1902 - mae: 0.3827 - val_loss: 0.2042 - val_mae: 0.4001
Epoch 91/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1888 - mae: 0.3784 - val_loss: 0.2038 - val_mae: 0.4009
Epoch 92/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1927 - mae: 0.3843 - val_loss: 0.2030 - val_mae: 0.4003
Epoch 93/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1851 - mae: 0.3730 - val_loss: 0.2018 - val_mae: 0.3981
Epoch 94/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1984 - mae: 0.3916 - val_loss: 0.2008 - val_mae: 0.3963
Epoch 95/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1851 - mae: 0.3733 - val_loss: 0.2001 - val_mae: 0.3960
Epoch 96/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1881 - mae: 0.3796 - val_loss: 0.1994 - val_mae: 0.3953
Epoch 97/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1859 - mae: 0.3765 - val_loss: 0.1987 - val_mae: 0.3949
Epoch 98/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1822 - mae: 0.3711 - val_loss: 0.1979 - val_mae: 0.3935
Epoch 99/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1886 - mae: 0.3764 - val_loss: 0.1970 - val_mae: 0.3915
Epoch 100/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1878 - mae: 0.3758 - val_loss: 0.1964 - val_mae: 0.3908
Epoch 101/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1769 - mae: 0.3670 - val_loss: 0.1958 - val_mae: 0.3897
Epoch 102/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1832 - mae: 0.3731 - val_loss: 0.1953 - val_mae: 0.3897
Epoch 103/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1827 - mae: 0.3728 - val_loss: 0.1952 - val_mae: 0.3910
Epoch 104/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1867 - mae: 0.3783 - val_loss: 0.1945 - val_mae: 0.3898
Epoch 105/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1813 - mae: 0.3691 - val_loss: 0.1937 - val_mae: 0.3869
Epoch 106/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1715 - mae: 0.3605 - val_loss: 0.1932 - val_mae: 0.3869
Epoch 107/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1800 - mae: 0.3692 - val_loss: 0.1928 - val_mae: 0.3859
Epoch 108/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1884 - mae: 0.3725 - val_loss: 0.1925 - val_mae: 0.3863
Epoch 109/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1777 - mae: 0.3686 - val_loss: 0.1922 - val_mae: 0.3862
Epoch 110/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1801 - mae: 0.3715 - val_loss: 0.1917 - val_mae: 0.3853
Epoch 111/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1794 - mae: 0.3665 - val_loss: 0.1913 - val_mae: 0.3846
Epoch 112/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1811 - mae: 0.3664 - val_loss: 0.1908 - val_mae: 0.3831
Epoch 113/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1821 - mae: 0.3655 - val_loss: 0.1904 - val_mae: 0.3823
Epoch 114/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1755 - mae: 0.3621 - val_loss: 0.1901 - val_mae: 0.3818
Epoch 115/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1718 - mae: 0.3584 - val_loss: 0.1899 - val_mae: 0.3820
Epoch 116/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1684 - mae: 0.3516 - val_loss: 0.1896 - val_mae: 0.3815
Epoch 117/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1760 - mae: 0.3618 - val_loss: 0.1894 - val_mae: 0.3816
Epoch 118/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1748 - mae: 0.3587 - val_loss: 0.1890 - val_mae: 0.3804
Epoch 119/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1749 - mae: 0.3626 - val_loss: 0.1887 - val_mae: 0.3792
Epoch 120/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1620 - mae: 0.3493 - val_loss: 0.1884 - val_mae: 0.3779
Epoch 121/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1720 - mae: 0.3573 - val_loss: 0.1883 - val_mae: 0.3789
Epoch 122/500
10/10 [==============================] - 0s 18ms/step - loss: 0.1767 - mae: 0.3623 - val_loss: 0.1881 - val_mae: 0.3787
Epoch 123/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1835 - mae: 0.3729 - val_loss: 0.1881 - val_mae: 0.3794
Epoch 124/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1782 - mae: 0.3691 - val_loss: 0.1876 - val_mae: 0.3775
Epoch 125/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1669 - mae: 0.3548 - val_loss: 0.1877 - val_mae: 0.3784
Epoch 126/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1819 - mae: 0.3693 - val_loss: 0.1878 - val_mae: 0.3791
Epoch 127/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1731 - mae: 0.3626 - val_loss: 0.1877 - val_mae: 0.3789
Epoch 128/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1696 - mae: 0.3556 - val_loss: 0.1872 - val_mae: 0.3773
Epoch 129/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1764 - mae: 0.3649 - val_loss: 0.1869 - val_mae: 0.3758
Epoch 130/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1770 - mae: 0.3649 - val_loss: 0.1867 - val_mae: 0.3750
Epoch 131/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1857 - mae: 0.3696 - val_loss: 0.1867 - val_mae: 0.3760
Epoch 132/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1715 - mae: 0.3566 - val_loss: 0.1865 - val_mae: 0.3754
Epoch 133/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1717 - mae: 0.3536 - val_loss: 0.1869 - val_mae: 0.3772
Epoch 134/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1692 - mae: 0.3558 - val_loss: 0.1863 - val_mae: 0.3751
Epoch 135/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1844 - mae: 0.3690 - val_loss: 0.1862 - val_mae: 0.3744
Epoch 136/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1608 - mae: 0.3431 - val_loss: 0.1861 - val_mae: 0.3737
Epoch 137/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1626 - mae: 0.3457 - val_loss: 0.1860 - val_mae: 0.3739
Epoch 138/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1705 - mae: 0.3598 - val_loss: 0.1861 - val_mae: 0.3748
Epoch 139/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1797 - mae: 0.3651 - val_loss: 0.1863 - val_mae: 0.3759
Epoch 140/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1692 - mae: 0.3543 - val_loss: 0.1858 - val_mae: 0.3739
Epoch 141/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1696 - mae: 0.3572 - val_loss: 0.1859 - val_mae: 0.3743
Epoch 142/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1652 - mae: 0.3503 - val_loss: 0.1861 - val_mae: 0.3754
Epoch 143/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1644 - mae: 0.3504 - val_loss: 0.1857 - val_mae: 0.3734
Epoch 144/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1721 - mae: 0.3567 - val_loss: 0.1855 - val_mae: 0.3728
Epoch 145/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1772 - mae: 0.3612 - val_loss: 0.1856 - val_mae: 0.3737
Epoch 146/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1654 - mae: 0.3502 - val_loss: 0.1856 - val_mae: 0.3736
Epoch 147/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1761 - mae: 0.3575 - val_loss: 0.1856 - val_mae: 0.3738
Epoch 148/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1693 - mae: 0.3542 - val_loss: 0.1853 - val_mae: 0.3719
Epoch 149/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1634 - mae: 0.3450 - val_loss: 0.1854 - val_mae: 0.3727
Epoch 150/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1642 - mae: 0.3457 - val_loss: 0.1853 - val_mae: 0.3723
Epoch 151/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1868 - mae: 0.3703 - val_loss: 0.1854 - val_mae: 0.3731
Epoch 152/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1797 - mae: 0.3615 - val_loss: 0.1852 - val_mae: 0.3716
Epoch 153/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1739 - mae: 0.3548 - val_loss: 0.1851 - val_mae: 0.3716
Epoch 154/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1779 - mae: 0.3633 - val_loss: 0.1851 - val_mae: 0.3711
Epoch 155/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1606 - mae: 0.3401 - val_loss: 0.1850 - val_mae: 0.3709
Epoch 156/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1834 - mae: 0.3646 - val_loss: 0.1853 - val_mae: 0.3728
Epoch 157/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1704 - mae: 0.3552 - val_loss: 0.1850 - val_mae: 0.3712
Epoch 158/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1741 - mae: 0.3575 - val_loss: 0.1850 - val_mae: 0.3714
Epoch 159/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1624 - mae: 0.3450 - val_loss: 0.1849 - val_mae: 0.3705
Epoch 160/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1691 - mae: 0.3547 - val_loss: 0.1850 - val_mae: 0.3712
Epoch 161/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1604 - mae: 0.3414 - val_loss: 0.1849 - val_mae: 0.3703
Epoch 162/500
10/10 [==============================] - 0s 18ms/step - loss: 0.1600 - mae: 0.3412 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 163/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1564 - mae: 0.3413 - val_loss: 0.1848 - val_mae: 0.3694
Epoch 164/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1664 - mae: 0.3461 - val_loss: 0.1851 - val_mae: 0.3719
Epoch 165/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1672 - mae: 0.3500 - val_loss: 0.1848 - val_mae: 0.3698
Epoch 166/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1717 - mae: 0.3600 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 167/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1645 - mae: 0.3450 - val_loss: 0.1849 - val_mae: 0.3707
Epoch 168/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1697 - mae: 0.3467 - val_loss: 0.1853 - val_mae: 0.3724
Epoch 169/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1742 - mae: 0.3566 - val_loss: 0.1850 - val_mae: 0.3712
Epoch 170/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1650 - mae: 0.3455 - val_loss: 0.1847 - val_mae: 0.3693
Epoch 171/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1667 - mae: 0.3511 - val_loss: 0.1847 - val_mae: 0.3693
Epoch 172/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1689 - mae: 0.3476 - val_loss: 0.1849 - val_mae: 0.3710
Epoch 173/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1709 - mae: 0.3538 - val_loss: 0.1848 - val_mae: 0.3706
Epoch 174/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1794 - mae: 0.3588 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 175/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1753 - mae: 0.3539 - val_loss: 0.1846 - val_mae: 0.3680
Epoch 176/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1704 - mae: 0.3511 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 177/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1635 - mae: 0.3465 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 178/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1669 - mae: 0.3508 - val_loss: 0.1850 - val_mae: 0.3712
Epoch 179/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1661 - mae: 0.3434 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 180/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1668 - mae: 0.3500 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 181/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1600 - mae: 0.3416 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 182/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1672 - mae: 0.3500 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 183/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1663 - mae: 0.3461 - val_loss: 0.1847 - val_mae: 0.3698
Epoch 184/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1690 - mae: 0.3494 - val_loss: 0.1847 - val_mae: 0.3695
Epoch 185/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1716 - mae: 0.3513 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 186/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1748 - mae: 0.3588 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 187/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1588 - mae: 0.3364 - val_loss: 0.1849 - val_mae: 0.3705
Epoch 188/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1739 - mae: 0.3539 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 189/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1711 - mae: 0.3497 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 190/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1706 - mae: 0.3525 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 191/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1621 - mae: 0.3447 - val_loss: 0.1846 - val_mae: 0.3688
Epoch 192/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1669 - mae: 0.3485 - val_loss: 0.1847 - val_mae: 0.3699
Epoch 193/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1694 - mae: 0.3498 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 194/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1708 - mae: 0.3520 - val_loss: 0.1846 - val_mae: 0.3694
Epoch 195/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1796 - mae: 0.3623 - val_loss: 0.1849 - val_mae: 0.3708
Epoch 196/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1624 - mae: 0.3417 - val_loss: 0.1849 - val_mae: 0.3706
Epoch 197/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1671 - mae: 0.3529 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 198/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1680 - mae: 0.3479 - val_loss: 0.1845 - val_mae: 0.3690
Epoch 199/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1750 - mae: 0.3587 - val_loss: 0.1844 - val_mae: 0.3677
Epoch 200/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1613 - mae: 0.3419 - val_loss: 0.1845 - val_mae: 0.3684
Epoch 201/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1625 - mae: 0.3434 - val_loss: 0.1845 - val_mae: 0.3684
Epoch 202/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1780 - mae: 0.3576 - val_loss: 0.1845 - val_mae: 0.3688
Epoch 203/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1567 - mae: 0.3381 - val_loss: 0.1845 - val_mae: 0.3677
Epoch 204/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1675 - mae: 0.3489 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 205/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1766 - mae: 0.3609 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 206/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1649 - mae: 0.3489 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 207/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1723 - mae: 0.3526 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 208/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1788 - mae: 0.3573 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 209/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1659 - mae: 0.3427 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 210/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1737 - mae: 0.3549 - val_loss: 0.1845 - val_mae: 0.3684
Epoch 211/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1616 - mae: 0.3437 - val_loss: 0.1845 - val_mae: 0.3686
Epoch 212/500
10/10 [==============================] - 0s 18ms/step - loss: 0.1665 - mae: 0.3466 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 213/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1726 - mae: 0.3560 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 214/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1716 - mae: 0.3516 - val_loss: 0.1844 - val_mae: 0.3673
Epoch 215/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1662 - mae: 0.3398 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 216/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1773 - mae: 0.3588 - val_loss: 0.1845 - val_mae: 0.3686
Epoch 217/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1645 - mae: 0.3485 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 218/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1664 - mae: 0.3514 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 219/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1775 - mae: 0.3572 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 220/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1650 - mae: 0.3451 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 221/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1607 - mae: 0.3393 - val_loss: 0.1845 - val_mae: 0.3686
Epoch 222/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1796 - mae: 0.3623 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 223/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1759 - mae: 0.3592 - val_loss: 0.1845 - val_mae: 0.3682
Epoch 224/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1702 - mae: 0.3513 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 225/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1823 - mae: 0.3648 - val_loss: 0.1852 - val_mae: 0.3715
Epoch 226/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1698 - mae: 0.3515 - val_loss: 0.1848 - val_mae: 0.3701
Epoch 227/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1658 - mae: 0.3447 - val_loss: 0.1847 - val_mae: 0.3699
Epoch 228/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1756 - mae: 0.3553 - val_loss: 0.1846 - val_mae: 0.3694
Epoch 229/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1670 - mae: 0.3549 - val_loss: 0.1844 - val_mae: 0.3671
Epoch 230/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1685 - mae: 0.3480 - val_loss: 0.1845 - val_mae: 0.3682
Epoch 231/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1740 - mae: 0.3578 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 232/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1774 - mae: 0.3602 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 233/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1566 - mae: 0.3383 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 234/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1714 - mae: 0.3518 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 235/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1650 - mae: 0.3435 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 236/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1721 - mae: 0.3513 - val_loss: 0.1846 - val_mae: 0.3694
Epoch 237/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1710 - mae: 0.3535 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 238/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1638 - mae: 0.3453 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 239/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1687 - mae: 0.3518 - val_loss: 0.1845 - val_mae: 0.3687
Epoch 240/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1701 - mae: 0.3519 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 241/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1721 - mae: 0.3530 - val_loss: 0.1849 - val_mae: 0.3703
Epoch 242/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1610 - mae: 0.3413 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 243/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1556 - mae: 0.3387 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 244/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1663 - mae: 0.3485 - val_loss: 0.1845 - val_mae: 0.3688
Epoch 245/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1761 - mae: 0.3585 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 246/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1592 - mae: 0.3394 - val_loss: 0.1849 - val_mae: 0.3706
Epoch 247/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1724 - mae: 0.3568 - val_loss: 0.1845 - val_mae: 0.3682
Epoch 248/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1668 - mae: 0.3516 - val_loss: 0.1844 - val_mae: 0.3671
Epoch 249/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1676 - mae: 0.3474 - val_loss: 0.1845 - val_mae: 0.3688
Epoch 250/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1747 - mae: 0.3563 - val_loss: 0.1844 - val_mae: 0.3680
Epoch 251/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1766 - mae: 0.3607 - val_loss: 0.1844 - val_mae: 0.3676
Epoch 252/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1693 - mae: 0.3522 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 253/500
10/10 [==============================] - 0s 19ms/step - loss: 0.1632 - mae: 0.3429 - val_loss: 0.1844 - val_mae: 0.3675
Epoch 254/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1747 - mae: 0.3537 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 255/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1731 - mae: 0.3574 - val_loss: 0.1847 - val_mae: 0.3695
Epoch 256/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1696 - mae: 0.3525 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 257/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1572 - mae: 0.3387 - val_loss: 0.1845 - val_mae: 0.3681
Epoch 258/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1617 - mae: 0.3409 - val_loss: 0.1849 - val_mae: 0.3702
Epoch 259/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1809 - mae: 0.3600 - val_loss: 0.1850 - val_mae: 0.3707
Epoch 260/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1633 - mae: 0.3435 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 261/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1684 - mae: 0.3506 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 262/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1710 - mae: 0.3512 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 263/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1657 - mae: 0.3471 - val_loss: 0.1850 - val_mae: 0.3709
Epoch 264/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1764 - mae: 0.3611 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 265/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1710 - mae: 0.3487 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 266/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1759 - mae: 0.3565 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 267/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1680 - mae: 0.3505 - val_loss: 0.1844 - val_mae: 0.3669
Epoch 268/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1764 - mae: 0.3597 - val_loss: 0.1844 - val_mae: 0.3671
Epoch 269/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1676 - mae: 0.3494 - val_loss: 0.1847 - val_mae: 0.3693
Epoch 270/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1641 - mae: 0.3478 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 271/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1784 - mae: 0.3615 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 272/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1767 - mae: 0.3571 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 273/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1714 - mae: 0.3521 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 274/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1710 - mae: 0.3503 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 275/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1729 - mae: 0.3507 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 276/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1754 - mae: 0.3579 - val_loss: 0.1845 - val_mae: 0.3677
Epoch 277/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1705 - mae: 0.3504 - val_loss: 0.1845 - val_mae: 0.3672
Epoch 278/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1721 - mae: 0.3553 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 279/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1664 - mae: 0.3476 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 280/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1655 - mae: 0.3467 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 281/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1693 - mae: 0.3534 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 282/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1732 - mae: 0.3580 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 283/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1779 - mae: 0.3598 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 284/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1763 - mae: 0.3570 - val_loss: 0.1849 - val_mae: 0.3705
Epoch 285/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1636 - mae: 0.3474 - val_loss: 0.1845 - val_mae: 0.3674
Epoch 286/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1716 - mae: 0.3496 - val_loss: 0.1845 - val_mae: 0.3680
Epoch 287/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1769 - mae: 0.3579 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 288/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1771 - mae: 0.3565 - val_loss: 0.1856 - val_mae: 0.3726
Epoch 289/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1709 - mae: 0.3516 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 290/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1719 - mae: 0.3584 - val_loss: 0.1844 - val_mae: 0.3675
Epoch 291/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1730 - mae: 0.3544 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 292/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1751 - mae: 0.3558 - val_loss: 0.1846 - val_mae: 0.3694
Epoch 293/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1658 - mae: 0.3511 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 294/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1713 - mae: 0.3536 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 295/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1725 - mae: 0.3565 - val_loss: 0.1844 - val_mae: 0.3678
Epoch 296/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1724 - mae: 0.3513 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 297/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1680 - mae: 0.3520 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 298/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1734 - mae: 0.3523 - val_loss: 0.1848 - val_mae: 0.3704
Epoch 299/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1756 - mae: 0.3561 - val_loss: 0.1846 - val_mae: 0.3695
Epoch 300/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1650 - mae: 0.3467 - val_loss: 0.1844 - val_mae: 0.3675
Epoch 301/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1690 - mae: 0.3495 - val_loss: 0.1844 - val_mae: 0.3669
Epoch 302/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1642 - mae: 0.3458 - val_loss: 0.1846 - val_mae: 0.3655
Epoch 303/500
10/10 [==============================] - 0s 19ms/step - loss: 0.1732 - mae: 0.3490 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 304/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1686 - mae: 0.3514 - val_loss: 0.1847 - val_mae: 0.3698
Epoch 305/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1757 - mae: 0.3568 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 306/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1650 - mae: 0.3475 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 307/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1544 - mae: 0.3364 - val_loss: 0.1845 - val_mae: 0.3673
Epoch 308/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1714 - mae: 0.3512 - val_loss: 0.1849 - val_mae: 0.3703
Epoch 309/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1729 - mae: 0.3549 - val_loss: 0.1853 - val_mae: 0.3718
Epoch 310/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1677 - mae: 0.3540 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 311/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1731 - mae: 0.3513 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 312/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1717 - mae: 0.3521 - val_loss: 0.1845 - val_mae: 0.3687
Epoch 313/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1656 - mae: 0.3425 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 314/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1632 - mae: 0.3439 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 315/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1694 - mae: 0.3512 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 316/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1679 - mae: 0.3496 - val_loss: 0.1851 - val_mae: 0.3712
Epoch 317/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1754 - mae: 0.3533 - val_loss: 0.1851 - val_mae: 0.3712
Epoch 318/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1757 - mae: 0.3582 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 319/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1705 - mae: 0.3522 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 320/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1539 - mae: 0.3368 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 321/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1691 - mae: 0.3523 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 322/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1695 - mae: 0.3494 - val_loss: 0.1854 - val_mae: 0.3720
Epoch 323/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1648 - mae: 0.3469 - val_loss: 0.1845 - val_mae: 0.3680
Epoch 324/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1781 - mae: 0.3610 - val_loss: 0.1845 - val_mae: 0.3684
Epoch 325/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1565 - mae: 0.3364 - val_loss: 0.1850 - val_mae: 0.3707
Epoch 326/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1680 - mae: 0.3496 - val_loss: 0.1849 - val_mae: 0.3706
Epoch 327/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1680 - mae: 0.3463 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 328/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1699 - mae: 0.3538 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 329/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1782 - mae: 0.3604 - val_loss: 0.1848 - val_mae: 0.3704
Epoch 330/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1746 - mae: 0.3527 - val_loss: 0.1848 - val_mae: 0.3704
Epoch 331/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1695 - mae: 0.3496 - val_loss: 0.1846 - val_mae: 0.3695
Epoch 332/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1635 - mae: 0.3445 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 333/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1611 - mae: 0.3453 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 334/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1595 - mae: 0.3416 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 335/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1733 - mae: 0.3562 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 336/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1668 - mae: 0.3458 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 337/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1678 - mae: 0.3455 - val_loss: 0.1846 - val_mae: 0.3685
Epoch 338/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1768 - mae: 0.3578 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 339/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1674 - mae: 0.3485 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 340/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1736 - mae: 0.3536 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 341/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1655 - mae: 0.3474 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 342/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1727 - mae: 0.3539 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 343/500
10/10 [==============================] - 0s 19ms/step - loss: 0.1721 - mae: 0.3489 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 344/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1620 - mae: 0.3464 - val_loss: 0.1845 - val_mae: 0.3675
Epoch 345/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1757 - mae: 0.3548 - val_loss: 0.1845 - val_mae: 0.3681
Epoch 346/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1753 - mae: 0.3576 - val_loss: 0.1846 - val_mae: 0.3685
Epoch 347/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1698 - mae: 0.3471 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 348/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1793 - mae: 0.3578 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 349/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1677 - mae: 0.3506 - val_loss: 0.1846 - val_mae: 0.3683
Epoch 350/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1683 - mae: 0.3502 - val_loss: 0.1847 - val_mae: 0.3686
Epoch 351/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1813 - mae: 0.3624 - val_loss: 0.1846 - val_mae: 0.3678
Epoch 352/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1656 - mae: 0.3440 - val_loss: 0.1846 - val_mae: 0.3674
Epoch 353/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1705 - mae: 0.3515 - val_loss: 0.1848 - val_mae: 0.3692
Epoch 354/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1786 - mae: 0.3562 - val_loss: 0.1850 - val_mae: 0.3703
Epoch 355/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1719 - mae: 0.3518 - val_loss: 0.1847 - val_mae: 0.3683
Epoch 356/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1698 - mae: 0.3528 - val_loss: 0.1846 - val_mae: 0.3679
Epoch 357/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1682 - mae: 0.3499 - val_loss: 0.1846 - val_mae: 0.3678
Epoch 358/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1627 - mae: 0.3442 - val_loss: 0.1848 - val_mae: 0.3694
Epoch 359/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1634 - mae: 0.3428 - val_loss: 0.1855 - val_mae: 0.3718
Epoch 360/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1671 - mae: 0.3486 - val_loss: 0.1848 - val_mae: 0.3694
Epoch 361/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1748 - mae: 0.3609 - val_loss: 0.1846 - val_mae: 0.3681
Epoch 362/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1655 - mae: 0.3470 - val_loss: 0.1846 - val_mae: 0.3673
Epoch 363/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1610 - mae: 0.3395 - val_loss: 0.1848 - val_mae: 0.3693
Epoch 364/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1713 - mae: 0.3539 - val_loss: 0.1847 - val_mae: 0.3688
Epoch 365/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1664 - mae: 0.3484 - val_loss: 0.1847 - val_mae: 0.3691
Epoch 366/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1554 - mae: 0.3350 - val_loss: 0.1847 - val_mae: 0.3691
Epoch 367/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1701 - mae: 0.3511 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 368/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1720 - mae: 0.3546 - val_loss: 0.1847 - val_mae: 0.3691
Epoch 369/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1675 - mae: 0.3495 - val_loss: 0.1847 - val_mae: 0.3695
Epoch 370/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1645 - mae: 0.3449 - val_loss: 0.1846 - val_mae: 0.3684
Epoch 371/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1790 - mae: 0.3588 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 372/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1662 - mae: 0.3466 - val_loss: 0.1847 - val_mae: 0.3689
Epoch 373/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1693 - mae: 0.3557 - val_loss: 0.1850 - val_mae: 0.3707
Epoch 374/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1682 - mae: 0.3493 - val_loss: 0.1851 - val_mae: 0.3711
Epoch 375/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1777 - mae: 0.3612 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 376/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1682 - mae: 0.3517 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 377/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1623 - mae: 0.3432 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 378/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1790 - mae: 0.3576 - val_loss: 0.1850 - val_mae: 0.3709
Epoch 379/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1795 - mae: 0.3594 - val_loss: 0.1846 - val_mae: 0.3685
Epoch 380/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1635 - mae: 0.3440 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 381/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1727 - mae: 0.3509 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 382/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1671 - mae: 0.3511 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 383/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1748 - mae: 0.3557 - val_loss: 0.1848 - val_mae: 0.3701
Epoch 384/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1745 - mae: 0.3581 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 385/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1728 - mae: 0.3566 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 386/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1679 - mae: 0.3499 - val_loss: 0.1847 - val_mae: 0.3696
Epoch 387/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1647 - mae: 0.3420 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 388/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1685 - mae: 0.3485 - val_loss: 0.1846 - val_mae: 0.3684
Epoch 389/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1622 - mae: 0.3443 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 390/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1656 - mae: 0.3495 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 391/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1680 - mae: 0.3484 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 392/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1779 - mae: 0.3601 - val_loss: 0.1846 - val_mae: 0.3688
Epoch 393/500
10/10 [==============================] - 0s 19ms/step - loss: 0.1667 - mae: 0.3450 - val_loss: 0.1847 - val_mae: 0.3695
Epoch 394/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1668 - mae: 0.3466 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 395/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1751 - mae: 0.3564 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 396/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1742 - mae: 0.3558 - val_loss: 0.1845 - val_mae: 0.3686
Epoch 397/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1800 - mae: 0.3653 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 398/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1663 - mae: 0.3425 - val_loss: 0.1845 - val_mae: 0.3678
Epoch 399/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1731 - mae: 0.3566 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 400/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1656 - mae: 0.3431 - val_loss: 0.1846 - val_mae: 0.3691
Epoch 401/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1603 - mae: 0.3438 - val_loss: 0.1846 - val_mae: 0.3688
Epoch 402/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1670 - mae: 0.3487 - val_loss: 0.1848 - val_mae: 0.3701
Epoch 403/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1762 - mae: 0.3544 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 404/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1714 - mae: 0.3497 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 405/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1652 - mae: 0.3454 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 406/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1663 - mae: 0.3471 - val_loss: 0.1851 - val_mae: 0.3710
Epoch 407/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1604 - mae: 0.3435 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 408/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1710 - mae: 0.3495 - val_loss: 0.1845 - val_mae: 0.3671
Epoch 409/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1716 - mae: 0.3498 - val_loss: 0.1846 - val_mae: 0.3689
Epoch 410/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1906 - mae: 0.3736 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 411/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1804 - mae: 0.3610 - val_loss: 0.1848 - val_mae: 0.3703
Epoch 412/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1685 - mae: 0.3505 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 413/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1598 - mae: 0.3406 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 414/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1619 - mae: 0.3453 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 415/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1786 - mae: 0.3603 - val_loss: 0.1849 - val_mae: 0.3704
Epoch 416/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1803 - mae: 0.3594 - val_loss: 0.1847 - val_mae: 0.3698
Epoch 417/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1714 - mae: 0.3564 - val_loss: 0.1845 - val_mae: 0.3681
Epoch 418/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1673 - mae: 0.3479 - val_loss: 0.1845 - val_mae: 0.3674
Epoch 419/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1648 - mae: 0.3469 - val_loss: 0.1847 - val_mae: 0.3695
Epoch 420/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1642 - mae: 0.3439 - val_loss: 0.1847 - val_mae: 0.3698
Epoch 421/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1738 - mae: 0.3554 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 422/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1662 - mae: 0.3466 - val_loss: 0.1845 - val_mae: 0.3681
Epoch 423/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1678 - mae: 0.3476 - val_loss: 0.1845 - val_mae: 0.3686
Epoch 424/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1762 - mae: 0.3599 - val_loss: 0.1845 - val_mae: 0.3684
Epoch 425/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1688 - mae: 0.3467 - val_loss: 0.1846 - val_mae: 0.3693
Epoch 426/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1708 - mae: 0.3483 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 427/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1641 - mae: 0.3435 - val_loss: 0.1845 - val_mae: 0.3680
Epoch 428/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1683 - mae: 0.3438 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 429/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1659 - mae: 0.3468 - val_loss: 0.1845 - val_mae: 0.3667
Epoch 430/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1630 - mae: 0.3462 - val_loss: 0.1845 - val_mae: 0.3670
Epoch 431/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1713 - mae: 0.3480 - val_loss: 0.1849 - val_mae: 0.3703
Epoch 432/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1818 - mae: 0.3676 - val_loss: 0.1851 - val_mae: 0.3712
Epoch 433/500
10/10 [==============================] - 0s 19ms/step - loss: 0.1833 - mae: 0.3606 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 434/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1676 - mae: 0.3489 - val_loss: 0.1845 - val_mae: 0.3669
Epoch 435/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1651 - mae: 0.3451 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 436/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1736 - mae: 0.3534 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 437/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1700 - mae: 0.3531 - val_loss: 0.1847 - val_mae: 0.3697
Epoch 438/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1799 - mae: 0.3615 - val_loss: 0.1845 - val_mae: 0.3685
Epoch 439/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1684 - mae: 0.3535 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 440/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1644 - mae: 0.3445 - val_loss: 0.1848 - val_mae: 0.3699
Epoch 441/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1702 - mae: 0.3541 - val_loss: 0.1845 - val_mae: 0.3682
Epoch 442/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1621 - mae: 0.3424 - val_loss: 0.1845 - val_mae: 0.3666
Epoch 443/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1757 - mae: 0.3551 - val_loss: 0.1845 - val_mae: 0.3670
Epoch 444/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1639 - mae: 0.3403 - val_loss: 0.1845 - val_mae: 0.3682
Epoch 445/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1739 - mae: 0.3512 - val_loss: 0.1848 - val_mae: 0.3695
Epoch 446/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1712 - mae: 0.3530 - val_loss: 0.1848 - val_mae: 0.3700
Epoch 447/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1630 - mae: 0.3460 - val_loss: 0.1848 - val_mae: 0.3698
Epoch 448/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1670 - mae: 0.3458 - val_loss: 0.1846 - val_mae: 0.3687
Epoch 449/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1576 - mae: 0.3345 - val_loss: 0.1846 - val_mae: 0.3685
Epoch 450/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1603 - mae: 0.3429 - val_loss: 0.1847 - val_mae: 0.3694
Epoch 451/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1689 - mae: 0.3507 - val_loss: 0.1848 - val_mae: 0.3697
Epoch 452/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1692 - mae: 0.3490 - val_loss: 0.1848 - val_mae: 0.3699
Epoch 453/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1685 - mae: 0.3514 - val_loss: 0.1845 - val_mae: 0.3679
Epoch 454/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1774 - mae: 0.3588 - val_loss: 0.1846 - val_mae: 0.3692
Epoch 455/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1672 - mae: 0.3472 - val_loss: 0.1846 - val_mae: 0.3690
Epoch 456/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1731 - mae: 0.3566 - val_loss: 0.1846 - val_mae: 0.3688
Epoch 457/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1658 - mae: 0.3454 - val_loss: 0.1847 - val_mae: 0.3693
Epoch 458/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1702 - mae: 0.3520 - val_loss: 0.1845 - val_mae: 0.3683
Epoch 459/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1739 - mae: 0.3532 - val_loss: 0.1846 - val_mae: 0.3684
Epoch 460/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1699 - mae: 0.3490 - val_loss: 0.1846 - val_mae: 0.3688
Epoch 461/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1703 - mae: 0.3547 - val_loss: 0.1845 - val_mae: 0.3671
Epoch 462/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1694 - mae: 0.3505 - val_loss: 0.1846 - val_mae: 0.3682
Epoch 463/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1728 - mae: 0.3542 - val_loss: 0.1848 - val_mae: 0.3698
Epoch 464/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1638 - mae: 0.3433 - val_loss: 0.1847 - val_mae: 0.3691
Epoch 465/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1648 - mae: 0.3382 - val_loss: 0.1845 - val_mae: 0.3676
Epoch 466/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1713 - mae: 0.3515 - val_loss: 0.1845 - val_mae: 0.3670
Epoch 467/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1660 - mae: 0.3467 - val_loss: 0.1846 - val_mae: 0.3684
Epoch 468/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1815 - mae: 0.3630 - val_loss: 0.1852 - val_mae: 0.3714
Epoch 469/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1685 - mae: 0.3455 - val_loss: 0.1852 - val_mae: 0.3712
Epoch 470/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1791 - mae: 0.3612 - val_loss: 0.1846 - val_mae: 0.3686
Epoch 471/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1707 - mae: 0.3523 - val_loss: 0.1846 - val_mae: 0.3685
Epoch 472/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1703 - mae: 0.3525 - val_loss: 0.1846 - val_mae: 0.3683
Epoch 473/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1608 - mae: 0.3447 - val_loss: 0.1846 - val_mae: 0.3671
Epoch 474/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1675 - mae: 0.3465 - val_loss: 0.1848 - val_mae: 0.3693
Epoch 475/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1689 - mae: 0.3513 - val_loss: 0.1846 - val_mae: 0.3683
Epoch 476/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1632 - mae: 0.3431 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 477/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1642 - mae: 0.3464 - val_loss: 0.1846 - val_mae: 0.3674
Epoch 478/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1734 - mae: 0.3511 - val_loss: 0.1851 - val_mae: 0.3707
Epoch 479/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1803 - mae: 0.3612 - val_loss: 0.1847 - val_mae: 0.3687
Epoch 480/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1679 - mae: 0.3531 - val_loss: 0.1846 - val_mae: 0.3677
Epoch 481/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1597 - mae: 0.3406 - val_loss: 0.1846 - val_mae: 0.3677
Epoch 482/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1761 - mae: 0.3575 - val_loss: 0.1850 - val_mae: 0.3701
Epoch 483/500
10/10 [==============================] - 0s 20ms/step - loss: 0.1707 - mae: 0.3541 - val_loss: 0.1847 - val_mae: 0.3692
Epoch 484/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1746 - mae: 0.3534 - val_loss: 0.1847 - val_mae: 0.3686
Epoch 485/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1644 - mae: 0.3457 - val_loss: 0.1846 - val_mae: 0.3675
Epoch 486/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1724 - mae: 0.3497 - val_loss: 0.1849 - val_mae: 0.3699
Epoch 487/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1743 - mae: 0.3552 - val_loss: 0.1849 - val_mae: 0.3699
Epoch 488/500
10/10 [==============================] - 0s 8ms/step - loss: 0.1662 - mae: 0.3468 - val_loss: 0.1846 - val_mae: 0.3678
Epoch 489/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1742 - mae: 0.3513 - val_loss: 0.1847 - val_mae: 0.3686
Epoch 490/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1695 - mae: 0.3481 - val_loss: 0.1846 - val_mae: 0.3674
Epoch 491/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1736 - mae: 0.3521 - val_loss: 0.1847 - val_mae: 0.3689
Epoch 492/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1554 - mae: 0.3364 - val_loss: 0.1846 - val_mae: 0.3664
Epoch 493/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1760 - mae: 0.3597 - val_loss: 0.1847 - val_mae: 0.3685
Epoch 494/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1666 - mae: 0.3457 - val_loss: 0.1849 - val_mae: 0.3697
Epoch 495/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1673 - mae: 0.3484 - val_loss: 0.1848 - val_mae: 0.3695
Epoch 496/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1754 - mae: 0.3581 - val_loss: 0.1848 - val_mae: 0.3695
Epoch 497/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1729 - mae: 0.3563 - val_loss: 0.1847 - val_mae: 0.3687
Epoch 498/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1727 - mae: 0.3584 - val_loss: 0.1847 - val_mae: 0.3688
Epoch 499/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1713 - mae: 0.3522 - val_loss: 0.1847 - val_mae: 0.3685
Epoch 500/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1634 - mae: 0.3428 - val_loss: 0.1846 - val_mae: 0.3680
3. Plot Metrics
1. Loss (or Mean Squared Error)

During training, the model's performance is constantly being measured against both our training data and the validation data that we set aside earlier. Training produces a log of data that tells us how the model's performance changed over the course of the training process.

The following cells will display some of that data in a graphical form:


# Draw a graph of the loss, which is the distance between
# the predicted and actual values during training and validation.
train_loss = history_1.history['loss']
val_loss = history_1.history['val_loss']

epochs = range(1, len(train_loss) + 1)

plt.plot(epochs, train_loss, 'g.', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
     

The graph shows the loss (or the difference between the model's predictions and the actual data) for each epoch. There are several ways to calculate loss, and the method we have used is mean squared error. There is a distinct loss value given for the training and the validation data.

As we can see, the amount of loss rapidly decreases over the first 25 epochs, before flattening out. This means that the model is improving and producing more accurate predictions!

Our goal is to stop training when either the model is no longer improving, or when the training loss is less than the validation loss, which would mean that the model has learned to predict the training data so well that it can no longer generalize to new data.

To make the flatter part of the graph more readable, let's skip the first 50 epochs:


# Exclude the first few epochs so the graph is easier to read
SKIP = 50

plt.plot(epochs[SKIP:], train_loss[SKIP:], 'g.', label='Training loss')
plt.plot(epochs[SKIP:], val_loss[SKIP:], 'b.', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
     

From the plot, we can see that loss continues to reduce until around 200 epochs, at which point it is mostly stable. This means that there's no need to train our network beyond 200 epochs.

However, we can also see that the lowest loss value is still around 0.155. This means that our network's predictions are off by an average of ~15%. In addition, the validation loss values jump around a lot, and is sometimes even higher.

2. Mean Absolute Error

To gain more insight into our model's performance we can plot some more data. This time, we'll plot the mean absolute error, which is another way of measuring how far the network's predictions are from the actual numbers:


plt.clf()

# Draw a graph of mean absolute error, which is another way of
# measuring the amount of error in the prediction.
train_mae = history_1.history['mae']
val_mae = history_1.history['val_mae']

plt.plot(epochs[SKIP:], train_mae[SKIP:], 'g.', label='Training MAE')
plt.plot(epochs[SKIP:], val_mae[SKIP:], 'b.', label='Validation MAE')
plt.title('Training and validation mean absolute error')
plt.xlabel('Epochs')
plt.ylabel('MAE')
plt.legend()
plt.show()
     

This graph of mean absolute error tells another story. We can see that training data shows consistently lower error than validation data, which means that the network may have overfit, or learned the training data so rigidly that it can't make effective predictions about new data.

In addition, the mean absolute error values are quite high, ~0.305 at best, which means some of the model's predictions are at least 30% off. A 30% error means we are very far from accurately modelling the sine wave function.

3. Actual vs Predicted Outputs

To get more insight into what is happening, let's check its predictions against the test dataset we set aside earlier:


# Calculate and print the loss on our test dataset
test_loss, test_mae = model_1.evaluate(x_test, y_test)

# Make predictions based on our test dataset
y_test_pred = model_1.predict(x_test)

# Graph the predictions against the actual values
plt.clf()
plt.title('Comparison of predictions and actual values')
plt.plot(x_test, y_test, 'b.', label='Actual values')
plt.plot(x_test, y_test_pred, 'r.', label='TF predictions')
plt.legend()
plt.show()
     
7/7 [==============================] - 0s 2ms/step - loss: 0.1627 - mae: 0.3434

Oh dear! The graph makes it clear that our network has learned to approximate the sine function in a very limited way.

The rigidity of this fit suggests that the model does not have enough capacity to learn the full complexity of the sine wave function, so it's only able to approximate it in an overly simplistic way. By making our model bigger, we should be able to improve its performance.

Training a Larger Model
1. Design the Model
To make our model bigger, let's add an additional layer of neurons. The following cell redefines our model in the same way as earlier, but with 16 neurons in the first layer and an additional layer of 16 neurons in the middle:


model = tf.keras.Sequential()

# First layer takes a scalar input and feeds it through 16 "neurons". The
# neurons decide whether to activate based on the 'relu' activation function.
model.add(keras.layers.Dense(16, activation='relu', input_shape=(1,)))

# The new second and third layer will help the network learn more complex representations
model.add(keras.layers.Dense(16, activation='relu'))

# Final layer is a single neuron, since we want to output a single value
model.add(keras.layers.Dense(1))

# Compile the model using the standard 'adam' optimizer and the mean squared error or 'mse' loss function for regression.
model.compile(optimizer='adam', loss="mse", metrics=["mae"])
     
2. Train the Model
We'll now train and save the new model.


# Train the model
history = model.fit(x_train, y_train, epochs=500, batch_size=64,
                    validation_data=(x_validate, y_validate))

# Save the model to disk
model.save(MODEL_TF)
     
Epoch 1/500
10/10 [==============================] - 1s 20ms/step - loss: 0.4355 - mae: 0.5542 - val_loss: 0.4315 - val_mae: 0.5685
Epoch 2/500
10/10 [==============================] - 0s 5ms/step - loss: 0.4183 - mae: 0.5548 - val_loss: 0.4157 - val_mae: 0.5581
Epoch 3/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3871 - mae: 0.5322 - val_loss: 0.3988 - val_mae: 0.5444
Epoch 4/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3954 - mae: 0.5348 - val_loss: 0.3834 - val_mae: 0.5350
Epoch 5/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3670 - mae: 0.5163 - val_loss: 0.3684 - val_mae: 0.5257
Epoch 6/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3426 - mae: 0.4999 - val_loss: 0.3532 - val_mae: 0.5166
Epoch 7/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3453 - mae: 0.5006 - val_loss: 0.3369 - val_mae: 0.5055
Epoch 8/500
10/10 [==============================] - 0s 6ms/step - loss: 0.3182 - mae: 0.4830 - val_loss: 0.3203 - val_mae: 0.4940
Epoch 9/500
10/10 [==============================] - 0s 5ms/step - loss: 0.3013 - mae: 0.4691 - val_loss: 0.3041 - val_mae: 0.4833
Epoch 10/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2795 - mae: 0.4523 - val_loss: 0.2867 - val_mae: 0.4699
Epoch 11/500
10/10 [==============================] - 0s 20ms/step - loss: 0.2632 - mae: 0.4395 - val_loss: 0.2698 - val_mae: 0.4558
Epoch 12/500
10/10 [==============================] - 0s 6ms/step - loss: 0.2581 - mae: 0.4331 - val_loss: 0.2534 - val_mae: 0.4436
Epoch 13/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2363 - mae: 0.4185 - val_loss: 0.2381 - val_mae: 0.4318
Epoch 14/500
10/10 [==============================] - 0s 5ms/step - loss: 0.2171 - mae: 0.3972 - val_loss: 0.2220 - val_mae: 0.4151
Epoch 15/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1944 - mae: 0.3783 - val_loss: 0.2095 - val_mae: 0.4041
Epoch 16/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1948 - mae: 0.3796 - val_loss: 0.1969 - val_mae: 0.3902
Epoch 17/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1842 - mae: 0.3642 - val_loss: 0.1868 - val_mae: 0.3790
Epoch 18/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1706 - mae: 0.3480 - val_loss: 0.1781 - val_mae: 0.3677
Epoch 19/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1599 - mae: 0.3348 - val_loss: 0.1713 - val_mae: 0.3576
Epoch 20/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1563 - mae: 0.3340 - val_loss: 0.1653 - val_mae: 0.3468
Epoch 21/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1487 - mae: 0.3161 - val_loss: 0.1613 - val_mae: 0.3391
Epoch 22/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1425 - mae: 0.3061 - val_loss: 0.1577 - val_mae: 0.3306
Epoch 23/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1347 - mae: 0.3005 - val_loss: 0.1552 - val_mae: 0.3235
Epoch 24/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1411 - mae: 0.2995 - val_loss: 0.1533 - val_mae: 0.3185
Epoch 25/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1414 - mae: 0.2992 - val_loss: 0.1517 - val_mae: 0.3122
Epoch 26/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1397 - mae: 0.3011 - val_loss: 0.1517 - val_mae: 0.3129
Epoch 27/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1335 - mae: 0.2879 - val_loss: 0.1494 - val_mae: 0.3057
Epoch 28/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1335 - mae: 0.2897 - val_loss: 0.1490 - val_mae: 0.3049
Epoch 29/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1287 - mae: 0.2792 - val_loss: 0.1478 - val_mae: 0.3010
Epoch 30/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1291 - mae: 0.2774 - val_loss: 0.1472 - val_mae: 0.2992
Epoch 31/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1245 - mae: 0.2756 - val_loss: 0.1467 - val_mae: 0.2991
Epoch 32/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1327 - mae: 0.2775 - val_loss: 0.1460 - val_mae: 0.2977
Epoch 33/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1163 - mae: 0.2613 - val_loss: 0.1453 - val_mae: 0.2955
Epoch 34/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1251 - mae: 0.2731 - val_loss: 0.1443 - val_mae: 0.2922
Epoch 35/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1365 - mae: 0.2829 - val_loss: 0.1441 - val_mae: 0.2951
Epoch 36/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1283 - mae: 0.2757 - val_loss: 0.1427 - val_mae: 0.2905
Epoch 37/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1146 - mae: 0.2567 - val_loss: 0.1432 - val_mae: 0.2930
Epoch 38/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1231 - mae: 0.2655 - val_loss: 0.1412 - val_mae: 0.2869
Epoch 39/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1263 - mae: 0.2739 - val_loss: 0.1407 - val_mae: 0.2890
Epoch 40/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1396 - mae: 0.2878 - val_loss: 0.1398 - val_mae: 0.2867
Epoch 41/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1194 - mae: 0.2651 - val_loss: 0.1390 - val_mae: 0.2835
Epoch 42/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1206 - mae: 0.2607 - val_loss: 0.1379 - val_mae: 0.2831
Epoch 43/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1296 - mae: 0.2716 - val_loss: 0.1373 - val_mae: 0.2850
Epoch 44/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1155 - mae: 0.2545 - val_loss: 0.1362 - val_mae: 0.2814
Epoch 45/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1237 - mae: 0.2610 - val_loss: 0.1353 - val_mae: 0.2806
Epoch 46/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1163 - mae: 0.2529 - val_loss: 0.1350 - val_mae: 0.2815
Epoch 47/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1123 - mae: 0.2527 - val_loss: 0.1339 - val_mae: 0.2814
Epoch 48/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1136 - mae: 0.2541 - val_loss: 0.1325 - val_mae: 0.2775
Epoch 49/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1154 - mae: 0.2535 - val_loss: 0.1318 - val_mae: 0.2783
Epoch 50/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1249 - mae: 0.2632 - val_loss: 0.1312 - val_mae: 0.2715
Epoch 51/500
10/10 [==============================] - 0s 17ms/step - loss: 0.1117 - mae: 0.2534 - val_loss: 0.1319 - val_mae: 0.2801
Epoch 52/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1088 - mae: 0.2529 - val_loss: 0.1289 - val_mae: 0.2727
Epoch 53/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1166 - mae: 0.2611 - val_loss: 0.1290 - val_mae: 0.2760
Epoch 54/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1137 - mae: 0.2537 - val_loss: 0.1270 - val_mae: 0.2696
Epoch 55/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1063 - mae: 0.2480 - val_loss: 0.1268 - val_mae: 0.2726
Epoch 56/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1083 - mae: 0.2461 - val_loss: 0.1253 - val_mae: 0.2655
Epoch 57/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0997 - mae: 0.2326 - val_loss: 0.1245 - val_mae: 0.2668
Epoch 58/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1066 - mae: 0.2470 - val_loss: 0.1235 - val_mae: 0.2644
Epoch 59/500
10/10 [==============================] - 0s 7ms/step - loss: 0.1068 - mae: 0.2399 - val_loss: 0.1231 - val_mae: 0.2662
Epoch 60/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1055 - mae: 0.2396 - val_loss: 0.1217 - val_mae: 0.2618
Epoch 61/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1034 - mae: 0.2338 - val_loss: 0.1207 - val_mae: 0.2606
Epoch 62/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1057 - mae: 0.2456 - val_loss: 0.1217 - val_mae: 0.2662
Epoch 63/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1067 - mae: 0.2439 - val_loss: 0.1189 - val_mae: 0.2564
Epoch 64/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0984 - mae: 0.2338 - val_loss: 0.1185 - val_mae: 0.2593
Epoch 65/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0974 - mae: 0.2356 - val_loss: 0.1175 - val_mae: 0.2598
Epoch 66/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0982 - mae: 0.2355 - val_loss: 0.1161 - val_mae: 0.2540
Epoch 67/500
10/10 [==============================] - 0s 6ms/step - loss: 0.1027 - mae: 0.2385 - val_loss: 0.1159 - val_mae: 0.2556
Epoch 68/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1017 - mae: 0.2356 - val_loss: 0.1144 - val_mae: 0.2511
Epoch 69/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0948 - mae: 0.2266 - val_loss: 0.1136 - val_mae: 0.2529
Epoch 70/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0969 - mae: 0.2316 - val_loss: 0.1127 - val_mae: 0.2516
Epoch 71/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0959 - mae: 0.2247 - val_loss: 0.1116 - val_mae: 0.2473
Epoch 72/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0988 - mae: 0.2279 - val_loss: 0.1107 - val_mae: 0.2468
Epoch 73/500
10/10 [==============================] - 0s 5ms/step - loss: 0.1069 - mae: 0.2367 - val_loss: 0.1097 - val_mae: 0.2461
Epoch 74/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0924 - mae: 0.2292 - val_loss: 0.1090 - val_mae: 0.2463
Epoch 75/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0967 - mae: 0.2268 - val_loss: 0.1080 - val_mae: 0.2454
Epoch 76/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0892 - mae: 0.2194 - val_loss: 0.1070 - val_mae: 0.2415
Epoch 77/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0939 - mae: 0.2265 - val_loss: 0.1064 - val_mae: 0.2431
Epoch 78/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0874 - mae: 0.2146 - val_loss: 0.1056 - val_mae: 0.2370
Epoch 79/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0895 - mae: 0.2188 - val_loss: 0.1050 - val_mae: 0.2413
Epoch 80/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0820 - mae: 0.2127 - val_loss: 0.1036 - val_mae: 0.2366
Epoch 81/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0890 - mae: 0.2167 - val_loss: 0.1027 - val_mae: 0.2380
Epoch 82/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0905 - mae: 0.2191 - val_loss: 0.1018 - val_mae: 0.2359
Epoch 83/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0822 - mae: 0.2072 - val_loss: 0.1012 - val_mae: 0.2346
Epoch 84/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0870 - mae: 0.2135 - val_loss: 0.1001 - val_mae: 0.2334
Epoch 85/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0936 - mae: 0.2228 - val_loss: 0.0993 - val_mae: 0.2310
Epoch 86/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0762 - mae: 0.2036 - val_loss: 0.0990 - val_mae: 0.2330
Epoch 87/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0781 - mae: 0.2018 - val_loss: 0.0978 - val_mae: 0.2314
Epoch 88/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0835 - mae: 0.2111 - val_loss: 0.0969 - val_mae: 0.2289
Epoch 89/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0814 - mae: 0.2084 - val_loss: 0.0961 - val_mae: 0.2279
Epoch 90/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0791 - mae: 0.2048 - val_loss: 0.0953 - val_mae: 0.2268
Epoch 91/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0816 - mae: 0.2088 - val_loss: 0.0948 - val_mae: 0.2288
Epoch 92/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0818 - mae: 0.2083 - val_loss: 0.0939 - val_mae: 0.2217
Epoch 93/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0735 - mae: 0.1931 - val_loss: 0.0934 - val_mae: 0.2255
Epoch 94/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0812 - mae: 0.2072 - val_loss: 0.0921 - val_mae: 0.2217
Epoch 95/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0815 - mae: 0.2055 - val_loss: 0.0913 - val_mae: 0.2205
Epoch 96/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0766 - mae: 0.2003 - val_loss: 0.0905 - val_mae: 0.2187
Epoch 97/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0803 - mae: 0.2053 - val_loss: 0.0898 - val_mae: 0.2202
Epoch 98/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0748 - mae: 0.1963 - val_loss: 0.0890 - val_mae: 0.2184
Epoch 99/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0754 - mae: 0.1959 - val_loss: 0.0885 - val_mae: 0.2134
Epoch 100/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0785 - mae: 0.2020 - val_loss: 0.0876 - val_mae: 0.2138
Epoch 101/500
10/10 [==============================] - 0s 19ms/step - loss: 0.0724 - mae: 0.1939 - val_loss: 0.0868 - val_mae: 0.2148
Epoch 102/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0742 - mae: 0.1977 - val_loss: 0.0861 - val_mae: 0.2130
Epoch 103/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0714 - mae: 0.1943 - val_loss: 0.0855 - val_mae: 0.2151
Epoch 104/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0777 - mae: 0.2017 - val_loss: 0.0845 - val_mae: 0.2110
Epoch 105/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0689 - mae: 0.1883 - val_loss: 0.0845 - val_mae: 0.2105
Epoch 106/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0660 - mae: 0.1848 - val_loss: 0.0832 - val_mae: 0.2100
Epoch 107/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0721 - mae: 0.1913 - val_loss: 0.0825 - val_mae: 0.2089
Epoch 108/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0819 - mae: 0.2055 - val_loss: 0.0819 - val_mae: 0.2077
Epoch 109/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0731 - mae: 0.1940 - val_loss: 0.0812 - val_mae: 0.2072
Epoch 110/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0678 - mae: 0.1863 - val_loss: 0.0805 - val_mae: 0.2051
Epoch 111/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0688 - mae: 0.1840 - val_loss: 0.0799 - val_mae: 0.2031
Epoch 112/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0739 - mae: 0.1874 - val_loss: 0.0792 - val_mae: 0.2031
Epoch 113/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0745 - mae: 0.1944 - val_loss: 0.0788 - val_mae: 0.2023
Epoch 114/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0704 - mae: 0.1902 - val_loss: 0.0780 - val_mae: 0.2016
Epoch 115/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0664 - mae: 0.1864 - val_loss: 0.0774 - val_mae: 0.2016
Epoch 116/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0624 - mae: 0.1774 - val_loss: 0.0769 - val_mae: 0.1986
Epoch 117/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0688 - mae: 0.1869 - val_loss: 0.0761 - val_mae: 0.1991
Epoch 118/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0671 - mae: 0.1801 - val_loss: 0.0756 - val_mae: 0.1975
Epoch 119/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0656 - mae: 0.1839 - val_loss: 0.0750 - val_mae: 0.1986
Epoch 120/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0554 - mae: 0.1686 - val_loss: 0.0742 - val_mae: 0.1973
Epoch 121/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0627 - mae: 0.1815 - val_loss: 0.0737 - val_mae: 0.1971
Epoch 122/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0668 - mae: 0.1842 - val_loss: 0.0733 - val_mae: 0.1955
Epoch 123/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0683 - mae: 0.1886 - val_loss: 0.0726 - val_mae: 0.1935
Epoch 124/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0601 - mae: 0.1734 - val_loss: 0.0726 - val_mae: 0.1966
Epoch 125/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0608 - mae: 0.1845 - val_loss: 0.0715 - val_mae: 0.1950
Epoch 126/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0644 - mae: 0.1833 - val_loss: 0.0709 - val_mae: 0.1940
Epoch 127/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0572 - mae: 0.1708 - val_loss: 0.0703 - val_mae: 0.1916
Epoch 128/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0571 - mae: 0.1712 - val_loss: 0.0698 - val_mae: 0.1901
Epoch 129/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0593 - mae: 0.1732 - val_loss: 0.0692 - val_mae: 0.1899
Epoch 130/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0583 - mae: 0.1718 - val_loss: 0.0688 - val_mae: 0.1914
Epoch 131/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0659 - mae: 0.1828 - val_loss: 0.0681 - val_mae: 0.1880
Epoch 132/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0601 - mae: 0.1734 - val_loss: 0.0686 - val_mae: 0.1927
Epoch 133/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0614 - mae: 0.1796 - val_loss: 0.0675 - val_mae: 0.1877
Epoch 134/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0575 - mae: 0.1725 - val_loss: 0.0670 - val_mae: 0.1899
Epoch 135/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0638 - mae: 0.1833 - val_loss: 0.0663 - val_mae: 0.1832
Epoch 136/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0519 - mae: 0.1603 - val_loss: 0.0661 - val_mae: 0.1886
Epoch 137/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0523 - mae: 0.1655 - val_loss: 0.0650 - val_mae: 0.1851
Epoch 138/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0499 - mae: 0.1625 - val_loss: 0.0645 - val_mae: 0.1841
Epoch 139/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0582 - mae: 0.1712 - val_loss: 0.0640 - val_mae: 0.1838
Epoch 140/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0520 - mae: 0.1618 - val_loss: 0.0640 - val_mae: 0.1853
Epoch 141/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0509 - mae: 0.1662 - val_loss: 0.0630 - val_mae: 0.1824
Epoch 142/500
10/10 [==============================] - 0s 18ms/step - loss: 0.0508 - mae: 0.1620 - val_loss: 0.0625 - val_mae: 0.1832
Epoch 143/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0484 - mae: 0.1564 - val_loss: 0.0624 - val_mae: 0.1823
Epoch 144/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0526 - mae: 0.1651 - val_loss: 0.0615 - val_mae: 0.1791
Epoch 145/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0536 - mae: 0.1649 - val_loss: 0.0611 - val_mae: 0.1809
Epoch 146/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0484 - mae: 0.1590 - val_loss: 0.0606 - val_mae: 0.1786
Epoch 147/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0555 - mae: 0.1652 - val_loss: 0.0601 - val_mae: 0.1770
Epoch 148/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0493 - mae: 0.1578 - val_loss: 0.0597 - val_mae: 0.1778
Epoch 149/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0475 - mae: 0.1538 - val_loss: 0.0591 - val_mae: 0.1779
Epoch 150/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0484 - mae: 0.1541 - val_loss: 0.0589 - val_mae: 0.1765
Epoch 151/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0580 - mae: 0.1705 - val_loss: 0.0584 - val_mae: 0.1741
Epoch 152/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0556 - mae: 0.1653 - val_loss: 0.0579 - val_mae: 0.1759
Epoch 153/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0491 - mae: 0.1562 - val_loss: 0.0576 - val_mae: 0.1714
Epoch 154/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0526 - mae: 0.1610 - val_loss: 0.0569 - val_mae: 0.1756
Epoch 155/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0460 - mae: 0.1538 - val_loss: 0.0563 - val_mae: 0.1722
Epoch 156/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0530 - mae: 0.1634 - val_loss: 0.0558 - val_mae: 0.1721
Epoch 157/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0464 - mae: 0.1522 - val_loss: 0.0556 - val_mae: 0.1710
Epoch 158/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0477 - mae: 0.1548 - val_loss: 0.0550 - val_mae: 0.1701
Epoch 159/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0447 - mae: 0.1499 - val_loss: 0.0546 - val_mae: 0.1706
Epoch 160/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0428 - mae: 0.1500 - val_loss: 0.0541 - val_mae: 0.1686
Epoch 161/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0436 - mae: 0.1471 - val_loss: 0.0540 - val_mae: 0.1717
Epoch 162/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0400 - mae: 0.1434 - val_loss: 0.0534 - val_mae: 0.1664
Epoch 163/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0361 - mae: 0.1362 - val_loss: 0.0540 - val_mae: 0.1735
Epoch 164/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0431 - mae: 0.1522 - val_loss: 0.0536 - val_mae: 0.1694
Epoch 165/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0444 - mae: 0.1504 - val_loss: 0.0531 - val_mae: 0.1711
Epoch 166/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0448 - mae: 0.1549 - val_loss: 0.0516 - val_mae: 0.1643
Epoch 167/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0417 - mae: 0.1455 - val_loss: 0.0511 - val_mae: 0.1664
Epoch 168/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0454 - mae: 0.1517 - val_loss: 0.0510 - val_mae: 0.1636
Epoch 169/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0439 - mae: 0.1469 - val_loss: 0.0506 - val_mae: 0.1663
Epoch 170/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0410 - mae: 0.1447 - val_loss: 0.0501 - val_mae: 0.1610
Epoch 171/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0404 - mae: 0.1449 - val_loss: 0.0495 - val_mae: 0.1643
Epoch 172/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0427 - mae: 0.1489 - val_loss: 0.0491 - val_mae: 0.1626
Epoch 173/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0421 - mae: 0.1473 - val_loss: 0.0490 - val_mae: 0.1632
Epoch 174/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0460 - mae: 0.1511 - val_loss: 0.0486 - val_mae: 0.1590
Epoch 175/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0431 - mae: 0.1461 - val_loss: 0.0480 - val_mae: 0.1602
Epoch 176/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0426 - mae: 0.1484 - val_loss: 0.0473 - val_mae: 0.1597
Epoch 177/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0380 - mae: 0.1396 - val_loss: 0.0473 - val_mae: 0.1617
Epoch 178/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0367 - mae: 0.1401 - val_loss: 0.0467 - val_mae: 0.1582
Epoch 179/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0406 - mae: 0.1438 - val_loss: 0.0462 - val_mae: 0.1578
Epoch 180/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0378 - mae: 0.1410 - val_loss: 0.0461 - val_mae: 0.1566
Epoch 181/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0353 - mae: 0.1352 - val_loss: 0.0457 - val_mae: 0.1591
Epoch 182/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0381 - mae: 0.1427 - val_loss: 0.0451 - val_mae: 0.1558
Epoch 183/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0372 - mae: 0.1353 - val_loss: 0.0448 - val_mae: 0.1562
Epoch 184/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0400 - mae: 0.1428 - val_loss: 0.0442 - val_mae: 0.1548
Epoch 185/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0378 - mae: 0.1393 - val_loss: 0.0438 - val_mae: 0.1541
Epoch 186/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0379 - mae: 0.1409 - val_loss: 0.0434 - val_mae: 0.1540
Epoch 187/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0357 - mae: 0.1355 - val_loss: 0.0431 - val_mae: 0.1535
Epoch 188/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0405 - mae: 0.1478 - val_loss: 0.0427 - val_mae: 0.1514
Epoch 189/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0375 - mae: 0.1384 - val_loss: 0.0423 - val_mae: 0.1512
Epoch 190/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0387 - mae: 0.1432 - val_loss: 0.0425 - val_mae: 0.1541
Epoch 191/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0347 - mae: 0.1374 - val_loss: 0.0418 - val_mae: 0.1500
Epoch 192/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0336 - mae: 0.1321 - val_loss: 0.0413 - val_mae: 0.1518
Epoch 193/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0369 - mae: 0.1356 - val_loss: 0.0409 - val_mae: 0.1506
Epoch 194/500
10/10 [==============================] - 0s 19ms/step - loss: 0.0355 - mae: 0.1353 - val_loss: 0.0405 - val_mae: 0.1480
Epoch 195/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0396 - mae: 0.1430 - val_loss: 0.0401 - val_mae: 0.1487
Epoch 196/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0348 - mae: 0.1352 - val_loss: 0.0403 - val_mae: 0.1510
Epoch 197/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0320 - mae: 0.1299 - val_loss: 0.0396 - val_mae: 0.1464
Epoch 198/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0349 - mae: 0.1328 - val_loss: 0.0393 - val_mae: 0.1484
Epoch 199/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0362 - mae: 0.1389 - val_loss: 0.0387 - val_mae: 0.1446
Epoch 200/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0303 - mae: 0.1235 - val_loss: 0.0384 - val_mae: 0.1446
Epoch 201/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0326 - mae: 0.1310 - val_loss: 0.0394 - val_mae: 0.1510
Epoch 202/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0345 - mae: 0.1359 - val_loss: 0.0389 - val_mae: 0.1460
Epoch 203/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0294 - mae: 0.1263 - val_loss: 0.0388 - val_mae: 0.1494
Epoch 204/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0336 - mae: 0.1355 - val_loss: 0.0373 - val_mae: 0.1438
Epoch 205/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0323 - mae: 0.1316 - val_loss: 0.0368 - val_mae: 0.1418
Epoch 206/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0294 - mae: 0.1234 - val_loss: 0.0366 - val_mae: 0.1427
Epoch 207/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0330 - mae: 0.1294 - val_loss: 0.0360 - val_mae: 0.1410
Epoch 208/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0333 - mae: 0.1314 - val_loss: 0.0357 - val_mae: 0.1417
Epoch 209/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0295 - mae: 0.1240 - val_loss: 0.0360 - val_mae: 0.1401
Epoch 210/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0313 - mae: 0.1265 - val_loss: 0.0356 - val_mae: 0.1434
Epoch 211/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0301 - mae: 0.1257 - val_loss: 0.0348 - val_mae: 0.1396
Epoch 212/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0295 - mae: 0.1253 - val_loss: 0.0349 - val_mae: 0.1390
Epoch 213/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0314 - mae: 0.1312 - val_loss: 0.0341 - val_mae: 0.1387
Epoch 214/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0332 - mae: 0.1322 - val_loss: 0.0341 - val_mae: 0.1381
Epoch 215/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0310 - mae: 0.1268 - val_loss: 0.0344 - val_mae: 0.1396
Epoch 216/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0310 - mae: 0.1300 - val_loss: 0.0331 - val_mae: 0.1369
Epoch 217/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0273 - mae: 0.1208 - val_loss: 0.0329 - val_mae: 0.1352
Epoch 218/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0278 - mae: 0.1210 - val_loss: 0.0326 - val_mae: 0.1368
Epoch 219/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0308 - mae: 0.1274 - val_loss: 0.0327 - val_mae: 0.1341
Epoch 220/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0267 - mae: 0.1191 - val_loss: 0.0319 - val_mae: 0.1340
Epoch 221/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0258 - mae: 0.1150 - val_loss: 0.0318 - val_mae: 0.1359
Epoch 222/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0307 - mae: 0.1293 - val_loss: 0.0326 - val_mae: 0.1346
Epoch 223/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0305 - mae: 0.1271 - val_loss: 0.0320 - val_mae: 0.1380
Epoch 224/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0284 - mae: 0.1225 - val_loss: 0.0306 - val_mae: 0.1320
Epoch 225/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0305 - mae: 0.1289 - val_loss: 0.0313 - val_mae: 0.1332
Epoch 226/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0281 - mae: 0.1235 - val_loss: 0.0309 - val_mae: 0.1355
Epoch 227/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0266 - mae: 0.1183 - val_loss: 0.0320 - val_mae: 0.1343
Epoch 228/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0306 - mae: 0.1269 - val_loss: 0.0294 - val_mae: 0.1294
Epoch 229/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0257 - mae: 0.1170 - val_loss: 0.0316 - val_mae: 0.1385
Epoch 230/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0275 - mae: 0.1260 - val_loss: 0.0293 - val_mae: 0.1300
Epoch 231/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0268 - mae: 0.1226 - val_loss: 0.0286 - val_mae: 0.1288
Epoch 232/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0270 - mae: 0.1187 - val_loss: 0.0291 - val_mae: 0.1270
Epoch 233/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0236 - mae: 0.1130 - val_loss: 0.0281 - val_mae: 0.1288
Epoch 234/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0263 - mae: 0.1200 - val_loss: 0.0276 - val_mae: 0.1266
Epoch 235/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0249 - mae: 0.1160 - val_loss: 0.0282 - val_mae: 0.1251
Epoch 236/500
10/10 [==============================] - 0s 18ms/step - loss: 0.0265 - mae: 0.1175 - val_loss: 0.0272 - val_mae: 0.1249
Epoch 237/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0263 - mae: 0.1169 - val_loss: 0.0273 - val_mae: 0.1278
Epoch 238/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0232 - mae: 0.1113 - val_loss: 0.0269 - val_mae: 0.1241
Epoch 239/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0234 - mae: 0.1135 - val_loss: 0.0263 - val_mae: 0.1240
Epoch 240/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0234 - mae: 0.1114 - val_loss: 0.0261 - val_mae: 0.1247
Epoch 241/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0241 - mae: 0.1151 - val_loss: 0.0263 - val_mae: 0.1229
Epoch 242/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0225 - mae: 0.1123 - val_loss: 0.0257 - val_mae: 0.1235
Epoch 243/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0217 - mae: 0.1099 - val_loss: 0.0253 - val_mae: 0.1234
Epoch 244/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0247 - mae: 0.1167 - val_loss: 0.0249 - val_mae: 0.1222
Epoch 245/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0243 - mae: 0.1174 - val_loss: 0.0247 - val_mae: 0.1216
Epoch 246/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0207 - mae: 0.1061 - val_loss: 0.0245 - val_mae: 0.1210
Epoch 247/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0224 - mae: 0.1101 - val_loss: 0.0244 - val_mae: 0.1203
Epoch 248/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0212 - mae: 0.1060 - val_loss: 0.0240 - val_mae: 0.1203
Epoch 249/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0200 - mae: 0.1066 - val_loss: 0.0237 - val_mae: 0.1199
Epoch 250/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0221 - mae: 0.1084 - val_loss: 0.0241 - val_mae: 0.1182
Epoch 251/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0230 - mae: 0.1124 - val_loss: 0.0235 - val_mae: 0.1195
Epoch 252/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0206 - mae: 0.1072 - val_loss: 0.0237 - val_mae: 0.1199
Epoch 253/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0205 - mae: 0.1058 - val_loss: 0.0235 - val_mae: 0.1192
Epoch 254/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0221 - mae: 0.1101 - val_loss: 0.0230 - val_mae: 0.1177
Epoch 255/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0215 - mae: 0.1077 - val_loss: 0.0225 - val_mae: 0.1171
Epoch 256/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0202 - mae: 0.1054 - val_loss: 0.0235 - val_mae: 0.1206
Epoch 257/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0205 - mae: 0.1071 - val_loss: 0.0220 - val_mae: 0.1163
Epoch 258/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0208 - mae: 0.1110 - val_loss: 0.0218 - val_mae: 0.1163
Epoch 259/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0224 - mae: 0.1096 - val_loss: 0.0219 - val_mae: 0.1151
Epoch 260/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0206 - mae: 0.1071 - val_loss: 0.0222 - val_mae: 0.1178
Epoch 261/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0209 - mae: 0.1093 - val_loss: 0.0214 - val_mae: 0.1157
Epoch 262/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0211 - mae: 0.1089 - val_loss: 0.0226 - val_mae: 0.1142
Epoch 263/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0201 - mae: 0.1063 - val_loss: 0.0208 - val_mae: 0.1141
Epoch 264/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0186 - mae: 0.1007 - val_loss: 0.0207 - val_mae: 0.1134
Epoch 265/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0195 - mae: 0.1037 - val_loss: 0.0209 - val_mae: 0.1129
Epoch 266/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0208 - mae: 0.1072 - val_loss: 0.0207 - val_mae: 0.1124
Epoch 267/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0186 - mae: 0.1016 - val_loss: 0.0216 - val_mae: 0.1167
Epoch 268/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0193 - mae: 0.1050 - val_loss: 0.0206 - val_mae: 0.1119
Epoch 269/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0193 - mae: 0.1063 - val_loss: 0.0198 - val_mae: 0.1116
Epoch 270/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0175 - mae: 0.0996 - val_loss: 0.0197 - val_mae: 0.1114
Epoch 271/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0194 - mae: 0.1037 - val_loss: 0.0196 - val_mae: 0.1107
Epoch 272/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0191 - mae: 0.1032 - val_loss: 0.0194 - val_mae: 0.1106
Epoch 273/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0182 - mae: 0.1026 - val_loss: 0.0193 - val_mae: 0.1106
Epoch 274/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0189 - mae: 0.1042 - val_loss: 0.0197 - val_mae: 0.1105
Epoch 275/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0192 - mae: 0.1077 - val_loss: 0.0189 - val_mae: 0.1098
Epoch 276/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0199 - mae: 0.1072 - val_loss: 0.0204 - val_mae: 0.1141
Epoch 277/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0197 - mae: 0.1104 - val_loss: 0.0195 - val_mae: 0.1116
Epoch 278/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0194 - mae: 0.1074 - val_loss: 0.0192 - val_mae: 0.1091
Epoch 279/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0179 - mae: 0.1027 - val_loss: 0.0183 - val_mae: 0.1081
Epoch 280/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0177 - mae: 0.1019 - val_loss: 0.0182 - val_mae: 0.1076
Epoch 281/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0170 - mae: 0.0987 - val_loss: 0.0181 - val_mae: 0.1079
Epoch 282/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0167 - mae: 0.0997 - val_loss: 0.0182 - val_mae: 0.1069
Epoch 283/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0182 - mae: 0.1022 - val_loss: 0.0177 - val_mae: 0.1069
Epoch 284/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0199 - mae: 0.1073 - val_loss: 0.0192 - val_mae: 0.1088
Epoch 285/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0179 - mae: 0.1033 - val_loss: 0.0177 - val_mae: 0.1061
Epoch 286/500
10/10 [==============================] - 0s 21ms/step - loss: 0.0171 - mae: 0.1013 - val_loss: 0.0173 - val_mae: 0.1060
Epoch 287/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0179 - mae: 0.1022 - val_loss: 0.0174 - val_mae: 0.1053
Epoch 288/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0185 - mae: 0.1055 - val_loss: 0.0182 - val_mae: 0.1070
Epoch 289/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0182 - mae: 0.1038 - val_loss: 0.0176 - val_mae: 0.1047
Epoch 290/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0173 - mae: 0.1032 - val_loss: 0.0177 - val_mae: 0.1069
Epoch 291/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0176 - mae: 0.1015 - val_loss: 0.0169 - val_mae: 0.1044
Epoch 292/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0173 - mae: 0.1022 - val_loss: 0.0171 - val_mae: 0.1044
Epoch 293/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0152 - mae: 0.0967 - val_loss: 0.0166 - val_mae: 0.1037
Epoch 294/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0165 - mae: 0.0998 - val_loss: 0.0164 - val_mae: 0.1027
Epoch 295/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0165 - mae: 0.0986 - val_loss: 0.0163 - val_mae: 0.1024
Epoch 296/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0165 - mae: 0.0979 - val_loss: 0.0163 - val_mae: 0.1026
Epoch 297/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0162 - mae: 0.0987 - val_loss: 0.0162 - val_mae: 0.1020
Epoch 298/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0173 - mae: 0.1011 - val_loss: 0.0160 - val_mae: 0.1021
Epoch 299/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0170 - mae: 0.1019 - val_loss: 0.0165 - val_mae: 0.1029
Epoch 300/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0164 - mae: 0.0996 - val_loss: 0.0155 - val_mae: 0.1005
Epoch 301/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0161 - mae: 0.0987 - val_loss: 0.0156 - val_mae: 0.1005
Epoch 302/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0147 - mae: 0.0952 - val_loss: 0.0162 - val_mae: 0.1029
Epoch 303/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0161 - mae: 0.0999 - val_loss: 0.0171 - val_mae: 0.1027
Epoch 304/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0164 - mae: 0.0990 - val_loss: 0.0161 - val_mae: 0.1007
Epoch 305/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0161 - mae: 0.0975 - val_loss: 0.0156 - val_mae: 0.1001
Epoch 306/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0159 - mae: 0.0982 - val_loss: 0.0167 - val_mae: 0.1039
Epoch 307/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0150 - mae: 0.0951 - val_loss: 0.0162 - val_mae: 0.1023
Epoch 308/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0175 - mae: 0.1035 - val_loss: 0.0148 - val_mae: 0.0985
Epoch 309/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0152 - mae: 0.0970 - val_loss: 0.0187 - val_mae: 0.1059
Epoch 310/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0172 - mae: 0.1025 - val_loss: 0.0154 - val_mae: 0.1006
Epoch 311/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0162 - mae: 0.0999 - val_loss: 0.0180 - val_mae: 0.1055
Epoch 312/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0162 - mae: 0.1019 - val_loss: 0.0149 - val_mae: 0.0978
Epoch 313/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0151 - mae: 0.0991 - val_loss: 0.0157 - val_mae: 0.0996
Epoch 314/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0150 - mae: 0.0951 - val_loss: 0.0148 - val_mae: 0.0983
Epoch 315/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0151 - mae: 0.0974 - val_loss: 0.0150 - val_mae: 0.0988
Epoch 316/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0156 - mae: 0.0987 - val_loss: 0.0146 - val_mae: 0.0977
Epoch 317/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0160 - mae: 0.0987 - val_loss: 0.0151 - val_mae: 0.0971
Epoch 318/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0154 - mae: 0.0973 - val_loss: 0.0141 - val_mae: 0.0960
Epoch 319/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0143 - mae: 0.0940 - val_loss: 0.0141 - val_mae: 0.0963
Epoch 320/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0131 - mae: 0.0904 - val_loss: 0.0143 - val_mae: 0.0965
Epoch 321/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0142 - mae: 0.0952 - val_loss: 0.0144 - val_mae: 0.0972
Epoch 322/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0146 - mae: 0.0954 - val_loss: 0.0147 - val_mae: 0.0964
Epoch 323/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0143 - mae: 0.0941 - val_loss: 0.0147 - val_mae: 0.0973
Epoch 324/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0149 - mae: 0.0952 - val_loss: 0.0150 - val_mae: 0.0984
Epoch 325/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0154 - mae: 0.0975 - val_loss: 0.0137 - val_mae: 0.0945
Epoch 326/500
10/10 [==============================] - 0s 18ms/step - loss: 0.0135 - mae: 0.0925 - val_loss: 0.0137 - val_mae: 0.0944
Epoch 327/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0134 - mae: 0.0913 - val_loss: 0.0142 - val_mae: 0.0962
Epoch 328/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0143 - mae: 0.0955 - val_loss: 0.0135 - val_mae: 0.0937
Epoch 329/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0142 - mae: 0.0938 - val_loss: 0.0145 - val_mae: 0.0957
Epoch 330/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0150 - mae: 0.0955 - val_loss: 0.0160 - val_mae: 0.1011
Epoch 331/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0162 - mae: 0.0996 - val_loss: 0.0136 - val_mae: 0.0940
Epoch 332/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0135 - mae: 0.0913 - val_loss: 0.0134 - val_mae: 0.0933
Epoch 333/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0133 - mae: 0.0900 - val_loss: 0.0141 - val_mae: 0.0953
Epoch 334/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0144 - mae: 0.0954 - val_loss: 0.0132 - val_mae: 0.0929
Epoch 335/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0134 - mae: 0.0895 - val_loss: 0.0144 - val_mae: 0.0956
Epoch 336/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0142 - mae: 0.0930 - val_loss: 0.0136 - val_mae: 0.0939
Epoch 337/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0135 - mae: 0.0924 - val_loss: 0.0130 - val_mae: 0.0922
Epoch 338/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0133 - mae: 0.0918 - val_loss: 0.0130 - val_mae: 0.0920
Epoch 339/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0132 - mae: 0.0921 - val_loss: 0.0131 - val_mae: 0.0920
Epoch 340/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0890 - val_loss: 0.0134 - val_mae: 0.0928
Epoch 341/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0139 - mae: 0.0937 - val_loss: 0.0135 - val_mae: 0.0929
Epoch 342/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0141 - mae: 0.0948 - val_loss: 0.0131 - val_mae: 0.0919
Epoch 343/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0154 - mae: 0.0979 - val_loss: 0.0143 - val_mae: 0.0955
Epoch 344/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0139 - mae: 0.0927 - val_loss: 0.0136 - val_mae: 0.0932
Epoch 345/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0136 - mae: 0.0914 - val_loss: 0.0127 - val_mae: 0.0906
Epoch 346/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0139 - mae: 0.0944 - val_loss: 0.0142 - val_mae: 0.0951
Epoch 347/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0129 - mae: 0.0892 - val_loss: 0.0129 - val_mae: 0.0910
Epoch 348/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0148 - mae: 0.0956 - val_loss: 0.0134 - val_mae: 0.0925
Epoch 349/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0127 - mae: 0.0886 - val_loss: 0.0141 - val_mae: 0.0943
Epoch 350/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0130 - mae: 0.0918 - val_loss: 0.0130 - val_mae: 0.0915
Epoch 351/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0144 - mae: 0.0945 - val_loss: 0.0131 - val_mae: 0.0920
Epoch 352/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0128 - mae: 0.0893 - val_loss: 0.0127 - val_mae: 0.0907
Epoch 353/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0132 - mae: 0.0926 - val_loss: 0.0135 - val_mae: 0.0927
Epoch 354/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0136 - mae: 0.0945 - val_loss: 0.0127 - val_mae: 0.0904
Epoch 355/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0127 - mae: 0.0893 - val_loss: 0.0136 - val_mae: 0.0937
Epoch 356/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0137 - mae: 0.0936 - val_loss: 0.0135 - val_mae: 0.0937
Epoch 357/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0144 - mae: 0.0973 - val_loss: 0.0128 - val_mae: 0.0906
Epoch 358/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0130 - mae: 0.0906 - val_loss: 0.0125 - val_mae: 0.0893
Epoch 359/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0896 - val_loss: 0.0125 - val_mae: 0.0899
Epoch 360/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0136 - mae: 0.0931 - val_loss: 0.0134 - val_mae: 0.0935
Epoch 361/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0139 - mae: 0.0942 - val_loss: 0.0124 - val_mae: 0.0892
Epoch 362/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0133 - mae: 0.0922 - val_loss: 0.0125 - val_mae: 0.0894
Epoch 363/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0894 - val_loss: 0.0126 - val_mae: 0.0904
Epoch 364/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0126 - mae: 0.0910 - val_loss: 0.0124 - val_mae: 0.0895
Epoch 365/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0121 - mae: 0.0883 - val_loss: 0.0123 - val_mae: 0.0892
Epoch 366/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0118 - mae: 0.0867 - val_loss: 0.0124 - val_mae: 0.0896
Epoch 367/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0122 - mae: 0.0872 - val_loss: 0.0121 - val_mae: 0.0881
Epoch 368/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0118 - mae: 0.0865 - val_loss: 0.0125 - val_mae: 0.0903
Epoch 369/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0131 - mae: 0.0908 - val_loss: 0.0121 - val_mae: 0.0885
Epoch 370/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0131 - mae: 0.0910 - val_loss: 0.0120 - val_mae: 0.0879
Epoch 371/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0897 - val_loss: 0.0129 - val_mae: 0.0906
Epoch 372/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0137 - mae: 0.0928 - val_loss: 0.0129 - val_mae: 0.0904
Epoch 373/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0128 - mae: 0.0900 - val_loss: 0.0123 - val_mae: 0.0886
Epoch 374/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0125 - mae: 0.0898 - val_loss: 0.0125 - val_mae: 0.0901
Epoch 375/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0131 - mae: 0.0911 - val_loss: 0.0120 - val_mae: 0.0877
Epoch 376/500
10/10 [==============================] - 0s 18ms/step - loss: 0.0121 - mae: 0.0889 - val_loss: 0.0121 - val_mae: 0.0878
Epoch 377/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0112 - mae: 0.0845 - val_loss: 0.0125 - val_mae: 0.0889
Epoch 378/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0869 - val_loss: 0.0122 - val_mae: 0.0880
Epoch 379/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0886 - val_loss: 0.0128 - val_mae: 0.0911
Epoch 380/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0904 - val_loss: 0.0119 - val_mae: 0.0878
Epoch 381/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0125 - mae: 0.0897 - val_loss: 0.0124 - val_mae: 0.0897
Epoch 382/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0904 - val_loss: 0.0119 - val_mae: 0.0872
Epoch 383/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0896 - val_loss: 0.0118 - val_mae: 0.0872
Epoch 384/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0895 - val_loss: 0.0120 - val_mae: 0.0881
Epoch 385/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0897 - val_loss: 0.0120 - val_mae: 0.0884
Epoch 386/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0120 - mae: 0.0875 - val_loss: 0.0120 - val_mae: 0.0882
Epoch 387/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0124 - mae: 0.0889 - val_loss: 0.0118 - val_mae: 0.0874
Epoch 388/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0135 - mae: 0.0933 - val_loss: 0.0132 - val_mae: 0.0915
Epoch 389/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0133 - mae: 0.0926 - val_loss: 0.0125 - val_mae: 0.0892
Epoch 390/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0130 - mae: 0.0903 - val_loss: 0.0130 - val_mae: 0.0909
Epoch 391/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0899 - val_loss: 0.0126 - val_mae: 0.0896
Epoch 392/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0132 - mae: 0.0906 - val_loss: 0.0121 - val_mae: 0.0878
Epoch 393/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0129 - mae: 0.0902 - val_loss: 0.0122 - val_mae: 0.0887
Epoch 394/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0901 - val_loss: 0.0117 - val_mae: 0.0870
Epoch 395/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0909 - val_loss: 0.0120 - val_mae: 0.0882
Epoch 396/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0125 - mae: 0.0885 - val_loss: 0.0117 - val_mae: 0.0869
Epoch 397/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0123 - mae: 0.0885 - val_loss: 0.0120 - val_mae: 0.0883
Epoch 398/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0130 - mae: 0.0907 - val_loss: 0.0120 - val_mae: 0.0882
Epoch 399/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0128 - mae: 0.0918 - val_loss: 0.0122 - val_mae: 0.0889
Epoch 400/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0124 - mae: 0.0901 - val_loss: 0.0119 - val_mae: 0.0878
Epoch 401/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0116 - mae: 0.0862 - val_loss: 0.0117 - val_mae: 0.0868
Epoch 402/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0900 - val_loss: 0.0119 - val_mae: 0.0878
Epoch 403/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0118 - mae: 0.0861 - val_loss: 0.0124 - val_mae: 0.0896
Epoch 404/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0893 - val_loss: 0.0118 - val_mae: 0.0875
Epoch 405/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0119 - mae: 0.0881 - val_loss: 0.0121 - val_mae: 0.0879
Epoch 406/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0122 - mae: 0.0884 - val_loss: 0.0115 - val_mae: 0.0862
Epoch 407/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0115 - mae: 0.0864 - val_loss: 0.0121 - val_mae: 0.0880
Epoch 408/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0127 - mae: 0.0901 - val_loss: 0.0121 - val_mae: 0.0886
Epoch 409/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0123 - mae: 0.0882 - val_loss: 0.0127 - val_mae: 0.0906
Epoch 410/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0130 - mae: 0.0898 - val_loss: 0.0119 - val_mae: 0.0875
Epoch 411/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0127 - mae: 0.0903 - val_loss: 0.0126 - val_mae: 0.0896
Epoch 412/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0119 - mae: 0.0872 - val_loss: 0.0115 - val_mae: 0.0864
Epoch 413/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0117 - mae: 0.0867 - val_loss: 0.0127 - val_mae: 0.0896
Epoch 414/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0117 - mae: 0.0874 - val_loss: 0.0127 - val_mae: 0.0898
Epoch 415/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0134 - mae: 0.0921 - val_loss: 0.0120 - val_mae: 0.0876
Epoch 416/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0139 - mae: 0.0941 - val_loss: 0.0117 - val_mae: 0.0869
Epoch 417/500
10/10 [==============================] - 0s 18ms/step - loss: 0.0122 - mae: 0.0889 - val_loss: 0.0120 - val_mae: 0.0879
Epoch 418/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0120 - mae: 0.0868 - val_loss: 0.0120 - val_mae: 0.0882
Epoch 419/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0122 - mae: 0.0884 - val_loss: 0.0119 - val_mae: 0.0877
Epoch 420/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0123 - mae: 0.0895 - val_loss: 0.0127 - val_mae: 0.0902
Epoch 421/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0901 - val_loss: 0.0128 - val_mae: 0.0911
Epoch 422/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0134 - mae: 0.0921 - val_loss: 0.0117 - val_mae: 0.0868
Epoch 423/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0119 - mae: 0.0880 - val_loss: 0.0118 - val_mae: 0.0871
Epoch 424/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0910 - val_loss: 0.0117 - val_mae: 0.0868
Epoch 425/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0120 - mae: 0.0881 - val_loss: 0.0117 - val_mae: 0.0869
Epoch 426/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0127 - mae: 0.0896 - val_loss: 0.0118 - val_mae: 0.0870
Epoch 427/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0117 - mae: 0.0870 - val_loss: 0.0116 - val_mae: 0.0865
Epoch 428/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0126 - mae: 0.0909 - val_loss: 0.0119 - val_mae: 0.0874
Epoch 429/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0115 - mae: 0.0848 - val_loss: 0.0119 - val_mae: 0.0877
Epoch 430/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0118 - mae: 0.0878 - val_loss: 0.0122 - val_mae: 0.0883
Epoch 431/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0889 - val_loss: 0.0118 - val_mae: 0.0871
Epoch 432/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0124 - mae: 0.0885 - val_loss: 0.0120 - val_mae: 0.0878
Epoch 433/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0124 - mae: 0.0891 - val_loss: 0.0116 - val_mae: 0.0863
Epoch 434/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0117 - mae: 0.0879 - val_loss: 0.0119 - val_mae: 0.0877
Epoch 435/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0124 - mae: 0.0891 - val_loss: 0.0126 - val_mae: 0.0901
Epoch 436/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0125 - mae: 0.0887 - val_loss: 0.0126 - val_mae: 0.0901
Epoch 437/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0129 - mae: 0.0913 - val_loss: 0.0123 - val_mae: 0.0886
Epoch 438/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0120 - mae: 0.0868 - val_loss: 0.0116 - val_mae: 0.0868
Epoch 439/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0128 - mae: 0.0894 - val_loss: 0.0132 - val_mae: 0.0911
Epoch 440/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0111 - mae: 0.0849 - val_loss: 0.0115 - val_mae: 0.0865
Epoch 441/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0121 - mae: 0.0866 - val_loss: 0.0118 - val_mae: 0.0875
Epoch 442/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0116 - mae: 0.0868 - val_loss: 0.0119 - val_mae: 0.0875
Epoch 443/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0118 - mae: 0.0861 - val_loss: 0.0124 - val_mae: 0.0891
Epoch 444/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0883 - val_loss: 0.0121 - val_mae: 0.0883
Epoch 445/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0114 - mae: 0.0854 - val_loss: 0.0122 - val_mae: 0.0884
Epoch 446/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0893 - val_loss: 0.0116 - val_mae: 0.0866
Epoch 447/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0879 - val_loss: 0.0122 - val_mae: 0.0885
Epoch 448/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0121 - mae: 0.0878 - val_loss: 0.0117 - val_mae: 0.0868
Epoch 449/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0113 - mae: 0.0865 - val_loss: 0.0117 - val_mae: 0.0866
Epoch 450/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0112 - mae: 0.0855 - val_loss: 0.0133 - val_mae: 0.0930
Epoch 451/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0137 - mae: 0.0931 - val_loss: 0.0121 - val_mae: 0.0883
Epoch 452/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0117 - mae: 0.0861 - val_loss: 0.0114 - val_mae: 0.0862
Epoch 453/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0113 - mae: 0.0855 - val_loss: 0.0117 - val_mae: 0.0870
Epoch 454/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0135 - mae: 0.0928 - val_loss: 0.0118 - val_mae: 0.0870
Epoch 455/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0884 - val_loss: 0.0114 - val_mae: 0.0860
Epoch 456/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0125 - mae: 0.0904 - val_loss: 0.0117 - val_mae: 0.0869
Epoch 457/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0124 - mae: 0.0883 - val_loss: 0.0114 - val_mae: 0.0862
Epoch 458/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0122 - mae: 0.0873 - val_loss: 0.0117 - val_mae: 0.0869
Epoch 459/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0122 - mae: 0.0887 - val_loss: 0.0116 - val_mae: 0.0865
Epoch 460/500
10/10 [==============================] - 0s 5ms/step - loss: 0.0125 - mae: 0.0894 - val_loss: 0.0118 - val_mae: 0.0874
Epoch 461/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0115 - mae: 0.0857 - val_loss: 0.0115 - val_mae: 0.0863
Epoch 462/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0115 - mae: 0.0862 - val_loss: 0.0117 - val_mae: 0.0874
Epoch 463/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0118 - mae: 0.0880 - val_loss: 0.0119 - val_mae: 0.0876
Epoch 464/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0132 - mae: 0.0928 - val_loss: 0.0116 - val_mae: 0.0865
Epoch 465/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0135 - mae: 0.0922 - val_loss: 0.0116 - val_mae: 0.0865
Epoch 466/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0121 - mae: 0.0885 - val_loss: 0.0115 - val_mae: 0.0863
Epoch 467/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0117 - mae: 0.0868 - val_loss: 0.0116 - val_mae: 0.0871
Epoch 468/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0117 - mae: 0.0861 - val_loss: 0.0117 - val_mae: 0.0872
Epoch 469/500
10/10 [==============================] - 0s 17ms/step - loss: 0.0121 - mae: 0.0896 - val_loss: 0.0115 - val_mae: 0.0863
Epoch 470/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0896 - val_loss: 0.0125 - val_mae: 0.0895
Epoch 471/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0916 - val_loss: 0.0114 - val_mae: 0.0862
Epoch 472/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0113 - mae: 0.0854 - val_loss: 0.0114 - val_mae: 0.0861
Epoch 473/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0116 - mae: 0.0862 - val_loss: 0.0129 - val_mae: 0.0904
Epoch 474/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0138 - mae: 0.0954 - val_loss: 0.0127 - val_mae: 0.0901
Epoch 475/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0134 - mae: 0.0923 - val_loss: 0.0118 - val_mae: 0.0877
Epoch 476/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0121 - mae: 0.0877 - val_loss: 0.0115 - val_mae: 0.0862
Epoch 477/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0117 - mae: 0.0865 - val_loss: 0.0117 - val_mae: 0.0874
Epoch 478/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0130 - mae: 0.0899 - val_loss: 0.0113 - val_mae: 0.0859
Epoch 479/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0131 - mae: 0.0907 - val_loss: 0.0115 - val_mae: 0.0864
Epoch 480/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0122 - mae: 0.0877 - val_loss: 0.0118 - val_mae: 0.0877
Epoch 481/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0119 - mae: 0.0866 - val_loss: 0.0115 - val_mae: 0.0864
Epoch 482/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0118 - mae: 0.0874 - val_loss: 0.0115 - val_mae: 0.0866
Epoch 483/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0121 - mae: 0.0873 - val_loss: 0.0123 - val_mae: 0.0890
Epoch 484/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0127 - mae: 0.0898 - val_loss: 0.0116 - val_mae: 0.0868
Epoch 485/500
10/10 [==============================] - 0s 9ms/step - loss: 0.0112 - mae: 0.0845 - val_loss: 0.0123 - val_mae: 0.0890
Epoch 486/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0876 - val_loss: 0.0114 - val_mae: 0.0860
Epoch 487/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0116 - mae: 0.0852 - val_loss: 0.0118 - val_mae: 0.0873
Epoch 488/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0114 - mae: 0.0859 - val_loss: 0.0114 - val_mae: 0.0859
Epoch 489/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0117 - mae: 0.0871 - val_loss: 0.0130 - val_mae: 0.0917
Epoch 490/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0135 - mae: 0.0933 - val_loss: 0.0131 - val_mae: 0.0920
Epoch 491/500
10/10 [==============================] - 0s 8ms/step - loss: 0.0120 - mae: 0.0879 - val_loss: 0.0119 - val_mae: 0.0881
Epoch 492/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0115 - mae: 0.0859 - val_loss: 0.0115 - val_mae: 0.0863
Epoch 493/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0113 - mae: 0.0854 - val_loss: 0.0114 - val_mae: 0.0862
Epoch 494/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0114 - mae: 0.0866 - val_loss: 0.0116 - val_mae: 0.0868
Epoch 495/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0119 - mae: 0.0875 - val_loss: 0.0113 - val_mae: 0.0860
Epoch 496/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0118 - mae: 0.0861 - val_loss: 0.0114 - val_mae: 0.0863
Epoch 497/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0107 - mae: 0.0818 - val_loss: 0.0115 - val_mae: 0.0864
Epoch 498/500
10/10 [==============================] - 0s 7ms/step - loss: 0.0123 - mae: 0.0894 - val_loss: 0.0114 - val_mae: 0.0862
Epoch 499/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0126 - mae: 0.0895 - val_loss: 0.0113 - val_mae: 0.0857
Epoch 500/500
10/10 [==============================] - 0s 6ms/step - loss: 0.0121 - mae: 0.0882 - val_loss: 0.0115 - val_mae: 0.0865
/usr/local/lib/python3.6/dist-packages/tensorflow/python/keras/engine/training.py:2325: UserWarning: `Model.state_updates` will be removed in a future version. This property should not be used in TensorFlow 2.0, as `updates` are applied automatically.
  warnings.warn('`Model.state_updates` will be removed in a future version. '
/usr/local/lib/python3.6/dist-packages/tensorflow/python/keras/engine/base_layer.py:1397: UserWarning: `layer.updates` will be removed in a future version. This property should not be used in TensorFlow 2.0, as `updates` are applied automatically.
  warnings.warn('`layer.updates` will be removed in a future version. '
WARNING:tensorflow:FOR KERAS USERS: The object that you are saving contains one or more Keras models or layers. If you are loading the SavedModel with `tf.keras.models.load_model`, continue reading (otherwise, you may ignore the following instructions). Please change your code to save with `tf.keras.models.save_model` or `model.save`, and confirm that the file "keras.metadata" exists in the export directory. In the future, Keras will only load the SavedModels that have this file. In other words, `tf.saved_model.save` will no longer write SavedModels that can be recovered as Keras models (this will apply in TF 2.5).

FOR DEVS: If you are overwriting _tracking_metadata in your class, this property has been used to save metadata in the SavedModel. The metadta field will be deprecated soon, so please move the metadata to a different file.
INFO:tensorflow:Assets written to: models/model/assets
3. Plot Metrics
Each training epoch, the model prints out its loss and mean absolute error for training and validation. You can read this in the output above (note that your exact numbers may differ):

Epoch 500/500
10/10 [==============================] - 0s 10ms/step - loss: 0.0121 - mae: 0.0882 - val_loss: 0.0115 - val_mae: 0.0865
You can see that we've already got a huge improvement - validation loss has dropped from 0.15 to 0.01, and validation MAE has dropped from 0.33 to 0.08.

The following cell will print the same graphs we used to evaluate our original model, but showing our new training history:


# Draw a graph of the loss, which is the distance between
# the predicted and actual values during training and validation.
train_loss = history.history['loss']
val_loss = history.history['val_loss']

epochs = range(1, len(train_loss) + 1)

# Exclude the first few epochs so the graph is easier to read
SKIP = 100

plt.figure(figsize=(10, 4))
plt.subplot(1, 2, 1)

plt.plot(epochs[SKIP:], train_loss[SKIP:], 'g.', label='Training loss')
plt.plot(epochs[SKIP:], val_loss[SKIP:], 'b.', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()

plt.subplot(1, 2, 2)

# Draw a graph of mean absolute error, which is another way of
# measuring the amount of error in the prediction.
train_mae = history.history['mae']
val_mae = history.history['val_mae']

plt.plot(epochs[SKIP:], train_mae[SKIP:], 'g.', label='Training MAE')
plt.plot(epochs[SKIP:], val_mae[SKIP:], 'b.', label='Validation MAE')
plt.title('Training and validation mean absolute error')
plt.xlabel('Epochs')
plt.ylabel('MAE')
plt.legend()

plt.tight_layout()
     

Great results! From these graphs, we can see several exciting things:

The overall loss and MAE are much better than our previous network
Metrics are better for validation than training, which means the network is not overfitting
The reason the metrics for validation are better than those for training is that validation metrics are calculated at the end of each epoch, while training metrics are calculated throughout the epoch, so validation happens on a model that has been trained slightly longer.

This all means our network seems to be performing well! To confirm, let's check its predictions against the test dataset we set aside earlier:


# Calculate and print the loss on our test dataset
test_loss, test_mae = model.evaluate(x_test, y_test)

# Make predictions based on our test dataset
y_test_pred = model.predict(x_test)

# Graph the predictions against the actual values
plt.clf()
plt.title('Comparison of predictions and actual values')
plt.plot(x_test, y_test, 'b.', label='Actual values')
plt.plot(x_test, y_test_pred, 'r.', label='TF predicted')
plt.legend()
plt.show()
     
7/7 [==============================] - 0s 2ms/step - loss: 0.0102 - mae: 0.0815

Much better! The evaluation metrics we printed show that the model has a low loss and MAE on the test data, and the predictions line up visually with our data fairly well.

The model isn't perfect; its predictions don't form a smooth sine curve. For instance, the line is almost straight when x is between 4.2 and 5.2. If we wanted to go further, we could try further increasing the capacity of the model, perhaps using some techniques to defend from overfitting.

However, an important part of machine learning is knowing when to stop. This model is good enough for our use case - which is to make some LEDs blink in a pleasing pattern.

Generate a TensorFlow Lite Model
1. Generate Models with or without Quantization
We now have an acceptably accurate model. We'll use the TensorFlow Lite Converter to convert the model into a special, space-efficient format for use on memory-constrained devices.

Since this model is going to be deployed on a microcontroller, we want it to be as tiny as possible! One technique for reducing the size of a model is called quantization. It reduces the precision of the model's weights, and possibly the activations (output of each layer) as well, which saves memory, often without much impact on accuracy. Quantized models also run faster, since the calculations required are simpler.

In the following cell, we'll convert the model twice: once with quantization, once without.


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
     
2488
2. Compare Model Performance
To prove these models are accurate even after conversion and quantization, we'll compare their predictions and loss on our test dataset.

Helper functions

We define the predict (for predictions) and evaluate (for loss) functions for TFLite models. Note: These are already included in a TF model, but not in a TFLite model.


def predict_tflite(tflite_model, x_test):
  # Prepare the test data
  x_test_ = x_test.copy()
  x_test_ = x_test_.reshape((x_test.size, 1))
  x_test_ = x_test_.astype(np.float32)

  # Initialize the TFLite interpreter
  interpreter = tf.lite.Interpreter(model_content=tflite_model,
                                    experimental_op_resolver_type=tf.lite.experimental.OpResolverType.BUILTIN_REF)
  interpreter.allocate_tensors()

  input_details = interpreter.get_input_details()[0]
  output_details = interpreter.get_output_details()[0]

  # If required, quantize the input layer (from float to integer)
  input_scale, input_zero_point = input_details["quantization"]
  if (input_scale, input_zero_point) != (0.0, 0):
    x_test_ = x_test_ / input_scale + input_zero_point
    x_test_ = x_test_.astype(input_details["dtype"])
  
  # Invoke the interpreter
  y_pred = np.empty(x_test_.size, dtype=output_details["dtype"])
  for i in range(len(x_test_)):
    interpreter.set_tensor(input_details["index"], [x_test_[i]])
    interpreter.invoke()
    y_pred[i] = interpreter.get_tensor(output_details["index"])[0]
  
  # If required, dequantized the output layer (from integer to float)
  output_scale, output_zero_point = output_details["quantization"]
  if (output_scale, output_zero_point) != (0.0, 0):
    y_pred = y_pred.astype(np.float32)
    y_pred = (y_pred - output_zero_point) * output_scale

  return y_pred

def evaluate_tflite(tflite_model, x_test, y_true):
  global model
  y_pred = predict_tflite(tflite_model, x_test)
  loss_function = tf.keras.losses.get(model.loss)
  loss = loss_function(y_true, y_pred).numpy()
  return loss
     
1. Predictions


# Calculate predictions
y_test_pred_tf = model.predict(x_test)
y_test_pred_no_quant_tflite = predict_tflite(model_no_quant_tflite, x_test)
y_test_pred_tflite = predict_tflite(model_tflite, x_test)
     

# Compare predictions
plt.clf()
plt.title('Comparison of various models against actual values')
plt.plot(x_test, y_test, 'bo', label='Actual values')
plt.plot(x_test, y_test_pred_tf, 'ro', label='TF predictions')
plt.plot(x_test, y_test_pred_no_quant_tflite, 'bx', label='TFLite predictions')
plt.plot(x_test, y_test_pred_tflite, 'gx', label='TFLite quantized predictions')
plt.legend()
plt.show()
     

2. Loss (MSE/Mean Squared Error)


# Calculate loss
loss_tf, _ = model.evaluate(x_test, y_test, verbose=0)
loss_no_quant_tflite = evaluate_tflite(model_no_quant_tflite, x_test, y_test)
loss_tflite = evaluate_tflite(model_tflite, x_test, y_test)
     

# Compare loss
df = pd.DataFrame.from_records(
    [["TensorFlow", loss_tf],
     ["TensorFlow Lite", loss_no_quant_tflite],
     ["TensorFlow Lite Quantized", loss_tflite]],
     columns = ["Model", "Loss/MSE"], index="Model").round(4)
df
     
Loss/MSE
Model	
TensorFlow	0.0102
TensorFlow Lite	0.0102
TensorFlow Lite Quantized	0.0108
3. Size


# Calculate size
size_tf = os.path.getsize(MODEL_TF)
size_no_quant_tflite = os.path.getsize(MODEL_NO_QUANT_TFLITE)
size_tflite = os.path.getsize(MODEL_TFLITE)
     

# Compare size
pd.DataFrame.from_records(
    [["TensorFlow", f"{size_tf} bytes", ""],
     ["TensorFlow Lite", f"{size_no_quant_tflite} bytes ", f"(reduced by {size_tf - size_no_quant_tflite} bytes)"],
     ["TensorFlow Lite Quantized", f"{size_tflite} bytes", f"(reduced by {size_no_quant_tflite - size_tflite} bytes)"]],
     columns = ["Model", "Size", ""], index="Model")
     
Size	
Model		
TensorFlow	4096 bytes	
TensorFlow Lite	2788 bytes	(reduced by 1308 bytes)
TensorFlow Lite Quantized	2488 bytes	(reduced by 300 bytes)
Summary

We can see from the predictions (graph) and loss (table) that the original TF model, the TFLite model, and the quantized TFLite model are all close enough to be indistinguishable - even though they differ in size (table). This implies that the quantized (smallest) model is ready to use!

Note: The quantized (integer) TFLite model is just 300 bytes smaller than the original (float) TFLite model - a tiny reduction in size! This is because the model is already so small that quantization has little effect. Complex models with more weights, can have upto a 4x reduction in size!

Generate a TensorFlow Lite for Microcontrollers Model
Convert the TensorFlow Lite quantized model into a C source file that can be loaded by TensorFlow Lite for Microcontrollers.


# Install xxd if it is not available
!apt-get update && apt-get -qq install xxd
# Convert to a C source file, i.e, a TensorFlow Lite for Microcontrollers model
!xxd -i {MODEL_TFLITE} > {MODEL_TFLITE_MICRO}
# Update variable names
REPLACE_TEXT = MODEL_TFLITE.replace('/', '_').replace('.', '_')
!sed -i 's/'{REPLACE_TEXT}'/g_model/g' {MODEL_TFLITE_MICRO}
     
Ign:1 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  InRelease
Hit:2 https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/ InRelease
Ign:3 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  InRelease
Hit:4 http://ppa.launchpad.net/c2d4u.team/c2d4u4.0+/ubuntu bionic InRelease
Hit:5 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:6 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:7 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release
Hit:8 https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64  Release
Hit:9 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:10 http://ppa.launchpad.net/graphics-drivers/ppa/ubuntu bionic InRelease
Hit:11 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Reading package lists... Done
Deploy to a Microcontroller
Follow the instructions in the hello_world README.md for TensorFlow Lite for MicroControllers to deploy this model on a specific microcontroller.

Reference Model: If you have not modified this notebook, you can follow the instructions as is, to deploy the model. Refer to the hello_world/train/models directory to access the models generated in this notebook.

New Model: If you have generated a new model, then update the values assigned to the variables defined in hello_world/model.cc with values displayed after running the following cell.


# Print the C source file
!cat {MODEL_TFLITE_MICRO}
     
unsigned char g_model[] = {
  0x1c, 0x00, 0x00, 0x00, 0x54, 0x46, 0x4c, 0x33, 0x14, 0x00, 0x20, 0x00,
  0x1c, 0x00, 0x18, 0x00, 0x14, 0x00, 0x10, 0x00, 0x0c, 0x00, 0x00, 0x00,
  0x08, 0x00, 0x04, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00,
  0x98, 0x00, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00, 0x1c, 0x03, 0x00, 0x00,
  0x2c, 0x03, 0x00, 0x00, 0x30, 0x09, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x60, 0xf7, 0xff, 0xff,
  0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00,
  0x44, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x73, 0x65, 0x72, 0x76,
  0x65, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x73, 0x65, 0x72, 0x76,
  0x69, 0x6e, 0x67, 0x5f, 0x64, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xbc, 0xff, 0xff, 0xff,
  0x09, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,
  0x64, 0x65, 0x6e, 0x73, 0x65, 0x5f, 0x34, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x04, 0x00, 0x00, 0x00, 0x76, 0xfd, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00,
  0x0d, 0x00, 0x00, 0x00, 0x64, 0x65, 0x6e, 0x73, 0x65, 0x5f, 0x32, 0x5f,
  0x69, 0x6e, 0x70, 0x75, 0x74, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x0c, 0x00, 0x00, 0x00, 0x08, 0x00, 0x0c, 0x00, 0x08, 0x00, 0x04, 0x00,
  0x08, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x13, 0x00, 0x00, 0x00, 0x6d, 0x69, 0x6e, 0x5f, 0x72, 0x75, 0x6e, 0x74,
  0x69, 0x6d, 0x65, 0x5f, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6f, 0x6e, 0x00,
  0x0c, 0x00, 0x00, 0x00, 0x50, 0x02, 0x00, 0x00, 0x48, 0x02, 0x00, 0x00,
  0x34, 0x02, 0x00, 0x00, 0xdc, 0x01, 0x00, 0x00, 0x8c, 0x01, 0x00, 0x00,
  0x6c, 0x01, 0x00, 0x00, 0x5c, 0x00, 0x00, 0x00, 0x3c, 0x00, 0x00, 0x00,
  0x34, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00,
  0x04, 0x00, 0x00, 0x00, 0xfa, 0xfd, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0x31, 0x2e, 0x35, 0x2e, 0x30, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0xfd, 0xff, 0xff,
  0x88, 0xfd, 0xff, 0xff, 0x8c, 0xfd, 0xff, 0xff, 0x22, 0xfe, 0xff, 0xff,
  0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x21, 0xa5, 0x8b, 0xca,
  0x5e, 0x1d, 0xce, 0x42, 0x9d, 0xce, 0x1f, 0xb0, 0xdf, 0x54, 0x2f, 0x81,
  0x3e, 0xfe, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
  0xee, 0xfc, 0x00, 0xec, 0x05, 0x17, 0xef, 0xec, 0xe6, 0xf8, 0x03, 0x01,
  0x00, 0xfa, 0xf8, 0xf5, 0xdc, 0xeb, 0x27, 0x14, 0xf1, 0xde, 0xe2, 0xdb,
  0xf0, 0xde, 0x31, 0x06, 0x02, 0xe6, 0xee, 0xf9, 0x00, 0x16, 0x07, 0xe0,
  0xfe, 0xff, 0xe9, 0x06, 0xe7, 0xef, 0x81, 0x1b, 0x18, 0xea, 0xc9, 0x01,
  0x0f, 0x00, 0xda, 0xf7, 0x0e, 0xec, 0x13, 0x1f, 0x04, 0x13, 0xb4, 0xe6,
  0xfd, 0x06, 0xb9, 0xe0, 0x0d, 0xec, 0xf0, 0xde, 0xeb, 0xf7, 0x05, 0x26,
  0x1a, 0xe4, 0x6f, 0x1a, 0xea, 0x1e, 0x35, 0xdf, 0x1a, 0xf3, 0xf1, 0x19,
  0x0f, 0x03, 0x1b, 0xe1, 0xde, 0x13, 0xf6, 0x19, 0xff, 0xf6, 0x1b, 0x18,
  0xf0, 0x1c, 0xda, 0x1b, 0x1b, 0x20, 0xe5, 0x1a, 0xf5, 0xff, 0x96, 0x0b,
  0x00, 0x01, 0xcd, 0xde, 0x0d, 0xf6, 0x16, 0xe3, 0xed, 0xfc, 0x0e, 0xe9,
  0xfa, 0xeb, 0x5c, 0xfc, 0x1d, 0x02, 0x5b, 0xe2, 0xe1, 0xf5, 0x15, 0xec,
  0xf4, 0x00, 0x13, 0x05, 0xec, 0x0c, 0x1d, 0x14, 0x0e, 0xe7, 0x0b, 0xf4,
  0x19, 0x00, 0xd7, 0x05, 0x27, 0x02, 0x15, 0xea, 0xea, 0x02, 0x9b, 0x00,
  0x0c, 0xfa, 0xe8, 0xea, 0xfd, 0x00, 0x14, 0xfd, 0x0b, 0x02, 0xef, 0xee,
  0x06, 0xee, 0x01, 0x0d, 0x06, 0xe6, 0xf7, 0x11, 0xf7, 0x09, 0xf8, 0xf1,
  0x21, 0xff, 0x0e, 0xf3, 0xec, 0x12, 0x26, 0x1d, 0xf2, 0xe9, 0x28, 0x18,
  0xe0, 0xfb, 0xf3, 0xf4, 0x05, 0x1d, 0x1d, 0xfb, 0xfd, 0x1e, 0xfc, 0x11,
  0xe8, 0x07, 0x09, 0x03, 0x12, 0xf2, 0x36, 0xfb, 0xdc, 0x1c, 0xf9, 0xef,
  0xf3, 0xe7, 0x6f, 0x0c, 0x1d, 0x00, 0x45, 0xfd, 0x0e, 0xf0, 0x0b, 0x19,
  0x1a, 0xfa, 0xe0, 0x19, 0x1f, 0x13, 0x36, 0x1c, 0x12, 0xeb, 0x3b, 0x0c,
  0xb4, 0xcb, 0xe6, 0x13, 0xfa, 0xeb, 0xf1, 0x06, 0x1c, 0xfa, 0x18, 0xe5,
  0xeb, 0xcb, 0x0c, 0xf4, 0x4a, 0xff, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0x75, 0x1c, 0x11, 0xe1, 0x0c, 0x81, 0xa5, 0x42,
  0xfe, 0xd5, 0xd4, 0xb2, 0x61, 0x78, 0x19, 0xdf, 0x66, 0xff, 0xff, 0xff,
  0x04, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x77, 0x0b, 0x00, 0x00, 0x53, 0xf6, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
  0x77, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0xd3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x72, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2f, 0x07, 0x00, 0x00,
  0x67, 0xf5, 0xff, 0xff, 0x34, 0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
  0xb2, 0xff, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0xb5, 0x04, 0x00, 0x00, 0x78, 0x0a, 0x00, 0x00,
  0x2d, 0x06, 0x00, 0x00, 0x71, 0xf8, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,
  0x9a, 0x0a, 0x00, 0x00, 0xfe, 0xf7, 0xff, 0xff, 0x0e, 0x05, 0x00, 0x00,
  0xd4, 0x09, 0x00, 0x00, 0x47, 0xfe, 0xff, 0xff, 0xb6, 0x04, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0xac, 0xf7, 0xff, 0xff, 0x4b, 0xf9, 0xff, 0xff,
  0x4a, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x08, 0x00, 0x04, 0x00,
  0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x8c, 0xef, 0xff, 0xff, 0x84, 0xff, 0xff, 0xff, 0x88, 0xff, 0xff, 0xff,
  0x0f, 0x00, 0x00, 0x00, 0x4d, 0x4c, 0x49, 0x52, 0x20, 0x43, 0x6f, 0x6e,
  0x76, 0x65, 0x72, 0x74, 0x65, 0x64, 0x2e, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x18, 0x00, 0x14, 0x00,
  0x10, 0x00, 0x0c, 0x00, 0x08, 0x00, 0x04, 0x00, 0x0e, 0x00, 0x00, 0x00,
  0x14, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0xdc, 0x00, 0x00, 0x00,
  0xe0, 0x00, 0x00, 0x00, 0xe4, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x6d, 0x61, 0x69, 0x6e, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
  0x84, 0x00, 0x00, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x96, 0xff, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
  0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,
  0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0xca, 0xff, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x08, 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00,
  0xba, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00,
  0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,
  0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x00,
  0x16, 0x00, 0x00, 0x00, 0x10, 0x00, 0x0c, 0x00, 0x0b, 0x00, 0x04, 0x00,
  0x0e, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
  0x18, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00,
  0x08, 0x00, 0x07, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
  0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x4c, 0x04, 0x00, 0x00,
  0xd0, 0x03, 0x00, 0x00, 0x68, 0x03, 0x00, 0x00, 0x0c, 0x03, 0x00, 0x00,
  0x98, 0x02, 0x00, 0x00, 0x24, 0x02, 0x00, 0x00, 0xb0, 0x01, 0x00, 0x00,
  0x24, 0x01, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0xf0, 0xfb, 0xff, 0xff, 0x18, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x54, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09,
  0x6c, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
  0x01, 0x00, 0x00, 0x00, 0xdc, 0xfb, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00,
  0x18, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x4a, 0xce, 0x0a, 0x3c, 0x01, 0x00, 0x00, 0x00,
  0x34, 0x84, 0x85, 0x3f, 0x01, 0x00, 0x00, 0x00, 0xc5, 0x02, 0x8f, 0xbf,
  0x1e, 0x00, 0x00, 0x00, 0x53, 0x74, 0x61, 0x74, 0x65, 0x66, 0x75, 0x6c,
  0x50, 0x61, 0x72, 0x74, 0x69, 0x74, 0x69, 0x6f, 0x6e, 0x65, 0x64, 0x43,
  0x61, 0x6c, 0x6c, 0x3a, 0x30, 0x5f, 0x69, 0x6e, 0x74, 0x38, 0x00, 0x00,
  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x80, 0xfc, 0xff, 0xff, 0x18, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x54, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09,
  0x64, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
  0x10, 0x00, 0x00, 0x00, 0x6c, 0xfc, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00,
  0x18, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x80, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
  0x01, 0x00, 0x00, 0x00, 0x93, 0xd0, 0xc0, 0x3b, 0x01, 0x00, 0x00, 0x00,
  0xc2, 0x0f, 0xc0, 0x3f, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x14, 0x00, 0x00, 0x00, 0x74, 0x66, 0x6c, 0x2e, 0x66, 0x75, 0x6c, 0x6c,
  0x79, 0x5f, 0x63, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x65, 0x64, 0x31,
  0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0x08, 0xfd, 0xff, 0xff, 0x18, 0x00, 0x00, 0x00,
  0x20, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x09, 0x64, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,
  0xff, 0xff, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00, 0xf4, 0xfc, 0xff, 0xff,
  0x10, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x24, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x80, 0xff, 0xff, 0xff,
  0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0xe0, 0xdb, 0x47, 0x3c, 0x01, 0x00, 0x00, 0x00, 0x04, 0x14, 0x47, 0x40,
  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,
  0x74, 0x66, 0x6c, 0x2e, 0x66, 0x75, 0x6c, 0x6c, 0x79, 0x5f, 0x63, 0x6f,
  0x6e, 0x6e, 0x65, 0x63, 0x74, 0x65, 0x64, 0x00, 0x02, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0xfe, 0xff, 0xff,
  0x14, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x09, 0x50, 0x00, 0x00, 0x00, 0x6c, 0xfd, 0xff, 0xff,
  0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00,
  0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xfb, 0x4b, 0x0b, 0x3c,
  0x01, 0x00, 0x00, 0x00, 0x40, 0x84, 0x4b, 0x3f, 0x01, 0x00, 0x00, 0x00,
  0x63, 0x35, 0x8a, 0xbf, 0x0d, 0x00, 0x00, 0x00, 0x73, 0x74, 0x64, 0x2e,
  0x63, 0x6f, 0x6e, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x32, 0x00, 0x00, 0x00,
  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
  0x72, 0xfe, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00,
  0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x50, 0x00, 0x00, 0x00,
  0xdc, 0xfd, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00,
  0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x60, 0x01, 0x4f, 0x3c, 0x01, 0x00, 0x00, 0x00, 0x47, 0x6d, 0xb3, 0x3f,
  0x01, 0x00, 0x00, 0x00, 0x5d, 0x63, 0xcd, 0xbf, 0x0d, 0x00, 0x00, 0x00,
  0x73, 0x74, 0x64, 0x2e, 0x63, 0x6f, 0x6e, 0x73, 0x74, 0x61, 0x6e, 0x74,
  0x31, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0xe2, 0xfe, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00,
  0x48, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09,
  0x50, 0x00, 0x00, 0x00, 0x4c, 0xfe, 0xff, 0xff, 0x10, 0x00, 0x00, 0x00,
  0x18, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0xd5, 0x6b, 0x8a, 0x3b, 0x01, 0x00, 0x00, 0x00,
  0xab, 0x49, 0x01, 0x3f, 0x01, 0x00, 0x00, 0x00, 0xfd, 0x56, 0x09, 0xbf,
  0x0c, 0x00, 0x00, 0x00, 0x73, 0x74, 0x64, 0x2e, 0x63, 0x6f, 0x6e, 0x73,
  0x74, 0x61, 0x6e, 0x74, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x52, 0xff, 0xff, 0xff,
  0x14, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x02, 0x3c, 0x00, 0x00, 0x00, 0x44, 0xff, 0xff, 0xff,
  0x08, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x28, 0xb3, 0xd9, 0x38, 0x0c, 0x00, 0x00, 0x00,
  0x64, 0x65, 0x6e, 0x73, 0x65, 0x5f, 0x32, 0x2f, 0x62, 0x69, 0x61, 0x73,
  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
  0xaa, 0xff, 0xff, 0xff, 0x14, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00,
  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x38, 0x00, 0x00, 0x00,
  0x9c, 0xff, 0xff, 0xff, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0xdd, 0x9b, 0x21, 0x39, 0x0c, 0x00, 0x00, 0x00,
  0x64, 0x65, 0x6e, 0x73, 0x65, 0x5f, 0x33, 0x2f, 0x62, 0x69, 0x61, 0x73,
  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x0e, 0x00, 0x18, 0x00, 0x14, 0x00, 0x13, 0x00, 0x0c, 0x00,
  0x08, 0x00, 0x04, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x40, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02,
  0x48, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x08, 0x00, 0x04, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
  0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0xf4, 0xd4, 0x51, 0x38, 0x0c, 0x00, 0x00, 0x00, 0x64, 0x65, 0x6e, 0x73,
  0x65, 0x5f, 0x34, 0x2f, 0x62, 0x69, 0x61, 0x73, 0x00, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00, 0x1c, 0x00,
  0x18, 0x00, 0x17, 0x00, 0x10, 0x00, 0x0c, 0x00, 0x08, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x04, 0x00, 0x14, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00,
  0x2c, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x09, 0x84, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,
  0xff, 0xff, 0xff, 0xff, 0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x14, 0x00,
  0x10, 0x00, 0x0c, 0x00, 0x08, 0x00, 0x04, 0x00, 0x0c, 0x00, 0x00, 0x00,
  0x10, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,
  0x24, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x80, 0xff, 0xff, 0xff,
  0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x5d, 0x4f, 0xc9, 0x3c, 0x01, 0x00, 0x00, 0x00, 0x0e, 0x86, 0xc8, 0x40,
  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00,
  0x73, 0x65, 0x72, 0x76, 0x69, 0x6e, 0x67, 0x5f, 0x64, 0x65, 0x66, 0x61,
  0x75, 0x6c, 0x74, 0x5f, 0x64, 0x65, 0x6e, 0x73, 0x65, 0x5f, 0x32, 0x5f,
  0x69, 0x6e, 0x70, 0x75, 0x74, 0x3a, 0x30, 0x5f, 0x69, 0x6e, 0x74, 0x38,
  0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
  0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,
  0x24, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xd8, 0xff, 0xff, 0xff,
  0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06,
  0x0c, 0x00, 0x0c, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
  0x0c, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x72,
  0x0c, 0x00, 0x10, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,
  0x0c, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x09
};
unsigned int g_model_len = 2488;
```




