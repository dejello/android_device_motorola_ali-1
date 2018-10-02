# Inherit from our custom product configuration
$(call inherit-product, vendor/cm/config/common.mk)

$(call inherit-product, device/motorola/ali/full_ali.mk)

PRODUCT_NAME := lineage_ali
