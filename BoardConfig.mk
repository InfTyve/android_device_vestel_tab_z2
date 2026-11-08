#
# TWRP device tree for Vestel V TAB Z2 LTE (EKVATOR)
# SoC: MediaTek MT6765 / MT8768  |  Android 11 (SDK 30)  |  A-only, dynamic partitions
#

DEVICE_PATH := device/vestel/EKVATOR

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true

# Platform
TARGET_BOARD_PLATFORM := mt6765
TARGET_BOOTLOADER_BOARD_NAME := mt6765
TARGET_NO_BOOTLOADER := true

# Kernel (stock, gzip-compressed blob extracted from boot.img)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_TAGS_OFFSET := 0x07808000
BOARD_MKBOOTIMG_ARGS := --header_version 2 --ramdisk_offset 0x11a88000 --tags_offset 0x07808000 --dtb $(DEVICE_PATH)/prebuilt/dtb --dtb_offset 0x07808000

# Boot / recovery partitions (stock images are padded to 32 MiB)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_METADATA_PARTITION := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
TARGET_RECOVERY_DEVICE_DIRS := $(DEVICE_PATH)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# A-only, dynamic partitions (super)
BOARD_USES_DYNAMIC_PARTITIONS := true
TW_INCLUDE_LOGICAL := true

# fastbootd: needed to manage logical partitions with "fastboot reboot fastboot"
# (delete/resize/flash system inside super). Board must expose super + a
# working usb gadget; both are present on this platform.
TW_INCLUDE_FASTBOOTD := true

# AVB - keep verification off, do not re-sign
BOARD_AVB_ENABLE := false

# TWRP configuration
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := zh_CN
TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_DEFAULT_USB_INIT := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 150
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_SERIALNO_PROPERTY := true
TW_DEVICE_VERSION := EKVATOR-mt6765
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone1/temp"
TW_NO_SCREEN_TIMEOUT := false
TW_SKIP_COMPATIBILITY_CHECK := true
TW_HAS_NO_RECOVERY_PARTITION := false

# Crypto: MTK FBE/FDE needs vendor keymaster + TEE blobs that are not
# available in a recovery-only tree. Left disabled on purpose; use
# "Format Data" to remove encryption or decrypt in the running system.
TW_INCLUDE_CRYPTO := false

# Misc
TARGET_OTA_ASSERT_DEVICE := EKVATOR,ekvator
