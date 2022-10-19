include $(SRC_PATH)build/arch.mk
SHAREDLIBSUFFIX = so
SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP 
# fix undifined symbol: __stack_chk_guard bug
# flags needed to build wasm
CFLAGS += -U_FORTIFY_SOURCE -pthread -DWASMSIMD -msimd128 
CXXFLAGS += -U_FORTIFY_SOURCE -pthread -DWASMSIMD -msimd128 
LDFLAGS += -U_FORTIFY_SOURCE -pthread -msimd128
ifeq ($(EMFS), nodefs)
CFLAGS += -DNODEFS
CXXFLAGS += -DNODEFS 
LDFLAGS += -lnodefs.js
endif
ifeq ($(EMFS), noderawfs)
CFLAGS += -DNODERAWFS
CXXFLAGS += -DNODERAWFS
LDFLAGS += -s NODERAWFS=1
endif
ifeq ($(EMFS), memfs)
CFLAGS += -DMEMFS
CXXFLAGS += -DMEMFS
LDFLAGS += --preload-file ./testbin/workload
endif
ifeq ($(WASMDEBUG), True)
CFLAGS += -g2 
CXXFLAGS += -g2
LDFLAGS += -g2
endif

STATIC_LDFLAGS += -lm
AR_OPTS = crD $@