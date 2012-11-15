TARGET_SPECIFIC_HEADER_PATH := device/sony/tamsui-common/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_HAS_NO_MISC_PARTITION := true

# Platform
TARGET_BOOTLOADER_BOARD_NAME := tamsui
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true
TARGET_CORTEX_CACHE_LINE_32 := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK

# Kernel information
TARGET_KERNEL_SOURCE := kernel/sony/msm7x27a
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
BOARD_KERNEL_BASE := 0x00200000
BOARD_RECOVERY_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_BOOT_ADDRESS    := 0x00208000
BOARD_FORCE_RAMDISK_ADDRESS := 0x01400000

# Wifi related defines
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_HAVE_BYPASS := false
TARGET_USES_SF_BYPASS := false
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := false
TARGET_NO_BYPASS_CROPPING := false
TARGET_QCOM_HDMI_OUT := false
TARGET_QCOM_HDMI_RESOLUTION_AUTO := false
BOARD_EGL_CFG := device/sony/tamsui-common/config/egl.cfg

TARGET_PROVIDES_LIBLIGHTS := true

# Workaround for missing symbols in camera
BOARD_NEEDS_MEMORYHEAPPMEM := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_PMEM := true

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := sony
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Custom boot
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_PRE_COMMAND := "touch /cache/recovery/boot;sync;"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/tamsui-common/custombootimg.mk
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/sony/tamsui-common/releasetools/semc_ota_from_target_files
#BOARD_CUSTOM_GRAPHICS := ../../../device/sony/tamsui-common/recovery/recovery-gfx.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sony/tamsui-common/recovery/recovery-keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

#TARGET_BOOTANIMATION_PRELOAD := true

# Nicer font rendering
BOARD_USE_SKIA_LCDTEXT := true

# Audio
#COMMON_GLOBAL_CFLAGS += -DQCOM_VOIP_ENABLED
#BOARD_HAVE_SONY_AUDIO := true
#BOARD_HAVE_BACK_MIC_CAMCORDER := true
