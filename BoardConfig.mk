#
# Copyright (C) 2015-2016 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/ali

TARGET_RECOVERY_DEVICE_DIRS := $(DEVICE_PATH)

TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOARD_PLATFORM := msm8953

TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 vmalloc=400M androidboot.selinux=permissive
# For the love of all that is holy, please do not include this in your ROM unless you really want TWRP to not work correctly!
# Thanks to Erfanoabdi for this CMDLINE
BOARD_KERNEL_CMDLINE += androidboot.fastboot=1
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000
TARGET_KERNEL_SOURCE := kernel/motorola/ali
TARGET_KERNEL_CONFIG := ali_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-linux-androidkernel-
LZMA_RAMDISK_TARGETS := recovery

BOARD_USES_QCOM_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 23171072        #    22628 * 1024 mmcblk0p36
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23171072    #    22628 * 1024 mmcblk0p37
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3271557120    #  3194880 * 1024 mmcblk0p52
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26419903488 # 25800687 * 1024 mmcblk0p53

# don't take forever to wipe
BOARD_SUPPRESS_SECURE_ERASE := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
PLATFORM_SECURITY_PATCH := 2025-12-31

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_FSTAB := device/motorola/ali/twrp.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_NEW_ION_HEAP := true
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
