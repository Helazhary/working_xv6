#include "types.h"
#include "stat.h"
#include "user.h"
#include "date.h"

void 
testDateTime(){
    struct rtcdate r;
    if (datetime(&r)){
        printf(2, "date failed\n");
        exit();
    }
    printf(1, "Today is %d-%d-%d %d:%d:%d\n", r.year, r.month, r.day, r.hour, r.minute, r.second);
    
}


int 
main (int argc, char * argv[]) {
  if(argc != 1){
    printf(1, "Usage: testdatetime\n");
    exit();
  }
  testDateTime();
  exit();
}