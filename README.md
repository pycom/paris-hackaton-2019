# Paris Hackathon 2019

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


# Solutions
* `sudo chmod 755 FILE_NAME`


# Publicly accessible firmware links
* [FiPy](https://software.pycom.io/downloads/pybytes/FiPy.html)
* [LoPy4](https://software.pycom.io/downloads/pybytes/LoPy4.html)
* [GPy](https://software.pycom.io/downloads/pybytes/GPy.html)
* [WiPy](https://software.pycom.io/downloads/pybytes/WiPy.html)

# References
* [Pybytes documentation](https://docs.pycom.io/pybytes/)
