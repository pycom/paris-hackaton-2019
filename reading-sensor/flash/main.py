import time
from machine import Pin
from dth import DTH
import _thread

th = DTH(Pin('P23', mode=Pin.OPEN_DRAIN), 0)
time.sleep(2)


def send_env_data():
    while True:
        result = th.read()
        while not result.is_valid():
            time.sleep(.5)
            result = th.read()
        pybytes.send_signal(1, result.temperature) # noqa F821
        pybytes.send_signal(2, result.humidity) # noqa F821
        time.sleep(10)


_thread.start_new_thread(send_env_data, ())
