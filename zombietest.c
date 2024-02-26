#include "types.h"
#include "user.h"

int main(void) {
    int children = 5;
    int i;

    for (i = 0; i < children; i++) {
        int pid = fork();
        if (pid == 0) { //just checks if succesfully forked
            exit();
        }
    }

    sleep(100);
    printf(1, "Zombie Count = %d\n", getzombcount());

    for (i = 0; i < children; i++) {
        wait();
    }

    exit();
}
