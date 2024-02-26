#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char buf[512];

int
save(int fd, char *stringToBeAdded)
{
    int n, lengthOfStringToBeAdded;

    lengthOfStringToBeAdded = (int) strlen(stringToBeAdded);
    //strcpy(buf, stringToBeAdded);
    printf(1, "save: %s of size %d\n", stringToBeAdded, lengthOfStringToBeAdded);
    while((n = read(fd, buf, sizeof(buf))) > 0);
    if (write(fd, stringToBeAdded, lengthOfStringToBeAdded) != lengthOfStringToBeAdded) {
        printf(1, "save: write error\n");
        exit();
    }

    return 0;
}

int
main(int argc, char *argv[])
{
    int fd;

    if(argc <= 2){
        // Could provide a better error message here by calling save with unique arguments
        printf(1, "save: not enough arguments\n");
        exit();
    }

    if((fd = open(argv[1], O_RDWR | O_CREATE)) < 0){        
        printf(1, "save: cannot open %s\n", argv[1]);
        exit();
    }
    save(fd, argv[2]);
    close(fd);

    exit();
}