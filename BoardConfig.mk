#
# Copyright (C) 2013 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := device/samsung/ja3gduosctc

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := ja3gduosctc,i959,SCH-I959

# Platform
TARGET_SOC := exynos5410

# Kernel
TARGET_KERNEL_CONFIG := lineageos_ja3gduosctc_defconfig
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
TARGET_KERNEL_SOURCE := kernel/samsung/exynos5410-origin
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Linker
LINKER_FORCED_SHIM_LIBS := /system/bin/secgpsd|libdmitry.so

# Radio
SIM_COUNT := 2
TARGET_GLOBAL_CFLAGS += -DANDROID_MULTI_SIM
TARGET_GLOBAL_CPPFLAGS += -DANDROID_MULTI_SIM
BOARD_MODEM_TYPE := esc6270 mdm6600
BOARD_MODEM_NEEDS_VIDEO_CALL_FIELD := true
BOARD_PROVIDES_LIBRIL := false
BOARD_RIL_CLASS := ../../../device/samsung/ja3gduosctc/ril
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_SAMSUNG_DUAL_SIM := true
SEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM := true
BOARD_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.universal5410

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/ja3gduosctc/sepolicy

# inherit from the proprietary version
-include vendor/samsung/ja3gduosctc/BoardConfigVendor.mk

# inherit common board flags
include device/samsung/exynos5410-common/BoardConfigCommon.mk

# Filesystems
## (Workaround)Fix for recovery.img too large error when building
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
