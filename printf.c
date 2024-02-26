#include "types.h"
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    putc(fd, buf[i]);
}

// Print to the given fd. Only understands %d, %x, %p, %s, AW appended: %f, %.<percision>f
void
printf(int fd, const char *fmt, ...)
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == '.'){ // AW: if '%' is followed by '.' change the state and move on next character
        state = '.';
        continue;
      }
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      
      } else if(c == 'f'){ //printing floats by AW
        double value = *(double*)ap;
        int int_part = (int)value;
        double frac = value - int_part;
        int frac_part = frac * 10000;

        if(frac_part < 0) {frac_part *= -1;}; 
        printint(fd, int_part, 10,1);
        putc(fd,'.');
        printint(fd,frac_part, 10,1);

      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    // AW: percision handling state
    } else if (state == '.') {
      // AW: possible validation on i here to not be last+1 
      char cn = fmt[i+1] & 0xff;
      // AW: validation on percision
      if(c <= '9' && c >= '0' && cn == 'f') {
        double value = *(double*)ap;
        int int_part = (int)value;
        double frac = value - int_part;
        for (int i = 0; i < (int)(c - '0'); i++, frac = frac * 10);

        int frac_part = (int)frac;
        if(frac_part < 0) {frac_part *= -1;};

        printint(fd, int_part, 10,1);
        putc(fd,'.');
        printint(fd,frac_part, 10,1);
        i++; // AW: to avoid printing the 'f'
      } else {
        // AW: unknown '.' sequence. print it to draw attention too.
        putc(fd, '.');
        putc(fd, c);
        putc(fd, cn);
      }

      state = 0;
    }
  }
}
