# Copyright 2014 The Android Open Source Project
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

# Platform path
PLATFORM_COMMON_PATH := device/sony/loire
PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8952
TARGET_KERNEL_VERSION := 4.4

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

TARGET_USES_64_BIT_BINDER := true
TARGET_USES_64_BIT_BCMDHD := true

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_KERNEL_BASE        := 0x20000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci

# Serial console
ifeq ($(BOARD_ENABLE_SERIAL_CONSOLE),true)
BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x7af0000 androidboot.console=msm_serial_dm,0x7af0000
endif

TARGET_RECOVERY_FSTAB = $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.loire

# Wi-Fi definitions for Broadcom solution
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_COMMON_PATH)/bluetooth/vnd_generic.txt

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NXP_CHIP_TYPE := PN547C2
NXP_CHIP_FW_TYPE := PN547C2

# SELinux
BOARD_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# FPC version select
TARGET_FPC_VERSION := N

# Legacy Keymaster
TARGET_LEGACY_KEYMASTER := true

# Platform witout a vendor partition
TARGET_COPY_OUT_VENDOR := system/vendor

include device/sony/common/CommonConfig.mk
