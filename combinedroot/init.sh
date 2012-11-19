#!/sbin/busybox sh
set +x
_PATH="$PATH"
export PATH=/sbin

busybox cd /
busybox date >>boot.txt
exec >>boot.txt 2>&1
busybox rm /init

# include device specific vars
source /sbin/bootrec-device

# create directories
busybox mkdir -m 755 -p /cache
busybox mkdir -m 755 -p /dev/block
busybox mkdir -m 755 -p /dev/input
busybox mkdir -m 555 -p /proc
busybox mkdir -m 755 -p /sys

# create device nodes
busybox mknod -m 600 /dev/block/mmcblk0 b 179 0
busybox mknod -m 600 ${BOOTREC_CACHE_NODE}
busybox mknod -m 600 ${BOOTREC_EVENT_NODE}
busybox mknod -m 666 /dev/null c 1 3

# mount filesystems
busybox mount -t proc proc /proc
busybox mount -t sysfs sysfs /sys
busybox mount -t ext4 ${BOOTREC_CACHE} /cache

# trigger ON amber LED
busybox echo ${BOOTREC_RED_LED_ON} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_GREEN_LED_OFF} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_BLUE_LED_ON} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_BUTTON_LED_ON} > ${BOOTREC_CONTROL_LED}

# keycheck
busybox cat ${BOOTREC_EVENT} > /dev/keycheck&
busybox sleep 3

# trigger OFF amber LED
busybox echo ${BOOTREC_RED_LED_OFF} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_GREEN_LED_OFF} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_BLUE_LED_OFF} > ${BOOTREC_CONTROL_LED}
busybox echo ${BOOTREC_BUTTON_LED_OFF} > ${BOOTREC_CONTROL_LED}

# android ramdisk
load_image=/sbin/ramdisk.cpio

# boot decision
if [ -s /dev/keycheck -o -e /cache/recovery/boot ]
then
	busybox echo 'RECOVERY BOOT' >>boot.txt
	busybox rm -fr /cache/recovery/boot
	# trigger blue led
	busybox echo ${BOOTREC_RED_LED_OFF} > ${BOOTREC_CONTROL_LED}
	busybox echo ${BOOTREC_GREEN_LED_OFF} > ${BOOTREC_CONTROL_LED}
	busybox echo ${BOOTREC_BLUE_LED_ON} > ${BOOTREC_CONTROL_LED}
	# recovery ramdisk
	load_image=/sbin/ramdisk-recovery.cpio
else
	busybox echo 'ANDROID BOOT' >>boot.txt
	# poweroff LED
	busybox echo ${BOOTREC_RED_LED_OFF} > ${BOOTREC_CONTROL_LED}
	busybox echo ${BOOTREC_GREEN_LED_OFF} > ${BOOTREC_CONTROL_LED}
	busybox echo ${BOOTREC_BLUE_LED_OFF} > ${BOOTREC_CONTROL_LED}
fi

# kill the keycheck process
busybox pkill -f "busybox cat ${BOOTREC_EVENT}"

# unpack the ramdisk image
busybox cpio -i < ${load_image}

busybox umount /cache
busybox umount /proc
busybox umount /sys

busybox rm -fr /dev/*
busybox date >>boot.txt
export PATH="${_PATH}"
exec /init
