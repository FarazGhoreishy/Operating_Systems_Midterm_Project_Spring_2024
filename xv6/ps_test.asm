
_ps_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  int state;                  // Process state
  char name[16];              // Process name
};

int main() 
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx

    struct Process_Info* process_info = (struct Process_Info*) malloc(sizeof(struct Process_Info));   
  13:	83 ec 0c             	sub    $0xc,%esp
  16:	6a 28                	push   $0x28
  18:	e8 b3 06 00 00       	call   6d0 <malloc>

    ps(6, 4, process_info);
  1d:	83 c4 0c             	add    $0xc,%esp
  20:	50                   	push   %eax
    struct Process_Info* process_info = (struct Process_Info*) malloc(sizeof(struct Process_Info));   
  21:	89 c3                	mov    %eax,%ebx
    ps(6, 4, process_info);
  23:	6a 04                	push   $0x4
  25:	6a 06                	push   $0x6
  27:	e8 7f 03 00 00       	call   3ab <ps>
    
    printf(1, "Process found with the following details:\n\r");
  2c:	58                   	pop    %eax
  2d:	5a                   	pop    %edx
  2e:	68 d8 07 00 00       	push   $0x7d8
  33:	6a 01                	push   $0x1
  35:	e8 36 04 00 00       	call   470 <printf>
    printf(1, "Name\t%s\n", process_info->name);
  3a:	8d 43 18             	lea    0x18(%ebx),%eax
  3d:	83 c4 0c             	add    $0xc,%esp
  40:	50                   	push   %eax
  41:	68 1d 08 00 00       	push   $0x81d
  46:	6a 01                	push   $0x1
  48:	e8 23 04 00 00       	call   470 <printf>
    printf(1, "PID\t%d\n", process_info->pid);
  4d:	83 c4 0c             	add    $0xc,%esp
  50:	ff 73 10             	pushl  0x10(%ebx)
  53:	68 04 08 00 00       	push   $0x804
  58:	6a 01                	push   $0x1
  5a:	e8 11 04 00 00       	call   470 <printf>
    printf(1, "State\t%d\n", process_info->state);
  5f:	83 c4 0c             	add    $0xc,%esp
  62:	ff 73 14             	pushl  0x14(%ebx)
  65:	68 0c 08 00 00       	push   $0x80c
  6a:	6a 01                	push   $0x1
  6c:	e8 ff 03 00 00       	call   470 <printf>
    printf(1, "Parent Name\t%s\n", process_info->parent_name);
  71:	83 c4 0c             	add    $0xc,%esp
  74:	53                   	push   %ebx
  75:	68 16 08 00 00       	push   $0x816
  7a:	6a 01                	push   $0x1
  7c:	e8 ef 03 00 00       	call   470 <printf>
    

    free(process_info);  
  81:	89 1c 24             	mov    %ebx,(%esp)
  84:	e8 b7 05 00 00       	call   640 <free>
    faps(getpid());
  89:	e8 f5 02 00 00       	call   383 <getpid>
  8e:	89 04 24             	mov    %eax,(%esp)
  91:	e8 0d 03 00 00       	call   3a3 <faps>
    exit();
  96:	e8 68 02 00 00       	call   303 <exit>
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a5:	31 c0                	xor    %eax,%eax
{
  a7:	89 e5                	mov    %esp,%ebp
  a9:	53                   	push   %ebx
  aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  b7:	83 c0 01             	add    $0x1,%eax
  ba:	84 d2                	test   %dl,%dl
  bc:	75 f2                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  be:	89 c8                	mov    %ecx,%eax
  c0:	5b                   	pop    %ebx
  c1:	5d                   	pop    %ebp
  c2:	c3                   	ret    
  c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	f3 0f 1e fb          	endbr32 
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	53                   	push   %ebx
  d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  de:	0f b6 01             	movzbl (%ecx),%eax
  e1:	0f b6 1a             	movzbl (%edx),%ebx
  e4:	84 c0                	test   %al,%al
  e6:	75 19                	jne    101 <strcmp+0x31>
  e8:	eb 26                	jmp    110 <strcmp+0x40>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  f4:	83 c1 01             	add    $0x1,%ecx
  f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  fa:	0f b6 1a             	movzbl (%edx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	38 d8                	cmp    %bl,%al
 103:	74 eb                	je     f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 105:	29 d8                	sub    %ebx,%eax
}
 107:	5b                   	pop    %ebx
 108:	5d                   	pop    %ebp
 109:	c3                   	ret    
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 110:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11e:	66 90                	xchg   %ax,%ax

00000120 <strlen>:

uint
strlen(const char *s)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 12a:	80 3a 00             	cmpb   $0x0,(%edx)
 12d:	74 21                	je     150 <strlen+0x30>
 12f:	31 c0                	xor    %eax,%eax
 131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 138:	83 c0 01             	add    $0x1,%eax
 13b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 13f:	89 c1                	mov    %eax,%ecx
 141:	75 f5                	jne    138 <strlen+0x18>
    ;
  return n;
}
 143:	89 c8                	mov    %ecx,%eax
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 150:	31 c9                	xor    %ecx,%ecx
}
 152:	5d                   	pop    %ebp
 153:	89 c8                	mov    %ecx,%eax
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	57                   	push   %edi
 168:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 16b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16e:	8b 45 0c             	mov    0xc(%ebp),%eax
 171:	89 d7                	mov    %edx,%edi
 173:	fc                   	cld    
 174:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 176:	89 d0                	mov    %edx,%eax
 178:	5f                   	pop    %edi
 179:	5d                   	pop    %ebp
 17a:	c3                   	ret    
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18e:	0f b6 10             	movzbl (%eax),%edx
 191:	84 d2                	test   %dl,%dl
 193:	75 16                	jne    1ab <strchr+0x2b>
 195:	eb 21                	jmp    1b8 <strchr+0x38>
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
 1a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	84 d2                	test   %dl,%dl
 1a9:	74 0d                	je     1b8 <strchr+0x38>
    if(*s == c)
 1ab:	38 d1                	cmp    %dl,%cl
 1ad:	75 f1                	jne    1a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1b8:	31 c0                	xor    %eax,%eax
}
 1ba:	5d                   	pop    %ebp
 1bb:	c3                   	ret    
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c9:	31 f6                	xor    %esi,%esi
{
 1cb:	53                   	push   %ebx
 1cc:	89 f3                	mov    %esi,%ebx
 1ce:	83 ec 1c             	sub    $0x1c,%esp
 1d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1d4:	eb 33                	jmp    209 <gets+0x49>
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1e6:	6a 01                	push   $0x1
 1e8:	50                   	push   %eax
 1e9:	6a 00                	push   $0x0
 1eb:	e8 2b 01 00 00       	call   31b <read>
    if(cc < 1)
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	85 c0                	test   %eax,%eax
 1f5:	7e 1c                	jle    213 <gets+0x53>
      break;
    buf[i++] = c;
 1f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1fb:	83 c7 01             	add    $0x1,%edi
 1fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 201:	3c 0a                	cmp    $0xa,%al
 203:	74 23                	je     228 <gets+0x68>
 205:	3c 0d                	cmp    $0xd,%al
 207:	74 1f                	je     228 <gets+0x68>
  for(i=0; i+1 < max; ){
 209:	83 c3 01             	add    $0x1,%ebx
 20c:	89 fe                	mov    %edi,%esi
 20e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 211:	7c cd                	jl     1e0 <gets+0x20>
 213:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 215:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 218:	c6 03 00             	movb   $0x0,(%ebx)
}
 21b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5f                   	pop    %edi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	8b 75 08             	mov    0x8(%ebp),%esi
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	01 de                	add    %ebx,%esi
 230:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 232:	c6 03 00             	movb   $0x0,(%ebx)
}
 235:	8d 65 f4             	lea    -0xc(%ebp),%esp
 238:	5b                   	pop    %ebx
 239:	5e                   	pop    %esi
 23a:	5f                   	pop    %edi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <stat>:

int
stat(const char *n, struct stat *st)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	56                   	push   %esi
 248:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 249:	83 ec 08             	sub    $0x8,%esp
 24c:	6a 00                	push   $0x0
 24e:	ff 75 08             	pushl  0x8(%ebp)
 251:	e8 ed 00 00 00       	call   343 <open>
  if(fd < 0)
 256:	83 c4 10             	add    $0x10,%esp
 259:	85 c0                	test   %eax,%eax
 25b:	78 2b                	js     288 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 25d:	83 ec 08             	sub    $0x8,%esp
 260:	ff 75 0c             	pushl  0xc(%ebp)
 263:	89 c3                	mov    %eax,%ebx
 265:	50                   	push   %eax
 266:	e8 f0 00 00 00       	call   35b <fstat>
  close(fd);
 26b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 26e:	89 c6                	mov    %eax,%esi
  close(fd);
 270:	e8 b6 00 00 00       	call   32b <close>
  return r;
 275:	83 c4 10             	add    $0x10,%esp
}
 278:	8d 65 f8             	lea    -0x8(%ebp),%esp
 27b:	89 f0                	mov    %esi,%eax
 27d:	5b                   	pop    %ebx
 27e:	5e                   	pop    %esi
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 288:	be ff ff ff ff       	mov    $0xffffffff,%esi
 28d:	eb e9                	jmp    278 <stat+0x38>
 28f:	90                   	nop

00000290 <atoi>:

int
atoi(const char *s)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	53                   	push   %ebx
 298:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29b:	0f be 02             	movsbl (%edx),%eax
 29e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2a9:	77 1a                	ja     2c5 <atoi+0x35>
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop
    n = n*10 + *s++ - '0';
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ba:	0f be 02             	movsbl (%edx),%eax
 2bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
  return n;
}
 2c5:	89 c8                	mov    %ecx,%eax
 2c7:	5b                   	pop    %ebx
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	57                   	push   %edi
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
 2db:	8b 55 08             	mov    0x8(%ebp),%edx
 2de:	56                   	push   %esi
 2df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2e2:	85 c0                	test   %eax,%eax
 2e4:	7e 0f                	jle    2f5 <memmove+0x25>
 2e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2e8:	89 d7                	mov    %edx,%edi
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2f1:	39 f8                	cmp    %edi,%eax
 2f3:	75 fb                	jne    2f0 <memmove+0x20>
  return vdst;
}
 2f5:	5e                   	pop    %esi
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    

000002fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fb:	b8 01 00 00 00       	mov    $0x1,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exit>:
SYSCALL(exit)
 303:	b8 02 00 00 00       	mov    $0x2,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <wait>:
SYSCALL(wait)
 30b:	b8 03 00 00 00       	mov    $0x3,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <pipe>:
SYSCALL(pipe)
 313:	b8 04 00 00 00       	mov    $0x4,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <read>:
SYSCALL(read)
 31b:	b8 05 00 00 00       	mov    $0x5,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <write>:
SYSCALL(write)
 323:	b8 10 00 00 00       	mov    $0x10,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <close>:
SYSCALL(close)
 32b:	b8 15 00 00 00       	mov    $0x15,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <kill>:
SYSCALL(kill)
 333:	b8 06 00 00 00       	mov    $0x6,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <exec>:
SYSCALL(exec)
 33b:	b8 07 00 00 00       	mov    $0x7,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <open>:
SYSCALL(open)
 343:	b8 0f 00 00 00       	mov    $0xf,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <mknod>:
SYSCALL(mknod)
 34b:	b8 11 00 00 00       	mov    $0x11,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <unlink>:
SYSCALL(unlink)
 353:	b8 12 00 00 00       	mov    $0x12,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <fstat>:
SYSCALL(fstat)
 35b:	b8 08 00 00 00       	mov    $0x8,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <link>:
SYSCALL(link)
 363:	b8 13 00 00 00       	mov    $0x13,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <mkdir>:
SYSCALL(mkdir)
 36b:	b8 14 00 00 00       	mov    $0x14,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <chdir>:
SYSCALL(chdir)
 373:	b8 09 00 00 00       	mov    $0x9,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <dup>:
SYSCALL(dup)
 37b:	b8 0a 00 00 00       	mov    $0xa,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getpid>:
SYSCALL(getpid)
 383:	b8 0b 00 00 00       	mov    $0xb,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <sbrk>:
SYSCALL(sbrk)
 38b:	b8 0c 00 00 00       	mov    $0xc,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <sleep>:
SYSCALL(sleep)
 393:	b8 0d 00 00 00       	mov    $0xd,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <uptime>:
SYSCALL(uptime)
 39b:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <faps>:
SYSCALL(faps)
 3a3:	b8 2a 00 00 00       	mov    $0x2a,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <ps>:
SYSCALL(ps)
 3ab:	b8 16 00 00 00       	mov    $0x16,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    
 3b3:	66 90                	xchg   %ax,%ax
 3b5:	66 90                	xchg   %ax,%ax
 3b7:	66 90                	xchg   %ax,%ax
 3b9:	66 90                	xchg   %ax,%ax
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 3c             	sub    $0x3c,%esp
 3c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3cc:	89 d1                	mov    %edx,%ecx
{
 3ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3d1:	85 d2                	test   %edx,%edx
 3d3:	0f 89 7f 00 00 00    	jns    458 <printint+0x98>
 3d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3dd:	74 79                	je     458 <printint+0x98>
    neg = 1;
 3df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3e8:	31 db                	xor    %ebx,%ebx
 3ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	89 cf                	mov    %ecx,%edi
 3f6:	f7 75 c4             	divl   -0x3c(%ebp)
 3f9:	0f b6 92 30 08 00 00 	movzbl 0x830(%edx),%edx
 400:	89 45 c0             	mov    %eax,-0x40(%ebp)
 403:	89 d8                	mov    %ebx,%eax
 405:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 408:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 40b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 40e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 411:	76 dd                	jbe    3f0 <printint+0x30>
  if(neg)
 413:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 416:	85 c9                	test   %ecx,%ecx
 418:	74 0c                	je     426 <printint+0x66>
    buf[i++] = '-';
 41a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 41f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 421:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 426:	8b 7d b8             	mov    -0x48(%ebp),%edi
 429:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 42d:	eb 07                	jmp    436 <printint+0x76>
 42f:	90                   	nop
 430:	0f b6 13             	movzbl (%ebx),%edx
 433:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 436:	83 ec 04             	sub    $0x4,%esp
 439:	88 55 d7             	mov    %dl,-0x29(%ebp)
 43c:	6a 01                	push   $0x1
 43e:	56                   	push   %esi
 43f:	57                   	push   %edi
 440:	e8 de fe ff ff       	call   323 <write>
  while(--i >= 0)
 445:	83 c4 10             	add    $0x10,%esp
 448:	39 de                	cmp    %ebx,%esi
 44a:	75 e4                	jne    430 <printint+0x70>
    putc(fd, buf[i]);
}
 44c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5f                   	pop    %edi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 458:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 45f:	eb 87                	jmp    3e8 <printint+0x28>
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	57                   	push   %edi
 478:	56                   	push   %esi
 479:	53                   	push   %ebx
 47a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 47d:	8b 75 0c             	mov    0xc(%ebp),%esi
 480:	0f b6 1e             	movzbl (%esi),%ebx
 483:	84 db                	test   %bl,%bl
 485:	0f 84 b4 00 00 00    	je     53f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 48b:	8d 45 10             	lea    0x10(%ebp),%eax
 48e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 491:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 494:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 496:	89 45 d0             	mov    %eax,-0x30(%ebp)
 499:	eb 33                	jmp    4ce <printf+0x5e>
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop
 4a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4a8:	83 f8 25             	cmp    $0x25,%eax
 4ab:	74 17                	je     4c4 <printf+0x54>
  write(fd, &c, 1);
 4ad:	83 ec 04             	sub    $0x4,%esp
 4b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4b3:	6a 01                	push   $0x1
 4b5:	57                   	push   %edi
 4b6:	ff 75 08             	pushl  0x8(%ebp)
 4b9:	e8 65 fe ff ff       	call   323 <write>
 4be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4c4:	0f b6 1e             	movzbl (%esi),%ebx
 4c7:	83 c6 01             	add    $0x1,%esi
 4ca:	84 db                	test   %bl,%bl
 4cc:	74 71                	je     53f <printf+0xcf>
    c = fmt[i] & 0xff;
 4ce:	0f be cb             	movsbl %bl,%ecx
 4d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4d4:	85 d2                	test   %edx,%edx
 4d6:	74 c8                	je     4a0 <printf+0x30>
      }
    } else if(state == '%'){
 4d8:	83 fa 25             	cmp    $0x25,%edx
 4db:	75 e7                	jne    4c4 <printf+0x54>
      if(c == 'd'){
 4dd:	83 f8 64             	cmp    $0x64,%eax
 4e0:	0f 84 9a 00 00 00    	je     580 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ec:	83 f9 70             	cmp    $0x70,%ecx
 4ef:	74 5f                	je     550 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f1:	83 f8 73             	cmp    $0x73,%eax
 4f4:	0f 84 d6 00 00 00    	je     5d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4fa:	83 f8 63             	cmp    $0x63,%eax
 4fd:	0f 84 8d 00 00 00    	je     590 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 503:	83 f8 25             	cmp    $0x25,%eax
 506:	0f 84 b4 00 00 00    	je     5c0 <printf+0x150>
  write(fd, &c, 1);
 50c:	83 ec 04             	sub    $0x4,%esp
 50f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 513:	6a 01                	push   $0x1
 515:	57                   	push   %edi
 516:	ff 75 08             	pushl  0x8(%ebp)
 519:	e8 05 fe ff ff       	call   323 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 51e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 521:	83 c4 0c             	add    $0xc,%esp
 524:	6a 01                	push   $0x1
 526:	83 c6 01             	add    $0x1,%esi
 529:	57                   	push   %edi
 52a:	ff 75 08             	pushl  0x8(%ebp)
 52d:	e8 f1 fd ff ff       	call   323 <write>
  for(i = 0; fmt[i]; i++){
 532:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 536:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 539:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 53b:	84 db                	test   %bl,%bl
 53d:	75 8f                	jne    4ce <printf+0x5e>
    }
  }
}
 53f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 542:	5b                   	pop    %ebx
 543:	5e                   	pop    %esi
 544:	5f                   	pop    %edi
 545:	5d                   	pop    %ebp
 546:	c3                   	ret    
 547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
 558:	6a 00                	push   $0x0
 55a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	8b 13                	mov    (%ebx),%edx
 562:	e8 59 fe ff ff       	call   3c0 <printint>
        ap++;
 567:	89 d8                	mov    %ebx,%eax
 569:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56c:	31 d2                	xor    %edx,%edx
        ap++;
 56e:	83 c0 04             	add    $0x4,%eax
 571:	89 45 d0             	mov    %eax,-0x30(%ebp)
 574:	e9 4b ff ff ff       	jmp    4c4 <printf+0x54>
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 0a 00 00 00       	mov    $0xa,%ecx
 588:	6a 01                	push   $0x1
 58a:	eb ce                	jmp    55a <printf+0xea>
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 590:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 593:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 596:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 598:	6a 01                	push   $0x1
        ap++;
 59a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 59d:	57                   	push   %edi
 59e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5a4:	e8 7a fd ff ff       	call   323 <write>
        ap++;
 5a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5af:	31 d2                	xor    %edx,%edx
 5b1:	e9 0e ff ff ff       	jmp    4c4 <printf+0x54>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
 5c6:	e9 59 ff ff ff       	jmp    524 <printf+0xb4>
 5cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
        s = (char*)*ap;
 5d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5d5:	83 c0 04             	add    $0x4,%eax
 5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5db:	85 db                	test   %ebx,%ebx
 5dd:	74 17                	je     5f6 <printf+0x186>
        while(*s != 0){
 5df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5e4:	84 c0                	test   %al,%al
 5e6:	0f 84 d8 fe ff ff    	je     4c4 <printf+0x54>
 5ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ef:	89 de                	mov    %ebx,%esi
 5f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5f4:	eb 1a                	jmp    610 <printf+0x1a0>
          s = "(null)";
 5f6:	bb 26 08 00 00       	mov    $0x826,%ebx
        while(*s != 0){
 5fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5fe:	b8 28 00 00 00       	mov    $0x28,%eax
 603:	89 de                	mov    %ebx,%esi
 605:	8b 5d 08             	mov    0x8(%ebp),%ebx
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
          s++;
 613:	83 c6 01             	add    $0x1,%esi
 616:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 619:	6a 01                	push   $0x1
 61b:	57                   	push   %edi
 61c:	53                   	push   %ebx
 61d:	e8 01 fd ff ff       	call   323 <write>
        while(*s != 0){
 622:	0f b6 06             	movzbl (%esi),%eax
 625:	83 c4 10             	add    $0x10,%esp
 628:	84 c0                	test   %al,%al
 62a:	75 e4                	jne    610 <printf+0x1a0>
 62c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 62f:	31 d2                	xor    %edx,%edx
 631:	e9 8e fe ff ff       	jmp    4c4 <printf+0x54>
 636:	66 90                	xchg   %ax,%ax
 638:	66 90                	xchg   %ax,%ax
 63a:	66 90                	xchg   %ax,%ax
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 645:	a1 dc 0a 00 00       	mov    0xadc,%eax
{
 64a:	89 e5                	mov    %esp,%ebp
 64c:	57                   	push   %edi
 64d:	56                   	push   %esi
 64e:	53                   	push   %ebx
 64f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 652:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 654:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 657:	39 c8                	cmp    %ecx,%eax
 659:	73 15                	jae    670 <free+0x30>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
 660:	39 d1                	cmp    %edx,%ecx
 662:	72 14                	jb     678 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 664:	39 d0                	cmp    %edx,%eax
 666:	73 10                	jae    678 <free+0x38>
{
 668:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66a:	8b 10                	mov    (%eax),%edx
 66c:	39 c8                	cmp    %ecx,%eax
 66e:	72 f0                	jb     660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 670:	39 d0                	cmp    %edx,%eax
 672:	72 f4                	jb     668 <free+0x28>
 674:	39 d1                	cmp    %edx,%ecx
 676:	73 f0                	jae    668 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 678:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67e:	39 fa                	cmp    %edi,%edx
 680:	74 1e                	je     6a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 682:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 685:	8b 50 04             	mov    0x4(%eax),%edx
 688:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 68b:	39 f1                	cmp    %esi,%ecx
 68d:	74 28                	je     6b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 691:	5b                   	pop    %ebx
  freep = p;
 692:	a3 dc 0a 00 00       	mov    %eax,0xadc
}
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    
 69b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 6a0:	03 72 04             	add    0x4(%edx),%esi
 6a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a6:	8b 10                	mov    (%eax),%edx
 6a8:	8b 12                	mov    (%edx),%edx
 6aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ad:	8b 50 04             	mov    0x4(%eax),%edx
 6b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6b3:	39 f1                	cmp    %esi,%ecx
 6b5:	75 d8                	jne    68f <free+0x4f>
    p->s.size += bp->s.size;
 6b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ba:	a3 dc 0a 00 00       	mov    %eax,0xadc
    p->s.size += bp->s.size;
 6bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c5:	89 10                	mov    %edx,(%eax)
}
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	57                   	push   %edi
 6d8:	56                   	push   %esi
 6d9:	53                   	push   %ebx
 6da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6e0:	8b 3d dc 0a 00 00    	mov    0xadc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e6:	8d 70 07             	lea    0x7(%eax),%esi
 6e9:	c1 ee 03             	shr    $0x3,%esi
 6ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6ef:	85 ff                	test   %edi,%edi
 6f1:	0f 84 a9 00 00 00    	je     7a0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 6f9:	8b 48 04             	mov    0x4(%eax),%ecx
 6fc:	39 f1                	cmp    %esi,%ecx
 6fe:	73 6d                	jae    76d <malloc+0x9d>
 700:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 706:	bb 00 10 00 00       	mov    $0x1000,%ebx
 70b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 70e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 715:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 718:	eb 17                	jmp    731 <malloc+0x61>
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 720:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 722:	8b 4a 04             	mov    0x4(%edx),%ecx
 725:	39 f1                	cmp    %esi,%ecx
 727:	73 4f                	jae    778 <malloc+0xa8>
 729:	8b 3d dc 0a 00 00    	mov    0xadc,%edi
 72f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 731:	39 c7                	cmp    %eax,%edi
 733:	75 eb                	jne    720 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 735:	83 ec 0c             	sub    $0xc,%esp
 738:	ff 75 e4             	pushl  -0x1c(%ebp)
 73b:	e8 4b fc ff ff       	call   38b <sbrk>
  if(p == (char*)-1)
 740:	83 c4 10             	add    $0x10,%esp
 743:	83 f8 ff             	cmp    $0xffffffff,%eax
 746:	74 1b                	je     763 <malloc+0x93>
  hp->s.size = nu;
 748:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	83 c0 08             	add    $0x8,%eax
 751:	50                   	push   %eax
 752:	e8 e9 fe ff ff       	call   640 <free>
  return freep;
 757:	a1 dc 0a 00 00       	mov    0xadc,%eax
      if((p = morecore(nunits)) == 0)
 75c:	83 c4 10             	add    $0x10,%esp
 75f:	85 c0                	test   %eax,%eax
 761:	75 bd                	jne    720 <malloc+0x50>
        return 0;
  }
}
 763:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 766:	31 c0                	xor    %eax,%eax
}
 768:	5b                   	pop    %ebx
 769:	5e                   	pop    %esi
 76a:	5f                   	pop    %edi
 76b:	5d                   	pop    %ebp
 76c:	c3                   	ret    
    if(p->s.size >= nunits){
 76d:	89 c2                	mov    %eax,%edx
 76f:	89 f8                	mov    %edi,%eax
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 778:	39 ce                	cmp    %ecx,%esi
 77a:	74 54                	je     7d0 <malloc+0x100>
        p->s.size -= nunits;
 77c:	29 f1                	sub    %esi,%ecx
 77e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 781:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 784:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 787:	a3 dc 0a 00 00       	mov    %eax,0xadc
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 78f:	8d 42 08             	lea    0x8(%edx),%eax
}
 792:	5b                   	pop    %ebx
 793:	5e                   	pop    %esi
 794:	5f                   	pop    %edi
 795:	5d                   	pop    %ebp
 796:	c3                   	ret    
 797:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 79e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 7a0:	c7 05 dc 0a 00 00 e0 	movl   $0xae0,0xadc
 7a7:	0a 00 00 
    base.s.size = 0;
 7aa:	bf e0 0a 00 00       	mov    $0xae0,%edi
    base.s.ptr = freep = prevp = &base;
 7af:	c7 05 e0 0a 00 00 e0 	movl   $0xae0,0xae0
 7b6:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 7bb:	c7 05 e4 0a 00 00 00 	movl   $0x0,0xae4
 7c2:	00 00 00 
    if(p->s.size >= nunits){
 7c5:	e9 36 ff ff ff       	jmp    700 <malloc+0x30>
 7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7d0:	8b 0a                	mov    (%edx),%ecx
 7d2:	89 08                	mov    %ecx,(%eax)
 7d4:	eb b1                	jmp    787 <malloc+0xb7>
