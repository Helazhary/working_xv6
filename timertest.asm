
_timertest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
int count;
void handler();

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
    if(argc < 2){
   f:	83 39 01             	cmpl   $0x1,(%ecx)
{
  12:	8b 41 04             	mov    0x4(%ecx),%eax
    if(argc < 2){
  15:	0f 8e 97 00 00 00    	jle    b2 <main+0xb2>
        printf(2, "usage: timertest ticks\n");
        exit();
    }
    int ticks = atoi(argv[1]);
  1b:	83 ec 0c             	sub    $0xc,%esp
  1e:	ff 70 04             	push   0x4(%eax)
  21:	e8 aa 02 00 00       	call   2d0 <atoi>
    int i;
    printf(1, "timertest starting\n");
  26:	5a                   	pop    %edx
  27:	59                   	pop    %ecx
  28:	68 08 08 00 00       	push   $0x808
  2d:	6a 01                	push   $0x1
    int ticks = atoi(argv[1]);
  2f:	89 c3                	mov    %eax,%ebx
    printf(1, "timertest starting\n");
  31:	e8 8a 04 00 00       	call   4c0 <printf>
    settimer(ticks, handler);
  36:	58                   	pop    %eax
  37:	5a                   	pop    %edx
  38:	68 d0 00 00 00       	push   $0xd0
  3d:	53                   	push   %ebx
    for(i = 0; i < 200*500000; i++){
  3e:	31 db                	xor    %ebx,%ebx
    settimer(ticks, handler);
  40:	e8 a6 03 00 00       	call   3eb <settimer>
  45:	83 c4 10             	add    $0x10,%esp
  48:	eb 11                	jmp    5b <main+0x5b>
  4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(i = 0; i < 200*500000; i++){
  50:	83 c3 02             	add    $0x2,%ebx
  53:	81 fb 00 e1 f5 05    	cmp    $0x5f5e100,%ebx
  59:	74 2f                	je     8a <main+0x8a>
    settimer(ticks, handler);
  5b:	69 c3 39 61 c2 68    	imul   $0x68c26139,%ebx,%eax
  61:	c1 c8 05             	ror    $0x5,%eax
        if((i++ % 500000) == 0)
  64:	3d 8d 21 00 00       	cmp    $0x218d,%eax
  69:	77 e5                	ja     50 <main+0x50>
            write(2, ".", 1);
  6b:	83 ec 04             	sub    $0x4,%esp
    for(i = 0; i < 200*500000; i++){
  6e:	83 c3 02             	add    $0x2,%ebx
            write(2, ".", 1);
  71:	6a 01                	push   $0x1
  73:	68 1c 08 00 00       	push   $0x81c
  78:	6a 02                	push   $0x2
  7a:	e8 e4 02 00 00       	call   363 <write>
  7f:	83 c4 10             	add    $0x10,%esp
    for(i = 0; i < 200*500000; i++){
  82:	81 fb 00 e1 f5 05    	cmp    $0x5f5e100,%ebx
  88:	75 d1                	jne    5b <main+0x5b>
    }
    printf(1, "\nTest done!\n");
  8a:	50                   	push   %eax
  8b:	50                   	push   %eax
  8c:	68 1e 08 00 00       	push   $0x81e
  91:	6a 01                	push   $0x1
  93:	e8 28 04 00 00       	call   4c0 <printf>
    printf(1, "count: %d\n", count);
  98:	83 c4 0c             	add    $0xc,%esp
  9b:	ff 35 64 0b 00 00    	push   0xb64
  a1:	68 2b 08 00 00       	push   $0x82b
  a6:	6a 01                	push   $0x1
  a8:	e8 13 04 00 00       	call   4c0 <printf>
    exit();
  ad:	e8 91 02 00 00       	call   343 <exit>
        printf(2, "usage: timertest ticks\n");
  b2:	51                   	push   %ecx
  b3:	51                   	push   %ecx
  b4:	68 f0 07 00 00       	push   $0x7f0
  b9:	6a 02                	push   $0x2
  bb:	e8 00 04 00 00       	call   4c0 <printf>
        exit();
  c0:	e8 7e 02 00 00       	call   343 <exit>
  c5:	66 90                	xchg   %ax,%ax
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <handler>:
}

void handler(){
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	83 ec 10             	sub    $0x10,%esp
    count++;
  d6:	83 05 64 0b 00 00 01 	addl   $0x1,0xb64
    printf(1, "alarm!\n");
  dd:	68 e8 07 00 00       	push   $0x7e8
  e2:	6a 01                	push   $0x1
  e4:	e8 d7 03 00 00       	call   4c0 <printf>
  e9:	83 c4 10             	add    $0x10,%esp
  ec:	c9                   	leave  
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

// Added by AW 
char*
strcat(char* s1, char* s2)
  f0:	55                   	push   %ebp
{
  char* result;
  result = s1;
  int i = 0;
  f1:	31 c0                	xor    %eax,%eax
strcat(char* s1, char* s2)
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i = 0;
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>

  while(s1++) {
    i += 1;
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:
  }
  
  while(s2++) {
    result[i++] = *s2;
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  }
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax

 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  }
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>

 146:	89 d9                	mov    %ebx,%ecx
  }
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return result;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return result;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return result;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:
//
char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  char *os;

  os = s;
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
  while((*s++ = *t++) != 0)
    ;
  return os;
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  os = s;
 1a0:	31 c9                	xor    %ecx,%ecx
  return os;
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:
}

int
strcmp(const char *p, const char *q)
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
{
  while(*p && *p == *q)
    p++, q++;
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:
  return (uchar)*p - (uchar)*q;
}

uint
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
strlen(const char *s)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
{
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
  int n;

  for(n = 0; s[n]; n++)
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

 200:	31 c0                	xor    %eax,%eax
  for(n = 0; s[n]; n++)
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:
    ;
  return n;
}

 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi

 218:	53                   	push   %ebx
  stosb(dst, c, n);
 219:	31 db                	xor    %ebx,%ebx

 21b:	83 ec 1c             	sub    $0x1c,%esp
  stosb(dst, c, n);
 21e:	eb 27                	jmp    247 <gets+0x37>
  return dst;
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 2e 01 00 00       	call   35b <read>
}
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>

char*
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
strchr(const char *s, char c)
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  stosb(dst, c, n);
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
{
  for(; *s; s++)
    if(*s == c)
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
      return (char*)s;
  return 0;
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
    if(*s == c)
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return 0;
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:
}

char*
gets(char *buf, int max)
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
{
  int i, cc;
  char c;

 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  for(i=0; i+1 < max; ){
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    cc = read(0, &c, 1);
    if(cc < 1)
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
      break;
 2a7:	89 1c 24             	mov    %ebx,(%esp)
    if(cc < 1)
 2aa:	89 c6                	mov    %eax,%esi
      break;
 2ac:	e8 ba 00 00 00       	call   36b <close>
    buf[i++] = c;
 2b1:	83 c4 10             	add    $0x10,%esp
    if(c == '\n' || c == '\r')
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:
      break;
  }
  buf[i] = '\0';
  return buf;
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

int
stat(const char *n, struct stat *st)
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
int
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
stat(const char *n, struct stat *st)
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
{
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
stat(const char *n, struct stat *st)
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  int fd;
  int r;
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
}
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
atoi(const char *s)
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
int
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
{
  int n;
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <datetime>:
SYSCALL(datetime)
 3e3:	b8 16 00 00 00       	mov    $0x16,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <settimer>:
SYSCALL(settimer)
 3eb:	b8 17 00 00 00       	mov    $0x17,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <getzombcount>:
SYSCALL(getzombcount)
 3f3:	b8 18 00 00 00       	mov    $0x18,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <getpname>:
SYSCALL(getpname)
 3fb:	b8 1a 00 00 00       	mov    $0x1a,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <getparentpid>:
SYSCALL(getparentpid)
 403:	b8 19 00 00 00       	mov    $0x19,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    
 40b:	66 90                	xchg   %ax,%ax
 40d:	66 90                	xchg   %ax,%ax
 40f:	90                   	nop

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 3c             	sub    $0x3c,%esp
 419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 41c:	89 d1                	mov    %edx,%ecx
{
 41e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 421:	85 d2                	test   %edx,%edx
 423:	0f 89 7f 00 00 00    	jns    4a8 <printint+0x98>
 429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 42d:	74 79                	je     4a8 <printint+0x98>
    neg = 1;
 42f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 438:	31 db                	xor    %ebx,%ebx
 43a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 43d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 440:	89 c8                	mov    %ecx,%eax
 442:	31 d2                	xor    %edx,%edx
 444:	89 cf                	mov    %ecx,%edi
 446:	f7 75 c4             	divl   -0x3c(%ebp)
 449:	0f b6 92 98 08 00 00 	movzbl 0x898(%edx),%edx
 450:	89 45 c0             	mov    %eax,-0x40(%ebp)
 453:	89 d8                	mov    %ebx,%eax
 455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 45b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 45e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 461:	76 dd                	jbe    440 <printint+0x30>
  if(neg)
 463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 466:	85 c9                	test   %ecx,%ecx
 468:	74 0c                	je     476 <printint+0x66>
    buf[i++] = '-';
 46a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 46f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 476:	8b 7d b8             	mov    -0x48(%ebp),%edi
 479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 47d:	eb 07                	jmp    486 <printint+0x76>
 47f:	90                   	nop
    putc(fd, buf[i]);
 480:	0f b6 13             	movzbl (%ebx),%edx
 483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 486:	83 ec 04             	sub    $0x4,%esp
 489:	88 55 d7             	mov    %dl,-0x29(%ebp)
 48c:	6a 01                	push   $0x1
 48e:	56                   	push   %esi
 48f:	57                   	push   %edi
 490:	e8 ce fe ff ff       	call   363 <write>
  while(--i >= 0)
 495:	83 c4 10             	add    $0x10,%esp
 498:	39 de                	cmp    %ebx,%esi
 49a:	75 e4                	jne    480 <printint+0x70>
}
 49c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49f:	5b                   	pop    %ebx
 4a0:	5e                   	pop    %esi
 4a1:	5f                   	pop    %edi
 4a2:	5d                   	pop    %ebp
 4a3:	c3                   	ret    
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4af:	eb 87                	jmp    438 <printint+0x28>
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bf:	90                   	nop

000004c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s, AW appended: %f, %.<percision>f
void
printf(int fd, const char *fmt, ...)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4cf:	0f b6 13             	movzbl (%ebx),%edx
 4d2:	84 d2                	test   %dl,%dl
 4d4:	74 6a                	je     540 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4d6:	8d 45 10             	lea    0x10(%ebp),%eax
 4d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e4:	eb 36                	jmp    51c <printf+0x5c>
 4e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	74 15                	je     512 <printf+0x52>
  write(fd, &c, 1);
 4fd:	83 ec 04             	sub    $0x4,%esp
 500:	88 55 e7             	mov    %dl,-0x19(%ebp)
 503:	6a 01                	push   $0x1
 505:	57                   	push   %edi
 506:	56                   	push   %esi
 507:	e8 57 fe ff ff       	call   363 <write>
 50c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 50f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 512:	0f b6 13             	movzbl (%ebx),%edx
 515:	83 c3 01             	add    $0x1,%ebx
 518:	84 d2                	test   %dl,%dl
 51a:	74 24                	je     540 <printf+0x80>
    c = fmt[i] & 0xff;
 51c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 51f:	85 c9                	test   %ecx,%ecx
 521:	74 cd                	je     4f0 <printf+0x30>
      }
    } else if(state == '%'){
 523:	83 f9 25             	cmp    $0x25,%ecx
 526:	75 ea                	jne    512 <printf+0x52>
      if(c == '.'){ // AW: if '%' is followed by '.' change the state and move on next character
 528:	83 f8 25             	cmp    $0x25,%eax
 52b:	0f 84 07 01 00 00    	je     638 <printf+0x178>
 531:	83 e8 63             	sub    $0x63,%eax
 534:	83 f8 15             	cmp    $0x15,%eax
 537:	77 17                	ja     550 <printf+0x90>
 539:	ff 24 85 40 08 00 00 	jmp    *0x840(,%eax,4)
      } else if(c == 'f'){ //printing floats by AW
        double value = *(double*)ap;
        int int_part = (int)value;
        double frac = value - int_part;
        int frac_part = frac * 10000;

 540:	8d 65 f4             	lea    -0xc(%ebp),%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 556:	6a 01                	push   $0x1
 558:	57                   	push   %edi
 559:	56                   	push   %esi
 55a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 55e:	e8 00 fe ff ff       	call   363 <write>
      } else if(c == 'f'){ //printing floats by AW
 563:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 567:	83 c4 0c             	add    $0xc,%esp
 56a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 56d:	6a 01                	push   $0x1
 56f:	57                   	push   %edi
 570:	56                   	push   %esi
 571:	e8 ed fd ff ff       	call   363 <write>
      } else if(c == 'f'){ //printing floats by AW
 576:	83 c4 10             	add    $0x10,%esp
        int int_part = (int)value;
 579:	31 c9                	xor    %ecx,%ecx
 57b:	eb 95                	jmp    512 <printf+0x52>
 57d:	8d 76 00             	lea    0x0(%esi),%esi
      if(c == 'd'){
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 58d:	8b 10                	mov    (%eax),%edx
 58f:	89 f0                	mov    %esi,%eax
 591:	e8 7a fe ff ff       	call   410 <printint>
        printint(fd, *ap, 10, 1);
 596:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 59a:	83 c4 10             	add    $0x10,%esp
        int int_part = (int)value;
 59d:	31 c9                	xor    %ecx,%ecx
 59f:	e9 6e ff ff ff       	jmp    512 <printf+0x52>
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 'x' || c == 'p'){
 5a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ab:	8b 10                	mov    (%eax),%edx
        printint(fd, *ap, 16, 0);
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        ap++;
 5b3:	85 d2                	test   %edx,%edx
 5b5:	0f 84 8d 00 00 00    	je     648 <printf+0x188>
        s = (char*)*ap;
 5bb:	0f b6 02             	movzbl (%edx),%eax
        int int_part = (int)value;
 5be:	31 c9                	xor    %ecx,%ecx
        s = (char*)*ap;
 5c0:	84 c0                	test   %al,%al
 5c2:	0f 84 4a ff ff ff    	je     512 <printf+0x52>
 5c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5cb:	89 d3                	mov    %edx,%ebx
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
        if(s == 0)
 5d3:	83 c3 01             	add    $0x1,%ebx
 5d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d9:	6a 01                	push   $0x1
 5db:	57                   	push   %edi
 5dc:	56                   	push   %esi
 5dd:	e8 81 fd ff ff       	call   363 <write>
        s = (char*)*ap;
 5e2:	0f b6 03             	movzbl (%ebx),%eax
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	84 c0                	test   %al,%al
 5ea:	75 e4                	jne    5d0 <printf+0x110>
        int int_part = (int)value;
 5ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5ef:	31 c9                	xor    %ecx,%ecx
 5f1:	e9 1c ff ff ff       	jmp    512 <printf+0x52>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        state = '.';
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 0a 00 00 00       	mov    $0xa,%ecx
 608:	6a 01                	push   $0x1
 60a:	e9 7b ff ff ff       	jmp    58a <printf+0xca>
 60f:	90                   	nop
          putc(fd, *s);
 610:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 613:	83 ec 04             	sub    $0x4,%esp
          putc(fd, *s);
 616:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 618:	6a 01                	push   $0x1
 61a:	57                   	push   %edi
 61b:	56                   	push   %esi
          putc(fd, *s);
 61c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 61f:	e8 3f fd ff ff       	call   363 <write>
          s++;
 624:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 628:	83 c4 10             	add    $0x10,%esp
        int int_part = (int)value;
 62b:	31 c9                	xor    %ecx,%ecx
 62d:	e9 e0 fe ff ff       	jmp    512 <printf+0x52>
 632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else if(c == 'c'){
 638:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 63b:	83 ec 04             	sub    $0x4,%esp
 63e:	e9 2a ff ff ff       	jmp    56d <printf+0xad>
 643:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 647:	90                   	nop
      } else if(c == 's'){
 648:	ba 36 08 00 00       	mov    $0x836,%edx
        s = (char*)*ap;
 64d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 650:	b8 28 00 00 00       	mov    $0x28,%eax
 655:	89 d3                	mov    %edx,%ebx
 657:	e9 74 ff ff ff       	jmp    5d0 <printf+0x110>
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 68 0b 00 00       	mov    0xb68,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 678:	89 c2                	mov    %eax,%edx
 67a:	8b 00                	mov    (%eax),%eax
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	73 30                	jae    6b0 <free+0x50>
 680:	39 c1                	cmp    %eax,%ecx
 682:	72 04                	jb     688 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 c2                	cmp    %eax,%edx
 686:	72 f0                	jb     678 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	74 30                	je     6c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 692:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 695:	8b 42 04             	mov    0x4(%edx),%eax
 698:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 69b:	39 f1                	cmp    %esi,%ecx
 69d:	74 3a                	je     6d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 69f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6a1:	5b                   	pop    %ebx
  freep = p;
 6a2:	89 15 68 0b 00 00    	mov    %edx,0xb68
}
 6a8:	5e                   	pop    %esi
 6a9:	5f                   	pop    %edi
 6aa:	5d                   	pop    %ebp
 6ab:	c3                   	ret    
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 c2                	cmp    %eax,%edx
 6b2:	72 c4                	jb     678 <free+0x18>
 6b4:	39 c1                	cmp    %eax,%ecx
 6b6:	73 c0                	jae    678 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 f8                	cmp    %edi,%eax
 6c0:	75 d0                	jne    692 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6c2:	03 70 04             	add    0x4(%eax),%esi
 6c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c8:	8b 02                	mov    (%edx),%eax
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cf:	8b 42 04             	mov    0x4(%edx),%eax
 6d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6d5:	39 f1                	cmp    %esi,%ecx
 6d7:	75 c6                	jne    69f <free+0x3f>
    p->s.size += bp->s.size;
 6d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6dc:	89 15 68 0b 00 00    	mov    %edx,0xb68
    p->s.size += bp->s.size;
 6e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6e8:	89 0a                	mov    %ecx,(%edx)
}
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5f                   	pop    %edi
 6ed:	5d                   	pop    %ebp
 6ee:	c3                   	ret    
 6ef:	90                   	nop

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 3d 68 0b 00 00    	mov    0xb68,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 70 07             	lea    0x7(%eax),%esi
 705:	c1 ee 03             	shr    $0x3,%esi
 708:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 70b:	85 ff                	test   %edi,%edi
 70d:	0f 84 9d 00 00 00    	je     7b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 713:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 715:	8b 4a 04             	mov    0x4(%edx),%ecx
 718:	39 f1                	cmp    %esi,%ecx
 71a:	73 6a                	jae    786 <malloc+0x96>
 71c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 721:	39 de                	cmp    %ebx,%esi
 723:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 726:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 72d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 730:	eb 17                	jmp    749 <malloc+0x59>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 f1                	cmp    %esi,%ecx
 73f:	73 4f                	jae    790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	8b 3d 68 0b 00 00    	mov    0xb68,%edi
 747:	89 c2                	mov    %eax,%edx
 749:	39 d7                	cmp    %edx,%edi
 74b:	75 eb                	jne    738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 74d:	83 ec 0c             	sub    $0xc,%esp
 750:	ff 75 e4             	push   -0x1c(%ebp)
 753:	e8 73 fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 758:	83 c4 10             	add    $0x10,%esp
 75b:	83 f8 ff             	cmp    $0xffffffff,%eax
 75e:	74 1c                	je     77c <malloc+0x8c>
  hp->s.size = nu;
 760:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	83 c0 08             	add    $0x8,%eax
 769:	50                   	push   %eax
 76a:	e8 f1 fe ff ff       	call   660 <free>
  return freep;
 76f:	8b 15 68 0b 00 00    	mov    0xb68,%edx
      if((p = morecore(nunits)) == 0)
 775:	83 c4 10             	add    $0x10,%esp
 778:	85 d2                	test   %edx,%edx
 77a:	75 bc                	jne    738 <malloc+0x48>
        return 0;
  }
}
 77c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 77f:	31 c0                	xor    %eax,%eax
}
 781:	5b                   	pop    %ebx
 782:	5e                   	pop    %esi
 783:	5f                   	pop    %edi
 784:	5d                   	pop    %ebp
 785:	c3                   	ret    
    if(p->s.size >= nunits){
 786:	89 d0                	mov    %edx,%eax
 788:	89 fa                	mov    %edi,%edx
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 790:	39 ce                	cmp    %ecx,%esi
 792:	74 4c                	je     7e0 <malloc+0xf0>
        p->s.size -= nunits;
 794:	29 f1                	sub    %esi,%ecx
 796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 79c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 79f:	89 15 68 0b 00 00    	mov    %edx,0xb68
}
 7a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7a8:	83 c0 08             	add    $0x8,%eax
}
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 68 0b 00 00 6c 	movl   $0xb6c,0xb68
 7b7:	0b 00 00 
    base.s.size = 0;
 7ba:	bf 6c 0b 00 00       	mov    $0xb6c,%edi
    base.s.ptr = freep = prevp = &base;
 7bf:	c7 05 6c 0b 00 00 6c 	movl   $0xb6c,0xb6c
 7c6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7cb:	c7 05 70 0b 00 00 00 	movl   $0x0,0xb70
 7d2:	00 00 00 
    if(p->s.size >= nunits){
 7d5:	e9 42 ff ff ff       	jmp    71c <malloc+0x2c>
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb b9                	jmp    79f <malloc+0xaf>
