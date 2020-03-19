#!/usr/bin/env bash

# get Wireless MAC Address
# import machine; import ubinascii; ubinascii.hexlify(machine.unique_id()).decode('ascii').upper()

# https://www.devdungeon.com/content/taking-command-line-arguments-bash
MINICOM_ONLY=false

#!/bin/bash
for arg in "$@"
do
    if [[ "$arg" == "--minicom-only" ]]
    then
        echo "--minicom-only argument detected"
        MINICOM_ONLY=true
    fi
done

FW_TYPE="pybytes-production"
FW_VERSION="1.20.1.r2"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LOG_DIR="${SCRIPT_DIR}/logs"
FW_PATH="${SCRIPT_DIR}/${FW_TYPE}/${FW_VERSION}"

rm -rf "${LOG_DIR}"
mkdir "${LOG_DIR}"

doMagic () {
  NAME=$1
  TYPE=$2
  PORT=$3
  WMAC=$4
  FULL_DEV_NAME="${NAME}-${TYPE}-${WMAC}"
  MINICOM_CMD="minicom -D ${PORT} -b 115200 -C ${LOG_DIR}/${FULL_DEV_NAME}.log"

  if [[ ${MINICOM_ONLY} == true ]]
  then
      ttab -t "${FULL_DEV_NAME}" -G "${MINICOM_CMD}";
  else
      ttab -t "${FULL_DEV_NAME}" -G "cd ${FW_PATH} && pycom-fwtool-cli -p ${PORT} erase_all && pycom-fwtool-cli -vp ${PORT} flash -t ${TYPE}-${FW_VERSION}.tar.gz && ${MINICOM_CMD}" ;
  fi
}


# doMagic "FiPy-807D3AC2DDC0" "FiPy" "/dev/tty.usbmodemPyb4ed8a1" "807D3AC2DDC0"
# doMagic "FiPy-807D3AC343A4" "FiPy" "/dev/tty.usbmodemPy6995751" "807D3AC343A4"
# doMagic "FiPy-807D3AC2DDC0" "FiPy" "/dev/tty.usbmodemPyb4ed8a1" "807D3AC2DDC0"
# doMagic "FiPy-807D3AC34244" "FiPy" "/dev/tty.usbmodemPybe3cb51" "807D3AC34244"
# doMagic "FiPy-807D3AC3441C" "FiPy" "/dev/tty.usbmodemPy6588f51" "807D3AC3441C"
# doMagic "FiPy-807D3AC34430" "FiPy" "/dev/tty.usbmodemPy667c3c1" "807D3AC34430"
# doMagic "FiPy-807D3AC268C8" "FiPy" "/dev/tty.usbmodemPyeb07361" "807D3AC268C8"
doMagic "WiPy-30AEA42D1888" "WiPy" "/dev/tty.usbmodemPyae536c1" "30AEA42D1888"
# doMagic "FiPy-466a9c1" "FiPy" "/dev/tty.usbmodemPy466a9c1" "466a9c1"
# doMagic "FiPy-5f51eb1" "FiPy" "/dev/tty.usbmodemPy5f51eb1" "5f51eb1"
#
# doMagic "Jovial-keller" "FiPy" "/dev/tty.usbmodemPyadad0c1" "807D3AC31340"
# doMagic "Dreamy-shirley" "LoPy4" "/dev/tty.usbmodemPyc6b8231" "30AEA42D32A4"
# doMagic "Khaki-harbor" "LoPy4" "/dev/tty.usbmodemPyc699771" "30AEA42D32D8"
# doMagic "Orange-regret" "GPy" "/dev/tty.usbmodemPy935f161" "30AEA42CEC4C"
# doMagic "Square-swim" "FiPy" "/dev/tty.usbmodemPy8d75da1" "807D3AC322A8"
