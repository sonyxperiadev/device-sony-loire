# Copyright (C) 2014 The Android Open Source Project
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

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

SOMC_PLATFORM := loire

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/aanc_tuning_mixer_wcd9335.txt:system/etc/aanc_tuning_mixer_wcd9335.txt \
    $(SONY_ROOT)/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/system/etc/media_profiles_V1_0.xml:system/vendor/etc/media_profiles_V1_0.xml

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/rqbalance_config.xml:system/etc/rqbalance_config.xml

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# Platform Init
PRODUCT_PACKAGES += \
    fstab.loire \
    init.loire.pwr

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8952

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8952 \
    gralloc.msm8952 \
    hwcomposer.msm8952 \
    memtrack.msm8952

# GPS
PRODUCT_PACKAGES += \
    gps.msm8952

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8952

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8952

# OpenGLES Nougat version
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# aDSP sensors
## max rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.max_accel_rate=false \
    ro.qti.sensors.max_gyro_rate=false \
    ro.qti.sensors.max_mag_rate=false \
    ro.qti.sensors.max_geomag_rotv=50

## sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sdk.sensors.gestures=false \
    ro.qti.sensors.pedometer=false \
    ro.qti.sensors.step_detector=false \
    ro.qti.sensors.step_counter=false \
    ro.qti.sensors.pam=false \
    ro.qti.sensors.scrn_ortn=false \
    ro.qti.sensors.smd=false \
    ro.qti.sensors.game_rv=false \
    ro.qti.sensors.georv=false \
    ro.qti.sensors.cmc=false \
    ro.qti.sensors.bte=false \
    ro.qti.sensors.fns=false \
    ro.qti.sensors.qmd=false \
    ro.qti.sensors.amd=false \
    ro.qti.sensors.rmd=false \
    ro.qti.sensors.vmd=false \
    ro.qti.sensors.gtap=false \
    ro.qti.sensors.tap=false \
    ro.qti.sensors.facing=false \
    ro.qti.sensors.tilt=false \
    ro.qti.sensors.tilt_detector=false \
    ro.qti.sensors.dpc=false \
    ro.qti.sensors.als_scale=1 \
    ro.qti.sensors.wu=true

# VIDC configuration
## Downscalar
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.dec.enable.downscalar=1 \
    vidc.dec.downscalar_width=1920 \
    vidc.dec.downscalar_height=1088

## Others
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.enc.disable_bframes=1 \
    vidc.enc.disable_pframes=1 \
    vidc.disable.split.mode=1

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=msm_hsusb
