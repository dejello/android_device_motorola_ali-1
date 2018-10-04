# Inherit from our custom product configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

$(call inherit-product, device/motorola/ali/full_ali.mk)

PRODUCT_NAME := lineage_ali
