LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),tapioca_ss)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
