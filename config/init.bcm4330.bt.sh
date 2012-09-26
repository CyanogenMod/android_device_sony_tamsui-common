#!/system/bin/sh
# Copyright (c) 2009-2010, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Code Aurora nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

BLUETOOTH_SLEEP_PATH=/proc/bluetooth/sleep/proto
LOG_TAG="bcm4330-bluetooth"
LOG_NAME="${0}:"

bcm4330_pid=""

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

failed ()
{
  loge "$1: exit code $2"
  exit $2
}

start_hciattach ()
{
  /system/bin/brcm_patchram_plus --patchram $BTS_FIRMWARE_PATH --baudrate $BTS_BAUD --no2bytes --enable_hci $BTS_DEVICE --enable_lpm --use_baudrate_for_download --tosleep=50000&
  bcm4330_pid=$!
  logi "start_bcm4330: pid = $bcm4330_pid enable sleep lpm"
  echo 1 > $BLUETOOTH_SLEEP_PATH
}

kill_hciattach ()
{
  echo 0 > $BLUETOOTH_SLEEP_PATH
  logi "kill_bcm4330: pid = $bcm4330_pid"
  ## careful not to kill zero or null!
  kill -TERM $bcm4330_pid
  # this shell doesn't exit now -- wait returns for normal exit
}

BTS_DEVICE=${1:-"/dev/ttyHS0"}
BTS_TYPE=${2:-"any"}
BTS_BAUD=${3:-"4000000"}
BTS_FIRMWARE_PATH=${4:-"/system/etc/bcm4330/BCM4330B1_002.001.003.0750.0775.hcd"}

# init does SIGTERM on ctl.stop for service
trap "kill_hciattach" TERM INT

start_hciattach

wait $bcm4330_pid

logi "Bluetooth stopped"

exit 0
