CC_CMD = @echo "CC $@"; $(CC) $(CFLAGS) -o $@ -c $<

all: wsh_util.o wsh_shell.o

wsh_util.o: wsh_util.c wsh_util.h
	$(CC_CMD)

wsh_shell.o: wsh_shell.c wsh_shell.h
	$(CC_CMD)

clean:
	@rm wsh_util.o
	@rm wsh_shell.o

.PHONY: all
