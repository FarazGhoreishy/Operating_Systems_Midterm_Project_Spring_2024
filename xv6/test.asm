
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

int j = 0;

int main() 
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	bb 05 00 00 00       	mov    $0x5,%ebx
  17:	51                   	push   %ecx

    int segment_size = ARRAY_SIZE / SEGMENT_COUNT; 

    for (int i = 0; i < SEGMENT_COUNT; i++) 
    {
        int pid = fork();
  18:	e8 1e 03 00 00       	call   33b <fork>
        if (pid  == 0) 
  1d:	85 c0                	test   %eax,%eax
  1f:	74 53                	je     74 <main+0x74>
            segment_max[i] = segment_max_value;
            j ++;
            faps(getpid());
            exit(); 
        }
        if (pid > 0)
  21:	7f 3d                	jg     60 <main+0x60>
    for (int i = 0; i < SEGMENT_COUNT; i++) 
  23:	83 eb 01             	sub    $0x1,%ebx
  26:	75 f0                	jne    18 <main+0x18>
        {   
            int wpid;
            while ((wpid = wait()) > 0);
        }
    }
    printf(1, "\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 19 08 00 00       	push   $0x819
  30:	6a 01                	push   $0x1
  32:	e8 69 04 00 00       	call   4a0 <printf>


    // for(int i = 0; i < SEGMENT_COUNT; i++)
    //     printf(1, "%d\t", segment_max[i]);
    
    printf(1, "Sorting Finished.\n");
  37:	58                   	pop    %eax
  38:	5a                   	pop    %edx
  39:	68 08 08 00 00       	push   $0x808
  3e:	6a 01                	push   $0x1
  40:	e8 5b 04 00 00       	call   4a0 <printf>
    faps(getpid());
  45:	e8 79 03 00 00       	call   3c3 <getpid>
  4a:	89 04 24             	mov    %eax,(%esp)
  4d:	e8 91 03 00 00       	call   3e3 <faps>
    exit();
  52:	e8 ec 02 00 00       	call   343 <exit>
  57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5e:	66 90                	xchg   %ax,%ax
            while ((wpid = wait()) > 0);
  60:	e8 e6 02 00 00       	call   34b <wait>
  65:	85 c0                	test   %eax,%eax
  67:	7e ba                	jle    23 <main+0x23>
  69:	e8 dd 02 00 00       	call   34b <wait>
  6e:	85 c0                	test   %eax,%eax
  70:	7f ee                	jg     60 <main+0x60>
  72:	eb af                	jmp    23 <main+0x23>
            int segment_max_value = find_max_array(array,  j * segment_size, (j + 1) * segment_size);
  74:	83 05 00 0b 00 00 01 	addl   $0x1,0xb00
            faps(getpid());
  7b:	e8 43 03 00 00       	call   3c3 <getpid>
  80:	83 ec 0c             	sub    $0xc,%esp
  83:	50                   	push   %eax
  84:	e8 5a 03 00 00       	call   3e3 <faps>
            exit(); 
  89:	e8 b5 02 00 00       	call   343 <exit>
  8e:	66 90                	xchg   %ax,%ax

00000090 <find_max_array>:
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
    for (int i = start + 1; i < end; i++) 
  98:	8b 45 0c             	mov    0xc(%ebp),%eax
{
  9b:	8b 55 10             	mov    0x10(%ebp),%edx
  9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    for (int i = start + 1; i < end; i++) 
  a1:	83 c0 01             	add    $0x1,%eax
  a4:	39 d0                	cmp    %edx,%eax
  a6:	7d 28                	jge    d0 <find_max_array+0x40>
  a8:	8d 1c 91             	lea    (%ecx,%edx,4),%ebx
  ab:	8d 04 81             	lea    (%ecx,%eax,4),%eax
    int max_value = - __INT_MAX__ - 1;
  ae:	ba 00 00 00 80       	mov    $0x80000000,%edx
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
        if (array[i] > max_value) 
  b8:	8b 08                	mov    (%eax),%ecx
  ba:	39 ca                	cmp    %ecx,%edx
  bc:	0f 4c d1             	cmovl  %ecx,%edx
    for (int i = start + 1; i < end; i++) 
  bf:	83 c0 04             	add    $0x4,%eax
  c2:	39 d8                	cmp    %ebx,%eax
  c4:	75 f2                	jne    b8 <find_max_array+0x28>
}
  c6:	89 d0                	mov    %edx,%eax
  c8:	5b                   	pop    %ebx
  c9:	5d                   	pop    %ebp
  ca:	c3                   	ret    
  cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  cf:	90                   	nop
    int max_value = - __INT_MAX__ - 1;
  d0:	ba 00 00 00 80       	mov    $0x80000000,%edx
}
  d5:	5b                   	pop    %ebx
  d6:	5d                   	pop    %ebp
  d7:	89 d0                	mov    %edx,%eax
  d9:	c3                   	ret    
  da:	66 90                	xchg   %ax,%ax
  dc:	66 90                	xchg   %ax,%ax
  de:	66 90                	xchg   %ax,%ax

000000e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e5:	31 c0                	xor    %eax,%eax
{
  e7:	89 e5                	mov    %esp,%ebp
  e9:	53                   	push   %ebx
  ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ed:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	89 c8                	mov    %ecx,%eax
 100:	5b                   	pop    %ebx
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    
 103:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	53                   	push   %ebx
 118:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 11e:	0f b6 01             	movzbl (%ecx),%eax
 121:	0f b6 1a             	movzbl (%edx),%ebx
 124:	84 c0                	test   %al,%al
 126:	75 19                	jne    141 <strcmp+0x31>
 128:	eb 26                	jmp    150 <strcmp+0x40>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 134:	83 c1 01             	add    $0x1,%ecx
 137:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 13a:	0f b6 1a             	movzbl (%edx),%ebx
 13d:	84 c0                	test   %al,%al
 13f:	74 0f                	je     150 <strcmp+0x40>
 141:	38 d8                	cmp    %bl,%al
 143:	74 eb                	je     130 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 145:	29 d8                	sub    %ebx,%eax
}
 147:	5b                   	pop    %ebx
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 150:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 152:	29 d8                	sub    %ebx,%eax
}
 154:	5b                   	pop    %ebx
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax

00000160 <strlen>:

uint
strlen(const char *s)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 16a:	80 3a 00             	cmpb   $0x0,(%edx)
 16d:	74 21                	je     190 <strlen+0x30>
 16f:	31 c0                	xor    %eax,%eax
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 178:	83 c0 01             	add    $0x1,%eax
 17b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 17f:	89 c1                	mov    %eax,%ecx
 181:	75 f5                	jne    178 <strlen+0x18>
    ;
  return n;
}
 183:	89 c8                	mov    %ecx,%eax
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	57                   	push   %edi
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b1:	89 d7                	mov    %edx,%edi
 1b3:	fc                   	cld    
 1b4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b6:	89 d0                	mov    %edx,%eax
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ce:	0f b6 10             	movzbl (%eax),%edx
 1d1:	84 d2                	test   %dl,%dl
 1d3:	75 16                	jne    1eb <strchr+0x2b>
 1d5:	eb 21                	jmp    1f8 <strchr+0x38>
 1d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1de:	66 90                	xchg   %ax,%ax
 1e0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1e4:	83 c0 01             	add    $0x1,%eax
 1e7:	84 d2                	test   %dl,%dl
 1e9:	74 0d                	je     1f8 <strchr+0x38>
    if(*s == c)
 1eb:	38 d1                	cmp    %dl,%cl
 1ed:	75 f1                	jne    1e0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f8:	31 c0                	xor    %eax,%eax
}
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 209:	31 f6                	xor    %esi,%esi
{
 20b:	53                   	push   %ebx
 20c:	89 f3                	mov    %esi,%ebx
 20e:	83 ec 1c             	sub    $0x1c,%esp
 211:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 214:	eb 33                	jmp    249 <gets+0x49>
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	8d 45 e7             	lea    -0x19(%ebp),%eax
 226:	6a 01                	push   $0x1
 228:	50                   	push   %eax
 229:	6a 00                	push   $0x0
 22b:	e8 2b 01 00 00       	call   35b <read>
    if(cc < 1)
 230:	83 c4 10             	add    $0x10,%esp
 233:	85 c0                	test   %eax,%eax
 235:	7e 1c                	jle    253 <gets+0x53>
      break;
    buf[i++] = c;
 237:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 23b:	83 c7 01             	add    $0x1,%edi
 23e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 241:	3c 0a                	cmp    $0xa,%al
 243:	74 23                	je     268 <gets+0x68>
 245:	3c 0d                	cmp    $0xd,%al
 247:	74 1f                	je     268 <gets+0x68>
  for(i=0; i+1 < max; ){
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	89 fe                	mov    %edi,%esi
 24e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 251:	7c cd                	jl     220 <gets+0x20>
 253:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 255:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 258:	c6 03 00             	movb   $0x0,(%ebx)
}
 25b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25e:	5b                   	pop    %ebx
 25f:	5e                   	pop    %esi
 260:	5f                   	pop    %edi
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 267:	90                   	nop
 268:	8b 75 08             	mov    0x8(%ebp),%esi
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	01 de                	add    %ebx,%esi
 270:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 272:	c6 03 00             	movb   $0x0,(%ebx)
}
 275:	8d 65 f4             	lea    -0xc(%ebp),%esp
 278:	5b                   	pop    %ebx
 279:	5e                   	pop    %esi
 27a:	5f                   	pop    %edi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	6a 00                	push   $0x0
 28e:	ff 75 08             	pushl  0x8(%ebp)
 291:	e8 ed 00 00 00       	call   383 <open>
  if(fd < 0)
 296:	83 c4 10             	add    $0x10,%esp
 299:	85 c0                	test   %eax,%eax
 29b:	78 2b                	js     2c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 29d:	83 ec 08             	sub    $0x8,%esp
 2a0:	ff 75 0c             	pushl  0xc(%ebp)
 2a3:	89 c3                	mov    %eax,%ebx
 2a5:	50                   	push   %eax
 2a6:	e8 f0 00 00 00       	call   39b <fstat>
  close(fd);
 2ab:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ae:	89 c6                	mov    %eax,%esi
  close(fd);
 2b0:	e8 b6 00 00 00       	call   36b <close>
  return r;
 2b5:	83 c4 10             	add    $0x10,%esp
}
 2b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2bb:	89 f0                	mov    %esi,%eax
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2cd:	eb e9                	jmp    2b8 <stat+0x38>
 2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2db:	0f be 02             	movsbl (%edx),%eax
 2de:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2e1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e9:	77 1a                	ja     305 <atoi+0x35>
 2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ef:	90                   	nop
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	89 c8                	mov    %ecx,%eax
 307:	5b                   	pop    %ebx
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	57                   	push   %edi
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	8b 55 08             	mov    0x8(%ebp),%edx
 31e:	56                   	push   %esi
 31f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 322:	85 c0                	test   %eax,%eax
 324:	7e 0f                	jle    335 <memmove+0x25>
 326:	01 d0                	add    %edx,%eax
  dst = vdst;
 328:	89 d7                	mov    %edx,%edi
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
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

000003e3 <faps>:
SYSCALL(faps)
 3e3:	b8 2a 00 00 00       	mov    $0x2a,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    
 3eb:	66 90                	xchg   %ax,%ax
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
 3f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3fc:	89 d1                	mov    %edx,%ecx
{
 3fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 401:	85 d2                	test   %edx,%edx
 403:	0f 89 7f 00 00 00    	jns    488 <printint+0x98>
 409:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 40d:	74 79                	je     488 <printint+0x98>
    neg = 1;
 40f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 416:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 418:	31 db                	xor    %ebx,%ebx
 41a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 41d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 c8                	mov    %ecx,%eax
 422:	31 d2                	xor    %edx,%edx
 424:	89 cf                	mov    %ecx,%edi
 426:	f7 75 c4             	divl   -0x3c(%ebp)
 429:	0f b6 92 24 08 00 00 	movzbl 0x824(%edx),%edx
 430:	89 45 c0             	mov    %eax,-0x40(%ebp)
 433:	89 d8                	mov    %ebx,%eax
 435:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 438:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 43b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 43e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 441:	76 dd                	jbe    420 <printint+0x30>
  if(neg)
 443:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 446:	85 c9                	test   %ecx,%ecx
 448:	74 0c                	je     456 <printint+0x66>
    buf[i++] = '-';
 44a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 44f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 451:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 456:	8b 7d b8             	mov    -0x48(%ebp),%edi
 459:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 45d:	eb 07                	jmp    466 <printint+0x76>
 45f:	90                   	nop
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 ee fe ff ff       	call   363 <write>
  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x70>
    putc(fd, buf[i]);
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 48f:	eb 87                	jmp    418 <printint+0x28>
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	57                   	push   %edi
 4a8:	56                   	push   %esi
 4a9:	53                   	push   %ebx
 4aa:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ad:	8b 75 0c             	mov    0xc(%ebp),%esi
 4b0:	0f b6 1e             	movzbl (%esi),%ebx
 4b3:	84 db                	test   %bl,%bl
 4b5:	0f 84 b4 00 00 00    	je     56f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 4bb:	8d 45 10             	lea    0x10(%ebp),%eax
 4be:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4c4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c9:	eb 33                	jmp    4fe <printf+0x5e>
 4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4cf:	90                   	nop
 4d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 17                	je     4f4 <printf+0x54>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	ff 75 08             	pushl  0x8(%ebp)
 4e9:	e8 75 fe ff ff       	call   363 <write>
 4ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4f1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4f4:	0f b6 1e             	movzbl (%esi),%ebx
 4f7:	83 c6 01             	add    $0x1,%esi
 4fa:	84 db                	test   %bl,%bl
 4fc:	74 71                	je     56f <printf+0xcf>
    c = fmt[i] & 0xff;
 4fe:	0f be cb             	movsbl %bl,%ecx
 501:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 504:	85 d2                	test   %edx,%edx
 506:	74 c8                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 508:	83 fa 25             	cmp    $0x25,%edx
 50b:	75 e7                	jne    4f4 <printf+0x54>
      if(c == 'd'){
 50d:	83 f8 64             	cmp    $0x64,%eax
 510:	0f 84 9a 00 00 00    	je     5b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 516:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 51c:	83 f9 70             	cmp    $0x70,%ecx
 51f:	74 5f                	je     580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 521:	83 f8 73             	cmp    $0x73,%eax
 524:	0f 84 d6 00 00 00    	je     600 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 52a:	83 f8 63             	cmp    $0x63,%eax
 52d:	0f 84 8d 00 00 00    	je     5c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 533:	83 f8 25             	cmp    $0x25,%eax
 536:	0f 84 b4 00 00 00    	je     5f0 <printf+0x150>
  write(fd, &c, 1);
 53c:	83 ec 04             	sub    $0x4,%esp
 53f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	ff 75 08             	pushl  0x8(%ebp)
 549:	e8 15 fe ff ff       	call   363 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 54e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 551:	83 c4 0c             	add    $0xc,%esp
 554:	6a 01                	push   $0x1
 556:	83 c6 01             	add    $0x1,%esi
 559:	57                   	push   %edi
 55a:	ff 75 08             	pushl  0x8(%ebp)
 55d:	e8 01 fe ff ff       	call   363 <write>
  for(i = 0; fmt[i]; i++){
 562:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 566:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 569:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 56b:	84 db                	test   %bl,%bl
 56d:	75 8f                	jne    4fe <printf+0x5e>
    }
  }
}
 56f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 572:	5b                   	pop    %ebx
 573:	5e                   	pop    %esi
 574:	5f                   	pop    %edi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    
 577:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 58d:	8b 45 08             	mov    0x8(%ebp),%eax
 590:	8b 13                	mov    (%ebx),%edx
 592:	e8 59 fe ff ff       	call   3f0 <printint>
        ap++;
 597:	89 d8                	mov    %ebx,%eax
 599:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59c:	31 d2                	xor    %edx,%edx
        ap++;
 59e:	83 c0 04             	add    $0x4,%eax
 5a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a4:	e9 4b ff ff ff       	jmp    4f4 <printf+0x54>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b8:	6a 01                	push   $0x1
 5ba:	eb ce                	jmp    58a <printf+0xea>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
        ap++;
 5ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5cd:	57                   	push   %edi
 5ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d4:	e8 8a fd ff ff       	call   363 <write>
        ap++;
 5d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 0e ff ff ff       	jmp    4f4 <printf+0x54>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
 5f6:	e9 59 ff ff ff       	jmp    554 <printf+0xb4>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
        s = (char*)*ap;
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
 603:	8b 18                	mov    (%eax),%ebx
        ap++;
 605:	83 c0 04             	add    $0x4,%eax
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 60b:	85 db                	test   %ebx,%ebx
 60d:	74 17                	je     626 <printf+0x186>
        while(*s != 0){
 60f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 612:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 614:	84 c0                	test   %al,%al
 616:	0f 84 d8 fe ff ff    	je     4f4 <printf+0x54>
 61c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 61f:	89 de                	mov    %ebx,%esi
 621:	8b 5d 08             	mov    0x8(%ebp),%ebx
 624:	eb 1a                	jmp    640 <printf+0x1a0>
          s = "(null)";
 626:	bb 1b 08 00 00       	mov    $0x81b,%ebx
        while(*s != 0){
 62b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 62e:	b8 28 00 00 00       	mov    $0x28,%eax
 633:	89 de                	mov    %ebx,%esi
 635:	8b 5d 08             	mov    0x8(%ebp),%ebx
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c6 01             	add    $0x1,%esi
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	53                   	push   %ebx
 64d:	e8 11 fd ff ff       	call   363 <write>
        while(*s != 0){
 652:	0f b6 06             	movzbl (%esi),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x1a0>
 65c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 8e fe ff ff       	jmp    4f4 <printf+0x54>
 666:	66 90                	xchg   %ax,%ax
 668:	66 90                	xchg   %ax,%ax
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 675:	a1 04 0b 00 00       	mov    0xb04,%eax
{
 67a:	89 e5                	mov    %esp,%ebp
 67c:	57                   	push   %edi
 67d:	56                   	push   %esi
 67e:	53                   	push   %ebx
 67f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 682:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 684:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 687:	39 c8                	cmp    %ecx,%eax
 689:	73 15                	jae    6a0 <free+0x30>
 68b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
 690:	39 d1                	cmp    %edx,%ecx
 692:	72 14                	jb     6a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 d0                	cmp    %edx,%eax
 696:	73 10                	jae    6a8 <free+0x38>
{
 698:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69a:	8b 10                	mov    (%eax),%edx
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 f4                	jb     698 <free+0x28>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	73 f0                	jae    698 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 fa                	cmp    %edi,%edx
 6b0:	74 1e                	je     6d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 28                	je     6e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 6d0:	03 72 04             	add    0x4(%edx),%esi
 6d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	8b 12                	mov    (%edx),%edx
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	75 d8                	jne    6bf <free+0x4f>
    p->s.size += bp->s.size;
 6e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ea:	a3 04 0b 00 00       	mov    %eax,0xb04
    p->s.size += bp->s.size;
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6f5:	89 10                	mov    %edx,(%eax)
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	f3 0f 1e fb          	endbr32 
 704:	55                   	push   %ebp
 705:	89 e5                	mov    %esp,%ebp
 707:	57                   	push   %edi
 708:	56                   	push   %esi
 709:	53                   	push   %ebx
 70a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 710:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 716:	8d 70 07             	lea    0x7(%eax),%esi
 719:	c1 ee 03             	shr    $0x3,%esi
 71c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 71f:	85 ff                	test   %edi,%edi
 721:	0f 84 a9 00 00 00    	je     7d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 727:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 729:	8b 48 04             	mov    0x4(%eax),%ecx
 72c:	39 f1                	cmp    %esi,%ecx
 72e:	73 6d                	jae    79d <malloc+0x9d>
 730:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 736:	bb 00 10 00 00       	mov    $0x1000,%ebx
 73b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 73e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 745:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 748:	eb 17                	jmp    761 <malloc+0x61>
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 750:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 752:	8b 4a 04             	mov    0x4(%edx),%ecx
 755:	39 f1                	cmp    %esi,%ecx
 757:	73 4f                	jae    7a8 <malloc+0xa8>
 759:	8b 3d 04 0b 00 00    	mov    0xb04,%edi
 75f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 761:	39 c7                	cmp    %eax,%edi
 763:	75 eb                	jne    750 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	ff 75 e4             	pushl  -0x1c(%ebp)
 76b:	e8 5b fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 770:	83 c4 10             	add    $0x10,%esp
 773:	83 f8 ff             	cmp    $0xffffffff,%eax
 776:	74 1b                	je     793 <malloc+0x93>
  hp->s.size = nu;
 778:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 77b:	83 ec 0c             	sub    $0xc,%esp
 77e:	83 c0 08             	add    $0x8,%eax
 781:	50                   	push   %eax
 782:	e8 e9 fe ff ff       	call   670 <free>
  return freep;
 787:	a1 04 0b 00 00       	mov    0xb04,%eax
      if((p = morecore(nunits)) == 0)
 78c:	83 c4 10             	add    $0x10,%esp
 78f:	85 c0                	test   %eax,%eax
 791:	75 bd                	jne    750 <malloc+0x50>
        return 0;
  }
}
 793:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 796:	31 c0                	xor    %eax,%eax
}
 798:	5b                   	pop    %ebx
 799:	5e                   	pop    %esi
 79a:	5f                   	pop    %edi
 79b:	5d                   	pop    %ebp
 79c:	c3                   	ret    
    if(p->s.size >= nunits){
 79d:	89 c2                	mov    %eax,%edx
 79f:	89 f8                	mov    %edi,%eax
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7a8:	39 ce                	cmp    %ecx,%esi
 7aa:	74 54                	je     800 <malloc+0x100>
        p->s.size -= nunits;
 7ac:	29 f1                	sub    %esi,%ecx
 7ae:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 7b1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 7b4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 7b7:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7bf:	8d 42 08             	lea    0x8(%edx),%eax
}
 7c2:	5b                   	pop    %ebx
 7c3:	5e                   	pop    %esi
 7c4:	5f                   	pop    %edi
 7c5:	5d                   	pop    %ebp
 7c6:	c3                   	ret    
 7c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ce:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 04 0b 00 00 08 	movl   $0xb08,0xb04
 7d7:	0b 00 00 
    base.s.size = 0;
 7da:	bf 08 0b 00 00       	mov    $0xb08,%edi
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 08 0b 00 00 08 	movl   $0xb08,0xb08
 7e6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 7eb:	c7 05 0c 0b 00 00 00 	movl   $0x0,0xb0c
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	e9 36 ff ff ff       	jmp    730 <malloc+0x30>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 800:	8b 0a                	mov    (%edx),%ecx
 802:	89 08                	mov    %ecx,(%eax)
 804:	eb b1                	jmp    7b7 <malloc+0xb7>
