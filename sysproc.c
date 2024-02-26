#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
sys_datetime(void)
{
  struct rtcdate *myDate;
  if(argptr(0, (void*)&myDate, sizeof(*myDate)) < 0){
    // pointer for myDate is invalid
    return -1;
  }
  // helper function to fill the rtcdate struct
  cmostime(myDate);
  return 0;
}

int
sys_settimer(void)
{
  int ticks;
  void (*handler)();

  if(argint(0, &ticks) < 0 || argptr(1, (char**)&handler, 1))
    return -1;
  myproc()->alarmOn = ticks;
  myproc()->alarmCountDown = ticks;
  myproc()->alarmHandler = handler;

  return 0;
}

int
sys_getzombcount(void){
  return getzombcount();
}

int
sys_getparentpid(void){
  return getparentpid_helper();
}

int
sys_getpname(void){
  int pid;
  char *pname;
  if(argint(0, &pid) < 0 || argptr(1, &pname, 1) < 0)
    return -1;
  return (getpname_helper(pid, pname));
}