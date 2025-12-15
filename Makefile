#
#  Makefile
#
#  Build dependencies: libvncserver-dev and libraspberrypi-dev
#

APP:=dispmanx_vncserver

# Optimization flags for better performance:
# -O3: Maximum optimization level
# -march=native: Optimize for the current CPU (comment out for cross-compilation)
# -funroll-loops: Unroll loops for better performance
# -ftree-vectorize: Enable auto-vectorization
CFLAGS:=-O3 -funroll-loops -ftree-vectorize

all: $(APP)

$(APP): main.c
	gcc $(CFLAGS) main.c -o $(APP) -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux -L/opt/vc/lib/ -lbrcmGLESv2 -lbrcmEGL -lopenmaxil -lbcm_host -lvcos -lvchiq_arm -lpthread -lrt -lvncserver

clean:
	rm -f $(APP)
