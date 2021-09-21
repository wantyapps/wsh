#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>

#include "util/wsh_util.h"
#include "util/wsh_shell.h"
#include "config.h"

int main(void) {
	if ( WSH_DEBUG_MODE == 1 ) {
		logPrint("[DEBUG]", "Enabled debug Mode");
	}
	
	shell(WSH_DEBUG_MODE);

	return 0;
}
