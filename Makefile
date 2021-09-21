include config.mk

MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

CC_CMD = @echo "CC $@"; $(CC) $(CFLAGS) -o $@ -c $<

SUBDIRS := $(wildcard */.)

all: options $(SUBDIRS) $(TARGET).o $(WSH_UTIL_DIR) $(TARGET)

$(SUBDIRS):
	@$(MAKE) -C $@

$(WSH_UTIL_DIR):
	@$(MAKE) -C $@

options:
	@echo "CC              : $(CC)"
	@echo "WSH_UTIL_DIR    : $(WSH_UTIL_DIR)"
	@echo "CFLAGS          : $(CFLAGS)"
	@echo "TARGET          : $(TARGET)"
	@echo "TARGET_BUILD_DIR: $(TARGET_BUILD_DIR)\n\n"

$(TARGET).o: $(TARGET).c $(WSH_UTIL_DIR)/wsh_util.o
	$(CC_CMD)

$(TARGET): $(TARGET).o $(WSH_UTIL_DIR)/wsh_util.o $(WSH_UTIL_DIR)/wsh_shell.o
	@if [ ! -d $(TARGET_BUILD_DIR) ]; then mkdir $(TARGET_BUILD_DIR); fi
	$(CC) $(CFLAGS) $(WSH_UTIL_DIR)/wsh_util.o $(WSH_UTIL_DIR)/wsh_shell.o $(TARGET).o -o $(TARGET_BUILD_DIR)/$(TARGET)

clean:
	@rm $(TARGET).o
	@rm -r $(TARGET_BUILD_DIR)
	@$(MAKE) -C $(WSH_UTIL_DIR) clean

install: $(TARGET_BUILD_DIR)/$(TARGET)
	@cp $(TARGET_BUILD_DIR)/$(TARGET) /usr/local/bin/

.PHONY: clean all $(SUBDIRS)
