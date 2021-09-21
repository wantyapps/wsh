#include <stdio.h>
#include <stdlib.h>

#include "wsh_util.h"

void logPrint(char *prefix, char *message) {
	printf("%s %s\n", prefix, message);
}

void clear(void) {
    printf("\e[H\e[2J");
}

void wsh_version(void) {
    printf("WSH Version: 0.0.1\n");
}

void wsh_exit(void) {
    exit(0);
}
