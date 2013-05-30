LOCAL_PATH:= $(call my-dir)

TARGET_OUT_VENDOR = $(TARGET_OUT)/vendor
TARGET_OUT_VENDOR_SHARED_LIBRARIES = $(TARGET_OUT)/vendor/lib

define PREBUILT_L_template
include $(CLEAR_VARS)
LOCAL_MODULE := $(1)
LOCAL_SRC_FILES := $$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)
endef

define create-TCL-symlink
$(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$(1) : $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$(2)
	@echo "<TCL>link: $$@ -> $$<"
	@rm -rf $$@
	@ln -sf $$(notdir $$<) $$@
ALL_DEFAULT_INSTALLED_MODULES += $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$(1)
ALL_MODULES.$(1).INSTALLED := $(ALL_MODULES.$(1).INSTALLED) $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/$(1)
endef

prebuilt_LIB := \
ld-2.13.so \
libc-2.13.so \
libgcc_s.so.1

prebuilt_LIB += \
	libAlog.so \
	libAcutil.so \
	libAz.so

$(foreach mylib,$(prebuilt_LIB), \
	$(eval $(call PREBUILT_L_template, $(mylib))))

$(eval $(call create-TCL-symlink,ld-linux.so.3,ld-2.13.so))
$(eval $(call create-TCL-symlink,libc.so.6,libc-2.13.so))
