#
# Device configuration for Vestel V TAB Z2 LTE (EKVATOR)
#
# Note: recovery/root is picked up automatically through
# TARGET_RECOVERY_DEVICE_DIRS in BoardConfig.mk, so no explicit
# PRODUCT_COPY_FILES entries are required for the ramdisk files.
#

LOCAL_PATH := device/vestel/EKVATOR

PRODUCT_PLATFORM := mt6765

PRODUCT_PROPERTY_OVERRIDES += \
    ro.board.platform=mt6765 \
    ro.product.device=EKVATOR \
    ro.product.name=EKVATOR \
    ro.product.model="V TAB Z2 LTE" \
    ro.product.manufacturer=Vestel \
    ro.product.brand=Vestel

# Static fs tools used by TWRP for formatting / repairing
PRODUCT_PACKAGES += \
    e2fsck_static \
    mke2fs_static \
    tune2fs_static

# fastbootd userspace daemon (TW_INCLUDE_FASTBOOTD in BoardConfig.mk only
# sets the compile flag; the binary still has to be pulled into the
# recovery ramdisk through PRODUCT_PACKAGES).
PRODUCT_PACKAGES += \
    fastbootd
