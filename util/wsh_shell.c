#include <string.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <ctype.h>

#include "wsh_shell.h"
#include "wsh_util.h"

void shell(int debugMode, int startupClear) {
	int mainLoop = 1;
	if ( startupClear == 1 ) clear();

	while ( mainLoop == 1 ) {
		char *command = readline("WSH> ");
		if ( strcmp(command, "") != 0 ) {
			add_history(command);
		};
		char lowercase[1000];
		for ( int i = 0; i <= strlen(command); i++ ) {
			lowercase[i] = tolower(command[i]);
		};

		if ( strcmp(lowercase, "clear") == 0 ) { // There has to be a better way to do this.
			clear();
		} else if ( strcmp(lowercase, "wsh_version") == 0 ) {
			wsh_version();
		} else if ( strcmp(lowercase, "exit") == 0 ) {
			wsh_exit();
		} else if ( strcmp(lowercase, "help") == 0 ) {
			wsh_help();
		};
	};
}
