ifeq ($(BOARD_USES_HTC_CAMERA),true)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := cameraHAL.cpp
LOCAL_C_INCLUDES := frameworks/av/include
LOCAL_C_INCLUDES += frameworks/native/include

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libbinder
LOCAL_SHARED_LIBRARIES += libui libhardware libcamera_client
LOCAL_SHARED_LIBRARIES += libcamera libseccameraadaptor
LOCAL_PRELINK_MODULE := false


# hack for prebuilt
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libseccameraadaptor_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libseccameraadaptor_intermediates/export_includes)

include $(BUILD_SHARED_LIBRARY)

endif
