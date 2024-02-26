#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

// Added by AW 
char*
strcat(char* s1, char* s2)
{
  char* result;
  result = s1;
  int i = 0;

  while(s1++) {
    i += 1;
  }
  
  while(s2++) {
    result[i++] = *s2;
  }

  return result;
}
//
char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

// AW: atof implementation, needs some validation
double
atof(const char*s)
{
  double frac_part = 0;
  double int_part = 0;
  double factor = 1;
  int neg = 1;

  // AW: check if negative
  if (*s == '-') {neg = -1;};

  int decimal = 0; // bool to check for fraction

  while(*s) {
    if(*s >= '0' && *s <= '9') {
      if(decimal) { 
        frac_part = frac_part*10 + (*s - '0');
        factor *= 10;
      }
      else {
        int_part = int_part*10 + (*s - '0');
      }
    } else if (*s == '.') {
      if(decimal) {
        return neg * (int_part + frac_part/factor); 
      }
      decimal = 1;
    } else { // End of string
      return neg * (int_part + frac_part/factor); 
    }
    ++s;
  }

  return neg * (int_part + frac_part/factor); 

}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}
