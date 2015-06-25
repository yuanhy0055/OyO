BUILD_NETD := false
ifneq ($(TARGET_SIMULATOR),true)
    BUILD_NETD := true
endif

ifeq ($(BUILD_NETD),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=                                      \
                  main.cpp                             \
                  CommandListener.cpp                  \
                  NetdCommand.cpp                      \
                  NetlinkManager.cpp                   \
                  NetlinkHandler.cpp                   \
                  logwrapper.c                         \
                  TetherController.cpp                 \
                  NatController.cpp                    \
                  PppController.cpp                    \
                  SoftapController.cpp                 \
                  UsbController.cpp                    \
                  ThrottleController.cpp

LOCAL_MODULE:= netd

LOCAL_C_INCLUDES := $(KERNEL_HEADERS) \
                    external/openssl/include

LOCAL_CFLAGS :=
ifdef WIFI_DRIVER_FW_STA_PATH
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_STA_PATH=\"$(WIFI_DRIVER_FW_STA_PATH)\"
endif
ifdef WIFI_DRIVER_FW_AP_PATH
LOCAL_CFLAGS += -DWIFI_DRIVER_FW_AP_PATH=\"$(WIFI_DRIVER_FW_AP_PATH)\"
endif

LOCAL_SHARED_LIBRARIES := libsysutils libcutils libnetutils libcrypto

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:=          \
                  ndc.c \

LOCAL_MODULE:= ndc

LOCAL_C_INCLUDES := $(KERNEL_HEADERS)

LOCAL_CFLAGS := 

LOCAL_SHARED_LIBRARIES := libcutils

include $(BUILD_EXECUTABLE)

endif # ifeq ($(BUILD_NETD,true)
