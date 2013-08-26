$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/tamsui-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Common Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh

# thermald config
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/thermald.conf:system/etc/thermald.conf

# QCOM Display
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libgenlock \
    libI420colorconvert \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libqdutils \
    libtilerenderer

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.sony \
    audio.primary.sony \
    libaudioutils

PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/audio_policy.conf:system/etc/audio_policy.conf \
    device/sony/tamsui-common/config/media_profiles.xml:system/etc/media_profiles.xml \
    device/sony/tamsui-common/config/media_codecs.xml:system/etc/media_codecs.xml \
    device/sony/tamsui-common/config/AudioFilter.csv:system/etc/AudioFilter.csv

# QCOM Power
PRODUCT_PACKAGES += \
    power.msm7x27a \

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
    gps.msm7x27a

# Light
PRODUCT_PACKAGES += \
    lights.msm7x27a

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# FmRadio
#PRODUCT_PACKAGES += \
#    FmRadioReceiver

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

# Ramdisk
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/config/init.sony.rc:root/init.sony.rc \
    device/sony/tamsui-common/config/ueventd.sony.rc:root/ueventd.sony.rc

# system props for the MM modules
PRODUCT_PROPERTY_OVERRIDES += \
   media.stagefright.enable-player=true \
   media.stagefright.enable-meta=false \
   media.stagefright.enable-scan=true \
   media.stagefright.enable-http=true \
   media.stagefright.enable-fma2dp=true \
   media.stagefright.enable-aac=true \
   media.stagefright.enable-qcp=true \
   debug.camcorder.disablemeta=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SonyQualcommRIL \
    ro.telephony.ril.v3=qcomdsds \
    ro.telephony.call_ring.multiple=false \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    keyguard.no_require_sim=1 \
    ro.use_data_netmgrd=true \
    ro.ril.transmitpower=true \
    persist.data.ds_fmc_app.mode=0 \
    persist.ims.regmanager.mode=0


# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    com.qc.hardware=true \
    debug.sf.hw=1 \
    debug.composition.type=mdp

## Reference values from CAF
PRODUCT_PROPERTY_OVERRIDES += \
    hwui.render_dirty_regions=false \
    ro.max.fling_velocity=4000

# QCOM CpuGovernorService
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

PRODUCT_PROPERTY_OVERRIDES += \
    hw.fm.isAnalog=true

PRODUCT_PROPERTY_OVERRIDES += \
    sys.mem.max_hidden_apps=10

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

$(call inherit-product, vendor/sony/qcom-common/common-vendor.mk)

$(call inherit-product, vendor/sony/tamsui-common/common-vendor.mk)
