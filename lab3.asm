
_lab3:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
	x = test(x);
	printf(1,"%d\n",x);
   return x;
}
int main(int argc, char *argv[])
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
   int pid=0;
   pid=fork();
    1011:	e8 b4 02 00 00       	call   12ca <fork>
   if(pid==0){
    1016:	85 c0                	test   %eax,%eax
    1018:	75 1d                	jne    1037 <main+0x37>
       test(1);
    101a:	83 ec 0c             	sub    $0xc,%esp
    101d:	6a 01                	push   $0x1
    101f:	e8 2c 00 00 00       	call   1050 <test>
	printf(1,"running");
    1024:	58                   	pop    %eax
    1025:	5a                   	pop    %edx
    1026:	68 88 17 00 00       	push   $0x1788
    102b:	6a 01                	push   $0x1
    102d:	e8 fe 03 00 00       	call   1430 <printf>
       exit();
    1032:	e8 9b 02 00 00       	call   12d2 <exit>
   }
   wait();
    1037:	e8 9e 02 00 00       	call   12da <wait>
   exit();
    103c:	e8 91 02 00 00       	call   12d2 <exit>
    1041:	66 90                	xchg   %ax,%ax
    1043:	66 90                	xchg   %ax,%ax
    1045:	66 90                	xchg   %ax,%ax
    1047:	66 90                	xchg   %ax,%ax
    1049:	66 90                	xchg   %ax,%ax
    104b:	66 90                	xchg   %ax,%ax
    104d:	66 90                	xchg   %ax,%ax
    104f:	90                   	nop

00001050 <test>:
#include "types.h"
#include "stat.h"
#include "user.h"

int test(int n)
{ 
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	53                   	push   %ebx
    1054:	83 ec 10             	sub    $0x10,%esp
   int x = n + 1;
    1057:	8b 45 08             	mov    0x8(%ebp),%eax
    105a:	83 c0 01             	add    $0x1,%eax

	x = test(x);
    105d:	50                   	push   %eax
    105e:	e8 ed ff ff ff       	call   1050 <test>
	x = test(x);
    1063:	89 04 24             	mov    %eax,(%esp)
    1066:	e8 e5 ff ff ff       	call   1050 <test>
	printf(1,"%d\n",x);
    106b:	83 c4 0c             	add    $0xc,%esp
int test(int n)
{ 
   int x = n + 1;

	x = test(x);
	x = test(x);
    106e:	89 c3                	mov    %eax,%ebx
	printf(1,"%d\n",x);
    1070:	50                   	push   %eax
    1071:	68 84 17 00 00       	push   $0x1784
    1076:	6a 01                	push   $0x1
    1078:	e8 b3 03 00 00       	call   1430 <printf>
   return x;
}
    107d:	89 d8                	mov    %ebx,%eax
    107f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1082:	c9                   	leave  
    1083:	c3                   	ret    
    1084:	66 90                	xchg   %ax,%ax
    1086:	66 90                	xchg   %ax,%ax
    1088:	66 90                	xchg   %ax,%ax
    108a:	66 90                	xchg   %ax,%ax
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	8b 45 08             	mov    0x8(%ebp),%eax
    1097:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    109a:	89 c2                	mov    %eax,%edx
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a0:	83 c1 01             	add    $0x1,%ecx
    10a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    10a7:	83 c2 01             	add    $0x1,%edx
    10aa:	84 db                	test   %bl,%bl
    10ac:	88 5a ff             	mov    %bl,-0x1(%edx)
    10af:	75 ef                	jne    10a0 <strcpy+0x10>
    ;
  return os;
}
    10b1:	5b                   	pop    %ebx
    10b2:	5d                   	pop    %ebp
    10b3:	c3                   	ret    
    10b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	56                   	push   %esi
    10c4:	53                   	push   %ebx
    10c5:	8b 55 08             	mov    0x8(%ebp),%edx
    10c8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    10cb:	0f b6 02             	movzbl (%edx),%eax
    10ce:	0f b6 19             	movzbl (%ecx),%ebx
    10d1:	84 c0                	test   %al,%al
    10d3:	75 1e                	jne    10f3 <strcmp+0x33>
    10d5:	eb 29                	jmp    1100 <strcmp+0x40>
    10d7:	89 f6                	mov    %esi,%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    10e0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    10e6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10e9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    10ed:	84 c0                	test   %al,%al
    10ef:	74 0f                	je     1100 <strcmp+0x40>
    10f1:	89 f1                	mov    %esi,%ecx
    10f3:	38 d8                	cmp    %bl,%al
    10f5:	74 e9                	je     10e0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10f7:	29 d8                	sub    %ebx,%eax
}
    10f9:	5b                   	pop    %ebx
    10fa:	5e                   	pop    %esi
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1100:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1102:	29 d8                	sub    %ebx,%eax
}
    1104:	5b                   	pop    %ebx
    1105:	5e                   	pop    %esi
    1106:	5d                   	pop    %ebp
    1107:	c3                   	ret    
    1108:	90                   	nop
    1109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001110 <strlen>:

uint
strlen(char *s)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1116:	80 39 00             	cmpb   $0x0,(%ecx)
    1119:	74 12                	je     112d <strlen+0x1d>
    111b:	31 d2                	xor    %edx,%edx
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    1120:	83 c2 01             	add    $0x1,%edx
    1123:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1127:	89 d0                	mov    %edx,%eax
    1129:	75 f5                	jne    1120 <strlen+0x10>
    ;
  return n;
}
    112b:	5d                   	pop    %ebp
    112c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    112d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    112f:	5d                   	pop    %ebp
    1130:	c3                   	ret    
    1131:	eb 0d                	jmp    1140 <memset>
    1133:	90                   	nop
    1134:	90                   	nop
    1135:	90                   	nop
    1136:	90                   	nop
    1137:	90                   	nop
    1138:	90                   	nop
    1139:	90                   	nop
    113a:	90                   	nop
    113b:	90                   	nop
    113c:	90                   	nop
    113d:	90                   	nop
    113e:	90                   	nop
    113f:	90                   	nop

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1147:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114a:	8b 45 0c             	mov    0xc(%ebp),%eax
    114d:	89 d7                	mov    %edx,%edi
    114f:	fc                   	cld    
    1150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1152:	89 d0                	mov    %edx,%eax
    1154:	5f                   	pop    %edi
    1155:	5d                   	pop    %ebp
    1156:	c3                   	ret    
    1157:	89 f6                	mov    %esi,%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	53                   	push   %ebx
    1164:	8b 45 08             	mov    0x8(%ebp),%eax
    1167:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    116a:	0f b6 10             	movzbl (%eax),%edx
    116d:	84 d2                	test   %dl,%dl
    116f:	74 1d                	je     118e <strchr+0x2e>
    if(*s == c)
    1171:	38 d3                	cmp    %dl,%bl
    1173:	89 d9                	mov    %ebx,%ecx
    1175:	75 0d                	jne    1184 <strchr+0x24>
    1177:	eb 17                	jmp    1190 <strchr+0x30>
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1180:	38 ca                	cmp    %cl,%dl
    1182:	74 0c                	je     1190 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1184:	83 c0 01             	add    $0x1,%eax
    1187:	0f b6 10             	movzbl (%eax),%edx
    118a:	84 d2                	test   %dl,%dl
    118c:	75 f2                	jne    1180 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    118e:	31 c0                	xor    %eax,%eax
}
    1190:	5b                   	pop    %ebx
    1191:	5d                   	pop    %ebp
    1192:	c3                   	ret    
    1193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	56                   	push   %esi
    11a5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    11a8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    11ab:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11ae:	eb 29                	jmp    11d9 <gets+0x39>
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	6a 01                	push   $0x1
    11b5:	57                   	push   %edi
    11b6:	6a 00                	push   $0x0
    11b8:	e8 2d 01 00 00       	call   12ea <read>
    if(cc < 1)
    11bd:	83 c4 10             	add    $0x10,%esp
    11c0:	85 c0                	test   %eax,%eax
    11c2:	7e 1d                	jle    11e1 <gets+0x41>
      break;
    buf[i++] = c;
    11c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
    11cb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    11cd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    11cf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    11d3:	74 1b                	je     11f0 <gets+0x50>
    11d5:	3c 0d                	cmp    $0xd,%al
    11d7:	74 17                	je     11f0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11d9:	8d 5e 01             	lea    0x1(%esi),%ebx
    11dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11df:	7c cf                	jl     11b0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11e1:	8b 45 08             	mov    0x8(%ebp),%eax
    11e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11eb:	5b                   	pop    %ebx
    11ec:	5e                   	pop    %esi
    11ed:	5f                   	pop    %edi
    11ee:	5d                   	pop    %ebp
    11ef:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11f3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    11f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fc:	5b                   	pop    %ebx
    11fd:	5e                   	pop    %esi
    11fe:	5f                   	pop    %edi
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	eb 0d                	jmp    1210 <stat>
    1203:	90                   	nop
    1204:	90                   	nop
    1205:	90                   	nop
    1206:	90                   	nop
    1207:	90                   	nop
    1208:	90                   	nop
    1209:	90                   	nop
    120a:	90                   	nop
    120b:	90                   	nop
    120c:	90                   	nop
    120d:	90                   	nop
    120e:	90                   	nop
    120f:	90                   	nop

00001210 <stat>:

int
stat(char *n, struct stat *st)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	56                   	push   %esi
    1214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1215:	83 ec 08             	sub    $0x8,%esp
    1218:	6a 00                	push   $0x0
    121a:	ff 75 08             	pushl  0x8(%ebp)
    121d:	e8 f0 00 00 00       	call   1312 <open>
  if(fd < 0)
    1222:	83 c4 10             	add    $0x10,%esp
    1225:	85 c0                	test   %eax,%eax
    1227:	78 27                	js     1250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	ff 75 0c             	pushl  0xc(%ebp)
    122f:	89 c3                	mov    %eax,%ebx
    1231:	50                   	push   %eax
    1232:	e8 f3 00 00 00       	call   132a <fstat>
    1237:	89 c6                	mov    %eax,%esi
  close(fd);
    1239:	89 1c 24             	mov    %ebx,(%esp)
    123c:	e8 b9 00 00 00       	call   12fa <close>
  return r;
    1241:	83 c4 10             	add    $0x10,%esp
    1244:	89 f0                	mov    %esi,%eax
}
    1246:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1249:	5b                   	pop    %ebx
    124a:	5e                   	pop    %esi
    124b:	5d                   	pop    %ebp
    124c:	c3                   	ret    
    124d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    1250:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1255:	eb ef                	jmp    1246 <stat+0x36>
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1267:	0f be 11             	movsbl (%ecx),%edx
    126a:	8d 42 d0             	lea    -0x30(%edx),%eax
    126d:	3c 09                	cmp    $0x9,%al
    126f:	b8 00 00 00 00       	mov    $0x0,%eax
    1274:	77 1f                	ja     1295 <atoi+0x35>
    1276:	8d 76 00             	lea    0x0(%esi),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1280:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1283:	83 c1 01             	add    $0x1,%ecx
    1286:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    128a:	0f be 11             	movsbl (%ecx),%edx
    128d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    1295:	5b                   	pop    %ebx
    1296:	5d                   	pop    %ebp
    1297:	c3                   	ret    
    1298:	90                   	nop
    1299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
    12a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ae:	85 db                	test   %ebx,%ebx
    12b0:	7e 14                	jle    12c6 <memmove+0x26>
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    12b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    12bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    12bf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12c2:	39 da                	cmp    %ebx,%edx
    12c4:	75 f2                	jne    12b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    12c6:	5b                   	pop    %ebx
    12c7:	5e                   	pop    %esi
    12c8:	5d                   	pop    %ebp
    12c9:	c3                   	ret    

000012ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12ca:	b8 01 00 00 00       	mov    $0x1,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <exit>:
SYSCALL(exit)
    12d2:	b8 02 00 00 00       	mov    $0x2,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <wait>:
SYSCALL(wait)
    12da:	b8 03 00 00 00       	mov    $0x3,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <pipe>:
SYSCALL(pipe)
    12e2:	b8 04 00 00 00       	mov    $0x4,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <read>:
SYSCALL(read)
    12ea:	b8 05 00 00 00       	mov    $0x5,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <write>:
SYSCALL(write)
    12f2:	b8 10 00 00 00       	mov    $0x10,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <close>:
SYSCALL(close)
    12fa:	b8 15 00 00 00       	mov    $0x15,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <kill>:
SYSCALL(kill)
    1302:	b8 06 00 00 00       	mov    $0x6,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <exec>:
SYSCALL(exec)
    130a:	b8 07 00 00 00       	mov    $0x7,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    

00001312 <open>:
SYSCALL(open)
    1312:	b8 0f 00 00 00       	mov    $0xf,%eax
    1317:	cd 40                	int    $0x40
    1319:	c3                   	ret    

0000131a <mknod>:
SYSCALL(mknod)
    131a:	b8 11 00 00 00       	mov    $0x11,%eax
    131f:	cd 40                	int    $0x40
    1321:	c3                   	ret    

00001322 <unlink>:
SYSCALL(unlink)
    1322:	b8 12 00 00 00       	mov    $0x12,%eax
    1327:	cd 40                	int    $0x40
    1329:	c3                   	ret    

0000132a <fstat>:
SYSCALL(fstat)
    132a:	b8 08 00 00 00       	mov    $0x8,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <link>:
SYSCALL(link)
    1332:	b8 13 00 00 00       	mov    $0x13,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <mkdir>:
SYSCALL(mkdir)
    133a:	b8 14 00 00 00       	mov    $0x14,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <chdir>:
SYSCALL(chdir)
    1342:	b8 09 00 00 00       	mov    $0x9,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <dup>:
SYSCALL(dup)
    134a:	b8 0a 00 00 00       	mov    $0xa,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <getpid>:
SYSCALL(getpid)
    1352:	b8 0b 00 00 00       	mov    $0xb,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <sbrk>:
SYSCALL(sbrk)
    135a:	b8 0c 00 00 00       	mov    $0xc,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <sleep>:
SYSCALL(sleep)
    1362:	b8 0d 00 00 00       	mov    $0xd,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <uptime>:
SYSCALL(uptime)
    136a:	b8 0e 00 00 00       	mov    $0xe,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <shm_open>:
SYSCALL(shm_open)
    1372:	b8 16 00 00 00       	mov    $0x16,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <shm_close>:
SYSCALL(shm_close)	
    137a:	b8 17 00 00 00       	mov    $0x17,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    
    1382:	66 90                	xchg   %ax,%ax
    1384:	66 90                	xchg   %ax,%ax
    1386:	66 90                	xchg   %ax,%ax
    1388:	66 90                	xchg   %ax,%ax
    138a:	66 90                	xchg   %ax,%ax
    138c:	66 90                	xchg   %ax,%ax
    138e:	66 90                	xchg   %ax,%ax

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	89 c6                	mov    %eax,%esi
    1398:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    139b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    139e:	85 db                	test   %ebx,%ebx
    13a0:	74 7e                	je     1420 <printint+0x90>
    13a2:	89 d0                	mov    %edx,%eax
    13a4:	c1 e8 1f             	shr    $0x1f,%eax
    13a7:	84 c0                	test   %al,%al
    13a9:	74 75                	je     1420 <printint+0x90>
    neg = 1;
    x = -xx;
    13ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    13ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    13b4:	f7 d8                	neg    %eax
    13b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    13b9:	31 ff                	xor    %edi,%edi
    13bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    13be:	89 ce                	mov    %ecx,%esi
    13c0:	eb 08                	jmp    13ca <printint+0x3a>
    13c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13c8:	89 cf                	mov    %ecx,%edi
    13ca:	31 d2                	xor    %edx,%edx
    13cc:	8d 4f 01             	lea    0x1(%edi),%ecx
    13cf:	f7 f6                	div    %esi
    13d1:	0f b6 92 98 17 00 00 	movzbl 0x1798(%edx),%edx
  }while((x /= base) != 0);
    13d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    13da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    13dd:	75 e9                	jne    13c8 <printint+0x38>
  if(neg)
    13df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    13e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    13e5:	85 c0                	test   %eax,%eax
    13e7:	74 08                	je     13f1 <printint+0x61>
    buf[i++] = '-';
    13e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    13ee:	8d 4f 02             	lea    0x2(%edi),%ecx
    13f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    13f5:	8d 76 00             	lea    0x0(%esi),%esi
    13f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13fb:	83 ec 04             	sub    $0x4,%esp
    13fe:	83 ef 01             	sub    $0x1,%edi
    1401:	6a 01                	push   $0x1
    1403:	53                   	push   %ebx
    1404:	56                   	push   %esi
    1405:	88 45 d7             	mov    %al,-0x29(%ebp)
    1408:	e8 e5 fe ff ff       	call   12f2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    140d:	83 c4 10             	add    $0x10,%esp
    1410:	39 df                	cmp    %ebx,%edi
    1412:	75 e4                	jne    13f8 <printint+0x68>
    putc(fd, buf[i]);
}
    1414:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1417:	5b                   	pop    %ebx
    1418:	5e                   	pop    %esi
    1419:	5f                   	pop    %edi
    141a:	5d                   	pop    %ebp
    141b:	c3                   	ret    
    141c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1420:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1422:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1429:	eb 8b                	jmp    13b6 <printint+0x26>
    142b:	90                   	nop
    142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001430 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1436:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1439:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    143c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    143f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1442:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1445:	0f b6 1e             	movzbl (%esi),%ebx
    1448:	83 c6 01             	add    $0x1,%esi
    144b:	84 db                	test   %bl,%bl
    144d:	0f 84 b0 00 00 00    	je     1503 <printf+0xd3>
    1453:	31 d2                	xor    %edx,%edx
    1455:	eb 39                	jmp    1490 <printf+0x60>
    1457:	89 f6                	mov    %esi,%esi
    1459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1460:	83 f8 25             	cmp    $0x25,%eax
    1463:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1466:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    146b:	74 18                	je     1485 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    146d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1470:	83 ec 04             	sub    $0x4,%esp
    1473:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1476:	6a 01                	push   $0x1
    1478:	50                   	push   %eax
    1479:	57                   	push   %edi
    147a:	e8 73 fe ff ff       	call   12f2 <write>
    147f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1482:	83 c4 10             	add    $0x10,%esp
    1485:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1488:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    148c:	84 db                	test   %bl,%bl
    148e:	74 73                	je     1503 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    1490:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1492:	0f be cb             	movsbl %bl,%ecx
    1495:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1498:	74 c6                	je     1460 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    149a:	83 fa 25             	cmp    $0x25,%edx
    149d:	75 e6                	jne    1485 <printf+0x55>
      if(c == 'd'){
    149f:	83 f8 64             	cmp    $0x64,%eax
    14a2:	0f 84 f8 00 00 00    	je     15a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14ae:	83 f9 70             	cmp    $0x70,%ecx
    14b1:	74 5d                	je     1510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14b3:	83 f8 73             	cmp    $0x73,%eax
    14b6:	0f 84 84 00 00 00    	je     1540 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14bc:	83 f8 63             	cmp    $0x63,%eax
    14bf:	0f 84 ea 00 00 00    	je     15af <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14c5:	83 f8 25             	cmp    $0x25,%eax
    14c8:	0f 84 c2 00 00 00    	je     1590 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
    14d1:	83 ec 04             	sub    $0x4,%esp
    14d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14d8:	6a 01                	push   $0x1
    14da:	50                   	push   %eax
    14db:	57                   	push   %edi
    14dc:	e8 11 fe ff ff       	call   12f2 <write>
    14e1:	83 c4 0c             	add    $0xc,%esp
    14e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    14e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    14ea:	6a 01                	push   $0x1
    14ec:	50                   	push   %eax
    14ed:	57                   	push   %edi
    14ee:	83 c6 01             	add    $0x1,%esi
    14f1:	e8 fc fd ff ff       	call   12f2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14fd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ff:	84 db                	test   %bl,%bl
    1501:	75 8d                	jne    1490 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1503:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1506:	5b                   	pop    %ebx
    1507:	5e                   	pop    %esi
    1508:	5f                   	pop    %edi
    1509:	5d                   	pop    %ebp
    150a:	c3                   	ret    
    150b:	90                   	nop
    150c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1510:	83 ec 0c             	sub    $0xc,%esp
    1513:	b9 10 00 00 00       	mov    $0x10,%ecx
    1518:	6a 00                	push   $0x0
    151a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    151d:	89 f8                	mov    %edi,%eax
    151f:	8b 13                	mov    (%ebx),%edx
    1521:	e8 6a fe ff ff       	call   1390 <printint>
        ap++;
    1526:	89 d8                	mov    %ebx,%eax
    1528:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    152b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    152d:	83 c0 04             	add    $0x4,%eax
    1530:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1533:	e9 4d ff ff ff       	jmp    1485 <printf+0x55>
    1538:	90                   	nop
    1539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1540:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1543:	8b 18                	mov    (%eax),%ebx
        ap++;
    1545:	83 c0 04             	add    $0x4,%eax
    1548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    154b:	b8 90 17 00 00       	mov    $0x1790,%eax
    1550:	85 db                	test   %ebx,%ebx
    1552:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    1555:	0f b6 03             	movzbl (%ebx),%eax
    1558:	84 c0                	test   %al,%al
    155a:	74 23                	je     157f <printf+0x14f>
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1560:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1563:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1566:	83 ec 04             	sub    $0x4,%esp
    1569:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    156b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    156e:	50                   	push   %eax
    156f:	57                   	push   %edi
    1570:	e8 7d fd ff ff       	call   12f2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1575:	0f b6 03             	movzbl (%ebx),%eax
    1578:	83 c4 10             	add    $0x10,%esp
    157b:	84 c0                	test   %al,%al
    157d:	75 e1                	jne    1560 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    157f:	31 d2                	xor    %edx,%edx
    1581:	e9 ff fe ff ff       	jmp    1485 <printf+0x55>
    1586:	8d 76 00             	lea    0x0(%esi),%esi
    1589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1590:	83 ec 04             	sub    $0x4,%esp
    1593:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1596:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1599:	6a 01                	push   $0x1
    159b:	e9 4c ff ff ff       	jmp    14ec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15a8:	6a 01                	push   $0x1
    15aa:	e9 6b ff ff ff       	jmp    151a <printf+0xea>
    15af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15b2:	83 ec 04             	sub    $0x4,%esp
    15b5:	8b 03                	mov    (%ebx),%eax
    15b7:	6a 01                	push   $0x1
    15b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
    15bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    15bf:	50                   	push   %eax
    15c0:	57                   	push   %edi
    15c1:	e8 2c fd ff ff       	call   12f2 <write>
    15c6:	e9 5b ff ff ff       	jmp    1526 <printf+0xf6>
    15cb:	66 90                	xchg   %ax,%ax
    15cd:	66 90                	xchg   %ax,%ax
    15cf:	90                   	nop

000015d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d1:	a1 94 1a 00 00       	mov    0x1a94,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d6:	89 e5                	mov    %esp,%ebp
    15d8:	57                   	push   %edi
    15d9:	56                   	push   %esi
    15da:	53                   	push   %ebx
    15db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15de:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e3:	39 c8                	cmp    %ecx,%eax
    15e5:	73 19                	jae    1600 <free+0x30>
    15e7:	89 f6                	mov    %esi,%esi
    15e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    15f0:	39 d1                	cmp    %edx,%ecx
    15f2:	72 1c                	jb     1610 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f4:	39 d0                	cmp    %edx,%eax
    15f6:	73 18                	jae    1610 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    15f8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15fa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15fc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15fe:	72 f0                	jb     15f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1600:	39 d0                	cmp    %edx,%eax
    1602:	72 f4                	jb     15f8 <free+0x28>
    1604:	39 d1                	cmp    %edx,%ecx
    1606:	73 f0                	jae    15f8 <free+0x28>
    1608:	90                   	nop
    1609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1610:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1613:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1616:	39 d7                	cmp    %edx,%edi
    1618:	74 19                	je     1633 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    161a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    161d:	8b 50 04             	mov    0x4(%eax),%edx
    1620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1623:	39 f1                	cmp    %esi,%ecx
    1625:	74 23                	je     164a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1627:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1629:	a3 94 1a 00 00       	mov    %eax,0x1a94
}
    162e:	5b                   	pop    %ebx
    162f:	5e                   	pop    %esi
    1630:	5f                   	pop    %edi
    1631:	5d                   	pop    %ebp
    1632:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1633:	03 72 04             	add    0x4(%edx),%esi
    1636:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1639:	8b 10                	mov    (%eax),%edx
    163b:	8b 12                	mov    (%edx),%edx
    163d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1640:	8b 50 04             	mov    0x4(%eax),%edx
    1643:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1646:	39 f1                	cmp    %esi,%ecx
    1648:	75 dd                	jne    1627 <free+0x57>
    p->s.size += bp->s.size;
    164a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    164d:	a3 94 1a 00 00       	mov    %eax,0x1a94
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1652:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1655:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1658:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    165a:	5b                   	pop    %ebx
    165b:	5e                   	pop    %esi
    165c:	5f                   	pop    %edi
    165d:	5d                   	pop    %ebp
    165e:	c3                   	ret    
    165f:	90                   	nop

00001660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    166c:	8b 15 94 1a 00 00    	mov    0x1a94,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1672:	8d 78 07             	lea    0x7(%eax),%edi
    1675:	c1 ef 03             	shr    $0x3,%edi
    1678:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    167b:	85 d2                	test   %edx,%edx
    167d:	0f 84 a3 00 00 00    	je     1726 <malloc+0xc6>
    1683:	8b 02                	mov    (%edx),%eax
    1685:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1688:	39 cf                	cmp    %ecx,%edi
    168a:	76 74                	jbe    1700 <malloc+0xa0>
    168c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1692:	be 00 10 00 00       	mov    $0x1000,%esi
    1697:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    169e:	0f 43 f7             	cmovae %edi,%esi
    16a1:	ba 00 80 00 00       	mov    $0x8000,%edx
    16a6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    16ac:	0f 46 da             	cmovbe %edx,%ebx
    16af:	eb 10                	jmp    16c1 <malloc+0x61>
    16b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    16ba:	8b 48 04             	mov    0x4(%eax),%ecx
    16bd:	39 cf                	cmp    %ecx,%edi
    16bf:	76 3f                	jbe    1700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16c1:	39 05 94 1a 00 00    	cmp    %eax,0x1a94
    16c7:	89 c2                	mov    %eax,%edx
    16c9:	75 ed                	jne    16b8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	53                   	push   %ebx
    16cf:	e8 86 fc ff ff       	call   135a <sbrk>
  if(p == (char*)-1)
    16d4:	83 c4 10             	add    $0x10,%esp
    16d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    16da:	74 1c                	je     16f8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    16dc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    16df:	83 ec 0c             	sub    $0xc,%esp
    16e2:	83 c0 08             	add    $0x8,%eax
    16e5:	50                   	push   %eax
    16e6:	e8 e5 fe ff ff       	call   15d0 <free>
  return freep;
    16eb:	8b 15 94 1a 00 00    	mov    0x1a94,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    16f1:	83 c4 10             	add    $0x10,%esp
    16f4:	85 d2                	test   %edx,%edx
    16f6:	75 c0                	jne    16b8 <malloc+0x58>
        return 0;
    16f8:	31 c0                	xor    %eax,%eax
    16fa:	eb 1c                	jmp    1718 <malloc+0xb8>
    16fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1700:	39 cf                	cmp    %ecx,%edi
    1702:	74 1c                	je     1720 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1704:	29 f9                	sub    %edi,%ecx
    1706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    170c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    170f:	89 15 94 1a 00 00    	mov    %edx,0x1a94
      return (void*)(p + 1);
    1715:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1718:	8d 65 f4             	lea    -0xc(%ebp),%esp
    171b:	5b                   	pop    %ebx
    171c:	5e                   	pop    %esi
    171d:	5f                   	pop    %edi
    171e:	5d                   	pop    %ebp
    171f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1720:	8b 08                	mov    (%eax),%ecx
    1722:	89 0a                	mov    %ecx,(%edx)
    1724:	eb e9                	jmp    170f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1726:	c7 05 94 1a 00 00 98 	movl   $0x1a98,0x1a94
    172d:	1a 00 00 
    1730:	c7 05 98 1a 00 00 98 	movl   $0x1a98,0x1a98
    1737:	1a 00 00 
    base.s.size = 0;
    173a:	b8 98 1a 00 00       	mov    $0x1a98,%eax
    173f:	c7 05 9c 1a 00 00 00 	movl   $0x0,0x1a9c
    1746:	00 00 00 
    1749:	e9 3e ff ff ff       	jmp    168c <malloc+0x2c>
    174e:	66 90                	xchg   %ax,%ax

00001750 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1750:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1751:	b9 01 00 00 00       	mov    $0x1,%ecx
    1756:	89 e5                	mov    %esp,%ebp
    1758:	8b 55 08             	mov    0x8(%ebp),%edx
    175b:	90                   	nop
    175c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1760:	89 c8                	mov    %ecx,%eax
    1762:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1765:	85 c0                	test   %eax,%eax
    1767:	75 f7                	jne    1760 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1769:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    176e:	5d                   	pop    %ebp
    176f:	c3                   	ret    

00001770 <urelease>:

void urelease (struct uspinlock *lk) {
    1770:	55                   	push   %ebp
    1771:	89 e5                	mov    %esp,%ebp
    1773:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1776:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    177b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1781:	5d                   	pop    %ebp
    1782:	c3                   	ret    
