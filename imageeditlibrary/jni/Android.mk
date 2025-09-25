LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := photoprocessing

LOCAL_CFLAGS := -DANDROID_NDK \
                -DDISABLE_IMPORTGL
                
LOCAL_SRC_FILES := nanojpeg.c mem_utils.c bitmap.c bicubic_resize.c filter.c transform.c colour_space.c matrix.c blur.c photo_processing.c

# Alinhamento de página de 16 KB
LOCAL_LDFLAGS += -Wl,-z,common-page-size=16384 -Wl,-z,max-page-size=16384

LOCAL_LDLIBS    := -lm -llog -ljnigraphics -landroid $(extra_ldlibs)

include $(BUILD_SHARED_LIBRARY)