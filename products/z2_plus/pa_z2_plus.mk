# Copyright (C) 2016-2017 Paranoid Android
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

# Check for target product
ifeq (pa_z2_plus,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

TARGET_BOOT_ANIMATION_RES := 1080

# Advanced platform features
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

include device/qcom/common/common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/zuk/z2_plus/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_z2_plus
PRODUCT_DEVICE := z2_plus
PRODUCT_BRAND := ZUK
PRODUCT_MANUFACTURER := ZUK

PRODUCT_GMS_CLIENTID_BASE := android-zuk

# Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="z2_plus" \
    PRODUCT_NAME="z2_plus" \
    BUILD_FINGERPRINT="ZUK/z2_plus/z2_plus:6.0.1/MMB29M/1.9.077_160617:user/release-keys" \
    PRIVATE_BUILD_DESC="z2_plus-user 6.0.1 MMB29M 1.9.077_160617 release-keys"

# Paranoid Android platform
include vendor/pa/main.mk

endif

