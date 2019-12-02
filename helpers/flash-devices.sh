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

doMagic "Jovial-keller" "FiPy" "/dev/tty." "807D3AC2DDC0"
