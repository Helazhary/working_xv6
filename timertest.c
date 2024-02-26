#include "types.h"
#include "stat.h"
#include "user.h"
int count;
void handler();

int
main(int argc, char *argv[])
{
    if(argc < 2){
        printf(2, "usage: timertest ticks\n");
        exit();
    }
    int ticks = atoi(argv[1]);
    int i;
    printf(1, "timertest starting\n");
    settimer(ticks, handler);
    for(i = 0; i < 200*500000; i++){
        if((i++ % 500000) == 0)
            write(2, ".", 1);
    }
    printf(1, "\nTest done!\n");
    printf(1, "count: %d\n", count);
    exit();
}

void handler(){
    count++;
    printf(1, "alarm!\n");
}