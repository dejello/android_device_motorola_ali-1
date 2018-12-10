#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from albus device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := ali
PRODUCT_MANUFACTURER := motorola
PRODUCT_NAME := lineage_ali
PRODUCT_MODEL := Motorola G6

PRODUCT_GMS_CLIENTID_BASE := android-motorola

TARGET_VENDOR := motorola
TARGET_VENDOR_PRODUCT_NAME := ali

PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="ali-user 8.0.0 OPS27.82-87 108 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/ali/ali:8.0.0/OPS27.82-87/108:user/release-keys
