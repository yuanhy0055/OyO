LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

file := $(TARGET_ROOT_OUT_SBIN)/busybox
$(file) : $(LOCAL_PATH)/busybox | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

TOOLS := \
	cp \
	vi \
	du \
	wget \
	find \
	openvt \
	chvt \
	tty

SYMLINKS := $(addprefix $(TARGET_ROOT_OUT_SBIN)/,$(TOOLS))
$(SYMLINKS): BBOX_BINARY := busybox
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(BBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(BBOX_BINARY) $@
ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)
ALL_MODULES.busybox.INSTALLED := \
	$(ALL_MODULES.busybox.INSTALLED) $(SYMLINKS)

file := $(TARGET_ROOT_OUT_SBIN)/bash
$(file) : $(LOCAL_PATH)/bash | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= app-linux.cpp demo.c.arm
#LOCAL_SHARED_LIBRARIES := libEGL libGLESv1_CM libui
#LOCAL_MODULE:= aNgeles
#LOCAL_MODULE_TAGS := optional
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= yyjsvc.cpp edfw.cpp
LOCAL_SHARED_LIBRARIES:= libutils libbinder
#LOCAL_SHARED_LIBRARIES:= libutils libnicosvc
LOCAL_MODULE:= yyjsvc
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES := $(call all-subdir-java-files)
#LOCAL_MODULE := ynoak
#include $(BUILD_JAVA_LIBRARY)
#include $(CLEAR_VARS)
#ALL_PREBUILT += $(TARGET_OUT)/bin/yyoak
#$(TARGET_OUT)/bin/yyoak : $(LOCAL_PATH)/yyoak | $(ACP)
#	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := CallTTS.c
#LOCAL_STATIC_LIBRARIES:= libTTS
LOCAL_LDFLAGS += $(LOCAL_PATH)/libTTS.a
LOCAL_LD_LIBS += -lTTS -L$(LOCAL_PATH)
LOCAL_MODULE := libTCLtts
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
