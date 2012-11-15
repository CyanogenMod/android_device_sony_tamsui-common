$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Recovery resources
$(call inherit-product, device/sony/tamsui-common/recovery/recovery.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/tamsui-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# EGL config
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/egl.cfg:system/lib/egl/egl.cfg

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/init.bcm4330.bt.sh:system/etc/init.bcm4330.bt.sh \
    device/sony/tamsui-common/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm7x27 \
    gralloc.msm7x27 \
    hwcomposer.msm7x27 \
    libgenlock \
    libI420colorconvert \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libqdutils \
    libtilerenderer

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras


# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    audio_policy.conf \
    libaudioutils

PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/media_codecs.xml:system/etc/media_codecs.xml

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27

# Light
PRODUCT_PACKAGES += \
    lights.msm7x27

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Custom init / uevent
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/init.Sony.rc:root/init.Sony.rc \
    device/sony/tamsui-common/config/ueventd.Sony.rc:root/ueventd.Sony.rc

# Recovery bootstrap script
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/recovery/bootrec:root/sbin/bootrec

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb
