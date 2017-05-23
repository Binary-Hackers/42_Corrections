#include <pthread.h>
#include <assert.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/wait.h>

static void *start0(void *arg) {
	pause();
	assert(0);
}

int main(int argc, char *argv[]) {
	pthread_t thread0;
	pid_t child, got_pid;
	int status;
	int i;

	child = fork();
	switch (child) {
		case -1:
			assert(0);
		case 0:
			i = pthread_create(&thread0, NULL, start0, NULL);
			assert(i == 0);
			sleep(1);
			exit(42);
			assert(0);
		default:
			sleep(2);
			got_pid = waitpid(-1, &status, 0);
			assert(got_pid == child);
			assert(WIFEXITED(status));
			assert(WEXITSTATUS(status) == 42);
			puts("OK");
			exit(0);
	}
	assert(0);
}
