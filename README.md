# Paris Hackathon 2019

# Prerequisites Steps
* IDE _anyone of the below Code editor_
  * [Atom](https://atom.io)
  * [VSC](https://code.visualstudio.com)
* Pymakr Plugin
  * [Installation Steps](https://docs.pycom.io/pymakr/installation/)
  * In case you get any error while adding **Pymakr** Plugin
    * Make sure that your Code editor is on the latest version
    * Install Node
    * Install `prebuild-install`
    ```
    npm install -g prebuild-install
    ```
    * For Linux & Unix user
    ```bash
    cd ~/.atom/packages/pymakr/node_modules/\@serialport/bindings
    ```
    * For Windows users
    ```bash
    cd %USERPROFILE%/.atom/packages/pymakr/node_modules/\@serialport/bindings
    ```
    * Run
    ```bash
    prebuild-install --runtime electron --target 4.2.7 --tag-prefix @serialport/bindings@ --verbose
    ```

* Pycom Firmware Updater
  * [Installation Steps](https://pycom.io/downloads/#firmware)

# Temperature sensor
To connect the temperature sensor to the device you should connect the following:
* `+` to the `3v3` pin
* `-` to the *GND*
* `out` to the `P23` pin

# Code Snippet
* switch to *wifi* network and *reconnect*
```python
pybytes.set_config('network_preferences', ['wifi'])
pybytes.reconnect()
```
* Enable Debugging
```python
import pycom
pycom.nvs_set('pybytes_debug', 6)
```
* Change or Set Lora Region
```python
from network import LoRa
pybytes.update_config('lora', { 'region': LoRa.EU868 })
```
* Send Data to Pybytes
```python
pybytes.send_signal(SIGNAL_NUMBER, DATA)
```
* Deep Sleep
```python
pybytes.deepsleep(10000)  # 10 sec sleep
```
# Solutions
* `sudo chmod 755 FILE_NAME`


# Publicly accessible firmware links
* [FiPy](https://software.pycom.io/downloads/pybytes/FiPy.html)
* [LoPy4](https://software.pycom.io/downloads/pybytes/LoPy4.html)
* [GPy](https://software.pycom.io/downloads/pybytes/GPy.html)
* [WiPy](https://software.pycom.io/downloads/pybytes/WiPy.html)

# References
* [Pybytes documentation](https://docs.pycom.io/pybytes/)
