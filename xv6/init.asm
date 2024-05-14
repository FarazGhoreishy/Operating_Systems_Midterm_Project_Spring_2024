
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 18 08 00 00       	push   $0x818
  1d:	e8 71 03 00 00       	call   393 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 9b 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  2d:	83 ec 0c             	sub    $0xc,%esp
  30:	6a 00                	push   $0x0
  32:	e8 94 03 00 00       	call   3cb <dup>
  dup(0);  // stderr
  37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3e:	e8 88 03 00 00       	call   3cb <dup>
  43:	83 c4 10             	add    $0x10,%esp
  46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  50:	83 ec 08             	sub    $0x8,%esp
  53:	68 20 08 00 00       	push   $0x820
  58:	6a 01                	push   $0x1
  5a:	e8 51 04 00 00       	call   4b0 <printf>
    pid = fork();
  5f:	e8 e7 02 00 00       	call   34b <fork>
    if(pid < 0){
  64:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  69:	85 c0                	test   %eax,%eax
  6b:	78 24                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  6d:	74 35                	je     a4 <main+0xa4>
  6f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 e6 02 00 00       	call   35b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 d7                	js     50 <main+0x50>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 d3                	je     50 <main+0x50>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 5f 08 00 00       	push   $0x85f
  85:	6a 01                	push   $0x1
  87:	e8 24 04 00 00       	call   4b0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 33 08 00 00       	push   $0x833
  98:	6a 01                	push   $0x1
  9a:	e8 11 04 00 00       	call   4b0 <printf>
      exit();
  9f:	e8 af 02 00 00       	call   353 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 1c 0b 00 00       	push   $0xb1c
  ab:	68 46 08 00 00       	push   $0x846
  b0:	e8 d6 02 00 00       	call   38b <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 49 08 00 00       	push   $0x849
  bc:	6a 01                	push   $0x1
  be:	e8 ed 03 00 00       	call   4b0 <printf>
      exit();
  c3:	e8 8b 02 00 00       	call   353 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 18 08 00 00       	push   $0x818
  d2:	e8 c4 02 00 00       	call   39b <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 18 08 00 00       	push   $0x818
  e0:	e8 ae 02 00 00       	call   393 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 40 ff ff ff       	jmp    2d <main+0x2d>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	31 c0                	xor    %eax,%eax
  f7:	89 e5                	mov    %esp,%ebp
  f9:	53                   	push   %ebx
  fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
 10e:	89 c8                	mov    %ecx,%eax
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12b:	8b 55 0c             	mov    0xc(%ebp),%edx
 12e:	0f b6 01             	movzbl (%ecx),%eax
 131:	0f b6 1a             	movzbl (%edx),%ebx
 134:	84 c0                	test   %al,%al
 136:	75 19                	jne    151 <strcmp+0x31>
 138:	eb 26                	jmp    160 <strcmp+0x40>
 13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
 144:	83 c1 01             	add    $0x1,%ecx
 147:	83 c2 01             	add    $0x1,%edx
 14a:	0f b6 1a             	movzbl (%edx),%ebx
 14d:	84 c0                	test   %al,%al
 14f:	74 0f                	je     160 <strcmp+0x40>
 151:	38 d8                	cmp    %bl,%al
 153:	74 eb                	je     140 <strcmp+0x20>
 155:	29 d8                	sub    %ebx,%eax
 157:	5b                   	pop    %ebx
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	31 c0                	xor    %eax,%eax
 162:	29 d8                	sub    %ebx,%eax
 164:	5b                   	pop    %ebx
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	8b 55 08             	mov    0x8(%ebp),%edx
 17a:	80 3a 00             	cmpb   $0x0,(%edx)
 17d:	74 21                	je     1a0 <strlen+0x30>
 17f:	31 c0                	xor    %eax,%eax
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 188:	83 c0 01             	add    $0x1,%eax
 18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 18f:	89 c1                	mov    %eax,%ecx
 191:	75 f5                	jne    188 <strlen+0x18>
 193:	89 c8                	mov    %ecx,%eax
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19e:	66 90                	xchg   %ax,%ax
 1a0:	31 c9                	xor    %ecx,%ecx
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 d7                	mov    %edx,%edi
 1c3:	fc                   	cld    
 1c4:	f3 aa                	rep stos %al,%es:(%edi)
 1c6:	89 d0                	mov    %edx,%eax
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strchr>:
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 1de:	0f b6 10             	movzbl (%eax),%edx
 1e1:	84 d2                	test   %dl,%dl
 1e3:	75 16                	jne    1fb <strchr+0x2b>
 1e5:	eb 21                	jmp    208 <strchr+0x38>
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
 1f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1f4:	83 c0 01             	add    $0x1,%eax
 1f7:	84 d2                	test   %dl,%dl
 1f9:	74 0d                	je     208 <strchr+0x38>
 1fb:	38 d1                	cmp    %dl,%cl
 1fd:	75 f1                	jne    1f0 <strchr+0x20>
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	31 c0                	xor    %eax,%eax
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <gets>:
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	57                   	push   %edi
 218:	56                   	push   %esi
 219:	31 f6                	xor    %esi,%esi
 21b:	53                   	push   %ebx
 21c:	89 f3                	mov    %esi,%ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	8b 7d 08             	mov    0x8(%ebp),%edi
 224:	eb 33                	jmp    259 <gets+0x49>
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 ec 04             	sub    $0x4,%esp
 233:	8d 45 e7             	lea    -0x19(%ebp),%eax
 236:	6a 01                	push   $0x1
 238:	50                   	push   %eax
 239:	6a 00                	push   $0x0
 23b:	e8 2b 01 00 00       	call   36b <read>
 240:	83 c4 10             	add    $0x10,%esp
 243:	85 c0                	test   %eax,%eax
 245:	7e 1c                	jle    263 <gets+0x53>
 247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 24b:	83 c7 01             	add    $0x1,%edi
 24e:	88 47 ff             	mov    %al,-0x1(%edi)
 251:	3c 0a                	cmp    $0xa,%al
 253:	74 23                	je     278 <gets+0x68>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 1f                	je     278 <gets+0x68>
 259:	83 c3 01             	add    $0x1,%ebx
 25c:	89 fe                	mov    %edi,%esi
 25e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 261:	7c cd                	jl     230 <gets+0x20>
 263:	89 f3                	mov    %esi,%ebx
 265:	8b 45 08             	mov    0x8(%ebp),%eax
 268:	c6 03 00             	movb   $0x0,(%ebx)
 26b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26e:	5b                   	pop    %ebx
 26f:	5e                   	pop    %esi
 270:	5f                   	pop    %edi
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	8b 75 08             	mov    0x8(%ebp),%esi
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	01 de                	add    %ebx,%esi
 280:	89 f3                	mov    %esi,%ebx
 282:	c6 03 00             	movb   $0x0,(%ebx)
 285:	8d 65 f4             	lea    -0xc(%ebp),%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi

00000290 <stat>:
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	56                   	push   %esi
 298:	53                   	push   %ebx
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	6a 00                	push   $0x0
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 ed 00 00 00       	call   393 <open>
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	78 2b                	js     2d8 <stat+0x48>
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	50                   	push   %eax
 2b6:	e8 f0 00 00 00       	call   3ab <fstat>
 2bb:	89 1c 24             	mov    %ebx,(%esp)
 2be:	89 c6                	mov    %eax,%esi
 2c0:	e8 b6 00 00 00       	call   37b <close>
 2c5:	83 c4 10             	add    $0x10,%esp
 2c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2dd:	eb e9                	jmp    2c8 <stat+0x38>
 2df:	90                   	nop

000002e0 <atoi>:
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	53                   	push   %ebx
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	0f be 02             	movsbl (%edx),%eax
 2ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2f1:	80 f9 09             	cmp    $0x9,%cl
 2f4:	b9 00 00 00 00       	mov    $0x0,%ecx
 2f9:	77 1a                	ja     315 <atoi+0x35>
 2fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
 300:	83 c2 01             	add    $0x1,%edx
 303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 30a:	0f be 02             	movsbl (%edx),%eax
 30d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
 315:	89 c8                	mov    %ecx,%eax
 317:	5b                   	pop    %ebx
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <memmove>:
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
 32e:	56                   	push   %esi
 32f:	8b 75 0c             	mov    0xc(%ebp),%esi
 332:	85 c0                	test   %eax,%eax
 334:	7e 0f                	jle    345 <memmove+0x25>
 336:	01 d0                	add    %edx,%eax
 338:	89 d7                	mov    %edx,%edi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 341:	39 f8                	cmp    %edi,%eax
 343:	75 fb                	jne    340 <memmove+0x20>
 345:	5e                   	pop    %esi
 346:	89 d0                	mov    %edx,%eax
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    

0000034b <fork>:
 34b:	b8 01 00 00 00       	mov    $0x1,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <exit>:
 353:	b8 02 00 00 00       	mov    $0x2,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <wait>:
 35b:	b8 03 00 00 00       	mov    $0x3,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <pipe>:
 363:	b8 04 00 00 00       	mov    $0x4,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <read>:
 36b:	b8 05 00 00 00       	mov    $0x5,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <write>:
 373:	b8 10 00 00 00       	mov    $0x10,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <close>:
 37b:	b8 15 00 00 00       	mov    $0x15,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <kill>:
 383:	b8 06 00 00 00       	mov    $0x6,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exec>:
 38b:	b8 07 00 00 00       	mov    $0x7,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <open>:
 393:	b8 0f 00 00 00       	mov    $0xf,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <mknod>:
 39b:	b8 11 00 00 00       	mov    $0x11,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <unlink>:
 3a3:	b8 12 00 00 00       	mov    $0x12,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <fstat>:
 3ab:	b8 08 00 00 00       	mov    $0x8,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <link>:
 3b3:	b8 13 00 00 00       	mov    $0x13,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <mkdir>:
 3bb:	b8 14 00 00 00       	mov    $0x14,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <chdir>:
 3c3:	b8 09 00 00 00       	mov    $0x9,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <dup>:
 3cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <getpid>:
 3d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <sbrk>:
 3db:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <sleep>:
 3e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <uptime>:
 3eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <faps>:
 3f3:	b8 2a 00 00 00       	mov    $0x2a,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    
 3fb:	66 90                	xchg   %ax,%ax
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <printint>:
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 3c             	sub    $0x3c,%esp
 409:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
 40c:	89 d1                	mov    %edx,%ecx
 40e:	89 45 b8             	mov    %eax,-0x48(%ebp)
 411:	85 d2                	test   %edx,%edx
 413:	0f 89 7f 00 00 00    	jns    498 <printint+0x98>
 419:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 41d:	74 79                	je     498 <printint+0x98>
 41f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
 426:	f7 d9                	neg    %ecx
 428:	31 db                	xor    %ebx,%ebx
 42a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	89 c8                	mov    %ecx,%eax
 432:	31 d2                	xor    %edx,%edx
 434:	89 cf                	mov    %ecx,%edi
 436:	f7 75 c4             	divl   -0x3c(%ebp)
 439:	0f b6 92 70 08 00 00 	movzbl 0x870(%edx),%edx
 440:	89 45 c0             	mov    %eax,-0x40(%ebp)
 443:	89 d8                	mov    %ebx,%eax
 445:	8d 5b 01             	lea    0x1(%ebx),%ebx
 448:	8b 4d c0             	mov    -0x40(%ebp),%ecx
 44b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
 44e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 451:	76 dd                	jbe    430 <printint+0x30>
 453:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 456:	85 c9                	test   %ecx,%ecx
 458:	74 0c                	je     466 <printint+0x66>
 45a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 45f:	89 d8                	mov    %ebx,%eax
 461:	ba 2d 00 00 00       	mov    $0x2d,%edx
 466:	8b 7d b8             	mov    -0x48(%ebp),%edi
 469:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 46d:	eb 07                	jmp    476 <printint+0x76>
 46f:	90                   	nop
 470:	0f b6 13             	movzbl (%ebx),%edx
 473:	83 eb 01             	sub    $0x1,%ebx
 476:	83 ec 04             	sub    $0x4,%esp
 479:	88 55 d7             	mov    %dl,-0x29(%ebp)
 47c:	6a 01                	push   $0x1
 47e:	56                   	push   %esi
 47f:	57                   	push   %edi
 480:	e8 ee fe ff ff       	call   373 <write>
 485:	83 c4 10             	add    $0x10,%esp
 488:	39 de                	cmp    %ebx,%esi
 48a:	75 e4                	jne    470 <printint+0x70>
 48c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5f                   	pop    %edi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 498:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 49f:	eb 87                	jmp    428 <printint+0x28>
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop

000004b0 <printf>:
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	56                   	push   %esi
 4b9:	53                   	push   %ebx
 4ba:	83 ec 2c             	sub    $0x2c,%esp
 4bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 4c0:	0f b6 1e             	movzbl (%esi),%ebx
 4c3:	84 db                	test   %bl,%bl
 4c5:	0f 84 b4 00 00 00    	je     57f <printf+0xcf>
 4cb:	8d 45 10             	lea    0x10(%ebp),%eax
 4ce:	83 c6 01             	add    $0x1,%esi
 4d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4d4:	31 d2                	xor    %edx,%edx
 4d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d9:	eb 33                	jmp    50e <printf+0x5e>
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop
 4e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4e3:	ba 25 00 00 00       	mov    $0x25,%edx
 4e8:	83 f8 25             	cmp    $0x25,%eax
 4eb:	74 17                	je     504 <printf+0x54>
 4ed:	83 ec 04             	sub    $0x4,%esp
 4f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4f3:	6a 01                	push   $0x1
 4f5:	57                   	push   %edi
 4f6:	ff 75 08             	pushl  0x8(%ebp)
 4f9:	e8 75 fe ff ff       	call   373 <write>
 4fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 501:	83 c4 10             	add    $0x10,%esp
 504:	0f b6 1e             	movzbl (%esi),%ebx
 507:	83 c6 01             	add    $0x1,%esi
 50a:	84 db                	test   %bl,%bl
 50c:	74 71                	je     57f <printf+0xcf>
 50e:	0f be cb             	movsbl %bl,%ecx
 511:	0f b6 c3             	movzbl %bl,%eax
 514:	85 d2                	test   %edx,%edx
 516:	74 c8                	je     4e0 <printf+0x30>
 518:	83 fa 25             	cmp    $0x25,%edx
 51b:	75 e7                	jne    504 <printf+0x54>
 51d:	83 f8 64             	cmp    $0x64,%eax
 520:	0f 84 9a 00 00 00    	je     5c0 <printf+0x110>
 526:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 52c:	83 f9 70             	cmp    $0x70,%ecx
 52f:	74 5f                	je     590 <printf+0xe0>
 531:	83 f8 73             	cmp    $0x73,%eax
 534:	0f 84 d6 00 00 00    	je     610 <printf+0x160>
 53a:	83 f8 63             	cmp    $0x63,%eax
 53d:	0f 84 8d 00 00 00    	je     5d0 <printf+0x120>
 543:	83 f8 25             	cmp    $0x25,%eax
 546:	0f 84 b4 00 00 00    	je     600 <printf+0x150>
 54c:	83 ec 04             	sub    $0x4,%esp
 54f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 553:	6a 01                	push   $0x1
 555:	57                   	push   %edi
 556:	ff 75 08             	pushl  0x8(%ebp)
 559:	e8 15 fe ff ff       	call   373 <write>
 55e:	88 5d e7             	mov    %bl,-0x19(%ebp)
 561:	83 c4 0c             	add    $0xc,%esp
 564:	6a 01                	push   $0x1
 566:	83 c6 01             	add    $0x1,%esi
 569:	57                   	push   %edi
 56a:	ff 75 08             	pushl  0x8(%ebp)
 56d:	e8 01 fe ff ff       	call   373 <write>
 572:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 576:	83 c4 10             	add    $0x10,%esp
 579:	31 d2                	xor    %edx,%edx
 57b:	84 db                	test   %bl,%bl
 57d:	75 8f                	jne    50e <printf+0x5e>
 57f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 582:	5b                   	pop    %ebx
 583:	5e                   	pop    %esi
 584:	5f                   	pop    %edi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret    
 587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58e:	66 90                	xchg   %ax,%ax
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	6a 00                	push   $0x0
 59a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59d:	8b 45 08             	mov    0x8(%ebp),%eax
 5a0:	8b 13                	mov    (%ebx),%edx
 5a2:	e8 59 fe ff ff       	call   400 <printint>
 5a7:	89 d8                	mov    %ebx,%eax
 5a9:	83 c4 10             	add    $0x10,%esp
 5ac:	31 d2                	xor    %edx,%edx
 5ae:	83 c0 04             	add    $0x4,%eax
 5b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b4:	e9 4b ff ff ff       	jmp    504 <printf+0x54>
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c8:	6a 01                	push   $0x1
 5ca:	eb ce                	jmp    59a <printf+0xea>
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5d3:	83 ec 04             	sub    $0x4,%esp
 5d6:	8b 03                	mov    (%ebx),%eax
 5d8:	6a 01                	push   $0x1
 5da:	83 c3 04             	add    $0x4,%ebx
 5dd:	57                   	push   %edi
 5de:	ff 75 08             	pushl  0x8(%ebp)
 5e1:	88 45 e7             	mov    %al,-0x19(%ebp)
 5e4:	e8 8a fd ff ff       	call   373 <write>
 5e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5ec:	83 c4 10             	add    $0x10,%esp
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 0e ff ff ff       	jmp    504 <printf+0x54>
 5f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
 600:	88 5d e7             	mov    %bl,-0x19(%ebp)
 603:	83 ec 04             	sub    $0x4,%esp
 606:	e9 59 ff ff ff       	jmp    564 <printf+0xb4>
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
 610:	8b 45 d0             	mov    -0x30(%ebp),%eax
 613:	8b 18                	mov    (%eax),%ebx
 615:	83 c0 04             	add    $0x4,%eax
 618:	89 45 d0             	mov    %eax,-0x30(%ebp)
 61b:	85 db                	test   %ebx,%ebx
 61d:	74 17                	je     636 <printf+0x186>
 61f:	0f b6 03             	movzbl (%ebx),%eax
 622:	31 d2                	xor    %edx,%edx
 624:	84 c0                	test   %al,%al
 626:	0f 84 d8 fe ff ff    	je     504 <printf+0x54>
 62c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 62f:	89 de                	mov    %ebx,%esi
 631:	8b 5d 08             	mov    0x8(%ebp),%ebx
 634:	eb 1a                	jmp    650 <printf+0x1a0>
 636:	bb 68 08 00 00       	mov    $0x868,%ebx
 63b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 63e:	b8 28 00 00 00       	mov    $0x28,%eax
 643:	89 de                	mov    %ebx,%esi
 645:	8b 5d 08             	mov    0x8(%ebp),%ebx
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
 650:	83 ec 04             	sub    $0x4,%esp
 653:	83 c6 01             	add    $0x1,%esi
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
 659:	6a 01                	push   $0x1
 65b:	57                   	push   %edi
 65c:	53                   	push   %ebx
 65d:	e8 11 fd ff ff       	call   373 <write>
 662:	0f b6 06             	movzbl (%esi),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x1a0>
 66c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 66f:	31 d2                	xor    %edx,%edx
 671:	e9 8e fe ff ff       	jmp    504 <printf+0x54>
 676:	66 90                	xchg   %ax,%ax
 678:	66 90                	xchg   %ax,%ax
 67a:	66 90                	xchg   %ax,%ax
 67c:	66 90                	xchg   %ax,%ax
 67e:	66 90                	xchg   %ax,%ax

00000680 <free>:
 680:	f3 0f 1e fb          	endbr32 
 684:	55                   	push   %ebp
 685:	a1 24 0b 00 00       	mov    0xb24,%eax
 68a:	89 e5                	mov    %esp,%ebp
 68c:	57                   	push   %edi
 68d:	56                   	push   %esi
 68e:	53                   	push   %ebx
 68f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 692:	8b 10                	mov    (%eax),%edx
 694:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 697:	39 c8                	cmp    %ecx,%eax
 699:	73 15                	jae    6b0 <free+0x30>
 69b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
 6a0:	39 d1                	cmp    %edx,%ecx
 6a2:	72 14                	jb     6b8 <free+0x38>
 6a4:	39 d0                	cmp    %edx,%eax
 6a6:	73 10                	jae    6b8 <free+0x38>
 6a8:	89 d0                	mov    %edx,%eax
 6aa:	8b 10                	mov    (%eax),%edx
 6ac:	39 c8                	cmp    %ecx,%eax
 6ae:	72 f0                	jb     6a0 <free+0x20>
 6b0:	39 d0                	cmp    %edx,%eax
 6b2:	72 f4                	jb     6a8 <free+0x28>
 6b4:	39 d1                	cmp    %edx,%ecx
 6b6:	73 f0                	jae    6a8 <free+0x28>
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 fa                	cmp    %edi,%edx
 6c0:	74 1e                	je     6e0 <free+0x60>
 6c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6c5:	8b 50 04             	mov    0x4(%eax),%edx
 6c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6cb:	39 f1                	cmp    %esi,%ecx
 6cd:	74 28                	je     6f7 <free+0x77>
 6cf:	89 08                	mov    %ecx,(%eax)
 6d1:	5b                   	pop    %ebx
 6d2:	a3 24 0b 00 00       	mov    %eax,0xb24
 6d7:	5e                   	pop    %esi
 6d8:	5f                   	pop    %edi
 6d9:	5d                   	pop    %ebp
 6da:	c3                   	ret    
 6db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
 6e0:	03 72 04             	add    0x4(%edx),%esi
 6e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
 6e6:	8b 10                	mov    (%eax),%edx
 6e8:	8b 12                	mov    (%edx),%edx
 6ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6ed:	8b 50 04             	mov    0x4(%eax),%edx
 6f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f3:	39 f1                	cmp    %esi,%ecx
 6f5:	75 d8                	jne    6cf <free+0x4f>
 6f7:	03 53 fc             	add    -0x4(%ebx),%edx
 6fa:	a3 24 0b 00 00       	mov    %eax,0xb24
 6ff:	89 50 04             	mov    %edx,0x4(%eax)
 702:	8b 53 f8             	mov    -0x8(%ebx),%edx
 705:	89 10                	mov    %edx,(%eax)
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000710 <malloc>:
 710:	f3 0f 1e fb          	endbr32 
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	57                   	push   %edi
 718:	56                   	push   %esi
 719:	53                   	push   %ebx
 71a:	83 ec 1c             	sub    $0x1c,%esp
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	8b 3d 24 0b 00 00    	mov    0xb24,%edi
 726:	8d 70 07             	lea    0x7(%eax),%esi
 729:	c1 ee 03             	shr    $0x3,%esi
 72c:	83 c6 01             	add    $0x1,%esi
 72f:	85 ff                	test   %edi,%edi
 731:	0f 84 a9 00 00 00    	je     7e0 <malloc+0xd0>
 737:	8b 07                	mov    (%edi),%eax
 739:	8b 48 04             	mov    0x4(%eax),%ecx
 73c:	39 f1                	cmp    %esi,%ecx
 73e:	73 6d                	jae    7ad <malloc+0x9d>
 740:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 746:	bb 00 10 00 00       	mov    $0x1000,%ebx
 74b:	0f 43 de             	cmovae %esi,%ebx
 74e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 755:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 758:	eb 17                	jmp    771 <malloc+0x61>
 75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 760:	8b 10                	mov    (%eax),%edx
 762:	8b 4a 04             	mov    0x4(%edx),%ecx
 765:	39 f1                	cmp    %esi,%ecx
 767:	73 4f                	jae    7b8 <malloc+0xa8>
 769:	8b 3d 24 0b 00 00    	mov    0xb24,%edi
 76f:	89 d0                	mov    %edx,%eax
 771:	39 c7                	cmp    %eax,%edi
 773:	75 eb                	jne    760 <malloc+0x50>
 775:	83 ec 0c             	sub    $0xc,%esp
 778:	ff 75 e4             	pushl  -0x1c(%ebp)
 77b:	e8 5b fc ff ff       	call   3db <sbrk>
 780:	83 c4 10             	add    $0x10,%esp
 783:	83 f8 ff             	cmp    $0xffffffff,%eax
 786:	74 1b                	je     7a3 <malloc+0x93>
 788:	89 58 04             	mov    %ebx,0x4(%eax)
 78b:	83 ec 0c             	sub    $0xc,%esp
 78e:	83 c0 08             	add    $0x8,%eax
 791:	50                   	push   %eax
 792:	e8 e9 fe ff ff       	call   680 <free>
 797:	a1 24 0b 00 00       	mov    0xb24,%eax
 79c:	83 c4 10             	add    $0x10,%esp
 79f:	85 c0                	test   %eax,%eax
 7a1:	75 bd                	jne    760 <malloc+0x50>
 7a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7a6:	31 c0                	xor    %eax,%eax
 7a8:	5b                   	pop    %ebx
 7a9:	5e                   	pop    %esi
 7aa:	5f                   	pop    %edi
 7ab:	5d                   	pop    %ebp
 7ac:	c3                   	ret    
 7ad:	89 c2                	mov    %eax,%edx
 7af:	89 f8                	mov    %edi,%eax
 7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7b8:	39 ce                	cmp    %ecx,%esi
 7ba:	74 54                	je     810 <malloc+0x100>
 7bc:	29 f1                	sub    %esi,%ecx
 7be:	89 4a 04             	mov    %ecx,0x4(%edx)
 7c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
 7c4:	89 72 04             	mov    %esi,0x4(%edx)
 7c7:	a3 24 0b 00 00       	mov    %eax,0xb24
 7cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cf:	8d 42 08             	lea    0x8(%edx),%eax
 7d2:	5b                   	pop    %ebx
 7d3:	5e                   	pop    %esi
 7d4:	5f                   	pop    %edi
 7d5:	5d                   	pop    %ebp
 7d6:	c3                   	ret    
 7d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7de:	66 90                	xchg   %ax,%ax
 7e0:	c7 05 24 0b 00 00 28 	movl   $0xb28,0xb24
 7e7:	0b 00 00 
 7ea:	bf 28 0b 00 00       	mov    $0xb28,%edi
 7ef:	c7 05 28 0b 00 00 28 	movl   $0xb28,0xb28
 7f6:	0b 00 00 
 7f9:	89 f8                	mov    %edi,%eax
 7fb:	c7 05 2c 0b 00 00 00 	movl   $0x0,0xb2c
 802:	00 00 00 
 805:	e9 36 ff ff ff       	jmp    740 <malloc+0x30>
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 810:	8b 0a                	mov    (%edx),%ecx
 812:	89 08                	mov    %ecx,(%eax)
 814:	eb b1                	jmp    7c7 <malloc+0xb7>
