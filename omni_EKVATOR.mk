#
# Product definition for Vestel V TAB Z2 LTE (EKVATOR)
#

# 64-bit with 32-bit secondary (matches ro.zygote=zygote64_32 on stock)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/vestel/EKVATOR/device.mk)

PRODUCT_DEVICE := EKVATOR
PRODUCT_NAME := omni_EKVATOR
PRODUCT_BRAND := Vestel
PRODUCT_MODEL := V TAB Z2 LTE
PRODUCT_MANUFACTURER := Vestel

PRODUCT_GMS_CLIENTID_BASE := android-vestel

# Assert the device during flashing
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=EKVATOR \
    PRODUCT_NAME=EKVATOR \
    TARGET_DEVICE=EKVATOR
