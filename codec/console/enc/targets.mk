# This file is autogenerated, do not edit it directly, edit build/mktargets.py
# instead. To regenerate files, run build/mktargets.sh.

H264ENC_SRCDIR=codec/console/enc
H264ENC_CPP_SRCS=\
	$(H264ENC_SRCDIR)/src/welsenc.cpp\

H264ENC_OBJS += $(H264ENC_CPP_SRCS:.cpp=.$(OBJ))

OBJS += $(H264ENC_OBJS)

$(H264ENC_SRCDIR)/%.$(OBJ): $(H264ENC_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(H264ENC_CFLAGS) $(H264ENC_INCLUDES) -c $(CXX_O) $<

h264enc$(EXEEXT): $(H264ENC_OBJS) $(H264ENC_DEPS)
	$(QUIET_CXX)$(CXX) $(CXX_LINK_O) $(H264ENC_OBJS) $(H264ENC_LDFLAGS) $(LDFLAGS)

h264enc.html: $(H264ENC_OBJS) $(H264ENC_DEPS)
	$(QUIET_CXX)$(CXX) $(CXX_LINK_O) $(H264ENC_OBJS) $(H264ENC_LDFLAGS) $(LDFLAGS)

ifeq ($(OS), wasm)
binaries: h264enc.html
BINARIES += h264enc.html
else
binaries: h264enc$(EXEEXT)
BINARIES += h264enc$(EXEEXT)
endif