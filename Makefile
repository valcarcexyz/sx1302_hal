LIBLORAGW_VERSION = v2.1.0

AR = ar
CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c99 -DLIBLORAGW_VERSION=\"$(LIBLORAGW_VERSION)\" -I./inc -I./external
# LIBS := -lloragw -ltinymt32 -lrt -lm
# CFLAGS := -O2 -Wall -Wextra -std=c99 -Iinc -I. -I../libtools/inc

OBJDIR = obj
INCLUDES = $(wildcard inc/*.h) #$(wildcard ../libtools/inc/*.h)

all: libloragw.a

clean:
	rm -f libloragw.a
	rm -f $(OBJDIR)/*.o

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: src/%.c $(INCLUDES) | $(OBJDIR)
	$(CC) -c $(CFLAGS) $< -o $@

### static library

libloragw.a: $(OBJDIR)/loragw_spi.o \
			 $(OBJDIR)/loragw_usb.o \
			 $(OBJDIR)/loragw_com.o \
			 $(OBJDIR)/loragw_mcu.o \
			 $(OBJDIR)/loragw_i2c.o \
			 $(OBJDIR)/sx125x_spi.o \
			 $(OBJDIR)/sx125x_com.o \
			 $(OBJDIR)/sx1250_spi.o \
			 $(OBJDIR)/sx1250_usb.o \
			 $(OBJDIR)/sx1250_com.o \
			 $(OBJDIR)/sx1261_spi.o \
			 $(OBJDIR)/sx1261_usb.o \
			 $(OBJDIR)/sx1261_com.o \
			 $(OBJDIR)/loragw_aux.o \
			 $(OBJDIR)/loragw_reg.o \
			 $(OBJDIR)/loragw_sx1250.o \
			 $(OBJDIR)/loragw_sx1261.o \
			 $(OBJDIR)/loragw_sx125x.o \
			 $(OBJDIR)/loragw_sx1302.o \
			 $(OBJDIR)/loragw_cal.o \
			 $(OBJDIR)/loragw_debug.o \
			 $(OBJDIR)/loragw_hal.o \
			 $(OBJDIR)/loragw_lbt.o \
			 $(OBJDIR)/loragw_stts751.o \
			 $(OBJDIR)/loragw_gps.o \
			 $(OBJDIR)/loragw_sx1302_timestamp.o \
			 $(OBJDIR)/loragw_sx1302_rx.o \
			 $(OBJDIR)/loragw_ad5338r.o
	$(AR) rcs $@ $^
