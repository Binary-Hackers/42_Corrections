#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int
main(int argc, char *argv[])
{
	char *c;
	int fd;

	fd = open("/tmp/delme", O_RDWR);
	c = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	*c = 0;
	if (fork()) {
		while (1) {
			strcpy(c, "/etc/passwd");
			strcpy(c, "/etc/shadow");
		}
	} else {
		while (1)
			if ((fd = open(c, 0)) != -1)
				close(fd);
	}
	return 0;
}
