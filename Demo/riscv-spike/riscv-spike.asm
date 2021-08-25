
riscv-spike.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <boot>:
# define LOAD     lw
# define REGBYTES 4
#endif

boot:
    li t6, 0x1800
    80000000:	6f89                	lui	t6,0x2
    80000002:	800f8f9b          	addiw	t6,t6,-2048
    csrw mstatus, t6
    80000006:	300f9073          	csrw	mstatus,t6
    j _mstart
    8000000a:	a81d                	j	80000040 <_mstart>
    8000000c:	00000013          	nop
    80000010:	00000013          	nop
    80000014:	00000013          	nop
    80000018:	00000013          	nop
    8000001c:	00000013          	nop
    80000020:	00000013          	nop
    80000024:	00000013          	nop
    80000028:	00000013          	nop
    8000002c:	00000013          	nop
    80000030:	00000013          	nop
    80000034:	00000013          	nop
    80000038:	00000013          	nop
    8000003c:	00000013          	nop

0000000080000040 <_mstart>:
	.align 6
	.section .text,"ax",@progbits
	.globl _mstart
/* Startup code */
_mstart:
    la t0, trap_entry
    80000040:	00000297          	auipc	t0,0x0
    80000044:	0cc28293          	addi	t0,t0,204 # 8000010c <trap_entry>
    csrw mtvec, t0
    80000048:	30529073          	csrw	mtvec,t0
    li	x1, 0
    8000004c:	4081                	li	ra,0
    li	x2, 0
    8000004e:	4101                	li	sp,0
    li	x3, 0
    80000050:	4181                	li	gp,0
    li	x4, 0
    80000052:	4201                	li	tp,0
    li	x5, 0
    80000054:	4281                	li	t0,0
	li	x6, 0
    80000056:	4301                	li	t1,0
    li	x7, 0
    80000058:	4381                	li	t2,0
    li	x8, 0
    8000005a:	4401                	li	s0,0
    li	x9, 0
    8000005c:	4481                	li	s1,0
    li	x10, 0
    8000005e:	4501                	li	a0,0
    li	x11, 0
    80000060:	4581                	li	a1,0
    li	x12, 0
    80000062:	4601                	li	a2,0
    li	x13, 0
    80000064:	4681                	li	a3,0
    li	x14, 0
    80000066:	4701                	li	a4,0
    li	x15, 0
    80000068:	4781                	li	a5,0
    li	x16, 0
    8000006a:	4801                	li	a6,0
    li	x17, 0
    8000006c:	4881                	li	a7,0
    li	x18, 0
    8000006e:	4901                	li	s2,0
    li	x19, 0
    80000070:	4981                	li	s3,0
    li	x20, 0
    80000072:	4a01                	li	s4,0
    li	x21, 0
    80000074:	4a81                	li	s5,0
    li	x22, 0
    80000076:	4b01                	li	s6,0
    li	x23, 0
    80000078:	4b81                	li	s7,0
    li	x24, 0
    8000007a:	4c01                	li	s8,0
    li	x25, 0
    8000007c:	4c81                	li	s9,0
    li	x26, 0
    8000007e:	4d01                	li	s10,0
    li	x27, 0
    80000080:	4d81                	li	s11,0
    li	x28, 0
    80000082:	4e01                	li	t3,0
    li	x29, 0
    80000084:	4e81                	li	t4,0
    li	x30, 0
    80000086:	4f01                	li	t5,0
    li	x31, 0
    80000088:	4f81                	li	t6,0

    /* initialize global pointer */
    la	gp, _gp
    8000008a:	00021197          	auipc	gp,0x21
    8000008e:	c7e18193          	addi	gp,gp,-898 # 80020d08 <_gp>

0000000080000092 <init_bss>:

init_bss:
    /* init bss section */
    la	a0, __bss_start
    80000092:	00020517          	auipc	a0,0x20
    80000096:	4ae50513          	addi	a0,a0,1198 # 80020540 <xStartContext>
    la	a1, __bss_end-4 /* section end is actually the start of the next section */
    8000009a:	0003a597          	auipc	a1,0x3a
    8000009e:	89258593          	addi	a1,a1,-1902 # 8003992c <xParameters+0x2c>
    li	a2, 0x0
    800000a2:	4601                	li	a2,0
    jal	fill_block
    800000a4:	10e000ef          	jal	ra,800001b2 <fill_block>

00000000800000a8 <init_sbss>:

init_sbss:
    /* init bss section */
    la	a0, __sbss_start
    800000a8:	00020517          	auipc	a0,0x20
    800000ac:	29850513          	addi	a0,a0,664 # 80020340 <uxSchedulerSuspended>
    la	a1, __sbss_end-4 /* section end is actually the start of the next section */
    800000b0:	00020597          	auipc	a1,0x20
    800000b4:	45458593          	addi	a1,a1,1108 # 80020504 <xMutex+0x4>
    li	a2, 0x0
    800000b8:	4601                	li	a2,0
    jal	fill_block
    800000ba:	0f8000ef          	jal	ra,800001b2 <fill_block>

00000000800000be <write_stack_pattern>:

write_stack_pattern:
    /* init bss section */
    la	a0, _stack_end  /* note the stack grows from top to bottom */
    800000be:	0003b517          	auipc	a0,0x3b
    800000c2:	87250513          	addi	a0,a0,-1934 # 8003a930 <_heap_end>
    la	a1, __stack-4   /* section end is actually the start of the next section */
    800000c6:	0003c597          	auipc	a1,0x3c
    800000ca:	86658593          	addi	a1,a1,-1946 # 8003b92c <_heap_end+0xffc>
    li	a2, 0xABABABAB
    800000ce:	000ac637          	lui	a2,0xac
    800000d2:	abb6061b          	addiw	a2,a2,-1349
    800000d6:	0632                	slli	a2,a2,0xc
    800000d8:	bab60613          	addi	a2,a2,-1109 # abbab <_HEAP_SIZE+0xaabab>
    jal	fill_block
    800000dc:	0d6000ef          	jal	ra,800001b2 <fill_block>

00000000800000e0 <init_stack>:

init_stack:
    /* set stack pointer */
    la	sp, _stack
    800000e0:	0003c117          	auipc	sp,0x3c
    800000e4:	85010113          	addi	sp,sp,-1968 # 8003b930 <__stack>

	j	vSyscallInit
    800000e8:	3e80306f          	j	800034d0 <vSyscallInit>

00000000800000ec <interrupt>:

/* When trap is an interrupt, this function is called */
interrupt:
	slli    t0,t0,1
    800000ec:	0286                	slli	t0,t0,0x1
	srli    t0,t0,1
    800000ee:	0012d293          	srli	t0,t0,0x1
	addi    t0,t0,-3
    800000f2:	12f5                	addi	t0,t0,-3
	beq		t0,x0,softwareInterrupt
    800000f4:	00028863          	beqz	t0,80000104 <softwareInterrupt>
	LOAD	t0, 0x0(sp)
    800000f8:	6282                	ld	t0,0(sp)
	addi	sp, sp, REGBYTES
    800000fa:	0121                	addi	sp,sp,8

	/* Interupt is timer interrupt */
	j		TIMER_CMP_INT
    800000fc:	0f80006f          	j	800001f4 <TIMER_CMP_INT>
	mret
    80000100:	30200073          	mret

0000000080000104 <softwareInterrupt>:

softwareInterrupt:
	/* Interupt is software interrupt */
	LOAD  t0, 0x0(sp)
    80000104:	6282                	ld	t0,0(sp)
	addi  sp, sp, REGBYTES
    80000106:	0121                	addi	sp,sp,8
	mret
    80000108:	30200073          	mret

000000008000010c <trap_entry>:

/* For when a trap is fired */
.align 2
trap_entry:
	/* Check for interrupt */
	addi	sp, sp, -REGBYTES
    8000010c:	1161                	addi	sp,sp,-8
	STORE	t0, 0x0(sp)
    8000010e:	e016                	sd	t0,0(sp)
	csrr	t0, mcause
    80000110:	342022f3          	csrr	t0,mcause
	blt	t0,x0,interrupt
    80000114:	fc02cce3          	bltz	t0,800000ec <interrupt>
	LOAD	t0, 0x0(sp)
    80000118:	6282                	ld	t0,0(sp)
	addi	sp, sp, REGBYTES
    8000011a:	0121                	addi	sp,sp,8

	/* System call and other traps */
	addi sp, sp, -REGBYTES*32
    8000011c:	7111                	addi	sp,sp,-256
	STORE x1, 1*REGBYTES(sp)
    8000011e:	e406                	sd	ra,8(sp)
	STORE x2, 2*REGBYTES(sp)
    80000120:	e80a                	sd	sp,16(sp)
	STORE x3, 3*REGBYTES(sp)
    80000122:	ec0e                	sd	gp,24(sp)
	STORE x4, 4*REGBYTES(sp)
    80000124:	f012                	sd	tp,32(sp)
	STORE x5, 5*REGBYTES(sp)
    80000126:	f416                	sd	t0,40(sp)
	STORE x6, 6*REGBYTES(sp)
    80000128:	f81a                	sd	t1,48(sp)
	STORE x7, 7*REGBYTES(sp)
    8000012a:	fc1e                	sd	t2,56(sp)
	STORE x8, 8*REGBYTES(sp)
    8000012c:	e0a2                	sd	s0,64(sp)
	STORE x9, 9*REGBYTES(sp)
    8000012e:	e4a6                	sd	s1,72(sp)
	STORE x10, 10*REGBYTES(sp)
    80000130:	e8aa                	sd	a0,80(sp)
	STORE x11, 11*REGBYTES(sp)
    80000132:	ecae                	sd	a1,88(sp)
	STORE x12, 12*REGBYTES(sp)
    80000134:	f0b2                	sd	a2,96(sp)
	STORE x13, 13*REGBYTES(sp)
    80000136:	f4b6                	sd	a3,104(sp)
	STORE x14, 14*REGBYTES(sp)
    80000138:	f8ba                	sd	a4,112(sp)
	STORE x15, 15*REGBYTES(sp)
    8000013a:	fcbe                	sd	a5,120(sp)
	STORE x16, 16*REGBYTES(sp)
    8000013c:	e142                	sd	a6,128(sp)
	STORE x17, 17*REGBYTES(sp)
    8000013e:	e546                	sd	a7,136(sp)
	STORE x18, 18*REGBYTES(sp)
    80000140:	e94a                	sd	s2,144(sp)
	STORE x19, 19*REGBYTES(sp)
    80000142:	ed4e                	sd	s3,152(sp)
	STORE x20, 20*REGBYTES(sp)
    80000144:	f152                	sd	s4,160(sp)
	STORE x21, 21*REGBYTES(sp)
    80000146:	f556                	sd	s5,168(sp)
	STORE x22, 22*REGBYTES(sp)
    80000148:	f95a                	sd	s6,176(sp)
	STORE x23, 23*REGBYTES(sp)
    8000014a:	fd5e                	sd	s7,184(sp)
	STORE x24, 24*REGBYTES(sp)
    8000014c:	e1e2                	sd	s8,192(sp)
	STORE x25, 25*REGBYTES(sp)
    8000014e:	e5e6                	sd	s9,200(sp)
	STORE x26, 26*REGBYTES(sp)
    80000150:	e9ea                	sd	s10,208(sp)
	STORE x27, 27*REGBYTES(sp)
    80000152:	edee                	sd	s11,216(sp)
	STORE x28, 28*REGBYTES(sp)
    80000154:	f1f2                	sd	t3,224(sp)
	STORE x29, 29*REGBYTES(sp)
    80000156:	f5f6                	sd	t4,232(sp)
	STORE x30, 30*REGBYTES(sp)
    80000158:	f9fa                	sd	t5,240(sp)
	STORE x31, 31*REGBYTES(sp)
    8000015a:	fdfe                	sd	t6,248(sp)

	csrr a0, mcause
    8000015c:	34202573          	csrr	a0,mcause
	csrr a1, mepc
    80000160:	341025f3          	csrr	a1,mepc


	mv a2, sp
    80000164:	860a                	mv	a2,sp
	jal ulSyscallTrap
    80000166:	380030ef          	jal	ra,800034e6 <ulSyscallTrap>

	csrw mepc, a0
    8000016a:	34151073          	csrw	mepc,a0

	LOAD x1, 1*REGBYTES(sp)
    8000016e:	60a2                	ld	ra,8(sp)
	LOAD x2, 2*REGBYTES(sp)
    80000170:	6142                	ld	sp,16(sp)
	LOAD x3, 3*REGBYTES(sp)
    80000172:	61e2                	ld	gp,24(sp)
	LOAD x4, 4*REGBYTES(sp)
    80000174:	7202                	ld	tp,32(sp)
	LOAD x5, 5*REGBYTES(sp)
    80000176:	72a2                	ld	t0,40(sp)
	LOAD x6, 6*REGBYTES(sp)
    80000178:	7342                	ld	t1,48(sp)
	LOAD x7, 7*REGBYTES(sp)
    8000017a:	73e2                	ld	t2,56(sp)
	LOAD x8, 8*REGBYTES(sp)
    8000017c:	6406                	ld	s0,64(sp)
	LOAD x9, 9*REGBYTES(sp)
    8000017e:	64a6                	ld	s1,72(sp)
	LOAD x10, 10*REGBYTES(sp)
    80000180:	6546                	ld	a0,80(sp)
	LOAD x11, 11*REGBYTES(sp)
    80000182:	65e6                	ld	a1,88(sp)
	LOAD x12, 12*REGBYTES(sp)
    80000184:	7606                	ld	a2,96(sp)
	LOAD x13, 13*REGBYTES(sp)
    80000186:	76a6                	ld	a3,104(sp)
	LOAD x14, 14*REGBYTES(sp)
    80000188:	7746                	ld	a4,112(sp)
	LOAD x15, 15*REGBYTES(sp)
    8000018a:	77e6                	ld	a5,120(sp)
	LOAD x16, 16*REGBYTES(sp)
    8000018c:	680a                	ld	a6,128(sp)
	LOAD x17, 17*REGBYTES(sp)
    8000018e:	68aa                	ld	a7,136(sp)
	LOAD x18, 18*REGBYTES(sp)
    80000190:	694a                	ld	s2,144(sp)
	LOAD x19, 19*REGBYTES(sp)
    80000192:	69ea                	ld	s3,152(sp)
	LOAD x20, 20*REGBYTES(sp)
    80000194:	7a0a                	ld	s4,160(sp)
	LOAD x21, 21*REGBYTES(sp)
    80000196:	7aaa                	ld	s5,168(sp)
	LOAD x22, 22*REGBYTES(sp)
    80000198:	7b4a                	ld	s6,176(sp)
	LOAD x23, 23*REGBYTES(sp)
    8000019a:	7bea                	ld	s7,184(sp)
	LOAD x24, 24*REGBYTES(sp)
    8000019c:	6c0e                	ld	s8,192(sp)
	LOAD x25, 25*REGBYTES(sp)
    8000019e:	6cae                	ld	s9,200(sp)
	LOAD x26, 26*REGBYTES(sp)
    800001a0:	6d4e                	ld	s10,208(sp)
	LOAD x27, 27*REGBYTES(sp)
    800001a2:	6dee                	ld	s11,216(sp)
	LOAD x28, 28*REGBYTES(sp)
    800001a4:	7e0e                	ld	t3,224(sp)
	LOAD x29, 29*REGBYTES(sp)
    800001a6:	7eae                	ld	t4,232(sp)
	LOAD x30, 30*REGBYTES(sp)
    800001a8:	7f4e                	ld	t5,240(sp)
	LOAD x31, 31*REGBYTES(sp)
    800001aa:	7fee                	ld	t6,248(sp)

	addi sp, sp, REGBYTES*32
    800001ac:	6111                	addi	sp,sp,256
	mret
    800001ae:	30200073          	mret

00000000800001b2 <fill_block>:

/* Fills memory blocks */
fill_block:
    sw		a2, 0(a0)
    800001b2:	c110                	sw	a2,0(a0)
    bgeu	a0, a1, fb_end
    800001b4:	00b57463          	bgeu	a0,a1,800001bc <fb_end>
    addi	a0, a0, 4
    800001b8:	0511                	addi	a0,a0,4
    j		fill_block
    800001ba:	bfe5                	j	800001b2 <fill_block>

00000000800001bc <fb_end>:
fb_end:
    ret
    800001bc:	8082                	ret
	...

00000000800001f4 <TIMER_CMP_INT>:
	mret
	.endm

/* Macro for restoring task context */
TIMER_CMP_INT:
	portSAVE_CONTEXT
    800001f4:	7111                	addi	sp,sp,-256
    800001f6:	e006                	sd	ra,0(sp)
    800001f8:	e40a                	sd	sp,8(sp)
    800001fa:	e80e                	sd	gp,16(sp)
    800001fc:	ec12                	sd	tp,24(sp)
    800001fe:	f016                	sd	t0,32(sp)
    80000200:	f41a                	sd	t1,40(sp)
    80000202:	f81e                	sd	t2,48(sp)
    80000204:	fc22                	sd	s0,56(sp)
    80000206:	e0a6                	sd	s1,64(sp)
    80000208:	e4aa                	sd	a0,72(sp)
    8000020a:	e8ae                	sd	a1,80(sp)
    8000020c:	ecb2                	sd	a2,88(sp)
    8000020e:	f0b6                	sd	a3,96(sp)
    80000210:	f4ba                	sd	a4,104(sp)
    80000212:	f8be                	sd	a5,112(sp)
    80000214:	fcc2                	sd	a6,120(sp)
    80000216:	e146                	sd	a7,128(sp)
    80000218:	e54a                	sd	s2,136(sp)
    8000021a:	e94e                	sd	s3,144(sp)
    8000021c:	ed52                	sd	s4,152(sp)
    8000021e:	f156                	sd	s5,160(sp)
    80000220:	f55a                	sd	s6,168(sp)
    80000222:	f95e                	sd	s7,176(sp)
    80000224:	fd62                	sd	s8,184(sp)
    80000226:	e1e6                	sd	s9,192(sp)
    80000228:	e5ea                	sd	s10,200(sp)
    8000022a:	e9ee                	sd	s11,208(sp)
    8000022c:	edf2                	sd	t3,216(sp)
    8000022e:	f1f6                	sd	t4,224(sp)
    80000230:	f5fa                	sd	t5,232(sp)
    80000232:	f9fe                	sd	t6,240(sp)
    80000234:	00020297          	auipc	t0,0x20
    80000238:	1742b283          	ld	t0,372(t0) # 800203a8 <pxCurrentTCB>
    8000023c:	0022b023          	sd	sp,0(t0)
	portSAVE_EPC
    80000240:	341022f3          	csrr	t0,mepc
    80000244:	fd96                	sd	t0,248(sp)
	jal	vPortSysTickHandler
    80000246:	2e0000ef          	jal	ra,80000526 <vPortSysTickHandler>
	portRESTORE_CONTEXT
    8000024a:	00020117          	auipc	sp,0x20
    8000024e:	15e13103          	ld	sp,350(sp) # 800203a8 <pxCurrentTCB>
    80000252:	6102                	ld	sp,0(sp)
    80000254:	72ee                	ld	t0,248(sp)
    80000256:	34129073          	csrw	mepc,t0
    8000025a:	6289                	lui	t0,0x2
    8000025c:	8802829b          	addiw	t0,t0,-1920
    80000260:	3002a073          	csrs	mstatus,t0
    80000264:	6082                	ld	ra,0(sp)
    80000266:	6262                	ld	tp,24(sp)
    80000268:	7282                	ld	t0,32(sp)
    8000026a:	7322                	ld	t1,40(sp)
    8000026c:	73c2                	ld	t2,48(sp)
    8000026e:	7462                	ld	s0,56(sp)
    80000270:	6486                	ld	s1,64(sp)
    80000272:	6526                	ld	a0,72(sp)
    80000274:	65c6                	ld	a1,80(sp)
    80000276:	6666                	ld	a2,88(sp)
    80000278:	7686                	ld	a3,96(sp)
    8000027a:	7726                	ld	a4,104(sp)
    8000027c:	77c6                	ld	a5,112(sp)
    8000027e:	7866                	ld	a6,120(sp)
    80000280:	688a                	ld	a7,128(sp)
    80000282:	692a                	ld	s2,136(sp)
    80000284:	69ca                	ld	s3,144(sp)
    80000286:	6a6a                	ld	s4,152(sp)
    80000288:	7a8a                	ld	s5,160(sp)
    8000028a:	7b2a                	ld	s6,168(sp)
    8000028c:	7bca                	ld	s7,176(sp)
    8000028e:	7c6a                	ld	s8,184(sp)
    80000290:	6c8e                	ld	s9,192(sp)
    80000292:	6d2e                	ld	s10,200(sp)
    80000294:	6dce                	ld	s11,208(sp)
    80000296:	6e6e                	ld	t3,216(sp)
    80000298:	7e8e                	ld	t4,224(sp)
    8000029a:	7f2e                	ld	t5,232(sp)
    8000029c:	7fce                	ld	t6,240(sp)
    8000029e:	6111                	addi	sp,sp,256
    800002a0:	30200073          	mret

00000000800002a4 <xPortStartScheduler>:
#ifdef __gracefulExit
	/* Stores context when starting the scheduler in xStartContext.
	   This is used for when you want to gracefully exit the scheduler.
	   For example if you want to test multiple instances after each other in one test suite.
     */
	la		t0, xStartContext
    800002a4:	00020297          	auipc	t0,0x20
    800002a8:	29c28293          	addi	t0,t0,668 # 80020540 <xStartContext>
	STORE	x1, 0x0(t0)
    800002ac:	0012b023          	sd	ra,0(t0)
	STORE	x2, 1 * REGBYTES(t0)
    800002b0:	0022b423          	sd	sp,8(t0)
	STORE	x3, 2 * REGBYTES(t0)
    800002b4:	0032b823          	sd	gp,16(t0)
	STORE	x4, 3 * REGBYTES(t0)
    800002b8:	0042bc23          	sd	tp,24(t0)
	STORE	x5, 4 * REGBYTES(t0)
    800002bc:	0252b023          	sd	t0,32(t0)
	STORE	x6, 5 * REGBYTES(t0)
    800002c0:	0262b423          	sd	t1,40(t0)
	STORE	x7, 6 * REGBYTES(t0)
    800002c4:	0272b823          	sd	t2,48(t0)
	STORE	x8, 7 * REGBYTES(t0)
    800002c8:	0282bc23          	sd	s0,56(t0)
	STORE	x9, 8 * REGBYTES(t0)
    800002cc:	0492b023          	sd	s1,64(t0)
	STORE	x10, 9 * REGBYTES(t0)
    800002d0:	04a2b423          	sd	a0,72(t0)
	STORE	x11, 10 * REGBYTES(t0)
    800002d4:	04b2b823          	sd	a1,80(t0)
	STORE	x12, 11 * REGBYTES(t0)
    800002d8:	04c2bc23          	sd	a2,88(t0)
	STORE	x13, 12 * REGBYTES(t0)
    800002dc:	06d2b023          	sd	a3,96(t0)
	STORE	x14, 13 * REGBYTES(t0)
    800002e0:	06e2b423          	sd	a4,104(t0)
	STORE	x15, 14 * REGBYTES(t0)
    800002e4:	06f2b823          	sd	a5,112(t0)
	STORE	x16, 15 * REGBYTES(t0)
    800002e8:	0702bc23          	sd	a6,120(t0)
	STORE	x17, 16 * REGBYTES(t0)
    800002ec:	0912b023          	sd	a7,128(t0)
	STORE	x18, 17 * REGBYTES(t0)
    800002f0:	0922b423          	sd	s2,136(t0)
	STORE	x19, 18 * REGBYTES(t0)
    800002f4:	0932b823          	sd	s3,144(t0)
	STORE	x20, 19 * REGBYTES(t0)
    800002f8:	0942bc23          	sd	s4,152(t0)
	STORE	x21, 20 * REGBYTES(t0)
    800002fc:	0b52b023          	sd	s5,160(t0)
	STORE	x22, 21 * REGBYTES(t0)
    80000300:	0b62b423          	sd	s6,168(t0)
	STORE	x23, 22 * REGBYTES(t0)
    80000304:	0b72b823          	sd	s7,176(t0)
	STORE	x24, 23 * REGBYTES(t0)
    80000308:	0b82bc23          	sd	s8,184(t0)
	STORE	x25, 24 * REGBYTES(t0)
    8000030c:	0d92b023          	sd	s9,192(t0)
	STORE	x26, 25 * REGBYTES(t0)
    80000310:	0da2b423          	sd	s10,200(t0)
	STORE	x27, 26 * REGBYTES(t0)
    80000314:	0db2b823          	sd	s11,208(t0)
	STORE	x28, 27 * REGBYTES(t0)
    80000318:	0dc2bc23          	sd	t3,216(t0)
	STORE	x29, 28 * REGBYTES(t0)
    8000031c:	0fd2b023          	sd	t4,224(t0)
	STORE	x30, 29 * REGBYTES(t0)
    80000320:	0fe2b423          	sd	t5,232(t0)
	STORE	x31, 30 * REGBYTES(t0)
    80000324:	0ff2b823          	sd	t6,240(t0)
#endif
	jal		vPortSetupTimer
    80000328:	1b8000ef          	jal	ra,800004e0 <vPortSetupTimer>
	portRESTORE_CONTEXT
    8000032c:	00020117          	auipc	sp,0x20
    80000330:	07c13103          	ld	sp,124(sp) # 800203a8 <pxCurrentTCB>
    80000334:	6102                	ld	sp,0(sp)
    80000336:	72ee                	ld	t0,248(sp)
    80000338:	34129073          	csrw	mepc,t0
    8000033c:	6289                	lui	t0,0x2
    8000033e:	8802829b          	addiw	t0,t0,-1920
    80000342:	3002a073          	csrs	mstatus,t0
    80000346:	6082                	ld	ra,0(sp)
    80000348:	6262                	ld	tp,24(sp)
    8000034a:	7282                	ld	t0,32(sp)
    8000034c:	7322                	ld	t1,40(sp)
    8000034e:	73c2                	ld	t2,48(sp)
    80000350:	7462                	ld	s0,56(sp)
    80000352:	6486                	ld	s1,64(sp)
    80000354:	6526                	ld	a0,72(sp)
    80000356:	65c6                	ld	a1,80(sp)
    80000358:	6666                	ld	a2,88(sp)
    8000035a:	7686                	ld	a3,96(sp)
    8000035c:	7726                	ld	a4,104(sp)
    8000035e:	77c6                	ld	a5,112(sp)
    80000360:	7866                	ld	a6,120(sp)
    80000362:	688a                	ld	a7,128(sp)
    80000364:	692a                	ld	s2,136(sp)
    80000366:	69ca                	ld	s3,144(sp)
    80000368:	6a6a                	ld	s4,152(sp)
    8000036a:	7a8a                	ld	s5,160(sp)
    8000036c:	7b2a                	ld	s6,168(sp)
    8000036e:	7bca                	ld	s7,176(sp)
    80000370:	7c6a                	ld	s8,184(sp)
    80000372:	6c8e                	ld	s9,192(sp)
    80000374:	6d2e                	ld	s10,200(sp)
    80000376:	6dce                	ld	s11,208(sp)
    80000378:	6e6e                	ld	t3,216(sp)
    8000037a:	7e8e                	ld	t4,224(sp)
    8000037c:	7f2e                	ld	t5,232(sp)
    8000037e:	7fce                	ld	t6,240(sp)
    80000380:	6111                	addi	sp,sp,256
    80000382:	30200073          	mret

0000000080000386 <vPortEndScheduler>:

vPortEndScheduler:
#ifdef __gracefulExit
	/* Load current context from xStartContext */
	la		t0, xStartContext
    80000386:	00020297          	auipc	t0,0x20
    8000038a:	1ba28293          	addi	t0,t0,442 # 80020540 <xStartContext>
	LOAD	x1, 0x0(t0)
    8000038e:	0002b083          	ld	ra,0(t0)
	LOAD	x2, 1 * REGBYTES(t0)
    80000392:	0082b103          	ld	sp,8(t0)
	LOAD	x3, 2 * REGBYTES(t0)
    80000396:	0102b183          	ld	gp,16(t0)
	LOAD	x4, 3 * REGBYTES(t0)
    8000039a:	0182b203          	ld	tp,24(t0)
	LOAD	x5, 4 * REGBYTES(t0)
    8000039e:	0202b283          	ld	t0,32(t0)
	LOAD	x6, 5 * REGBYTES(t0)
    800003a2:	0282b303          	ld	t1,40(t0)
	LOAD	x7, 6 * REGBYTES(t0)
    800003a6:	0302b383          	ld	t2,48(t0)
	LOAD	x8, 7 * REGBYTES(t0)
    800003aa:	0382b403          	ld	s0,56(t0)
	LOAD	x9, 8 * REGBYTES(t0)
    800003ae:	0402b483          	ld	s1,64(t0)
	LOAD	x10, 9 * REGBYTES(t0)
    800003b2:	0482b503          	ld	a0,72(t0)
	LOAD	x11, 10 * REGBYTES(t0)
    800003b6:	0502b583          	ld	a1,80(t0)
	LOAD	x12, 11 * REGBYTES(t0)
    800003ba:	0582b603          	ld	a2,88(t0)
	LOAD	x13, 12 * REGBYTES(t0)
    800003be:	0602b683          	ld	a3,96(t0)
	LOAD	x14, 13 * REGBYTES(t0)
    800003c2:	0682b703          	ld	a4,104(t0)
	LOAD	x15, 14 * REGBYTES(t0)
    800003c6:	0702b783          	ld	a5,112(t0)
	LOAD	x16, 15 * REGBYTES(t0)
    800003ca:	0782b803          	ld	a6,120(t0)
	LOAD	x17, 16 * REGBYTES(t0)
    800003ce:	0802b883          	ld	a7,128(t0)
	LOAD	x18, 17 * REGBYTES(t0)
    800003d2:	0882b903          	ld	s2,136(t0)
	LOAD	x19, 18 * REGBYTES(t0)
    800003d6:	0902b983          	ld	s3,144(t0)
	LOAD	x20, 19 * REGBYTES(t0)
    800003da:	0982ba03          	ld	s4,152(t0)
	LOAD	x21, 20 * REGBYTES(t0)
    800003de:	0a02ba83          	ld	s5,160(t0)
	LOAD	x22, 21 * REGBYTES(t0)
    800003e2:	0a82bb03          	ld	s6,168(t0)
	LOAD	x23, 22 * REGBYTES(t0)
    800003e6:	0b02bb83          	ld	s7,176(t0)
	LOAD	x24, 23 * REGBYTES(t0)
    800003ea:	0b82bc03          	ld	s8,184(t0)
	LOAD	x25, 24 * REGBYTES(t0)
    800003ee:	0c02bc83          	ld	s9,192(t0)
	LOAD	x26, 25 * REGBYTES(t0)
    800003f2:	0c82bd03          	ld	s10,200(t0)
	LOAD	x27, 26 * REGBYTES(t0)
    800003f6:	0d02bd83          	ld	s11,208(t0)
	LOAD	x28, 27 * REGBYTES(t0)
    800003fa:	0d82be03          	ld	t3,216(t0)
	LOAD	x29, 28 * REGBYTES(t0)
    800003fe:	0e02be83          	ld	t4,224(t0)
	LOAD	x30, 39 * REGBYTES(t0)
    80000402:	1382bf03          	ld	t5,312(t0)
	LOAD	x31, 30 * REGBYTES(t0)
    80000406:	0f02bf83          	ld	t6,240(t0)
#endif
	ret
    8000040a:	8082                	ret

000000008000040c <vPortYield>:
	*  stack. However, "mepc" will be overwritten by the interrupt handler if a timer
	*  interrupt happens during the yield. To avoid this, prevent interrupts before starting.
	*  The write to mstatus in the restore context routine will enable interrupts after the
	*  mret. A more fine-grain lock may be possible.
	*/  
	csrci mstatus, 8
    8000040c:	30047073          	csrci	mstatus,8

	portSAVE_CONTEXT
    80000410:	7111                	addi	sp,sp,-256
    80000412:	e006                	sd	ra,0(sp)
    80000414:	e40a                	sd	sp,8(sp)
    80000416:	e80e                	sd	gp,16(sp)
    80000418:	ec12                	sd	tp,24(sp)
    8000041a:	f016                	sd	t0,32(sp)
    8000041c:	f41a                	sd	t1,40(sp)
    8000041e:	f81e                	sd	t2,48(sp)
    80000420:	fc22                	sd	s0,56(sp)
    80000422:	e0a6                	sd	s1,64(sp)
    80000424:	e4aa                	sd	a0,72(sp)
    80000426:	e8ae                	sd	a1,80(sp)
    80000428:	ecb2                	sd	a2,88(sp)
    8000042a:	f0b6                	sd	a3,96(sp)
    8000042c:	f4ba                	sd	a4,104(sp)
    8000042e:	f8be                	sd	a5,112(sp)
    80000430:	fcc2                	sd	a6,120(sp)
    80000432:	e146                	sd	a7,128(sp)
    80000434:	e54a                	sd	s2,136(sp)
    80000436:	e94e                	sd	s3,144(sp)
    80000438:	ed52                	sd	s4,152(sp)
    8000043a:	f156                	sd	s5,160(sp)
    8000043c:	f55a                	sd	s6,168(sp)
    8000043e:	f95e                	sd	s7,176(sp)
    80000440:	fd62                	sd	s8,184(sp)
    80000442:	e1e6                	sd	s9,192(sp)
    80000444:	e5ea                	sd	s10,200(sp)
    80000446:	e9ee                	sd	s11,208(sp)
    80000448:	edf2                	sd	t3,216(sp)
    8000044a:	f1f6                	sd	t4,224(sp)
    8000044c:	f5fa                	sd	t5,232(sp)
    8000044e:	f9fe                	sd	t6,240(sp)
    80000450:	00020297          	auipc	t0,0x20
    80000454:	f582b283          	ld	t0,-168(t0) # 800203a8 <pxCurrentTCB>
    80000458:	0022b023          	sd	sp,0(t0)
	portSAVE_RA
    8000045c:	fd86                	sd	ra,248(sp)
	jal	vTaskSwitchContext
    8000045e:	096010ef          	jal	ra,800014f4 <vTaskSwitchContext>
	portRESTORE_CONTEXT
    80000462:	00020117          	auipc	sp,0x20
    80000466:	f4613103          	ld	sp,-186(sp) # 800203a8 <pxCurrentTCB>
    8000046a:	6102                	ld	sp,0(sp)
    8000046c:	72ee                	ld	t0,248(sp)
    8000046e:	34129073          	csrw	mepc,t0
    80000472:	6289                	lui	t0,0x2
    80000474:	8802829b          	addiw	t0,t0,-1920
    80000478:	3002a073          	csrs	mstatus,t0
    8000047c:	6082                	ld	ra,0(sp)
    8000047e:	6262                	ld	tp,24(sp)
    80000480:	7282                	ld	t0,32(sp)
    80000482:	7322                	ld	t1,40(sp)
    80000484:	73c2                	ld	t2,48(sp)
    80000486:	7462                	ld	s0,56(sp)
    80000488:	6486                	ld	s1,64(sp)
    8000048a:	6526                	ld	a0,72(sp)
    8000048c:	65c6                	ld	a1,80(sp)
    8000048e:	6666                	ld	a2,88(sp)
    80000490:	7686                	ld	a3,96(sp)
    80000492:	7726                	ld	a4,104(sp)
    80000494:	77c6                	ld	a5,112(sp)
    80000496:	7866                	ld	a6,120(sp)
    80000498:	688a                	ld	a7,128(sp)
    8000049a:	692a                	ld	s2,136(sp)
    8000049c:	69ca                	ld	s3,144(sp)
    8000049e:	6a6a                	ld	s4,152(sp)
    800004a0:	7a8a                	ld	s5,160(sp)
    800004a2:	7b2a                	ld	s6,168(sp)
    800004a4:	7bca                	ld	s7,176(sp)
    800004a6:	7c6a                	ld	s8,184(sp)
    800004a8:	6c8e                	ld	s9,192(sp)
    800004aa:	6d2e                	ld	s10,200(sp)
    800004ac:	6dce                	ld	s11,208(sp)
    800004ae:	6e6e                	ld	t3,216(sp)
    800004b0:	7e8e                	ld	t4,224(sp)
    800004b2:	7f2e                	ld	t5,232(sp)
    800004b4:	7fce                	ld	t6,240(sp)
    800004b6:	6111                	addi	sp,sp,256
    800004b8:	30200073          	mret

00000000800004bc <prvSetNextTimerInterrupt>:
 * tickrate may already be behind current timer and prevent correctly programming
 * the 2nd interrupt
 */
static void prvSetNextTimerInterrupt(void)
{
    if (mtime && timecmp) 
    800004bc:	00020797          	auipc	a5,0x20
    800004c0:	0547b783          	ld	a5,84(a5) # 80020510 <mtime>
    800004c4:	cb91                	beqz	a5,800004d8 <prvSetNextTimerInterrupt+0x1c>
    800004c6:	00020717          	auipc	a4,0x20
    800004ca:	04273703          	ld	a4,66(a4) # 80020508 <timecmp>
    800004ce:	c709                	beqz	a4,800004d8 <prvSetNextTimerInterrupt+0x1c>
        *timecmp = *mtime + (configTICK_CLOCK_HZ / configTICK_RATE_HZ);
    800004d0:	639c                	ld	a5,0(a5)
    800004d2:	3e878793          	addi	a5,a5,1000
    800004d6:	e31c                	sd	a5,0(a4)
}
    800004d8:	8082                	ret

00000000800004da <prvTaskExitError>:
	its caller as there is nothing to return to.  If a task wants to exit it
	should instead call vTaskDelete( NULL ).

	Artificially force an assert() to be triggered if configASSERT() is
	defined, then stop here so application writers can catch the error. */
	configASSERT( uxCriticalNesting == ~0UL );
    800004da:	30047073          	csrci	mstatus,8
    800004de:	a001                	j	800004de <prvTaskExitError+0x4>

00000000800004e0 <vPortSetupTimer>:
{
    800004e0:	1141                	addi	sp,sp,-16
    800004e2:	e406                	sd	ra,8(sp)
    prvSetNextTimerInterrupt();
    800004e4:	fd9ff0ef          	jal	ra,800004bc <prvSetNextTimerInterrupt>
	__asm volatile("csrs mie,%0"::"r"(0x80));
    800004e8:	08000793          	li	a5,128
    800004ec:	3047a073          	csrs	mie,a5
}
    800004f0:	60a2                	ld	ra,8(sp)
    800004f2:	0141                	addi	sp,sp,16
    800004f4:	8082                	ret

00000000800004f6 <vPortClearInterruptMask>:
/*-----------------------------------------------------------*/

/* Clear current interrupt mask and set given mask */
void vPortClearInterruptMask(int mask)
{
	__asm volatile("csrw mie, %0"::"r"(mask));
    800004f6:	30451073          	csrw	mie,a0
}
    800004fa:	8082                	ret

00000000800004fc <vPortSetInterruptMask>:

/* Set interrupt mask and return current interrupt enable register */
int vPortSetInterruptMask(void)
{
	int ret;
	__asm volatile("csrr %0,mie":"=r"(ret));
    800004fc:	30402573          	csrr	a0,mie
    80000500:	2501                	sext.w	a0,a0
	__asm volatile("csrc mie,%0"::"i"(7));
    80000502:	3043f073          	csrci	mie,7
	return ret;
}
    80000506:	8082                	ret

0000000080000508 <pxPortInitialiseStack>:
{
	/* Simulate the stack frame as it would be created by a context switch
	interrupt. */
	register int *tp asm("x3");
	pxTopOfStack--;
	*pxTopOfStack = (portSTACK_TYPE)pxCode;			/* Start address */
    80000508:	feb53c23          	sd	a1,-8(a0)
	pxTopOfStack -= 22;
	*pxTopOfStack = (portSTACK_TYPE)pvParameters;	/* Register a0 */
    8000050c:	f4c53423          	sd	a2,-184(a0)
	pxTopOfStack -= 6;
	*pxTopOfStack = (portSTACK_TYPE)tp; /* Register thread pointer */
    80000510:	f0353c23          	sd	gp,-232(a0)
	pxTopOfStack -= 3;
	*pxTopOfStack = (portSTACK_TYPE)prvTaskExitError; /* Register ra */
    80000514:	00000797          	auipc	a5,0x0
    80000518:	fc678793          	addi	a5,a5,-58 # 800004da <prvTaskExitError>
    8000051c:	f0f53023          	sd	a5,-256(a0)
	
	return pxTopOfStack;
}
    80000520:	f0050513          	addi	a0,a0,-256
    80000524:	8082                	ret

0000000080000526 <vPortSysTickHandler>:
/*-----------------------------------------------------------*/

void vPortSysTickHandler( void )
{
    80000526:	1141                	addi	sp,sp,-16
    80000528:	e406                	sd	ra,8(sp)
	prvSetNextTimerInterrupt();
    8000052a:	f93ff0ef          	jal	ra,800004bc <prvSetNextTimerInterrupt>

	/* Increment the RTOS tick. */
	if( xTaskIncrementTick() != pdFALSE )
    8000052e:	665000ef          	jal	ra,80001392 <xTaskIncrementTick>
    80000532:	e501                	bnez	a0,8000053a <vPortSysTickHandler+0x14>
	{
		vTaskSwitchContext();
	}
}
    80000534:	60a2                	ld	ra,8(sp)
    80000536:	0141                	addi	sp,sp,16
    80000538:	8082                	ret
		vTaskSwitchContext();
    8000053a:	7bb000ef          	jal	ra,800014f4 <vTaskSwitchContext>
}
    8000053e:	bfdd                	j	80000534 <vPortSysTickHandler+0xe>

0000000080000540 <vListInitialise>:
void vListInitialise( List_t * const pxList )
{
	/* The list structure contains a list item which is used to mark the
	end of the list.  To initialise the list the list end is inserted
	as the only list entry. */
	pxList->pxIndex = ( ListItem_t * ) &( pxList->xListEnd );			/*lint !e826 !e740 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    80000540:	01050793          	addi	a5,a0,16
    80000544:	e51c                	sd	a5,8(a0)

	/* The list end value is the highest possible value in the list to
	ensure it remains at the end of the list. */
	pxList->xListEnd.xItemValue = portMAX_DELAY;
    80000546:	577d                	li	a4,-1
    80000548:	c918                	sw	a4,16(a0)

	/* The list end next and previous pointers point to itself so we know
	when the list is empty. */
	pxList->xListEnd.pxNext = ( ListItem_t * ) &( pxList->xListEnd );	/*lint !e826 !e740 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    8000054a:	ed1c                	sd	a5,24(a0)
	pxList->xListEnd.pxPrevious = ( ListItem_t * ) &( pxList->xListEnd );/*lint !e826 !e740 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    8000054c:	f11c                	sd	a5,32(a0)

	pxList->uxNumberOfItems = ( UBaseType_t ) 0U;
    8000054e:	00053023          	sd	zero,0(a0)

	/* Write known values into the list if
	configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
	listSET_LIST_INTEGRITY_CHECK_1_VALUE( pxList );
	listSET_LIST_INTEGRITY_CHECK_2_VALUE( pxList );
}
    80000552:	8082                	ret

0000000080000554 <vListInitialiseItem>:
/*-----------------------------------------------------------*/

void vListInitialiseItem( ListItem_t * const pxItem )
{
	/* Make sure the list item is not recorded as being on a list. */
	pxItem->pvContainer = NULL;
    80000554:	02053023          	sd	zero,32(a0)

	/* Write known values into the list item if
	configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
	listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
	listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
}
    80000558:	8082                	ret

000000008000055a <vListInsertEnd>:
/*-----------------------------------------------------------*/

void vListInsertEnd( List_t * const pxList, ListItem_t * const pxNewListItem )
{
ListItem_t * const pxIndex = pxList->pxIndex;
    8000055a:	651c                	ld	a5,8(a0)
	listTEST_LIST_ITEM_INTEGRITY( pxNewListItem );

	/* Insert a new list item into pxList, but rather than sort the list,
	makes the new list item the last item to be removed by a call to
	listGET_OWNER_OF_NEXT_ENTRY(). */
	pxNewListItem->pxNext = pxIndex;
    8000055c:	e59c                	sd	a5,8(a1)
	pxNewListItem->pxPrevious = pxIndex->pxPrevious;
    8000055e:	6b98                	ld	a4,16(a5)
    80000560:	e998                	sd	a4,16(a1)

	/* Only used during decision coverage testing. */
	mtCOVERAGE_TEST_DELAY();

	pxIndex->pxPrevious->pxNext = pxNewListItem;
    80000562:	e70c                	sd	a1,8(a4)
	pxIndex->pxPrevious = pxNewListItem;
    80000564:	eb8c                	sd	a1,16(a5)

	/* Remember which list the item is in. */
	pxNewListItem->pvContainer = ( void * ) pxList;
    80000566:	f188                	sd	a0,32(a1)

	( pxList->uxNumberOfItems )++;
    80000568:	611c                	ld	a5,0(a0)
    8000056a:	0785                	addi	a5,a5,1
    8000056c:	e11c                	sd	a5,0(a0)
}
    8000056e:	8082                	ret

0000000080000570 <vListInsert>:
/*-----------------------------------------------------------*/

void vListInsert( List_t * const pxList, ListItem_t * const pxNewListItem )
{
ListItem_t *pxIterator;
const TickType_t xValueOfInsertion = pxNewListItem->xItemValue;
    80000570:	4190                	lw	a2,0(a1)
	new list item should be placed after it.  This ensures that TCB's which are
	stored in ready lists (all of which have the same xItemValue value) get a
	share of the CPU.  However, if the xItemValue is the same as the back marker
	the iteration loop below will not end.  Therefore the value is checked
	first, and the algorithm slightly modified if necessary. */
	if( xValueOfInsertion == portMAX_DELAY )
    80000572:	57fd                	li	a5,-1
    80000574:	02f60363          	beq	a2,a5,8000059a <vListInsert+0x2a>
			4) Using a queue or semaphore before it has been initialised or
			   before the scheduler has been started (are interrupts firing
			   before vTaskStartScheduler() has been called?).
		**********************************************************************/

		for( pxIterator = ( ListItem_t * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext ) /*lint !e826 !e740 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    80000578:	01050793          	addi	a5,a0,16
    8000057c:	86be                	mv	a3,a5
    8000057e:	679c                	ld	a5,8(a5)
    80000580:	4398                	lw	a4,0(a5)
    80000582:	fee67de3          	bgeu	a2,a4,8000057c <vListInsert+0xc>
			/* There is nothing to do here, just iterating to the wanted
			insertion position. */
		}
	}

	pxNewListItem->pxNext = pxIterator->pxNext;
    80000586:	669c                	ld	a5,8(a3)
    80000588:	e59c                	sd	a5,8(a1)
	pxNewListItem->pxNext->pxPrevious = pxNewListItem;
    8000058a:	eb8c                	sd	a1,16(a5)
	pxNewListItem->pxPrevious = pxIterator;
    8000058c:	e994                	sd	a3,16(a1)
	pxIterator->pxNext = pxNewListItem;
    8000058e:	e68c                	sd	a1,8(a3)

	/* Remember which list the item is in.  This allows fast removal of the
	item later. */
	pxNewListItem->pvContainer = ( void * ) pxList;
    80000590:	f188                	sd	a0,32(a1)

	( pxList->uxNumberOfItems )++;
    80000592:	611c                	ld	a5,0(a0)
    80000594:	0785                	addi	a5,a5,1
    80000596:	e11c                	sd	a5,0(a0)
}
    80000598:	8082                	ret
		pxIterator = pxList->xListEnd.pxPrevious;
    8000059a:	7114                	ld	a3,32(a0)
    8000059c:	b7ed                	j	80000586 <vListInsert+0x16>

000000008000059e <uxListRemove>:

UBaseType_t uxListRemove( ListItem_t * const pxItemToRemove )
{
/* The list item knows which list it is in.  Obtain the list from the list
item. */
List_t * const pxList = ( List_t * ) pxItemToRemove->pvContainer;
    8000059e:	711c                	ld	a5,32(a0)

	pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
    800005a0:	6514                	ld	a3,8(a0)
    800005a2:	6918                	ld	a4,16(a0)
    800005a4:	ea98                	sd	a4,16(a3)
	pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
    800005a6:	6514                	ld	a3,8(a0)
    800005a8:	e714                	sd	a3,8(a4)

	/* Only used during decision coverage testing. */
	mtCOVERAGE_TEST_DELAY();

	/* Make sure the index is left pointing to a valid item. */
	if( pxList->pxIndex == pxItemToRemove )
    800005aa:	6798                	ld	a4,8(a5)
    800005ac:	00a70863          	beq	a4,a0,800005bc <uxListRemove+0x1e>
	else
	{
		mtCOVERAGE_TEST_MARKER();
	}

	pxItemToRemove->pvContainer = NULL;
    800005b0:	02053023          	sd	zero,32(a0)
	( pxList->uxNumberOfItems )--;
    800005b4:	6388                	ld	a0,0(a5)
    800005b6:	157d                	addi	a0,a0,-1
    800005b8:	e388                	sd	a0,0(a5)

	return pxList->uxNumberOfItems;
}
    800005ba:	8082                	ret
		pxList->pxIndex = pxItemToRemove->pxPrevious;
    800005bc:	6918                	ld	a4,16(a0)
    800005be:	e798                	sd	a4,8(a5)
    800005c0:	bfc5                	j	800005b0 <uxListRemove+0x12>

00000000800005c2 <prvIsQueueFull>:
	return xReturn;
} /*lint !e818 xQueue could not be pointer to const because it is a typedef. */
/*-----------------------------------------------------------*/

static BaseType_t prvIsQueueFull( const Queue_t *pxQueue )
{
    800005c2:	1141                	addi	sp,sp,-16
    800005c4:	e406                	sd	ra,8(sp)
    800005c6:	e022                	sd	s0,0(sp)
    800005c8:	842a                	mv	s0,a0
BaseType_t xReturn;

	taskENTER_CRITICAL();
    800005ca:	46c010ef          	jal	ra,80001a36 <vTaskEnterCritical>
	{
		if( pxQueue->uxMessagesWaiting == pxQueue->uxLength )
    800005ce:	7838                	ld	a4,112(s0)
    800005d0:	7c3c                	ld	a5,120(s0)
    800005d2:	00f70a63          	beq	a4,a5,800005e6 <prvIsQueueFull+0x24>
		{
			xReturn = pdTRUE;
		}
		else
		{
			xReturn = pdFALSE;
    800005d6:	4401                	li	s0,0
		}
	}
	taskEXIT_CRITICAL();
    800005d8:	480010ef          	jal	ra,80001a58 <vTaskExitCritical>

	return xReturn;
}
    800005dc:	8522                	mv	a0,s0
    800005de:	60a2                	ld	ra,8(sp)
    800005e0:	6402                	ld	s0,0(sp)
    800005e2:	0141                	addi	sp,sp,16
    800005e4:	8082                	ret
			xReturn = pdTRUE;
    800005e6:	4405                	li	s0,1
    800005e8:	bfc5                	j	800005d8 <prvIsQueueFull+0x16>

00000000800005ea <prvIsQueueEmpty>:
{
    800005ea:	1141                	addi	sp,sp,-16
    800005ec:	e406                	sd	ra,8(sp)
    800005ee:	e022                	sd	s0,0(sp)
    800005f0:	842a                	mv	s0,a0
	taskENTER_CRITICAL();
    800005f2:	444010ef          	jal	ra,80001a36 <vTaskEnterCritical>
		if( pxQueue->uxMessagesWaiting == ( UBaseType_t )  0 )
    800005f6:	783c                	ld	a5,112(s0)
    800005f8:	eb89                	bnez	a5,8000060a <prvIsQueueEmpty+0x20>
			xReturn = pdTRUE;
    800005fa:	4405                	li	s0,1
	taskEXIT_CRITICAL();
    800005fc:	45c010ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    80000600:	8522                	mv	a0,s0
    80000602:	60a2                	ld	ra,8(sp)
    80000604:	6402                	ld	s0,0(sp)
    80000606:	0141                	addi	sp,sp,16
    80000608:	8082                	ret
			xReturn = pdFALSE;
    8000060a:	4401                	li	s0,0
    8000060c:	bfc5                	j	800005fc <prvIsQueueEmpty+0x12>

000000008000060e <prvCopyDataToQueue>:
{
    8000060e:	1101                	addi	sp,sp,-32
    80000610:	ec06                	sd	ra,24(sp)
    80000612:	e822                	sd	s0,16(sp)
    80000614:	e426                	sd	s1,8(sp)
    80000616:	842a                	mv	s0,a0
    80000618:	84b2                	mv	s1,a2
	if( pxQueue->uxItemSize == ( UBaseType_t ) 0 )
    8000061a:	6150                	ld	a2,128(a0)
    8000061c:	e215                	bnez	a2,80000640 <prvCopyDataToQueue+0x32>
			if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
    8000061e:	611c                	ld	a5,0(a0)
    80000620:	cb91                	beqz	a5,80000634 <prvCopyDataToQueue+0x26>
BaseType_t xReturn = pdFALSE;
    80000622:	4501                	li	a0,0
	++( pxQueue->uxMessagesWaiting );
    80000624:	783c                	ld	a5,112(s0)
    80000626:	0785                	addi	a5,a5,1
    80000628:	f83c                	sd	a5,112(s0)
}
    8000062a:	60e2                	ld	ra,24(sp)
    8000062c:	6442                	ld	s0,16(sp)
    8000062e:	64a2                	ld	s1,8(sp)
    80000630:	6105                	addi	sp,sp,32
    80000632:	8082                	ret
				xReturn = xTaskPriorityDisinherit( ( void * ) pxQueue->pxMutexHolder );
    80000634:	6508                	ld	a0,8(a0)
    80000636:	372010ef          	jal	ra,800019a8 <xTaskPriorityDisinherit>
				pxQueue->pxMutexHolder = NULL;
    8000063a:	00043423          	sd	zero,8(s0)
    8000063e:	b7dd                	j	80000624 <prvCopyDataToQueue+0x16>
	else if( xPosition == queueSEND_TO_BACK )
    80000640:	ec99                	bnez	s1,8000065e <prvCopyDataToQueue+0x50>
		( void ) memcpy( ( void * ) pxQueue->pcWriteTo, pvItemToQueue, ( size_t ) pxQueue->uxItemSize ); /*lint !e961 !e418 MISRA exception as the casts are only redundant for some ports, plus previous logic ensures a null pointer can only be passed to memcpy() if the copy size is 0. */
    80000642:	6908                	ld	a0,16(a0)
    80000644:	4c3020ef          	jal	ra,80003306 <memcpy>
		pxQueue->pcWriteTo += pxQueue->uxItemSize;
    80000648:	6058                	ld	a4,128(s0)
    8000064a:	681c                	ld	a5,16(s0)
    8000064c:	97ba                	add	a5,a5,a4
    8000064e:	e81c                	sd	a5,16(s0)
		if( pxQueue->pcWriteTo >= pxQueue->pcTail ) /*lint !e946 MISRA exception justified as comparison of pointers is the cleanest solution. */
    80000650:	6418                	ld	a4,8(s0)
    80000652:	04e7e163          	bltu	a5,a4,80000694 <prvCopyDataToQueue+0x86>
			pxQueue->pcWriteTo = pxQueue->pcHead;
    80000656:	601c                	ld	a5,0(s0)
    80000658:	e81c                	sd	a5,16(s0)
BaseType_t xReturn = pdFALSE;
    8000065a:	8526                	mv	a0,s1
    8000065c:	b7e1                	j	80000624 <prvCopyDataToQueue+0x16>
		( void ) memcpy( ( void * ) pxQueue->u.pcReadFrom, pvItemToQueue, ( size_t ) pxQueue->uxItemSize ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    8000065e:	6d08                	ld	a0,24(a0)
    80000660:	4a7020ef          	jal	ra,80003306 <memcpy>
		pxQueue->u.pcReadFrom -= pxQueue->uxItemSize;
    80000664:	6058                	ld	a4,128(s0)
    80000666:	40e006b3          	neg	a3,a4
    8000066a:	6c1c                	ld	a5,24(s0)
    8000066c:	8f99                	sub	a5,a5,a4
    8000066e:	ec1c                	sd	a5,24(s0)
		if( pxQueue->u.pcReadFrom < pxQueue->pcHead ) /*lint !e946 MISRA exception justified as comparison of pointers is the cleanest solution. */
    80000670:	6018                	ld	a4,0(s0)
    80000672:	00e7f563          	bgeu	a5,a4,8000067c <prvCopyDataToQueue+0x6e>
			pxQueue->u.pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
    80000676:	641c                	ld	a5,8(s0)
    80000678:	97b6                	add	a5,a5,a3
    8000067a:	ec1c                	sd	a5,24(s0)
		if( xPosition == queueOVERWRITE )
    8000067c:	4789                	li	a5,2
    8000067e:	00f48463          	beq	s1,a5,80000686 <prvCopyDataToQueue+0x78>
BaseType_t xReturn = pdFALSE;
    80000682:	4501                	li	a0,0
    80000684:	b745                	j	80000624 <prvCopyDataToQueue+0x16>
			if( pxQueue->uxMessagesWaiting > ( UBaseType_t ) 0 )
    80000686:	783c                	ld	a5,112(s0)
    80000688:	cb81                	beqz	a5,80000698 <prvCopyDataToQueue+0x8a>
				--( pxQueue->uxMessagesWaiting );
    8000068a:	783c                	ld	a5,112(s0)
    8000068c:	17fd                	addi	a5,a5,-1
    8000068e:	f83c                	sd	a5,112(s0)
BaseType_t xReturn = pdFALSE;
    80000690:	4501                	li	a0,0
    80000692:	bf49                	j	80000624 <prvCopyDataToQueue+0x16>
    80000694:	8526                	mv	a0,s1
    80000696:	b779                	j	80000624 <prvCopyDataToQueue+0x16>
    80000698:	4501                	li	a0,0
    8000069a:	b769                	j	80000624 <prvCopyDataToQueue+0x16>

000000008000069c <prvCopyDataFromQueue>:
{
    8000069c:	87aa                	mv	a5,a0
	if( pxQueue->uxItemSize != ( UBaseType_t ) 0 )
    8000069e:	6150                	ld	a2,128(a0)
    800006a0:	c215                	beqz	a2,800006c4 <prvCopyDataFromQueue+0x28>
{
    800006a2:	1141                	addi	sp,sp,-16
    800006a4:	e406                	sd	ra,8(sp)
    800006a6:	852e                	mv	a0,a1
		pxQueue->u.pcReadFrom += pxQueue->uxItemSize;
    800006a8:	6f98                	ld	a4,24(a5)
    800006aa:	9732                	add	a4,a4,a2
    800006ac:	ef98                	sd	a4,24(a5)
		if( pxQueue->u.pcReadFrom >= pxQueue->pcTail ) /*lint !e946 MISRA exception justified as use of the relational operator is the cleanest solutions. */
    800006ae:	6794                	ld	a3,8(a5)
    800006b0:	00d76463          	bltu	a4,a3,800006b8 <prvCopyDataFromQueue+0x1c>
			pxQueue->u.pcReadFrom = pxQueue->pcHead;
    800006b4:	6398                	ld	a4,0(a5)
    800006b6:	ef98                	sd	a4,24(a5)
		( void ) memcpy( ( void * ) pvBuffer, ( void * ) pxQueue->u.pcReadFrom, ( size_t ) pxQueue->uxItemSize ); /*lint !e961 !e418 MISRA exception as the casts are only redundant for some ports.  Also previous logic ensures a null pointer can only be passed to memcpy() when the count is 0. */
    800006b8:	6f8c                	ld	a1,24(a5)
    800006ba:	44d020ef          	jal	ra,80003306 <memcpy>
}
    800006be:	60a2                	ld	ra,8(sp)
    800006c0:	0141                	addi	sp,sp,16
    800006c2:	8082                	ret
    800006c4:	8082                	ret

00000000800006c6 <prvUnlockQueue>:
{
    800006c6:	1141                	addi	sp,sp,-16
    800006c8:	e406                	sd	ra,8(sp)
    800006ca:	e022                	sd	s0,0(sp)
    800006cc:	842a                	mv	s0,a0
	taskENTER_CRITICAL();
    800006ce:	368010ef          	jal	ra,80001a36 <vTaskEnterCritical>
		while( pxQueue->xTxLock > queueLOCKED_UNMODIFIED )
    800006d2:	a021                	j	800006da <prvUnlockQueue+0x14>
			--( pxQueue->xTxLock );
    800006d4:	685c                	ld	a5,144(s0)
    800006d6:	17fd                	addi	a5,a5,-1
    800006d8:	e85c                	sd	a5,144(s0)
		while( pxQueue->xTxLock > queueLOCKED_UNMODIFIED )
    800006da:	685c                	ld	a5,144(s0)
    800006dc:	00f05c63          	blez	a5,800006f4 <prvUnlockQueue+0x2e>
				if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
    800006e0:	643c                	ld	a5,72(s0)
    800006e2:	cb89                	beqz	a5,800006f4 <prvUnlockQueue+0x2e>
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
    800006e4:	04840513          	addi	a0,s0,72
    800006e8:	08a010ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    800006ec:	d565                	beqz	a0,800006d4 <prvUnlockQueue+0xe>
						vTaskMissedYield();
    800006ee:	1cc010ef          	jal	ra,800018ba <vTaskMissedYield>
    800006f2:	b7cd                	j	800006d4 <prvUnlockQueue+0xe>
		pxQueue->xTxLock = queueUNLOCKED;
    800006f4:	57fd                	li	a5,-1
    800006f6:	e85c                	sd	a5,144(s0)
	taskEXIT_CRITICAL();
    800006f8:	360010ef          	jal	ra,80001a58 <vTaskExitCritical>
	taskENTER_CRITICAL();
    800006fc:	33a010ef          	jal	ra,80001a36 <vTaskEnterCritical>
		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
    80000700:	a021                	j	80000708 <prvUnlockQueue+0x42>
				--( pxQueue->xRxLock );
    80000702:	645c                	ld	a5,136(s0)
    80000704:	17fd                	addi	a5,a5,-1
    80000706:	e45c                	sd	a5,136(s0)
		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
    80000708:	645c                	ld	a5,136(s0)
    8000070a:	00f05c63          	blez	a5,80000722 <prvUnlockQueue+0x5c>
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
    8000070e:	701c                	ld	a5,32(s0)
    80000710:	cb89                	beqz	a5,80000722 <prvUnlockQueue+0x5c>
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
    80000712:	02040513          	addi	a0,s0,32
    80000716:	05c010ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    8000071a:	d565                	beqz	a0,80000702 <prvUnlockQueue+0x3c>
					vTaskMissedYield();
    8000071c:	19e010ef          	jal	ra,800018ba <vTaskMissedYield>
    80000720:	b7cd                	j	80000702 <prvUnlockQueue+0x3c>
		pxQueue->xRxLock = queueUNLOCKED;
    80000722:	57fd                	li	a5,-1
    80000724:	e45c                	sd	a5,136(s0)
	taskEXIT_CRITICAL();
    80000726:	332010ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    8000072a:	60a2                	ld	ra,8(sp)
    8000072c:	6402                	ld	s0,0(sp)
    8000072e:	0141                	addi	sp,sp,16
    80000730:	8082                	ret

0000000080000732 <xQueueGenericReset>:
	configASSERT( pxQueue );
    80000732:	c531                	beqz	a0,8000077e <xQueueGenericReset+0x4c>
{
    80000734:	1101                	addi	sp,sp,-32
    80000736:	ec06                	sd	ra,24(sp)
    80000738:	e822                	sd	s0,16(sp)
    8000073a:	e426                	sd	s1,8(sp)
    8000073c:	842a                	mv	s0,a0
    8000073e:	84ae                	mv	s1,a1
	taskENTER_CRITICAL();
    80000740:	2f6010ef          	jal	ra,80001a36 <vTaskEnterCritical>
		pxQueue->pcTail = pxQueue->pcHead + ( pxQueue->uxLength * pxQueue->uxItemSize );
    80000744:	601c                	ld	a5,0(s0)
    80000746:	7c34                	ld	a3,120(s0)
    80000748:	6058                	ld	a4,128(s0)
    8000074a:	02e68633          	mul	a2,a3,a4
    8000074e:	963e                	add	a2,a2,a5
    80000750:	e410                	sd	a2,8(s0)
		pxQueue->uxMessagesWaiting = ( UBaseType_t ) 0U;
    80000752:	06043823          	sd	zero,112(s0)
		pxQueue->pcWriteTo = pxQueue->pcHead;
    80000756:	e81c                	sd	a5,16(s0)
		pxQueue->u.pcReadFrom = pxQueue->pcHead + ( ( pxQueue->uxLength - ( UBaseType_t ) 1U ) * pxQueue->uxItemSize );
    80000758:	16fd                	addi	a3,a3,-1
    8000075a:	02d70733          	mul	a4,a4,a3
    8000075e:	97ba                	add	a5,a5,a4
    80000760:	ec1c                	sd	a5,24(s0)
		pxQueue->xRxLock = queueUNLOCKED;
    80000762:	57fd                	li	a5,-1
    80000764:	e45c                	sd	a5,136(s0)
		pxQueue->xTxLock = queueUNLOCKED;
    80000766:	e85c                	sd	a5,144(s0)
		if( xNewQueue == pdFALSE )
    80000768:	e885                	bnez	s1,80000798 <xQueueGenericReset+0x66>
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
    8000076a:	701c                	ld	a5,32(s0)
    8000076c:	ef81                	bnez	a5,80000784 <xQueueGenericReset+0x52>
	taskEXIT_CRITICAL();
    8000076e:	2ea010ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    80000772:	4505                	li	a0,1
    80000774:	60e2                	ld	ra,24(sp)
    80000776:	6442                	ld	s0,16(sp)
    80000778:	64a2                	ld	s1,8(sp)
    8000077a:	6105                	addi	sp,sp,32
    8000077c:	8082                	ret
	configASSERT( pxQueue );
    8000077e:	30047073          	csrci	mstatus,8
    80000782:	a001                	j	80000782 <xQueueGenericReset+0x50>
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) == pdTRUE )
    80000784:	02040513          	addi	a0,s0,32
    80000788:	7eb000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    8000078c:	4785                	li	a5,1
    8000078e:	fef510e3          	bne	a0,a5,8000076e <xQueueGenericReset+0x3c>
					queueYIELD_IF_USING_PREEMPTION();
    80000792:	c7bff0ef          	jal	ra,8000040c <vPortYield>
    80000796:	bfe1                	j	8000076e <xQueueGenericReset+0x3c>
			vListInitialise( &( pxQueue->xTasksWaitingToSend ) );
    80000798:	02040513          	addi	a0,s0,32
    8000079c:	da5ff0ef          	jal	ra,80000540 <vListInitialise>
			vListInitialise( &( pxQueue->xTasksWaitingToReceive ) );
    800007a0:	04840513          	addi	a0,s0,72
    800007a4:	d9dff0ef          	jal	ra,80000540 <vListInitialise>
    800007a8:	b7d9                	j	8000076e <xQueueGenericReset+0x3c>

00000000800007aa <xQueueGenericCreate>:
	configASSERT( uxQueueLength > ( UBaseType_t ) 0 );
    800007aa:	e501                	bnez	a0,800007b2 <xQueueGenericCreate+0x8>
    800007ac:	30047073          	csrci	mstatus,8
    800007b0:	a001                	j	800007b0 <xQueueGenericCreate+0x6>
{
    800007b2:	7179                	addi	sp,sp,-48
    800007b4:	f406                	sd	ra,40(sp)
    800007b6:	f022                	sd	s0,32(sp)
    800007b8:	ec26                	sd	s1,24(sp)
    800007ba:	e84a                	sd	s2,16(sp)
    800007bc:	e44e                	sd	s3,8(sp)
    800007be:	84aa                	mv	s1,a0
    800007c0:	842e                	mv	s0,a1
    800007c2:	89b2                	mv	s3,a2
	if( uxItemSize == ( UBaseType_t ) 0 )
    800007c4:	cd9d                	beqz	a1,80000802 <xQueueGenericCreate+0x58>
		xQueueSizeInBytes = ( size_t ) ( uxQueueLength * uxItemSize ) + ( size_t ) 1; /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800007c6:	02b50533          	mul	a0,a0,a1
    800007ca:	0505                	addi	a0,a0,1
	pxNewQueue = ( Queue_t * ) pvPortMalloc( sizeof( Queue_t ) + xQueueSizeInBytes );
    800007cc:	0a850513          	addi	a0,a0,168
    800007d0:	207020ef          	jal	ra,800031d6 <pvPortMalloc>
    800007d4:	892a                	mv	s2,a0
	if( pxNewQueue != NULL )
    800007d6:	c905                	beqz	a0,80000806 <xQueueGenericCreate+0x5c>
		if( uxItemSize == ( UBaseType_t ) 0 )
    800007d8:	e815                	bnez	s0,8000080c <xQueueGenericCreate+0x62>
			pxNewQueue->pcHead = ( int8_t * ) pxNewQueue;
    800007da:	00a93023          	sd	a0,0(s2)
		pxNewQueue->uxLength = uxQueueLength;
    800007de:	06993c23          	sd	s1,120(s2)
		pxNewQueue->uxItemSize = uxItemSize;
    800007e2:	08893023          	sd	s0,128(s2)
		( void ) xQueueGenericReset( pxNewQueue, pdTRUE );
    800007e6:	4585                	li	a1,1
    800007e8:	854a                	mv	a0,s2
    800007ea:	f49ff0ef          	jal	ra,80000732 <xQueueGenericReset>
			pxNewQueue->ucQueueType = ucQueueType;
    800007ee:	0b390023          	sb	s3,160(s2)
}
    800007f2:	854a                	mv	a0,s2
    800007f4:	70a2                	ld	ra,40(sp)
    800007f6:	7402                	ld	s0,32(sp)
    800007f8:	64e2                	ld	s1,24(sp)
    800007fa:	6942                	ld	s2,16(sp)
    800007fc:	69a2                	ld	s3,8(sp)
    800007fe:	6145                	addi	sp,sp,48
    80000800:	8082                	ret
		xQueueSizeInBytes = ( size_t ) 0;
    80000802:	852e                	mv	a0,a1
    80000804:	b7e1                	j	800007cc <xQueueGenericCreate+0x22>
	configASSERT( xReturn );
    80000806:	30047073          	csrci	mstatus,8
    8000080a:	a001                	j	8000080a <xQueueGenericCreate+0x60>
			pxNewQueue->pcHead = ( ( int8_t * ) pxNewQueue ) + sizeof( Queue_t );
    8000080c:	0a850793          	addi	a5,a0,168
    80000810:	e11c                	sd	a5,0(a0)
    80000812:	b7f1                	j	800007de <xQueueGenericCreate+0x34>

0000000080000814 <xQueueCreateCountingSemaphore>:
		configASSERT( uxMaxCount != 0 );
    80000814:	e501                	bnez	a0,8000081c <xQueueCreateCountingSemaphore+0x8>
    80000816:	30047073          	csrci	mstatus,8
    8000081a:	a001                	j	8000081a <xQueueCreateCountingSemaphore+0x6>
	{
    8000081c:	1141                	addi	sp,sp,-16
    8000081e:	e406                	sd	ra,8(sp)
    80000820:	e022                	sd	s0,0(sp)
    80000822:	842e                	mv	s0,a1
		configASSERT( uxInitialCount <= uxMaxCount );
    80000824:	00b57563          	bgeu	a0,a1,8000082e <xQueueCreateCountingSemaphore+0x1a>
    80000828:	30047073          	csrci	mstatus,8
    8000082c:	a001                	j	8000082c <xQueueCreateCountingSemaphore+0x18>
		xHandle = xQueueGenericCreate( uxMaxCount, queueSEMAPHORE_QUEUE_ITEM_LENGTH, queueQUEUE_TYPE_COUNTING_SEMAPHORE );
    8000082e:	4609                	li	a2,2
    80000830:	4581                	li	a1,0
    80000832:	f79ff0ef          	jal	ra,800007aa <xQueueGenericCreate>
		if( xHandle != NULL )
    80000836:	c111                	beqz	a0,8000083a <xQueueCreateCountingSemaphore+0x26>
			( ( Queue_t * ) xHandle )->uxMessagesWaiting = uxInitialCount;
    80000838:	f920                	sd	s0,112(a0)
		configASSERT( xHandle );
    8000083a:	c509                	beqz	a0,80000844 <xQueueCreateCountingSemaphore+0x30>
	}
    8000083c:	60a2                	ld	ra,8(sp)
    8000083e:	6402                	ld	s0,0(sp)
    80000840:	0141                	addi	sp,sp,16
    80000842:	8082                	ret
		configASSERT( xHandle );
    80000844:	30047073          	csrci	mstatus,8
    80000848:	a001                	j	80000848 <xQueueCreateCountingSemaphore+0x34>

000000008000084a <xQueueGenericSend>:
{
    8000084a:	715d                	addi	sp,sp,-80
    8000084c:	e486                	sd	ra,72(sp)
    8000084e:	e0a2                	sd	s0,64(sp)
    80000850:	fc26                	sd	s1,56(sp)
    80000852:	f84a                	sd	s2,48(sp)
    80000854:	f44e                	sd	s3,40(sp)
    80000856:	c632                	sw	a2,12(sp)
	configASSERT( pxQueue );
    80000858:	cd19                	beqz	a0,80000876 <xQueueGenericSend+0x2c>
    8000085a:	842a                	mv	s0,a0
    8000085c:	89ae                	mv	s3,a1
    8000085e:	84b6                	mv	s1,a3
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000860:	cd91                	beqz	a1,8000087c <xQueueGenericSend+0x32>
	configASSERT( !( ( xCopyPosition == queueOVERWRITE ) && ( pxQueue->uxLength != 1 ) ) );
    80000862:	4789                	li	a5,2
    80000864:	02f49163          	bne	s1,a5,80000886 <xQueueGenericSend+0x3c>
    80000868:	7c38                	ld	a4,120(s0)
    8000086a:	4785                	li	a5,1
    8000086c:	00f70d63          	beq	a4,a5,80000886 <xQueueGenericSend+0x3c>
    80000870:	30047073          	csrci	mstatus,8
    80000874:	a001                	j	80000874 <xQueueGenericSend+0x2a>
	configASSERT( pxQueue );
    80000876:	30047073          	csrci	mstatus,8
    8000087a:	a001                	j	8000087a <xQueueGenericSend+0x30>
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    8000087c:	615c                	ld	a5,128(a0)
    8000087e:	d3f5                	beqz	a5,80000862 <xQueueGenericSend+0x18>
    80000880:	30047073          	csrci	mstatus,8
    80000884:	a001                	j	80000884 <xQueueGenericSend+0x3a>
		configASSERT( !( ( xTaskGetSchedulerState() == taskSCHEDULER_SUSPENDED ) && ( xTicksToWait != 0 ) ) );
    80000886:	05a010ef          	jal	ra,800018e0 <xTaskGetSchedulerState>
    8000088a:	892a                	mv	s2,a0
    8000088c:	e511                	bnez	a0,80000898 <xQueueGenericSend+0x4e>
    8000088e:	47b2                	lw	a5,12(sp)
    80000890:	cbad                	beqz	a5,80000902 <xQueueGenericSend+0xb8>
    80000892:	30047073          	csrci	mstatus,8
    80000896:	a001                	j	80000896 <xQueueGenericSend+0x4c>
    80000898:	4901                	li	s2,0
    8000089a:	a0a5                	j	80000902 <xQueueGenericSend+0xb8>
				xYieldRequired = prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
    8000089c:	8626                	mv	a2,s1
    8000089e:	85ce                	mv	a1,s3
    800008a0:	8522                	mv	a0,s0
    800008a2:	d6dff0ef          	jal	ra,8000060e <prvCopyDataToQueue>
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
    800008a6:	643c                	ld	a5,72(s0)
    800008a8:	ef81                	bnez	a5,800008c0 <xQueueGenericSend+0x76>
					else if( xYieldRequired != pdFALSE )
    800008aa:	e50d                	bnez	a0,800008d4 <xQueueGenericSend+0x8a>
				taskEXIT_CRITICAL();
    800008ac:	1ac010ef          	jal	ra,80001a58 <vTaskExitCritical>
				return pdPASS;
    800008b0:	4505                	li	a0,1
}
    800008b2:	60a6                	ld	ra,72(sp)
    800008b4:	6406                	ld	s0,64(sp)
    800008b6:	74e2                	ld	s1,56(sp)
    800008b8:	7942                	ld	s2,48(sp)
    800008ba:	79a2                	ld	s3,40(sp)
    800008bc:	6161                	addi	sp,sp,80
    800008be:	8082                	ret
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) == pdTRUE )
    800008c0:	04840513          	addi	a0,s0,72
    800008c4:	6af000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    800008c8:	4785                	li	a5,1
    800008ca:	fef511e3          	bne	a0,a5,800008ac <xQueueGenericSend+0x62>
							queueYIELD_IF_USING_PREEMPTION();
    800008ce:	b3fff0ef          	jal	ra,8000040c <vPortYield>
    800008d2:	bfe9                	j	800008ac <xQueueGenericSend+0x62>
						queueYIELD_IF_USING_PREEMPTION();
    800008d4:	b39ff0ef          	jal	ra,8000040c <vPortYield>
    800008d8:	bfd1                	j	800008ac <xQueueGenericSend+0x62>
					taskEXIT_CRITICAL();
    800008da:	17e010ef          	jal	ra,80001a58 <vTaskExitCritical>
					return errQUEUE_FULL;
    800008de:	4501                	li	a0,0
    800008e0:	bfc9                	j	800008b2 <xQueueGenericSend+0x68>
					vTaskSetTimeOutState( &xTimeOut );
    800008e2:	0808                	addi	a0,sp,16
    800008e4:	7b9000ef          	jal	ra,8000189c <vTaskSetTimeOutState>
					xEntryTimeSet = pdTRUE;
    800008e8:	4905                	li	s2,1
    800008ea:	a80d                	j	8000091c <xQueueGenericSend+0xd2>
		prvLockQueue( pxQueue );
    800008ec:	08043423          	sd	zero,136(s0)
    800008f0:	a081                	j	80000930 <xQueueGenericSend+0xe6>
    800008f2:	08043823          	sd	zero,144(s0)
    800008f6:	a089                	j	80000938 <xQueueGenericSend+0xee>
				prvUnlockQueue( pxQueue );
    800008f8:	8522                	mv	a0,s0
    800008fa:	dcdff0ef          	jal	ra,800006c6 <prvUnlockQueue>
				( void ) xTaskResumeAll();
    800008fe:	6c8010ef          	jal	ra,80001fc6 <xTaskResumeAll>
		taskENTER_CRITICAL();
    80000902:	134010ef          	jal	ra,80001a36 <vTaskEnterCritical>
			if( ( pxQueue->uxMessagesWaiting < pxQueue->uxLength ) || ( xCopyPosition == queueOVERWRITE ) )
    80000906:	7838                	ld	a4,112(s0)
    80000908:	7c3c                	ld	a5,120(s0)
    8000090a:	f8f769e3          	bltu	a4,a5,8000089c <xQueueGenericSend+0x52>
    8000090e:	4789                	li	a5,2
    80000910:	f8f486e3          	beq	s1,a5,8000089c <xQueueGenericSend+0x52>
				if( xTicksToWait == ( TickType_t ) 0 )
    80000914:	47b2                	lw	a5,12(sp)
    80000916:	d3f1                	beqz	a5,800008da <xQueueGenericSend+0x90>
				else if( xEntryTimeSet == pdFALSE )
    80000918:	fc0905e3          	beqz	s2,800008e2 <xQueueGenericSend+0x98>
		taskEXIT_CRITICAL();
    8000091c:	13c010ef          	jal	ra,80001a58 <vTaskExitCritical>
		vTaskSuspendAll();
    80000920:	239000ef          	jal	ra,80001358 <vTaskSuspendAll>
		prvLockQueue( pxQueue );
    80000924:	112010ef          	jal	ra,80001a36 <vTaskEnterCritical>
    80000928:	6458                	ld	a4,136(s0)
    8000092a:	57fd                	li	a5,-1
    8000092c:	fcf700e3          	beq	a4,a5,800008ec <xQueueGenericSend+0xa2>
    80000930:	6858                	ld	a4,144(s0)
    80000932:	57fd                	li	a5,-1
    80000934:	faf70fe3          	beq	a4,a5,800008f2 <xQueueGenericSend+0xa8>
    80000938:	120010ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
    8000093c:	006c                	addi	a1,sp,12
    8000093e:	0808                	addi	a0,sp,16
    80000940:	1f9010ef          	jal	ra,80002338 <xTaskCheckForTimeOut>
    80000944:	e11d                	bnez	a0,8000096a <xQueueGenericSend+0x120>
			if( prvIsQueueFull( pxQueue ) != pdFALSE )
    80000946:	8522                	mv	a0,s0
    80000948:	c7bff0ef          	jal	ra,800005c2 <prvIsQueueFull>
    8000094c:	d555                	beqz	a0,800008f8 <xQueueGenericSend+0xae>
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
    8000094e:	45b2                	lw	a1,12(sp)
    80000950:	02040513          	addi	a0,s0,32
    80000954:	4d5000ef          	jal	ra,80001628 <vTaskPlaceOnEventList>
				prvUnlockQueue( pxQueue );
    80000958:	8522                	mv	a0,s0
    8000095a:	d6dff0ef          	jal	ra,800006c6 <prvUnlockQueue>
				if( xTaskResumeAll() == pdFALSE )
    8000095e:	668010ef          	jal	ra,80001fc6 <xTaskResumeAll>
    80000962:	f145                	bnez	a0,80000902 <xQueueGenericSend+0xb8>
					portYIELD_WITHIN_API();
    80000964:	aa9ff0ef          	jal	ra,8000040c <vPortYield>
    80000968:	bf69                	j	80000902 <xQueueGenericSend+0xb8>
			prvUnlockQueue( pxQueue );
    8000096a:	8522                	mv	a0,s0
    8000096c:	d5bff0ef          	jal	ra,800006c6 <prvUnlockQueue>
			( void ) xTaskResumeAll();
    80000970:	656010ef          	jal	ra,80001fc6 <xTaskResumeAll>
			return errQUEUE_FULL;
    80000974:	4501                	li	a0,0
    80000976:	bf35                	j	800008b2 <xQueueGenericSend+0x68>

0000000080000978 <xQueueCreateMutex>:
	{
    80000978:	1101                	addi	sp,sp,-32
    8000097a:	ec06                	sd	ra,24(sp)
    8000097c:	e822                	sd	s0,16(sp)
    8000097e:	e426                	sd	s1,8(sp)
    80000980:	84aa                	mv	s1,a0
		pxNewQueue = ( Queue_t * ) pvPortMalloc( sizeof( Queue_t ) );
    80000982:	0a800513          	li	a0,168
    80000986:	051020ef          	jal	ra,800031d6 <pvPortMalloc>
    8000098a:	842a                	mv	s0,a0
		if( pxNewQueue != NULL )
    8000098c:	c131                	beqz	a0,800009d0 <xQueueCreateMutex+0x58>
			pxNewQueue->pxMutexHolder = NULL;
    8000098e:	00053423          	sd	zero,8(a0)
			pxNewQueue->uxQueueType = queueQUEUE_IS_MUTEX;
    80000992:	00053023          	sd	zero,0(a0)
			pxNewQueue->pcWriteTo = NULL;
    80000996:	00053823          	sd	zero,16(a0)
			pxNewQueue->u.pcReadFrom = NULL;
    8000099a:	00053c23          	sd	zero,24(a0)
			pxNewQueue->uxMessagesWaiting = ( UBaseType_t ) 0U;
    8000099e:	06053823          	sd	zero,112(a0)
			pxNewQueue->uxLength = ( UBaseType_t ) 1U;
    800009a2:	4785                	li	a5,1
    800009a4:	fd3c                	sd	a5,120(a0)
			pxNewQueue->uxItemSize = ( UBaseType_t ) 0U;
    800009a6:	08053023          	sd	zero,128(a0)
			pxNewQueue->xRxLock = queueUNLOCKED;
    800009aa:	57fd                	li	a5,-1
    800009ac:	e55c                	sd	a5,136(a0)
			pxNewQueue->xTxLock = queueUNLOCKED;
    800009ae:	e95c                	sd	a5,144(a0)
				pxNewQueue->ucQueueType = ucQueueType;
    800009b0:	0a950023          	sb	s1,160(a0)
			vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
    800009b4:	02050513          	addi	a0,a0,32
    800009b8:	b89ff0ef          	jal	ra,80000540 <vListInitialise>
			vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );
    800009bc:	04840513          	addi	a0,s0,72
    800009c0:	b81ff0ef          	jal	ra,80000540 <vListInitialise>
			( void ) xQueueGenericSend( pxNewQueue, NULL, ( TickType_t ) 0U, queueSEND_TO_BACK );
    800009c4:	4681                	li	a3,0
    800009c6:	4601                	li	a2,0
    800009c8:	4581                	li	a1,0
    800009ca:	8522                	mv	a0,s0
    800009cc:	e7fff0ef          	jal	ra,8000084a <xQueueGenericSend>
	}
    800009d0:	8522                	mv	a0,s0
    800009d2:	60e2                	ld	ra,24(sp)
    800009d4:	6442                	ld	s0,16(sp)
    800009d6:	64a2                	ld	s1,8(sp)
    800009d8:	6105                	addi	sp,sp,32
    800009da:	8082                	ret

00000000800009dc <xQueueGiveMutexRecursive>:
		configASSERT( pxMutex );
    800009dc:	c10d                	beqz	a0,800009fe <xQueueGiveMutexRecursive+0x22>
	{
    800009de:	1101                	addi	sp,sp,-32
    800009e0:	ec06                	sd	ra,24(sp)
    800009e2:	e822                	sd	s0,16(sp)
    800009e4:	e426                	sd	s1,8(sp)
    800009e6:	842a                	mv	s0,a0
		if( pxMutex->pxMutexHolder == ( void * ) xTaskGetCurrentTaskHandle() ) /*lint !e961 Not a redundant cast as TaskHandle_t is a typedef. */
    800009e8:	6504                	ld	s1,8(a0)
    800009ea:	6ed000ef          	jal	ra,800018d6 <xTaskGetCurrentTaskHandle>
    800009ee:	00a48b63          	beq	s1,a0,80000a04 <xQueueGiveMutexRecursive+0x28>
			xReturn = pdFAIL;
    800009f2:	4501                	li	a0,0
	}
    800009f4:	60e2                	ld	ra,24(sp)
    800009f6:	6442                	ld	s0,16(sp)
    800009f8:	64a2                	ld	s1,8(sp)
    800009fa:	6105                	addi	sp,sp,32
    800009fc:	8082                	ret
		configASSERT( pxMutex );
    800009fe:	30047073          	csrci	mstatus,8
    80000a02:	a001                	j	80000a02 <xQueueGiveMutexRecursive+0x26>
			( pxMutex->u.uxRecursiveCallCount )--;
    80000a04:	6c1c                	ld	a5,24(s0)
    80000a06:	17fd                	addi	a5,a5,-1
    80000a08:	ec1c                	sd	a5,24(s0)
			if( pxMutex->u.uxRecursiveCallCount == ( UBaseType_t ) 0 )
    80000a0a:	c399                	beqz	a5,80000a10 <xQueueGiveMutexRecursive+0x34>
			xReturn = pdPASS;
    80000a0c:	4505                	li	a0,1
		return xReturn;
    80000a0e:	b7dd                	j	800009f4 <xQueueGiveMutexRecursive+0x18>
				( void ) xQueueGenericSend( pxMutex, NULL, queueMUTEX_GIVE_BLOCK_TIME, queueSEND_TO_BACK );
    80000a10:	4681                	li	a3,0
    80000a12:	4601                	li	a2,0
    80000a14:	4581                	li	a1,0
    80000a16:	8522                	mv	a0,s0
    80000a18:	e33ff0ef          	jal	ra,8000084a <xQueueGenericSend>
			xReturn = pdPASS;
    80000a1c:	4505                	li	a0,1
    80000a1e:	bfd9                	j	800009f4 <xQueueGiveMutexRecursive+0x18>

0000000080000a20 <xQueueGenericSendFromISR>:
	configASSERT( pxQueue );
    80000a20:	c51d                	beqz	a0,80000a4e <xQueueGenericSendFromISR+0x2e>
{
    80000a22:	7179                	addi	sp,sp,-48
    80000a24:	f406                	sd	ra,40(sp)
    80000a26:	f022                	sd	s0,32(sp)
    80000a28:	ec26                	sd	s1,24(sp)
    80000a2a:	e84a                	sd	s2,16(sp)
    80000a2c:	e44e                	sd	s3,8(sp)
    80000a2e:	e052                	sd	s4,0(sp)
    80000a30:	842a                	mv	s0,a0
    80000a32:	89ae                	mv	s3,a1
    80000a34:	8932                	mv	s2,a2
    80000a36:	84b6                	mv	s1,a3
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000a38:	cd91                	beqz	a1,80000a54 <xQueueGenericSendFromISR+0x34>
	configASSERT( !( ( xCopyPosition == queueOVERWRITE ) && ( pxQueue->uxLength != 1 ) ) );
    80000a3a:	4789                	li	a5,2
    80000a3c:	02f49163          	bne	s1,a5,80000a5e <xQueueGenericSendFromISR+0x3e>
    80000a40:	7c38                	ld	a4,120(s0)
    80000a42:	4785                	li	a5,1
    80000a44:	00f70d63          	beq	a4,a5,80000a5e <xQueueGenericSendFromISR+0x3e>
    80000a48:	30047073          	csrci	mstatus,8
    80000a4c:	a001                	j	80000a4c <xQueueGenericSendFromISR+0x2c>
	configASSERT( pxQueue );
    80000a4e:	30047073          	csrci	mstatus,8
    80000a52:	a001                	j	80000a52 <xQueueGenericSendFromISR+0x32>
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000a54:	615c                	ld	a5,128(a0)
    80000a56:	d3f5                	beqz	a5,80000a3a <xQueueGenericSendFromISR+0x1a>
    80000a58:	30047073          	csrci	mstatus,8
    80000a5c:	a001                	j	80000a5c <xQueueGenericSendFromISR+0x3c>
	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    80000a5e:	a9fff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    80000a62:	8a2a                	mv	s4,a0
		if( ( pxQueue->uxMessagesWaiting < pxQueue->uxLength ) || ( xCopyPosition == queueOVERWRITE ) )
    80000a64:	7838                	ld	a4,112(s0)
    80000a66:	7c3c                	ld	a5,120(s0)
    80000a68:	02f76263          	bltu	a4,a5,80000a8c <xQueueGenericSendFromISR+0x6c>
    80000a6c:	4789                	li	a5,2
    80000a6e:	00f48f63          	beq	s1,a5,80000a8c <xQueueGenericSendFromISR+0x6c>
			xReturn = errQUEUE_FULL;
    80000a72:	4401                	li	s0,0
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    80000a74:	8552                	mv	a0,s4
    80000a76:	a81ff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    80000a7a:	8522                	mv	a0,s0
    80000a7c:	70a2                	ld	ra,40(sp)
    80000a7e:	7402                	ld	s0,32(sp)
    80000a80:	64e2                	ld	s1,24(sp)
    80000a82:	6942                	ld	s2,16(sp)
    80000a84:	69a2                	ld	s3,8(sp)
    80000a86:	6a02                	ld	s4,0(sp)
    80000a88:	6145                	addi	sp,sp,48
    80000a8a:	8082                	ret
			( void ) prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
    80000a8c:	8626                	mv	a2,s1
    80000a8e:	85ce                	mv	a1,s3
    80000a90:	8522                	mv	a0,s0
    80000a92:	b7dff0ef          	jal	ra,8000060e <prvCopyDataToQueue>
			if( pxQueue->xTxLock == queueUNLOCKED )
    80000a96:	6858                	ld	a4,144(s0)
    80000a98:	57fd                	li	a5,-1
    80000a9a:	00f70763          	beq	a4,a5,80000aa8 <xQueueGenericSendFromISR+0x88>
				++( pxQueue->xTxLock );
    80000a9e:	685c                	ld	a5,144(s0)
    80000aa0:	0785                	addi	a5,a5,1
    80000aa2:	e85c                	sd	a5,144(s0)
			xReturn = pdPASS;
    80000aa4:	4405                	li	s0,1
    80000aa6:	b7f9                	j	80000a74 <xQueueGenericSendFromISR+0x54>
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
    80000aa8:	643c                	ld	a5,72(s0)
    80000aaa:	e399                	bnez	a5,80000ab0 <xQueueGenericSendFromISR+0x90>
			xReturn = pdPASS;
    80000aac:	4405                	li	s0,1
    80000aae:	b7d9                	j	80000a74 <xQueueGenericSendFromISR+0x54>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
    80000ab0:	04840513          	addi	a0,s0,72
    80000ab4:	4bf000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    80000ab8:	c901                	beqz	a0,80000ac8 <xQueueGenericSendFromISR+0xa8>
							if( pxHigherPriorityTaskWoken != NULL )
    80000aba:	00090963          	beqz	s2,80000acc <xQueueGenericSendFromISR+0xac>
								*pxHigherPriorityTaskWoken = pdTRUE;
    80000abe:	4785                	li	a5,1
    80000ac0:	00f93023          	sd	a5,0(s2)
			xReturn = pdPASS;
    80000ac4:	4405                	li	s0,1
    80000ac6:	b77d                	j	80000a74 <xQueueGenericSendFromISR+0x54>
    80000ac8:	4405                	li	s0,1
    80000aca:	b76d                	j	80000a74 <xQueueGenericSendFromISR+0x54>
    80000acc:	4405                	li	s0,1
    80000ace:	b75d                	j	80000a74 <xQueueGenericSendFromISR+0x54>

0000000080000ad0 <xQueueGiveFromISR>:
	configASSERT( pxQueue );
    80000ad0:	cd09                	beqz	a0,80000aea <xQueueGiveFromISR+0x1a>
{
    80000ad2:	1101                	addi	sp,sp,-32
    80000ad4:	ec06                	sd	ra,24(sp)
    80000ad6:	e822                	sd	s0,16(sp)
    80000ad8:	e426                	sd	s1,8(sp)
    80000ada:	e04a                	sd	s2,0(sp)
    80000adc:	842a                	mv	s0,a0
    80000ade:	84ae                	mv	s1,a1
	configASSERT( pxQueue->uxItemSize == 0 );
    80000ae0:	615c                	ld	a5,128(a0)
    80000ae2:	c799                	beqz	a5,80000af0 <xQueueGiveFromISR+0x20>
    80000ae4:	30047073          	csrci	mstatus,8
    80000ae8:	a001                	j	80000ae8 <xQueueGiveFromISR+0x18>
	configASSERT( pxQueue );
    80000aea:	30047073          	csrci	mstatus,8
    80000aee:	a001                	j	80000aee <xQueueGiveFromISR+0x1e>
	configASSERT( !( ( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX ) && ( pxQueue->pxMutexHolder != NULL ) ) );
    80000af0:	611c                	ld	a5,0(a0)
    80000af2:	c785                	beqz	a5,80000b1a <xQueueGiveFromISR+0x4a>
	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    80000af4:	a09ff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    80000af8:	892a                	mv	s2,a0
		if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
    80000afa:	7838                	ld	a4,112(s0)
    80000afc:	7c3c                	ld	a5,120(s0)
    80000afe:	04f77163          	bgeu	a4,a5,80000b40 <xQueueGiveFromISR+0x70>
			++( pxQueue->uxMessagesWaiting );
    80000b02:	783c                	ld	a5,112(s0)
    80000b04:	0785                	addi	a5,a5,1
    80000b06:	f83c                	sd	a5,112(s0)
			if( pxQueue->xTxLock == queueUNLOCKED )
    80000b08:	6858                	ld	a4,144(s0)
    80000b0a:	57fd                	li	a5,-1
    80000b0c:	00f70c63          	beq	a4,a5,80000b24 <xQueueGiveFromISR+0x54>
				++( pxQueue->xTxLock );
    80000b10:	685c                	ld	a5,144(s0)
    80000b12:	0785                	addi	a5,a5,1
    80000b14:	e85c                	sd	a5,144(s0)
			xReturn = pdPASS;
    80000b16:	4405                	li	s0,1
    80000b18:	a02d                	j	80000b42 <xQueueGiveFromISR+0x72>
	configASSERT( !( ( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX ) && ( pxQueue->pxMutexHolder != NULL ) ) );
    80000b1a:	651c                	ld	a5,8(a0)
    80000b1c:	dfe1                	beqz	a5,80000af4 <xQueueGiveFromISR+0x24>
    80000b1e:	30047073          	csrci	mstatus,8
    80000b22:	a001                	j	80000b22 <xQueueGiveFromISR+0x52>
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
    80000b24:	643c                	ld	a5,72(s0)
    80000b26:	e399                	bnez	a5,80000b2c <xQueueGiveFromISR+0x5c>
			xReturn = pdPASS;
    80000b28:	4405                	li	s0,1
    80000b2a:	a821                	j	80000b42 <xQueueGiveFromISR+0x72>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
    80000b2c:	04840513          	addi	a0,s0,72
    80000b30:	443000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    80000b34:	c10d                	beqz	a0,80000b56 <xQueueGiveFromISR+0x86>
							if( pxHigherPriorityTaskWoken != NULL )
    80000b36:	c095                	beqz	s1,80000b5a <xQueueGiveFromISR+0x8a>
								*pxHigherPriorityTaskWoken = pdTRUE;
    80000b38:	4785                	li	a5,1
    80000b3a:	e09c                	sd	a5,0(s1)
			xReturn = pdPASS;
    80000b3c:	4405                	li	s0,1
    80000b3e:	a011                	j	80000b42 <xQueueGiveFromISR+0x72>
			xReturn = errQUEUE_FULL;
    80000b40:	4401                	li	s0,0
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    80000b42:	854a                	mv	a0,s2
    80000b44:	9b3ff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    80000b48:	8522                	mv	a0,s0
    80000b4a:	60e2                	ld	ra,24(sp)
    80000b4c:	6442                	ld	s0,16(sp)
    80000b4e:	64a2                	ld	s1,8(sp)
    80000b50:	6902                	ld	s2,0(sp)
    80000b52:	6105                	addi	sp,sp,32
    80000b54:	8082                	ret
			xReturn = pdPASS;
    80000b56:	4405                	li	s0,1
    80000b58:	b7ed                	j	80000b42 <xQueueGiveFromISR+0x72>
    80000b5a:	4405                	li	s0,1
    80000b5c:	b7dd                	j	80000b42 <xQueueGiveFromISR+0x72>

0000000080000b5e <xQueueGenericReceive>:
{
    80000b5e:	715d                	addi	sp,sp,-80
    80000b60:	e486                	sd	ra,72(sp)
    80000b62:	e0a2                	sd	s0,64(sp)
    80000b64:	fc26                	sd	s1,56(sp)
    80000b66:	f84a                	sd	s2,48(sp)
    80000b68:	f44e                	sd	s3,40(sp)
    80000b6a:	c632                	sw	a2,12(sp)
	configASSERT( pxQueue );
    80000b6c:	cd11                	beqz	a0,80000b88 <xQueueGenericReceive+0x2a>
    80000b6e:	842a                	mv	s0,a0
    80000b70:	892e                	mv	s2,a1
    80000b72:	89b6                	mv	s3,a3
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000b74:	cd89                	beqz	a1,80000b8e <xQueueGenericReceive+0x30>
		configASSERT( !( ( xTaskGetSchedulerState() == taskSCHEDULER_SUSPENDED ) && ( xTicksToWait != 0 ) ) );
    80000b76:	56b000ef          	jal	ra,800018e0 <xTaskGetSchedulerState>
    80000b7a:	84aa                	mv	s1,a0
    80000b7c:	ed11                	bnez	a0,80000b98 <xQueueGenericReceive+0x3a>
    80000b7e:	47b2                	lw	a5,12(sp)
    80000b80:	cbdd                	beqz	a5,80000c36 <xQueueGenericReceive+0xd8>
    80000b82:	30047073          	csrci	mstatus,8
    80000b86:	a001                	j	80000b86 <xQueueGenericReceive+0x28>
	configASSERT( pxQueue );
    80000b88:	30047073          	csrci	mstatus,8
    80000b8c:	a001                	j	80000b8c <xQueueGenericReceive+0x2e>
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000b8e:	615c                	ld	a5,128(a0)
    80000b90:	d3fd                	beqz	a5,80000b76 <xQueueGenericReceive+0x18>
    80000b92:	30047073          	csrci	mstatus,8
    80000b96:	a001                	j	80000b96 <xQueueGenericReceive+0x38>
    80000b98:	4481                	li	s1,0
    80000b9a:	a871                	j	80000c36 <xQueueGenericReceive+0xd8>
				pcOriginalReadPosition = pxQueue->u.pcReadFrom;
    80000b9c:	6c04                	ld	s1,24(s0)
				prvCopyDataFromQueue( pxQueue, pvBuffer );
    80000b9e:	85ca                	mv	a1,s2
    80000ba0:	8522                	mv	a0,s0
    80000ba2:	afbff0ef          	jal	ra,8000069c <prvCopyDataFromQueue>
				if( xJustPeeking == pdFALSE )
    80000ba6:	04099163          	bnez	s3,80000be8 <xQueueGenericReceive+0x8a>
					--( pxQueue->uxMessagesWaiting );
    80000baa:	783c                	ld	a5,112(s0)
    80000bac:	17fd                	addi	a5,a5,-1
    80000bae:	f83c                	sd	a5,112(s0)
						if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
    80000bb0:	601c                	ld	a5,0(s0)
    80000bb2:	cf89                	beqz	a5,80000bcc <xQueueGenericReceive+0x6e>
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
    80000bb4:	701c                	ld	a5,32(s0)
    80000bb6:	ef99                	bnez	a5,80000bd4 <xQueueGenericReceive+0x76>
				taskEXIT_CRITICAL();
    80000bb8:	6a1000ef          	jal	ra,80001a58 <vTaskExitCritical>
				return pdPASS;
    80000bbc:	4505                	li	a0,1
}
    80000bbe:	60a6                	ld	ra,72(sp)
    80000bc0:	6406                	ld	s0,64(sp)
    80000bc2:	74e2                	ld	s1,56(sp)
    80000bc4:	7942                	ld	s2,48(sp)
    80000bc6:	79a2                	ld	s3,40(sp)
    80000bc8:	6161                	addi	sp,sp,80
    80000bca:	8082                	ret
							pxQueue->pxMutexHolder = ( int8_t * ) pvTaskIncrementMutexHeldCount(); /*lint !e961 Cast is not redundant as TaskHandle_t is a typedef. */
    80000bcc:	7fe010ef          	jal	ra,800023ca <pvTaskIncrementMutexHeldCount>
    80000bd0:	e408                	sd	a0,8(s0)
    80000bd2:	b7cd                	j	80000bb4 <xQueueGenericReceive+0x56>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) == pdTRUE )
    80000bd4:	02040513          	addi	a0,s0,32
    80000bd8:	39b000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    80000bdc:	4785                	li	a5,1
    80000bde:	fcf51de3          	bne	a0,a5,80000bb8 <xQueueGenericReceive+0x5a>
							queueYIELD_IF_USING_PREEMPTION();
    80000be2:	82bff0ef          	jal	ra,8000040c <vPortYield>
    80000be6:	bfc9                	j	80000bb8 <xQueueGenericReceive+0x5a>
					pxQueue->u.pcReadFrom = pcOriginalReadPosition;
    80000be8:	ec04                	sd	s1,24(s0)
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
    80000bea:	643c                	ld	a5,72(s0)
    80000bec:	d7f1                	beqz	a5,80000bb8 <xQueueGenericReceive+0x5a>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
    80000bee:	04840513          	addi	a0,s0,72
    80000bf2:	381000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    80000bf6:	d169                	beqz	a0,80000bb8 <xQueueGenericReceive+0x5a>
							queueYIELD_IF_USING_PREEMPTION();
    80000bf8:	815ff0ef          	jal	ra,8000040c <vPortYield>
    80000bfc:	bf75                	j	80000bb8 <xQueueGenericReceive+0x5a>
					taskEXIT_CRITICAL();
    80000bfe:	65b000ef          	jal	ra,80001a58 <vTaskExitCritical>
					return errQUEUE_EMPTY;
    80000c02:	4501                	li	a0,0
    80000c04:	bf6d                	j	80000bbe <xQueueGenericReceive+0x60>
					vTaskSetTimeOutState( &xTimeOut );
    80000c06:	0808                	addi	a0,sp,16
    80000c08:	495000ef          	jal	ra,8000189c <vTaskSetTimeOutState>
					xEntryTimeSet = pdTRUE;
    80000c0c:	4485                	li	s1,1
    80000c0e:	a81d                	j	80000c44 <xQueueGenericReceive+0xe6>
		prvLockQueue( pxQueue );
    80000c10:	08043423          	sd	zero,136(s0)
    80000c14:	a091                	j	80000c58 <xQueueGenericReceive+0xfa>
    80000c16:	08043823          	sd	zero,144(s0)
    80000c1a:	a099                	j	80000c60 <xQueueGenericReceive+0x102>
						taskENTER_CRITICAL();
    80000c1c:	61b000ef          	jal	ra,80001a36 <vTaskEnterCritical>
							vTaskPriorityInherit( ( void * ) pxQueue->pxMutexHolder );
    80000c20:	6408                	ld	a0,8(s0)
    80000c22:	4df000ef          	jal	ra,80001900 <vTaskPriorityInherit>
						taskEXIT_CRITICAL();
    80000c26:	633000ef          	jal	ra,80001a58 <vTaskExitCritical>
    80000c2a:	a881                	j	80000c7a <xQueueGenericReceive+0x11c>
				prvUnlockQueue( pxQueue );
    80000c2c:	8522                	mv	a0,s0
    80000c2e:	a99ff0ef          	jal	ra,800006c6 <prvUnlockQueue>
				( void ) xTaskResumeAll();
    80000c32:	394010ef          	jal	ra,80001fc6 <xTaskResumeAll>
		taskENTER_CRITICAL();
    80000c36:	601000ef          	jal	ra,80001a36 <vTaskEnterCritical>
			if( pxQueue->uxMessagesWaiting > ( UBaseType_t ) 0 )
    80000c3a:	783c                	ld	a5,112(s0)
    80000c3c:	f3a5                	bnez	a5,80000b9c <xQueueGenericReceive+0x3e>
				if( xTicksToWait == ( TickType_t ) 0 )
    80000c3e:	47b2                	lw	a5,12(sp)
    80000c40:	dfdd                	beqz	a5,80000bfe <xQueueGenericReceive+0xa0>
				else if( xEntryTimeSet == pdFALSE )
    80000c42:	d0f1                	beqz	s1,80000c06 <xQueueGenericReceive+0xa8>
		taskEXIT_CRITICAL();
    80000c44:	615000ef          	jal	ra,80001a58 <vTaskExitCritical>
		vTaskSuspendAll();
    80000c48:	710000ef          	jal	ra,80001358 <vTaskSuspendAll>
		prvLockQueue( pxQueue );
    80000c4c:	5eb000ef          	jal	ra,80001a36 <vTaskEnterCritical>
    80000c50:	6458                	ld	a4,136(s0)
    80000c52:	57fd                	li	a5,-1
    80000c54:	faf70ee3          	beq	a4,a5,80000c10 <xQueueGenericReceive+0xb2>
    80000c58:	6858                	ld	a4,144(s0)
    80000c5a:	57fd                	li	a5,-1
    80000c5c:	faf70de3          	beq	a4,a5,80000c16 <xQueueGenericReceive+0xb8>
    80000c60:	5f9000ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
    80000c64:	006c                	addi	a1,sp,12
    80000c66:	0808                	addi	a0,sp,16
    80000c68:	6d0010ef          	jal	ra,80002338 <xTaskCheckForTimeOut>
    80000c6c:	e50d                	bnez	a0,80000c96 <xQueueGenericReceive+0x138>
			if( prvIsQueueEmpty( pxQueue ) != pdFALSE )
    80000c6e:	8522                	mv	a0,s0
    80000c70:	97bff0ef          	jal	ra,800005ea <prvIsQueueEmpty>
    80000c74:	dd45                	beqz	a0,80000c2c <xQueueGenericReceive+0xce>
					if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
    80000c76:	601c                	ld	a5,0(s0)
    80000c78:	d3d5                	beqz	a5,80000c1c <xQueueGenericReceive+0xbe>
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
    80000c7a:	45b2                	lw	a1,12(sp)
    80000c7c:	04840513          	addi	a0,s0,72
    80000c80:	1a9000ef          	jal	ra,80001628 <vTaskPlaceOnEventList>
				prvUnlockQueue( pxQueue );
    80000c84:	8522                	mv	a0,s0
    80000c86:	a41ff0ef          	jal	ra,800006c6 <prvUnlockQueue>
				if( xTaskResumeAll() == pdFALSE )
    80000c8a:	33c010ef          	jal	ra,80001fc6 <xTaskResumeAll>
    80000c8e:	f545                	bnez	a0,80000c36 <xQueueGenericReceive+0xd8>
					portYIELD_WITHIN_API();
    80000c90:	f7cff0ef          	jal	ra,8000040c <vPortYield>
    80000c94:	b74d                	j	80000c36 <xQueueGenericReceive+0xd8>
			prvUnlockQueue( pxQueue );
    80000c96:	8522                	mv	a0,s0
    80000c98:	a2fff0ef          	jal	ra,800006c6 <prvUnlockQueue>
			( void ) xTaskResumeAll();
    80000c9c:	32a010ef          	jal	ra,80001fc6 <xTaskResumeAll>
			return errQUEUE_EMPTY;
    80000ca0:	4501                	li	a0,0
    80000ca2:	bf31                	j	80000bbe <xQueueGenericReceive+0x60>

0000000080000ca4 <xQueueTakeMutexRecursive>:
		configASSERT( pxMutex );
    80000ca4:	c91d                	beqz	a0,80000cda <xQueueTakeMutexRecursive+0x36>
	{
    80000ca6:	1101                	addi	sp,sp,-32
    80000ca8:	ec06                	sd	ra,24(sp)
    80000caa:	e822                	sd	s0,16(sp)
    80000cac:	e426                	sd	s1,8(sp)
    80000cae:	e04a                	sd	s2,0(sp)
    80000cb0:	842a                	mv	s0,a0
    80000cb2:	84ae                	mv	s1,a1
		if( pxMutex->pxMutexHolder == ( void * ) xTaskGetCurrentTaskHandle() ) /*lint !e961 Cast is not redundant as TaskHandle_t is a typedef. */
    80000cb4:	00853903          	ld	s2,8(a0)
    80000cb8:	41f000ef          	jal	ra,800018d6 <xTaskGetCurrentTaskHandle>
    80000cbc:	02a90263          	beq	s2,a0,80000ce0 <xQueueTakeMutexRecursive+0x3c>
			xReturn = xQueueGenericReceive( pxMutex, NULL, xTicksToWait, pdFALSE );
    80000cc0:	4681                	li	a3,0
    80000cc2:	8626                	mv	a2,s1
    80000cc4:	4581                	li	a1,0
    80000cc6:	8522                	mv	a0,s0
    80000cc8:	e97ff0ef          	jal	ra,80000b5e <xQueueGenericReceive>
			if( xReturn == pdPASS )
    80000ccc:	4785                	li	a5,1
    80000cce:	00f51d63          	bne	a0,a5,80000ce8 <xQueueTakeMutexRecursive+0x44>
				( pxMutex->u.uxRecursiveCallCount )++;
    80000cd2:	6c1c                	ld	a5,24(s0)
    80000cd4:	0785                	addi	a5,a5,1
    80000cd6:	ec1c                	sd	a5,24(s0)
		return xReturn;
    80000cd8:	a801                	j	80000ce8 <xQueueTakeMutexRecursive+0x44>
		configASSERT( pxMutex );
    80000cda:	30047073          	csrci	mstatus,8
    80000cde:	a001                	j	80000cde <xQueueTakeMutexRecursive+0x3a>
			( pxMutex->u.uxRecursiveCallCount )++;
    80000ce0:	6c1c                	ld	a5,24(s0)
    80000ce2:	0785                	addi	a5,a5,1
    80000ce4:	ec1c                	sd	a5,24(s0)
			xReturn = pdPASS;
    80000ce6:	4505                	li	a0,1
	}
    80000ce8:	60e2                	ld	ra,24(sp)
    80000cea:	6442                	ld	s0,16(sp)
    80000cec:	64a2                	ld	s1,8(sp)
    80000cee:	6902                	ld	s2,0(sp)
    80000cf0:	6105                	addi	sp,sp,32
    80000cf2:	8082                	ret

0000000080000cf4 <xQueueReceiveFromISR>:
	configASSERT( pxQueue );
    80000cf4:	cd05                	beqz	a0,80000d2c <xQueueReceiveFromISR+0x38>
{
    80000cf6:	7179                	addi	sp,sp,-48
    80000cf8:	f406                	sd	ra,40(sp)
    80000cfa:	f022                	sd	s0,32(sp)
    80000cfc:	ec26                	sd	s1,24(sp)
    80000cfe:	e84a                	sd	s2,16(sp)
    80000d00:	e44e                	sd	s3,8(sp)
    80000d02:	842a                	mv	s0,a0
    80000d04:	84ae                	mv	s1,a1
    80000d06:	8932                	mv	s2,a2
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000d08:	c58d                	beqz	a1,80000d32 <xQueueReceiveFromISR+0x3e>
	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    80000d0a:	ff2ff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    80000d0e:	89aa                	mv	s3,a0
		if( pxQueue->uxMessagesWaiting > ( UBaseType_t ) 0 )
    80000d10:	783c                	ld	a5,112(s0)
    80000d12:	e78d                	bnez	a5,80000d3c <xQueueReceiveFromISR+0x48>
			xReturn = pdFAIL;
    80000d14:	4401                	li	s0,0
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    80000d16:	854e                	mv	a0,s3
    80000d18:	fdeff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    80000d1c:	8522                	mv	a0,s0
    80000d1e:	70a2                	ld	ra,40(sp)
    80000d20:	7402                	ld	s0,32(sp)
    80000d22:	64e2                	ld	s1,24(sp)
    80000d24:	6942                	ld	s2,16(sp)
    80000d26:	69a2                	ld	s3,8(sp)
    80000d28:	6145                	addi	sp,sp,48
    80000d2a:	8082                	ret
	configASSERT( pxQueue );
    80000d2c:	30047073          	csrci	mstatus,8
    80000d30:	a001                	j	80000d30 <xQueueReceiveFromISR+0x3c>
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000d32:	615c                	ld	a5,128(a0)
    80000d34:	dbf9                	beqz	a5,80000d0a <xQueueReceiveFromISR+0x16>
    80000d36:	30047073          	csrci	mstatus,8
    80000d3a:	a001                	j	80000d3a <xQueueReceiveFromISR+0x46>
			prvCopyDataFromQueue( pxQueue, pvBuffer );
    80000d3c:	85a6                	mv	a1,s1
    80000d3e:	8522                	mv	a0,s0
    80000d40:	95dff0ef          	jal	ra,8000069c <prvCopyDataFromQueue>
			--( pxQueue->uxMessagesWaiting );
    80000d44:	783c                	ld	a5,112(s0)
    80000d46:	17fd                	addi	a5,a5,-1
    80000d48:	f83c                	sd	a5,112(s0)
			if( pxQueue->xRxLock == queueUNLOCKED )
    80000d4a:	6458                	ld	a4,136(s0)
    80000d4c:	57fd                	li	a5,-1
    80000d4e:	00f70763          	beq	a4,a5,80000d5c <xQueueReceiveFromISR+0x68>
				++( pxQueue->xRxLock );
    80000d52:	645c                	ld	a5,136(s0)
    80000d54:	0785                	addi	a5,a5,1
    80000d56:	e45c                	sd	a5,136(s0)
			xReturn = pdPASS;
    80000d58:	4405                	li	s0,1
    80000d5a:	bf75                	j	80000d16 <xQueueReceiveFromISR+0x22>
				if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
    80000d5c:	701c                	ld	a5,32(s0)
    80000d5e:	e399                	bnez	a5,80000d64 <xQueueReceiveFromISR+0x70>
			xReturn = pdPASS;
    80000d60:	4405                	li	s0,1
    80000d62:	bf55                	j	80000d16 <xQueueReceiveFromISR+0x22>
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
    80000d64:	02040513          	addi	a0,s0,32
    80000d68:	20b000ef          	jal	ra,80001772 <xTaskRemoveFromEventList>
    80000d6c:	c901                	beqz	a0,80000d7c <xQueueReceiveFromISR+0x88>
						if( pxHigherPriorityTaskWoken != NULL )
    80000d6e:	00090963          	beqz	s2,80000d80 <xQueueReceiveFromISR+0x8c>
							*pxHigherPriorityTaskWoken = pdTRUE;
    80000d72:	4785                	li	a5,1
    80000d74:	00f93023          	sd	a5,0(s2)
			xReturn = pdPASS;
    80000d78:	4405                	li	s0,1
    80000d7a:	bf71                	j	80000d16 <xQueueReceiveFromISR+0x22>
    80000d7c:	4405                	li	s0,1
    80000d7e:	bf61                	j	80000d16 <xQueueReceiveFromISR+0x22>
    80000d80:	4405                	li	s0,1
    80000d82:	bf51                	j	80000d16 <xQueueReceiveFromISR+0x22>

0000000080000d84 <xQueuePeekFromISR>:
	configASSERT( pxQueue );
    80000d84:	cd19                	beqz	a0,80000da2 <xQueuePeekFromISR+0x1e>
{
    80000d86:	7179                	addi	sp,sp,-48
    80000d88:	f406                	sd	ra,40(sp)
    80000d8a:	f022                	sd	s0,32(sp)
    80000d8c:	ec26                	sd	s1,24(sp)
    80000d8e:	e84a                	sd	s2,16(sp)
    80000d90:	e44e                	sd	s3,8(sp)
    80000d92:	842a                	mv	s0,a0
    80000d94:	84ae                	mv	s1,a1
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000d96:	c989                	beqz	a1,80000da8 <xQueuePeekFromISR+0x24>
	configASSERT( pxQueue->uxItemSize != 0 ); /* Can't peek a semaphore. */
    80000d98:	605c                	ld	a5,128(s0)
    80000d9a:	ef81                	bnez	a5,80000db2 <xQueuePeekFromISR+0x2e>
    80000d9c:	30047073          	csrci	mstatus,8
    80000da0:	a001                	j	80000da0 <xQueuePeekFromISR+0x1c>
	configASSERT( pxQueue );
    80000da2:	30047073          	csrci	mstatus,8
    80000da6:	a001                	j	80000da6 <xQueuePeekFromISR+0x22>
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( UBaseType_t ) 0U ) ) );
    80000da8:	615c                	ld	a5,128(a0)
    80000daa:	d7fd                	beqz	a5,80000d98 <xQueuePeekFromISR+0x14>
    80000dac:	30047073          	csrci	mstatus,8
    80000db0:	a001                	j	80000db0 <xQueuePeekFromISR+0x2c>
	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    80000db2:	f4aff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    80000db6:	892a                	mv	s2,a0
		if( pxQueue->uxMessagesWaiting > ( UBaseType_t ) 0 )
    80000db8:	783c                	ld	a5,112(s0)
    80000dba:	ef89                	bnez	a5,80000dd4 <xQueuePeekFromISR+0x50>
			xReturn = pdFAIL;
    80000dbc:	4401                	li	s0,0
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    80000dbe:	854a                	mv	a0,s2
    80000dc0:	f36ff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    80000dc4:	8522                	mv	a0,s0
    80000dc6:	70a2                	ld	ra,40(sp)
    80000dc8:	7402                	ld	s0,32(sp)
    80000dca:	64e2                	ld	s1,24(sp)
    80000dcc:	6942                	ld	s2,16(sp)
    80000dce:	69a2                	ld	s3,8(sp)
    80000dd0:	6145                	addi	sp,sp,48
    80000dd2:	8082                	ret
			pcOriginalReadPosition = pxQueue->u.pcReadFrom;
    80000dd4:	01843983          	ld	s3,24(s0)
			prvCopyDataFromQueue( pxQueue, pvBuffer );
    80000dd8:	85a6                	mv	a1,s1
    80000dda:	8522                	mv	a0,s0
    80000ddc:	8c1ff0ef          	jal	ra,8000069c <prvCopyDataFromQueue>
			pxQueue->u.pcReadFrom = pcOriginalReadPosition;
    80000de0:	01343c23          	sd	s3,24(s0)
			xReturn = pdPASS;
    80000de4:	4405                	li	s0,1
    80000de6:	bfe1                	j	80000dbe <xQueuePeekFromISR+0x3a>

0000000080000de8 <uxQueueMessagesWaiting>:
	configASSERT( xQueue );
    80000de8:	cd19                	beqz	a0,80000e06 <uxQueueMessagesWaiting+0x1e>
{
    80000dea:	1141                	addi	sp,sp,-16
    80000dec:	e406                	sd	ra,8(sp)
    80000dee:	e022                	sd	s0,0(sp)
    80000df0:	842a                	mv	s0,a0
	taskENTER_CRITICAL();
    80000df2:	445000ef          	jal	ra,80001a36 <vTaskEnterCritical>
		uxReturn = ( ( Queue_t * ) xQueue )->uxMessagesWaiting;
    80000df6:	7820                	ld	s0,112(s0)
	taskEXIT_CRITICAL();
    80000df8:	461000ef          	jal	ra,80001a58 <vTaskExitCritical>
} /*lint !e818 Pointer cannot be declared const as xQueue is a typedef not pointer. */
    80000dfc:	8522                	mv	a0,s0
    80000dfe:	60a2                	ld	ra,8(sp)
    80000e00:	6402                	ld	s0,0(sp)
    80000e02:	0141                	addi	sp,sp,16
    80000e04:	8082                	ret
	configASSERT( xQueue );
    80000e06:	30047073          	csrci	mstatus,8
    80000e0a:	a001                	j	80000e0a <uxQueueMessagesWaiting+0x22>

0000000080000e0c <uxQueueSpacesAvailable>:
	configASSERT( pxQueue );
    80000e0c:	c115                	beqz	a0,80000e30 <uxQueueSpacesAvailable+0x24>
{
    80000e0e:	1141                	addi	sp,sp,-16
    80000e10:	e406                	sd	ra,8(sp)
    80000e12:	e022                	sd	s0,0(sp)
    80000e14:	842a                	mv	s0,a0
	taskENTER_CRITICAL();
    80000e16:	421000ef          	jal	ra,80001a36 <vTaskEnterCritical>
		uxReturn = pxQueue->uxLength - pxQueue->uxMessagesWaiting;
    80000e1a:	7c3c                	ld	a5,120(s0)
    80000e1c:	7838                	ld	a4,112(s0)
    80000e1e:	40e78433          	sub	s0,a5,a4
	taskEXIT_CRITICAL();
    80000e22:	437000ef          	jal	ra,80001a58 <vTaskExitCritical>
} /*lint !e818 Pointer cannot be declared const as xQueue is a typedef not pointer. */
    80000e26:	8522                	mv	a0,s0
    80000e28:	60a2                	ld	ra,8(sp)
    80000e2a:	6402                	ld	s0,0(sp)
    80000e2c:	0141                	addi	sp,sp,16
    80000e2e:	8082                	ret
	configASSERT( pxQueue );
    80000e30:	30047073          	csrci	mstatus,8
    80000e34:	a001                	j	80000e34 <uxQueueSpacesAvailable+0x28>

0000000080000e36 <uxQueueMessagesWaitingFromISR>:
	configASSERT( xQueue );
    80000e36:	c119                	beqz	a0,80000e3c <uxQueueMessagesWaitingFromISR+0x6>
	uxReturn = ( ( Queue_t * ) xQueue )->uxMessagesWaiting;
    80000e38:	7928                	ld	a0,112(a0)
} /*lint !e818 Pointer cannot be declared const as xQueue is a typedef not pointer. */
    80000e3a:	8082                	ret
	configASSERT( xQueue );
    80000e3c:	30047073          	csrci	mstatus,8
    80000e40:	a001                	j	80000e40 <uxQueueMessagesWaitingFromISR+0xa>

0000000080000e42 <uxQueueGetQueueNumber>:
	}
    80000e42:	6d48                	ld	a0,152(a0)
    80000e44:	8082                	ret

0000000080000e46 <vQueueSetQueueNumber>:
		( ( Queue_t * ) xQueue )->uxQueueNumber = uxQueueNumber;
    80000e46:	ed4c                	sd	a1,152(a0)
	}
    80000e48:	8082                	ret

0000000080000e4a <ucQueueGetQueueType>:
	}
    80000e4a:	0a054503          	lbu	a0,160(a0)
    80000e4e:	8082                	ret

0000000080000e50 <xQueueIsQueueEmptyFromISR>:
	configASSERT( xQueue );
    80000e50:	c509                	beqz	a0,80000e5a <xQueueIsQueueEmptyFromISR+0xa>
	if( ( ( Queue_t * ) xQueue )->uxMessagesWaiting == ( UBaseType_t ) 0 )
    80000e52:	793c                	ld	a5,112(a0)
    80000e54:	e791                	bnez	a5,80000e60 <xQueueIsQueueEmptyFromISR+0x10>
		xReturn = pdTRUE;
    80000e56:	4505                	li	a0,1
    80000e58:	8082                	ret
	configASSERT( xQueue );
    80000e5a:	30047073          	csrci	mstatus,8
    80000e5e:	a001                	j	80000e5e <xQueueIsQueueEmptyFromISR+0xe>
		xReturn = pdFALSE;
    80000e60:	4501                	li	a0,0
} /*lint !e818 xQueue could not be pointer to const because it is a typedef. */
    80000e62:	8082                	ret

0000000080000e64 <xQueueIsQueueFullFromISR>:

BaseType_t xQueueIsQueueFullFromISR( const QueueHandle_t xQueue )
{
BaseType_t xReturn;

	configASSERT( xQueue );
    80000e64:	c519                	beqz	a0,80000e72 <xQueueIsQueueFullFromISR+0xe>
	if( ( ( Queue_t * ) xQueue )->uxMessagesWaiting == ( ( Queue_t * ) xQueue )->uxLength )
    80000e66:	7938                	ld	a4,112(a0)
    80000e68:	7d3c                	ld	a5,120(a0)
    80000e6a:	00f70763          	beq	a4,a5,80000e78 <xQueueIsQueueFullFromISR+0x14>
	{
		xReturn = pdTRUE;
	}
	else
	{
		xReturn = pdFALSE;
    80000e6e:	4501                	li	a0,0
	}

	return xReturn;
} /*lint !e818 xQueue could not be pointer to const because it is a typedef. */
    80000e70:	8082                	ret
	configASSERT( xQueue );
    80000e72:	30047073          	csrci	mstatus,8
    80000e76:	a001                	j	80000e76 <xQueueIsQueueFullFromISR+0x12>
		xReturn = pdTRUE;
    80000e78:	4505                	li	a0,1
    80000e7a:	8082                	ret

0000000080000e7c <vQueueAddToRegistry>:
	{
	UBaseType_t ux;

		/* See if there is an empty space in the registry.  A NULL name denotes
		a free slot. */
		for( ux = ( UBaseType_t ) 0U; ux < ( UBaseType_t ) configQUEUE_REGISTRY_SIZE; ux++ )
    80000e7c:	4781                	li	a5,0
    80000e7e:	471d                	li	a4,7
    80000e80:	02f76663          	bltu	a4,a5,80000eac <vQueueAddToRegistry+0x30>
		{
			if( xQueueRegistry[ ux ].pcQueueName == NULL )
    80000e84:	00479693          	slli	a3,a5,0x4
    80000e88:	0001f717          	auipc	a4,0x1f
    80000e8c:	7b070713          	addi	a4,a4,1968 # 80020638 <xQueueRegistry>
    80000e90:	9736                	add	a4,a4,a3
    80000e92:	6318                	ld	a4,0(a4)
    80000e94:	c319                	beqz	a4,80000e9a <vQueueAddToRegistry+0x1e>
		for( ux = ( UBaseType_t ) 0U; ux < ( UBaseType_t ) configQUEUE_REGISTRY_SIZE; ux++ )
    80000e96:	0785                	addi	a5,a5,1
    80000e98:	b7dd                	j	80000e7e <vQueueAddToRegistry+0x2>
			{
				/* Store the information on this queue. */
				xQueueRegistry[ ux ].pcQueueName = pcQueueName;
    80000e9a:	0001f717          	auipc	a4,0x1f
    80000e9e:	79e70713          	addi	a4,a4,1950 # 80020638 <xQueueRegistry>
    80000ea2:	00d707b3          	add	a5,a4,a3
    80000ea6:	e38c                	sd	a1,0(a5)
				xQueueRegistry[ ux ].xHandle = xQueue;
    80000ea8:	e788                	sd	a0,8(a5)

				traceQUEUE_REGISTRY_ADD( xQueue, pcQueueName );
				break;
    80000eaa:	8082                	ret
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}
	}
    80000eac:	8082                	ret

0000000080000eae <vQueueUnregisterQueue>:
	{
	UBaseType_t ux;

		/* See if the handle of the queue being unregistered in actually in the
		registry. */
		for( ux = ( UBaseType_t ) 0U; ux < ( UBaseType_t ) configQUEUE_REGISTRY_SIZE; ux++ )
    80000eae:	4781                	li	a5,0
    80000eb0:	471d                	li	a4,7
    80000eb2:	02f76763          	bltu	a4,a5,80000ee0 <vQueueUnregisterQueue+0x32>
		{
			if( xQueueRegistry[ ux ].xHandle == xQueue )
    80000eb6:	00479693          	slli	a3,a5,0x4
    80000eba:	0001f717          	auipc	a4,0x1f
    80000ebe:	77e70713          	addi	a4,a4,1918 # 80020638 <xQueueRegistry>
    80000ec2:	9736                	add	a4,a4,a3
    80000ec4:	6718                	ld	a4,8(a4)
    80000ec6:	00a70463          	beq	a4,a0,80000ece <vQueueUnregisterQueue+0x20>
		for( ux = ( UBaseType_t ) 0U; ux < ( UBaseType_t ) configQUEUE_REGISTRY_SIZE; ux++ )
    80000eca:	0785                	addi	a5,a5,1
    80000ecc:	b7d5                	j	80000eb0 <vQueueUnregisterQueue+0x2>
			{
				/* Set the name to NULL to show that this slot if free again. */
				xQueueRegistry[ ux ].pcQueueName = NULL;
    80000ece:	0001f717          	auipc	a4,0x1f
    80000ed2:	76a70713          	addi	a4,a4,1898 # 80020638 <xQueueRegistry>
    80000ed6:	00d707b3          	add	a5,a4,a3
    80000eda:	0007b023          	sd	zero,0(a5)
				break;
    80000ede:	8082                	ret
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}

	} /*lint !e818 xQueue could not be pointer to const because it is a typedef. */
    80000ee0:	8082                	ret

0000000080000ee2 <vQueueDelete>:
	configASSERT( pxQueue );
    80000ee2:	cd11                	beqz	a0,80000efe <vQueueDelete+0x1c>
{
    80000ee4:	1141                	addi	sp,sp,-16
    80000ee6:	e406                	sd	ra,8(sp)
    80000ee8:	e022                	sd	s0,0(sp)
    80000eea:	842a                	mv	s0,a0
		vQueueUnregisterQueue( pxQueue );
    80000eec:	fc3ff0ef          	jal	ra,80000eae <vQueueUnregisterQueue>
	vPortFree( pxQueue );
    80000ef0:	8522                	mv	a0,s0
    80000ef2:	3b6020ef          	jal	ra,800032a8 <vPortFree>
}
    80000ef6:	60a2                	ld	ra,8(sp)
    80000ef8:	6402                	ld	s0,0(sp)
    80000efa:	0141                	addi	sp,sp,16
    80000efc:	8082                	ret
	configASSERT( pxQueue );
    80000efe:	30047073          	csrci	mstatus,8
    80000f02:	a001                	j	80000f02 <vQueueDelete+0x20>

0000000080000f04 <vQueueWaitForMessageRestricted>:
/*-----------------------------------------------------------*/

#if ( configUSE_TIMERS == 1 )

	void vQueueWaitForMessageRestricted( QueueHandle_t xQueue, TickType_t xTicksToWait, const BaseType_t xWaitIndefinitely )
	{
    80000f04:	1101                	addi	sp,sp,-32
    80000f06:	ec06                	sd	ra,24(sp)
    80000f08:	e822                	sd	s0,16(sp)
    80000f0a:	e426                	sd	s1,8(sp)
    80000f0c:	e04a                	sd	s2,0(sp)
    80000f0e:	842a                	mv	s0,a0
    80000f10:	84ae                	mv	s1,a1
    80000f12:	8932                	mv	s2,a2
		will not actually cause the task to block, just place it on a blocked
		list.  It will not block until the scheduler is unlocked - at which
		time a yield will be performed.  If an item is added to the queue while
		the queue is locked, and the calling task blocks on the queue, then the
		calling task will be immediately unblocked when the queue is unlocked. */
		prvLockQueue( pxQueue );
    80000f14:	323000ef          	jal	ra,80001a36 <vTaskEnterCritical>
    80000f18:	6458                	ld	a4,136(s0)
    80000f1a:	57fd                	li	a5,-1
    80000f1c:	02f70363          	beq	a4,a5,80000f42 <vQueueWaitForMessageRestricted+0x3e>
    80000f20:	6858                	ld	a4,144(s0)
    80000f22:	57fd                	li	a5,-1
    80000f24:	02f70263          	beq	a4,a5,80000f48 <vQueueWaitForMessageRestricted+0x44>
    80000f28:	331000ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( pxQueue->uxMessagesWaiting == ( UBaseType_t ) 0U )
    80000f2c:	783c                	ld	a5,112(s0)
    80000f2e:	c385                	beqz	a5,80000f4e <vQueueWaitForMessageRestricted+0x4a>
		}
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
		prvUnlockQueue( pxQueue );
    80000f30:	8522                	mv	a0,s0
    80000f32:	f94ff0ef          	jal	ra,800006c6 <prvUnlockQueue>
	}
    80000f36:	60e2                	ld	ra,24(sp)
    80000f38:	6442                	ld	s0,16(sp)
    80000f3a:	64a2                	ld	s1,8(sp)
    80000f3c:	6902                	ld	s2,0(sp)
    80000f3e:	6105                	addi	sp,sp,32
    80000f40:	8082                	ret
		prvLockQueue( pxQueue );
    80000f42:	08043423          	sd	zero,136(s0)
    80000f46:	bfe9                	j	80000f20 <vQueueWaitForMessageRestricted+0x1c>
    80000f48:	08043823          	sd	zero,144(s0)
    80000f4c:	bff1                	j	80000f28 <vQueueWaitForMessageRestricted+0x24>
			vTaskPlaceOnEventListRestricted( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait, xWaitIndefinitely );
    80000f4e:	864a                	mv	a2,s2
    80000f50:	85a6                	mv	a1,s1
    80000f52:	04840513          	addi	a0,s0,72
    80000f56:	7b0000ef          	jal	ra,80001706 <vTaskPlaceOnEventListRestricted>
    80000f5a:	bfd9                	j	80000f30 <vQueueWaitForMessageRestricted+0x2c>

0000000080000f5c <prvTaskIsTaskSuspended>:

		/* Accesses xPendingReadyList so must be called from a critical
		section. */

		/* It does not make sense to check if the calling task is suspended. */
		configASSERT( xTask );
    80000f5c:	c911                	beqz	a0,80000f70 <prvTaskIsTaskSuspended+0x14>

		/* Is the task being resumed actually in the suspended list? */
		if( listIS_CONTAINED_WITHIN( &xSuspendedTaskList, &( pxTCB->xGenericListItem ) ) != pdFALSE )
    80000f5e:	7518                	ld	a4,40(a0)
    80000f60:	0001f797          	auipc	a5,0x1f
    80000f64:	75878793          	addi	a5,a5,1880 # 800206b8 <xSuspendedTaskList>
    80000f68:	00f70763          	beq	a4,a5,80000f76 <prvTaskIsTaskSuspended+0x1a>
	BaseType_t xReturn = pdFALSE;
    80000f6c:	4501                	li	a0,0
    80000f6e:	8082                	ret
		configASSERT( xTask );
    80000f70:	30047073          	csrci	mstatus,8
    80000f74:	a001                	j	80000f74 <prvTaskIsTaskSuspended+0x18>
		{
			/* Has the task already been resumed from within an ISR? */
			if( listIS_CONTAINED_WITHIN( &xPendingReadyList, &( pxTCB->xEventListItem ) ) == pdFALSE )
    80000f76:	693c                	ld	a5,80(a0)
    80000f78:	0001f717          	auipc	a4,0x1f
    80000f7c:	76870713          	addi	a4,a4,1896 # 800206e0 <xPendingReadyList>
    80000f80:	00e78563          	beq	a5,a4,80000f8a <prvTaskIsTaskSuspended+0x2e>
			{
				/* Is it in the suspended list because it is in the	Suspended
				state, or because is is blocked with no timeout? */
				if( listIS_CONTAINED_WITHIN( NULL, &( pxTCB->xEventListItem ) ) != pdFALSE )
    80000f84:	c789                	beqz	a5,80000f8e <prvTaskIsTaskSuspended+0x32>
	BaseType_t xReturn = pdFALSE;
    80000f86:	4501                	li	a0,0
    80000f88:	8082                	ret
    80000f8a:	4501                	li	a0,0
    80000f8c:	8082                	ret
				{
					xReturn = pdTRUE;
    80000f8e:	4505                	li	a0,1
		{
			mtCOVERAGE_TEST_MARKER();
		}

		return xReturn;
	} /*lint !e818 xTask cannot be a pointer to const because it is a typedef. */
    80000f90:	8082                	ret

0000000080000f92 <prvTaskCheckFreeStackSpace>:

#if ( ( configUSE_TRACE_FACILITY == 1 ) || ( INCLUDE_uxTaskGetStackHighWaterMark == 1 ) )

	static uint16_t prvTaskCheckFreeStackSpace( const uint8_t * pucStackByte )
	{
	uint32_t ulCount = 0U;
    80000f92:	4781                	li	a5,0

		while( *pucStackByte == ( uint8_t ) tskSTACK_FILL_BYTE )
    80000f94:	a019                	j	80000f9a <prvTaskCheckFreeStackSpace+0x8>
		{
			pucStackByte -= portSTACK_GROWTH;
    80000f96:	0505                	addi	a0,a0,1
			ulCount++;
    80000f98:	2785                	addiw	a5,a5,1
		while( *pucStackByte == ( uint8_t ) tskSTACK_FILL_BYTE )
    80000f9a:	00054683          	lbu	a3,0(a0)
    80000f9e:	0a500713          	li	a4,165
    80000fa2:	fee68ae3          	beq	a3,a4,80000f96 <prvTaskCheckFreeStackSpace+0x4>
		}

		ulCount /= ( uint32_t ) sizeof( StackType_t ); /*lint !e961 Casting is not redundant on smaller architectures. */
    80000fa6:	0037d51b          	srliw	a0,a5,0x3

		return ( uint16_t ) ulCount;
	}
    80000faa:	1542                	slli	a0,a0,0x30
    80000fac:	9141                	srli	a0,a0,0x30
    80000fae:	8082                	ret

0000000080000fb0 <prvListTaskWithinSingleList>:
	{
    80000fb0:	715d                	addi	sp,sp,-80
    80000fb2:	e486                	sd	ra,72(sp)
    80000fb4:	e0a2                	sd	s0,64(sp)
    80000fb6:	fc26                	sd	s1,56(sp)
    80000fb8:	f84a                	sd	s2,48(sp)
    80000fba:	f44e                	sd	s3,40(sp)
    80000fbc:	f052                	sd	s4,32(sp)
    80000fbe:	ec56                	sd	s5,24(sp)
    80000fc0:	e85a                	sd	s6,16(sp)
    80000fc2:	e45e                	sd	s7,8(sp)
		if( listCURRENT_LIST_LENGTH( pxList ) > ( UBaseType_t ) 0 )
    80000fc4:	0005b903          	ld	s2,0(a1)
    80000fc8:	08090763          	beqz	s2,80001056 <prvListTaskWithinSingleList+0xa6>
    80000fcc:	8aaa                	mv	s5,a0
    80000fce:	89ae                	mv	s3,a1
    80000fd0:	8a32                	mv	s4,a2
			listGET_OWNER_OF_NEXT_ENTRY( pxFirstTCB, pxList );
    80000fd2:	659c                	ld	a5,8(a1)
    80000fd4:	679c                	ld	a5,8(a5)
    80000fd6:	e59c                	sd	a5,8(a1)
    80000fd8:	01058b13          	addi	s6,a1,16
    80000fdc:	01678863          	beq	a5,s6,80000fec <prvListTaskWithinSingleList+0x3c>
    80000fe0:	0089b783          	ld	a5,8(s3)
    80000fe4:	0187bb83          	ld	s7,24(a5)
	UBaseType_t uxTask = 0;
    80000fe8:	4901                	li	s2,0
    80000fea:	a025                	j	80001012 <prvListTaskWithinSingleList+0x62>
			listGET_OWNER_OF_NEXT_ENTRY( pxFirstTCB, pxList );
    80000fec:	679c                	ld	a5,8(a5)
    80000fee:	e59c                	sd	a5,8(a1)
    80000ff0:	bfc5                	j	80000fe0 <prvListTaskWithinSingleList+0x30>
				listGET_OWNER_OF_NEXT_ENTRY( pxNextTCB, pxList );
    80000ff2:	679c                	ld	a5,8(a5)
    80000ff4:	00f9b423          	sd	a5,8(s3)
    80000ff8:	a025                	j	80001020 <prvListTaskWithinSingleList+0x70>
					pxTaskStatusArray[ uxTask ].uxBasePriority = pxNextTCB->uxBasePriority;
    80000ffa:	68dc                	ld	a5,144(s1)
    80000ffc:	f41c                	sd	a5,40(s0)
					pxTaskStatusArray[ uxTask ].ulRunTimeCounter = 0;
    80000ffe:	02042823          	sw	zero,48(s0)
					pxTaskStatusArray[ uxTask ].usStackHighWaterMark = prvTaskCheckFreeStackSpace( ( uint8_t * ) pxNextTCB->pxStack );
    80001002:	70a8                	ld	a0,96(s1)
    80001004:	f8fff0ef          	jal	ra,80000f92 <prvTaskCheckFreeStackSpace>
    80001008:	02a41a23          	sh	a0,52(s0)
				uxTask++;
    8000100c:	0905                	addi	s2,s2,1
			} while( pxNextTCB != pxFirstTCB );
    8000100e:	049b8463          	beq	s7,s1,80001056 <prvListTaskWithinSingleList+0xa6>
				listGET_OWNER_OF_NEXT_ENTRY( pxNextTCB, pxList );
    80001012:	0089b783          	ld	a5,8(s3)
    80001016:	679c                	ld	a5,8(a5)
    80001018:	00f9b423          	sd	a5,8(s3)
    8000101c:	fcfb0be3          	beq	s6,a5,80000ff2 <prvListTaskWithinSingleList+0x42>
    80001020:	0089b783          	ld	a5,8(s3)
    80001024:	6f84                	ld	s1,24(a5)
				pxTaskStatusArray[ uxTask ].xHandle = ( TaskHandle_t ) pxNextTCB;
    80001026:	00391413          	slli	s0,s2,0x3
    8000102a:	41240433          	sub	s0,s0,s2
    8000102e:	040e                	slli	s0,s0,0x3
    80001030:	9456                	add	s0,s0,s5
    80001032:	e004                	sd	s1,0(s0)
				pxTaskStatusArray[ uxTask ].pcTaskName = ( const char * ) &( pxNextTCB->pcTaskName [ 0 ] );
    80001034:	06848793          	addi	a5,s1,104
    80001038:	e41c                	sd	a5,8(s0)
				pxTaskStatusArray[ uxTask ].xTaskNumber = pxNextTCB->uxTCBNumber;
    8000103a:	60dc                	ld	a5,128(s1)
    8000103c:	e81c                	sd	a5,16(s0)
				pxTaskStatusArray[ uxTask ].eCurrentState = eState;
    8000103e:	01442c23          	sw	s4,24(s0)
				pxTaskStatusArray[ uxTask ].uxCurrentPriority = pxNextTCB->uxPriority;
    80001042:	6cbc                	ld	a5,88(s1)
    80001044:	f01c                	sd	a5,32(s0)
					if( eState == eSuspended )
    80001046:	478d                	li	a5,3
    80001048:	fafa19e3          	bne	s4,a5,80000ffa <prvListTaskWithinSingleList+0x4a>
						if( listLIST_ITEM_CONTAINER( &( pxNextTCB->xEventListItem ) ) != NULL )
    8000104c:	68bc                	ld	a5,80(s1)
    8000104e:	d7d5                	beqz	a5,80000ffa <prvListTaskWithinSingleList+0x4a>
							pxTaskStatusArray[ uxTask ].eCurrentState = eBlocked;
    80001050:	4789                	li	a5,2
    80001052:	cc1c                	sw	a5,24(s0)
    80001054:	b75d                	j	80000ffa <prvListTaskWithinSingleList+0x4a>
	}
    80001056:	854a                	mv	a0,s2
    80001058:	60a6                	ld	ra,72(sp)
    8000105a:	6406                	ld	s0,64(sp)
    8000105c:	74e2                	ld	s1,56(sp)
    8000105e:	7942                	ld	s2,48(sp)
    80001060:	79a2                	ld	s3,40(sp)
    80001062:	7a02                	ld	s4,32(sp)
    80001064:	6ae2                	ld	s5,24(sp)
    80001066:	6b42                	ld	s6,16(sp)
    80001068:	6ba2                	ld	s7,8(sp)
    8000106a:	6161                	addi	sp,sp,80
    8000106c:	8082                	ret

000000008000106e <prvResetNextTaskUnblockTime>:

static void prvResetNextTaskUnblockTime( void )
{
TCB_t *pxTCB;

	if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    8000106e:	0001f797          	auipc	a5,0x1f
    80001072:	3327b783          	ld	a5,818(a5) # 800203a0 <pxDelayedTaskList>
    80001076:	639c                	ld	a5,0(a5)
    80001078:	e799                	bnez	a5,80001086 <prvResetNextTaskUnblockTime+0x18>
	{
		/* The new current delayed list is empty.  Set xNextTaskUnblockTime to
		the maximum possible value so it is	extremely unlikely that the
		if( xTickCount >= xNextTaskUnblockTime ) test will pass until
		there is an item in the delayed list. */
		xNextTaskUnblockTime = portMAX_DELAY;
    8000107a:	57fd                	li	a5,-1
    8000107c:	0001f717          	auipc	a4,0x1f
    80001080:	2cf72623          	sw	a5,716(a4) # 80020348 <xNextTaskUnblockTime>
    80001084:	8082                	ret
	{
		/* The new current delayed list is not empty, get the value of
		the item at the head of the delayed list.  This is the time at
		which the task at the head of the delayed list should be removed
		from the Blocked state. */
		( pxTCB ) = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList );
    80001086:	0001f797          	auipc	a5,0x1f
    8000108a:	31a7b783          	ld	a5,794(a5) # 800203a0 <pxDelayedTaskList>
    8000108e:	6f9c                	ld	a5,24(a5)
    80001090:	6f9c                	ld	a5,24(a5)
		xNextTaskUnblockTime = listGET_LIST_ITEM_VALUE( &( ( pxTCB )->xGenericListItem ) );
    80001092:	479c                	lw	a5,8(a5)
    80001094:	0001f717          	auipc	a4,0x1f
    80001098:	2af72a23          	sw	a5,692(a4) # 80020348 <xNextTaskUnblockTime>
	}
}
    8000109c:	8082                	ret

000000008000109e <prvDeleteTCB>:
	{
    8000109e:	1141                	addi	sp,sp,-16
    800010a0:	e406                	sd	ra,8(sp)
    800010a2:	e022                	sd	s0,0(sp)
    800010a4:	842a                	mv	s0,a0
			vPortFreeAligned( pxTCB->pxStack );
    800010a6:	7128                	ld	a0,96(a0)
    800010a8:	200020ef          	jal	ra,800032a8 <vPortFree>
		vPortFree( pxTCB );
    800010ac:	8522                	mv	a0,s0
    800010ae:	1fa020ef          	jal	ra,800032a8 <vPortFree>
	}
    800010b2:	60a2                	ld	ra,8(sp)
    800010b4:	6402                	ld	s0,0(sp)
    800010b6:	0141                	addi	sp,sp,16
    800010b8:	8082                	ret

00000000800010ba <prvAllocateTCBAndStack>:
{
    800010ba:	1101                	addi	sp,sp,-32
    800010bc:	ec06                	sd	ra,24(sp)
    800010be:	e822                	sd	s0,16(sp)
    800010c0:	e426                	sd	s1,8(sp)
    800010c2:	e04a                	sd	s2,0(sp)
    800010c4:	892a                	mv	s2,a0
    800010c6:	842e                	mv	s0,a1
		pxStack = ( StackType_t * ) pvPortMallocAligned( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ), puxStackBuffer ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800010c8:	c985                	beqz	a1,800010f8 <prvAllocateTCBAndStack+0x3e>
		if( pxStack != NULL )
    800010ca:	c021                	beqz	s0,8000110a <prvAllocateTCBAndStack+0x50>
			pxNewTCB = ( TCB_t * ) pvPortMalloc( sizeof( TCB_t ) );
    800010cc:	0a800513          	li	a0,168
    800010d0:	106020ef          	jal	ra,800031d6 <pvPortMalloc>
    800010d4:	84aa                	mv	s1,a0
			if( pxNewTCB != NULL )
    800010d6:	c515                	beqz	a0,80001102 <prvAllocateTCBAndStack+0x48>
				pxNewTCB->pxStack = pxStack;
    800010d8:	f120                	sd	s0,96(a0)
	if( pxNewTCB != NULL )
    800010da:	c881                	beqz	s1,800010ea <prvAllocateTCBAndStack+0x30>
			( void ) memset( pxNewTCB->pxStack, ( int ) tskSTACK_FILL_BYTE, ( size_t ) usStackDepth * sizeof( StackType_t ) );
    800010dc:	00391613          	slli	a2,s2,0x3
    800010e0:	0a500593          	li	a1,165
    800010e4:	70a8                	ld	a0,96(s1)
    800010e6:	258020ef          	jal	ra,8000333e <memset>
}
    800010ea:	8526                	mv	a0,s1
    800010ec:	60e2                	ld	ra,24(sp)
    800010ee:	6442                	ld	s0,16(sp)
    800010f0:	64a2                	ld	s1,8(sp)
    800010f2:	6902                	ld	s2,0(sp)
    800010f4:	6105                	addi	sp,sp,32
    800010f6:	8082                	ret
		pxStack = ( StackType_t * ) pvPortMallocAligned( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ), puxStackBuffer ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800010f8:	050e                	slli	a0,a0,0x3
    800010fa:	0dc020ef          	jal	ra,800031d6 <pvPortMalloc>
    800010fe:	842a                	mv	s0,a0
    80001100:	b7e9                	j	800010ca <prvAllocateTCBAndStack+0x10>
				vPortFree( pxStack );
    80001102:	8522                	mv	a0,s0
    80001104:	1a4020ef          	jal	ra,800032a8 <vPortFree>
    80001108:	bfc9                	j	800010da <prvAllocateTCBAndStack+0x20>
			pxNewTCB = NULL;
    8000110a:	84a2                	mv	s1,s0
	return pxNewTCB;
    8000110c:	bff9                	j	800010ea <prvAllocateTCBAndStack+0x30>

000000008000110e <prvInitialiseTCBVariables>:
{
    8000110e:	1101                	addi	sp,sp,-32
    80001110:	ec06                	sd	ra,24(sp)
    80001112:	e822                	sd	s0,16(sp)
    80001114:	e426                	sd	s1,8(sp)
    80001116:	842a                	mv	s0,a0
    80001118:	84b2                	mv	s1,a2
	for( x = ( UBaseType_t ) 0; x < ( UBaseType_t ) configMAX_TASK_NAME_LEN; x++ )
    8000111a:	4781                	li	a5,0
    8000111c:	473d                	li	a4,15
    8000111e:	00f76d63          	bltu	a4,a5,80001138 <prvInitialiseTCBVariables+0x2a>
		pxTCB->pcTaskName[ x ] = pcName[ x ];
    80001122:	00f58733          	add	a4,a1,a5
    80001126:	00074703          	lbu	a4,0(a4)
    8000112a:	00f406b3          	add	a3,s0,a5
    8000112e:	06e68423          	sb	a4,104(a3)
		if( pcName[ x ] == 0x00 )
    80001132:	c319                	beqz	a4,80001138 <prvInitialiseTCBVariables+0x2a>
	for( x = ( UBaseType_t ) 0; x < ( UBaseType_t ) configMAX_TASK_NAME_LEN; x++ )
    80001134:	0785                	addi	a5,a5,1
    80001136:	b7dd                	j	8000111c <prvInitialiseTCBVariables+0xe>
	pxTCB->pcTaskName[ configMAX_TASK_NAME_LEN - 1 ] = '\0';
    80001138:	06040ba3          	sb	zero,119(s0)
	if( uxPriority >= ( UBaseType_t ) configMAX_PRIORITIES )
    8000113c:	4791                	li	a5,4
    8000113e:	0097f363          	bgeu	a5,s1,80001144 <prvInitialiseTCBVariables+0x36>
		uxPriority = ( UBaseType_t ) configMAX_PRIORITIES - ( UBaseType_t ) 1U;
    80001142:	4491                	li	s1,4
	pxTCB->uxPriority = uxPriority;
    80001144:	ec24                	sd	s1,88(s0)
		pxTCB->uxBasePriority = uxPriority;
    80001146:	e844                	sd	s1,144(s0)
		pxTCB->uxMutexesHeld = 0;
    80001148:	08043c23          	sd	zero,152(s0)
	vListInitialiseItem( &( pxTCB->xGenericListItem ) );
    8000114c:	00840513          	addi	a0,s0,8
    80001150:	c04ff0ef          	jal	ra,80000554 <vListInitialiseItem>
	vListInitialiseItem( &( pxTCB->xEventListItem ) );
    80001154:	03040513          	addi	a0,s0,48
    80001158:	bfcff0ef          	jal	ra,80000554 <vListInitialiseItem>
	listSET_LIST_ITEM_OWNER( &( pxTCB->xGenericListItem ), pxTCB );
    8000115c:	f000                	sd	s0,32(s0)
	listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    8000115e:	4795                	li	a5,5
    80001160:	9f85                	subw	a5,a5,s1
    80001162:	d81c                	sw	a5,48(s0)
	listSET_LIST_ITEM_OWNER( &( pxTCB->xEventListItem ), pxTCB );
    80001164:	e420                	sd	s0,72(s0)
		pxTCB->uxCriticalNesting = ( UBaseType_t ) 0U;
    80001166:	06043c23          	sd	zero,120(s0)
		pxTCB->ulNotifiedValue = 0;
    8000116a:	0a042023          	sw	zero,160(s0)
		pxTCB->eNotifyState = eNotWaitingNotification;
    8000116e:	0a042223          	sw	zero,164(s0)
}
    80001172:	60e2                	ld	ra,24(sp)
    80001174:	6442                	ld	s0,16(sp)
    80001176:	64a2                	ld	s1,8(sp)
    80001178:	6105                	addi	sp,sp,32
    8000117a:	8082                	ret

000000008000117c <prvInitialiseTaskLists>:
{
    8000117c:	1101                	addi	sp,sp,-32
    8000117e:	ec06                	sd	ra,24(sp)
    80001180:	e822                	sd	s0,16(sp)
    80001182:	e426                	sd	s1,8(sp)
	for( uxPriority = ( UBaseType_t ) 0U; uxPriority < ( UBaseType_t ) configMAX_PRIORITIES; uxPriority++ )
    80001184:	4401                	li	s0,0
    80001186:	a831                	j	800011a2 <prvInitialiseTaskLists+0x26>
		vListInitialise( &( pxReadyTasksLists[ uxPriority ] ) );
    80001188:	00241793          	slli	a5,s0,0x2
    8000118c:	97a2                	add	a5,a5,s0
    8000118e:	00379713          	slli	a4,a5,0x3
    80001192:	0001f517          	auipc	a0,0x1f
    80001196:	57650513          	addi	a0,a0,1398 # 80020708 <pxReadyTasksLists>
    8000119a:	953a                	add	a0,a0,a4
    8000119c:	ba4ff0ef          	jal	ra,80000540 <vListInitialise>
	for( uxPriority = ( UBaseType_t ) 0U; uxPriority < ( UBaseType_t ) configMAX_PRIORITIES; uxPriority++ )
    800011a0:	0405                	addi	s0,s0,1
    800011a2:	4791                	li	a5,4
    800011a4:	fe87f2e3          	bgeu	a5,s0,80001188 <prvInitialiseTaskLists+0xc>
	vListInitialise( &xDelayedTaskList1 );
    800011a8:	0001f497          	auipc	s1,0x1f
    800011ac:	62848493          	addi	s1,s1,1576 # 800207d0 <xDelayedTaskList1>
    800011b0:	8526                	mv	a0,s1
    800011b2:	b8eff0ef          	jal	ra,80000540 <vListInitialise>
	vListInitialise( &xDelayedTaskList2 );
    800011b6:	0001f417          	auipc	s0,0x1f
    800011ba:	64240413          	addi	s0,s0,1602 # 800207f8 <xDelayedTaskList2>
    800011be:	8522                	mv	a0,s0
    800011c0:	b80ff0ef          	jal	ra,80000540 <vListInitialise>
	vListInitialise( &xPendingReadyList );
    800011c4:	0001f517          	auipc	a0,0x1f
    800011c8:	51c50513          	addi	a0,a0,1308 # 800206e0 <xPendingReadyList>
    800011cc:	b74ff0ef          	jal	ra,80000540 <vListInitialise>
		vListInitialise( &xTasksWaitingTermination );
    800011d0:	0001f517          	auipc	a0,0x1f
    800011d4:	65050513          	addi	a0,a0,1616 # 80020820 <xTasksWaitingTermination>
    800011d8:	b68ff0ef          	jal	ra,80000540 <vListInitialise>
		vListInitialise( &xSuspendedTaskList );
    800011dc:	0001f517          	auipc	a0,0x1f
    800011e0:	4dc50513          	addi	a0,a0,1244 # 800206b8 <xSuspendedTaskList>
    800011e4:	b5cff0ef          	jal	ra,80000540 <vListInitialise>
	pxDelayedTaskList = &xDelayedTaskList1;
    800011e8:	0001f797          	auipc	a5,0x1f
    800011ec:	1a97bc23          	sd	s1,440(a5) # 800203a0 <pxDelayedTaskList>
	pxOverflowDelayedTaskList = &xDelayedTaskList2;
    800011f0:	0001f797          	auipc	a5,0x1f
    800011f4:	1a87b423          	sd	s0,424(a5) # 80020398 <pxOverflowDelayedTaskList>
}
    800011f8:	60e2                	ld	ra,24(sp)
    800011fa:	6442                	ld	s0,16(sp)
    800011fc:	64a2                	ld	s1,8(sp)
    800011fe:	6105                	addi	sp,sp,32
    80001200:	8082                	ret

0000000080001202 <prvAddCurrentTaskToDelayedList>:
{
    80001202:	1141                	addi	sp,sp,-16
    80001204:	e406                	sd	ra,8(sp)
    80001206:	e022                	sd	s0,0(sp)
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
    80001208:	0001f797          	auipc	a5,0x1f
    8000120c:	1a07b783          	ld	a5,416(a5) # 800203a8 <pxCurrentTCB>
    80001210:	c788                	sw	a0,8(a5)
	if( xTimeToWake < xTickCount )
    80001212:	0001f797          	auipc	a5,0x1f
    80001216:	16e7a783          	lw	a5,366(a5) # 80020380 <xTickCount>
    8000121a:	02f57163          	bgeu	a0,a5,8000123c <prvAddCurrentTaskToDelayedList+0x3a>
		vListInsert( pxOverflowDelayedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    8000121e:	0001f517          	auipc	a0,0x1f
    80001222:	17a53503          	ld	a0,378(a0) # 80020398 <pxOverflowDelayedTaskList>
    80001226:	0001f597          	auipc	a1,0x1f
    8000122a:	1825b583          	ld	a1,386(a1) # 800203a8 <pxCurrentTCB>
    8000122e:	05a1                	addi	a1,a1,8
    80001230:	b40ff0ef          	jal	ra,80000570 <vListInsert>
}
    80001234:	60a2                	ld	ra,8(sp)
    80001236:	6402                	ld	s0,0(sp)
    80001238:	0141                	addi	sp,sp,16
    8000123a:	8082                	ret
    8000123c:	842a                	mv	s0,a0
		vListInsert( pxDelayedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    8000123e:	0001f517          	auipc	a0,0x1f
    80001242:	16253503          	ld	a0,354(a0) # 800203a0 <pxDelayedTaskList>
    80001246:	0001f597          	auipc	a1,0x1f
    8000124a:	1625b583          	ld	a1,354(a1) # 800203a8 <pxCurrentTCB>
    8000124e:	05a1                	addi	a1,a1,8
    80001250:	b20ff0ef          	jal	ra,80000570 <vListInsert>
		if( xTimeToWake < xNextTaskUnblockTime )
    80001254:	0001f797          	auipc	a5,0x1f
    80001258:	0f47a783          	lw	a5,244(a5) # 80020348 <xNextTaskUnblockTime>
    8000125c:	fcf47ce3          	bgeu	s0,a5,80001234 <prvAddCurrentTaskToDelayedList+0x32>
			xNextTaskUnblockTime = xTimeToWake;
    80001260:	0001f797          	auipc	a5,0x1f
    80001264:	0e87a423          	sw	s0,232(a5) # 80020348 <xNextTaskUnblockTime>
}
    80001268:	b7f1                	j	80001234 <prvAddCurrentTaskToDelayedList+0x32>

000000008000126a <uxTaskPriorityGetFromISR>:
	{
    8000126a:	1141                	addi	sp,sp,-16
    8000126c:	e406                	sd	ra,8(sp)
    8000126e:	e022                	sd	s0,0(sp)
    80001270:	842a                	mv	s0,a0
		uxSavedInterruptState = portSET_INTERRUPT_MASK_FROM_ISR();
    80001272:	a8aff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
			pxTCB = prvGetTCBFromHandle( xTask );
    80001276:	c809                	beqz	s0,80001288 <uxTaskPriorityGetFromISR+0x1e>
			uxReturn = pxTCB->uxPriority;
    80001278:	6c20                	ld	s0,88(s0)
		portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptState );
    8000127a:	a7cff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
	}
    8000127e:	8522                	mv	a0,s0
    80001280:	60a2                	ld	ra,8(sp)
    80001282:	6402                	ld	s0,0(sp)
    80001284:	0141                	addi	sp,sp,16
    80001286:	8082                	ret
			pxTCB = prvGetTCBFromHandle( xTask );
    80001288:	0001f417          	auipc	s0,0x1f
    8000128c:	12043403          	ld	s0,288(s0) # 800203a8 <pxCurrentTCB>
    80001290:	b7e5                	j	80001278 <uxTaskPriorityGetFromISR+0xe>

0000000080001292 <xTaskResumeFromISR>:
		configASSERT( xTaskToResume );
    80001292:	cd15                	beqz	a0,800012ce <xTaskResumeFromISR+0x3c>
	{
    80001294:	7179                	addi	sp,sp,-48
    80001296:	f406                	sd	ra,40(sp)
    80001298:	f022                	sd	s0,32(sp)
    8000129a:	ec26                	sd	s1,24(sp)
    8000129c:	e84a                	sd	s2,16(sp)
    8000129e:	e44e                	sd	s3,8(sp)
    800012a0:	842a                	mv	s0,a0
		uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    800012a2:	a5aff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    800012a6:	892a                	mv	s2,a0
			if( prvTaskIsTaskSuspended( pxTCB ) == pdTRUE )
    800012a8:	8522                	mv	a0,s0
    800012aa:	cb3ff0ef          	jal	ra,80000f5c <prvTaskIsTaskSuspended>
    800012ae:	84aa                	mv	s1,a0
    800012b0:	4785                	li	a5,1
    800012b2:	02f50163          	beq	a0,a5,800012d4 <xTaskResumeFromISR+0x42>
	BaseType_t xYieldRequired = pdFALSE;
    800012b6:	4481                	li	s1,0
		portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    800012b8:	854a                	mv	a0,s2
    800012ba:	a3cff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
	}
    800012be:	8526                	mv	a0,s1
    800012c0:	70a2                	ld	ra,40(sp)
    800012c2:	7402                	ld	s0,32(sp)
    800012c4:	64e2                	ld	s1,24(sp)
    800012c6:	6942                	ld	s2,16(sp)
    800012c8:	69a2                	ld	s3,8(sp)
    800012ca:	6145                	addi	sp,sp,48
    800012cc:	8082                	ret
		configASSERT( xTaskToResume );
    800012ce:	30047073          	csrci	mstatus,8
    800012d2:	a001                	j	800012d2 <xTaskResumeFromISR+0x40>
				if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    800012d4:	0001f797          	auipc	a5,0x1f
    800012d8:	06c7b783          	ld	a5,108(a5) # 80020340 <uxSchedulerSuspended>
    800012dc:	e7b9                	bnez	a5,8000132a <xTaskResumeFromISR+0x98>
					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    800012de:	6c38                	ld	a4,88(s0)
    800012e0:	0001f797          	auipc	a5,0x1f
    800012e4:	0c87b783          	ld	a5,200(a5) # 800203a8 <pxCurrentTCB>
    800012e8:	6fbc                	ld	a5,88(a5)
    800012ea:	00f77363          	bgeu	a4,a5,800012f0 <xTaskResumeFromISR+0x5e>
	BaseType_t xYieldRequired = pdFALSE;
    800012ee:	4481                	li	s1,0
					( void ) uxListRemove(  &( pxTCB->xGenericListItem ) );
    800012f0:	00840993          	addi	s3,s0,8
    800012f4:	854e                	mv	a0,s3
    800012f6:	aa8ff0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    800012fa:	6c38                	ld	a4,88(s0)
    800012fc:	0001f797          	auipc	a5,0x1f
    80001300:	07c7b783          	ld	a5,124(a5) # 80020378 <uxTopReadyPriority>
    80001304:	00e7f663          	bgeu	a5,a4,80001310 <xTaskResumeFromISR+0x7e>
    80001308:	0001f797          	auipc	a5,0x1f
    8000130c:	06e7b823          	sd	a4,112(a5) # 80020378 <uxTopReadyPriority>
    80001310:	00271793          	slli	a5,a4,0x2
    80001314:	97ba                	add	a5,a5,a4
    80001316:	078e                	slli	a5,a5,0x3
    80001318:	85ce                	mv	a1,s3
    8000131a:	0001f517          	auipc	a0,0x1f
    8000131e:	3ee50513          	addi	a0,a0,1006 # 80020708 <pxReadyTasksLists>
    80001322:	953e                	add	a0,a0,a5
    80001324:	a36ff0ef          	jal	ra,8000055a <vListInsertEnd>
    80001328:	bf41                	j	800012b8 <xTaskResumeFromISR+0x26>
					vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
    8000132a:	03040593          	addi	a1,s0,48
    8000132e:	0001f517          	auipc	a0,0x1f
    80001332:	3b250513          	addi	a0,a0,946 # 800206e0 <xPendingReadyList>
    80001336:	a24ff0ef          	jal	ra,8000055a <vListInsertEnd>
	BaseType_t xYieldRequired = pdFALSE;
    8000133a:	4481                	li	s1,0
    8000133c:	bfb5                	j	800012b8 <xTaskResumeFromISR+0x26>

000000008000133e <vTaskEndScheduler>:
{
    8000133e:	1141                	addi	sp,sp,-16
    80001340:	e406                	sd	ra,8(sp)
	portDISABLE_INTERRUPTS();
    80001342:	30047073          	csrci	mstatus,8
	xSchedulerRunning = pdFALSE;
    80001346:	0001f797          	auipc	a5,0x1f
    8000134a:	0207b523          	sd	zero,42(a5) # 80020370 <xSchedulerRunning>
	vPortEndScheduler();
    8000134e:	838ff0ef          	jal	ra,80000386 <vPortEndScheduler>
}
    80001352:	60a2                	ld	ra,8(sp)
    80001354:	0141                	addi	sp,sp,16
    80001356:	8082                	ret

0000000080001358 <vTaskSuspendAll>:
	++uxSchedulerSuspended;
    80001358:	0001f717          	auipc	a4,0x1f
    8000135c:	fe870713          	addi	a4,a4,-24 # 80020340 <uxSchedulerSuspended>
    80001360:	631c                	ld	a5,0(a4)
    80001362:	0785                	addi	a5,a5,1
    80001364:	e31c                	sd	a5,0(a4)
}
    80001366:	8082                	ret

0000000080001368 <xTaskGetTickCountFromISR>:
{
    80001368:	1141                	addi	sp,sp,-16
    8000136a:	e406                	sd	ra,8(sp)
    8000136c:	e022                	sd	s0,0(sp)
	uxSavedInterruptStatus = portTICK_TYPE_SET_INTERRUPT_MASK_FROM_ISR();
    8000136e:	98eff0ef          	jal	ra,800004fc <vPortSetInterruptMask>
		xReturn = xTickCount;
    80001372:	0001f417          	auipc	s0,0x1f
    80001376:	00e42403          	lw	s0,14(s0) # 80020380 <xTickCount>
	portTICK_TYPE_CLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    8000137a:	97cff0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    8000137e:	8522                	mv	a0,s0
    80001380:	60a2                	ld	ra,8(sp)
    80001382:	6402                	ld	s0,0(sp)
    80001384:	0141                	addi	sp,sp,16
    80001386:	8082                	ret

0000000080001388 <uxTaskGetNumberOfTasks>:
}
    80001388:	0001f517          	auipc	a0,0x1f
    8000138c:	00053503          	ld	a0,0(a0) # 80020388 <uxCurrentNumberOfTasks>
    80001390:	8082                	ret

0000000080001392 <xTaskIncrementTick>:
{
    80001392:	7179                	addi	sp,sp,-48
    80001394:	f406                	sd	ra,40(sp)
    80001396:	f022                	sd	s0,32(sp)
    80001398:	ec26                	sd	s1,24(sp)
    8000139a:	e84a                	sd	s2,16(sp)
    8000139c:	e44e                	sd	s3,8(sp)
	if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    8000139e:	0001f797          	auipc	a5,0x1f
    800013a2:	fa27b783          	ld	a5,-94(a5) # 80020340 <uxSchedulerSuspended>
    800013a6:	12079163          	bnez	a5,800014c8 <xTaskIncrementTick+0x136>
		++xTickCount;
    800013aa:	0001f797          	auipc	a5,0x1f
    800013ae:	fd678793          	addi	a5,a5,-42 # 80020380 <xTickCount>
    800013b2:	4398                	lw	a4,0(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	c398                	sw	a4,0(a5)
			const TickType_t xConstTickCount = xTickCount;
    800013b8:	0007a903          	lw	s2,0(a5)
    800013bc:	2901                	sext.w	s2,s2
			if( xConstTickCount == ( TickType_t ) 0U )
    800013be:	04091063          	bnez	s2,800013fe <xTaskIncrementTick+0x6c>
				taskSWITCH_DELAYED_LISTS();
    800013c2:	0001f797          	auipc	a5,0x1f
    800013c6:	fde7b783          	ld	a5,-34(a5) # 800203a0 <pxDelayedTaskList>
    800013ca:	639c                	ld	a5,0(a5)
    800013cc:	c781                	beqz	a5,800013d4 <xTaskIncrementTick+0x42>
    800013ce:	30047073          	csrci	mstatus,8
    800013d2:	a001                	j	800013d2 <xTaskIncrementTick+0x40>
    800013d4:	0001f717          	auipc	a4,0x1f
    800013d8:	fcc70713          	addi	a4,a4,-52 # 800203a0 <pxDelayedTaskList>
    800013dc:	6314                	ld	a3,0(a4)
    800013de:	0001f797          	auipc	a5,0x1f
    800013e2:	fba78793          	addi	a5,a5,-70 # 80020398 <pxOverflowDelayedTaskList>
    800013e6:	6390                	ld	a2,0(a5)
    800013e8:	e310                	sd	a2,0(a4)
    800013ea:	e394                	sd	a3,0(a5)
    800013ec:	0001f717          	auipc	a4,0x1f
    800013f0:	f6c70713          	addi	a4,a4,-148 # 80020358 <xNumOfOverflows>
    800013f4:	631c                	ld	a5,0(a4)
    800013f6:	0785                	addi	a5,a5,1
    800013f8:	e31c                	sd	a5,0(a4)
    800013fa:	c75ff0ef          	jal	ra,8000106e <prvResetNextTaskUnblockTime>
			if( xConstTickCount >= xNextTaskUnblockTime )
    800013fe:	0001f797          	auipc	a5,0x1f
    80001402:	f4a7a783          	lw	a5,-182(a5) # 80020348 <xNextTaskUnblockTime>
    80001406:	0af97463          	bgeu	s2,a5,800014ae <xTaskIncrementTick+0x11c>
BaseType_t xSwitchRequired = pdFALSE;
    8000140a:	4981                	li	s3,0
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ pxCurrentTCB->uxPriority ] ) ) > ( UBaseType_t ) 1 )
    8000140c:	0001f797          	auipc	a5,0x1f
    80001410:	f9c7b783          	ld	a5,-100(a5) # 800203a8 <pxCurrentTCB>
    80001414:	6fb8                	ld	a4,88(a5)
    80001416:	00271793          	slli	a5,a4,0x2
    8000141a:	97ba                	add	a5,a5,a4
    8000141c:	00379713          	slli	a4,a5,0x3
    80001420:	0001f797          	auipc	a5,0x1f
    80001424:	29878793          	addi	a5,a5,664 # 800206b8 <xSuspendedTaskList>
    80001428:	97ba                	add	a5,a5,a4
    8000142a:	6bb8                	ld	a4,80(a5)
    8000142c:	4785                	li	a5,1
    8000142e:	0ae7f563          	bgeu	a5,a4,800014d8 <xTaskIncrementTick+0x146>
				xSwitchRequired = pdTRUE;
    80001432:	4985                	li	s3,1
    80001434:	a055                	j	800014d8 <xTaskIncrementTick+0x146>
								xSwitchRequired = pdTRUE;
    80001436:	4985                	li	s3,1
					if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    80001438:	0001f797          	auipc	a5,0x1f
    8000143c:	f687b783          	ld	a5,-152(a5) # 800203a0 <pxDelayedTaskList>
    80001440:	639c                	ld	a5,0(a5)
    80001442:	cba5                	beqz	a5,800014b2 <xTaskIncrementTick+0x120>
						pxTCB = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList );
    80001444:	0001f797          	auipc	a5,0x1f
    80001448:	f5c7b783          	ld	a5,-164(a5) # 800203a0 <pxDelayedTaskList>
    8000144c:	6f9c                	ld	a5,24(a5)
    8000144e:	6f80                	ld	s0,24(a5)
						xItemValue = listGET_LIST_ITEM_VALUE( &( pxTCB->xGenericListItem ) );
    80001450:	441c                	lw	a5,8(s0)
						if( xConstTickCount < xItemValue )
    80001452:	06f96663          	bltu	s2,a5,800014be <xTaskIncrementTick+0x12c>
						( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    80001456:	00840493          	addi	s1,s0,8
    8000145a:	8526                	mv	a0,s1
    8000145c:	942ff0ef          	jal	ra,8000059e <uxListRemove>
						if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    80001460:	683c                	ld	a5,80(s0)
    80001462:	c789                	beqz	a5,8000146c <xTaskIncrementTick+0xda>
							( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    80001464:	03040513          	addi	a0,s0,48
    80001468:	936ff0ef          	jal	ra,8000059e <uxListRemove>
						prvAddTaskToReadyList( pxTCB );
    8000146c:	6c38                	ld	a4,88(s0)
    8000146e:	0001f797          	auipc	a5,0x1f
    80001472:	f0a7b783          	ld	a5,-246(a5) # 80020378 <uxTopReadyPriority>
    80001476:	00e7f663          	bgeu	a5,a4,80001482 <xTaskIncrementTick+0xf0>
    8000147a:	0001f797          	auipc	a5,0x1f
    8000147e:	eee7bf23          	sd	a4,-258(a5) # 80020378 <uxTopReadyPriority>
    80001482:	00271793          	slli	a5,a4,0x2
    80001486:	97ba                	add	a5,a5,a4
    80001488:	00379713          	slli	a4,a5,0x3
    8000148c:	85a6                	mv	a1,s1
    8000148e:	0001f517          	auipc	a0,0x1f
    80001492:	27a50513          	addi	a0,a0,634 # 80020708 <pxReadyTasksLists>
    80001496:	953a                	add	a0,a0,a4
    80001498:	8c2ff0ef          	jal	ra,8000055a <vListInsertEnd>
							if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    8000149c:	6c38                	ld	a4,88(s0)
    8000149e:	0001f797          	auipc	a5,0x1f
    800014a2:	f0a7b783          	ld	a5,-246(a5) # 800203a8 <pxCurrentTCB>
    800014a6:	6fbc                	ld	a5,88(a5)
    800014a8:	f8f777e3          	bgeu	a4,a5,80001436 <xTaskIncrementTick+0xa4>
    800014ac:	b771                	j	80001438 <xTaskIncrementTick+0xa6>
BaseType_t xSwitchRequired = pdFALSE;
    800014ae:	4981                	li	s3,0
    800014b0:	b761                	j	80001438 <xTaskIncrementTick+0xa6>
						xNextTaskUnblockTime = portMAX_DELAY;
    800014b2:	57fd                	li	a5,-1
    800014b4:	0001f717          	auipc	a4,0x1f
    800014b8:	e8f72a23          	sw	a5,-364(a4) # 80020348 <xNextTaskUnblockTime>
						break;
    800014bc:	bf81                	j	8000140c <xTaskIncrementTick+0x7a>
							xNextTaskUnblockTime = xItemValue;
    800014be:	0001f717          	auipc	a4,0x1f
    800014c2:	e8f72523          	sw	a5,-374(a4) # 80020348 <xNextTaskUnblockTime>
							break;
    800014c6:	b799                	j	8000140c <xTaskIncrementTick+0x7a>
		++uxPendedTicks;
    800014c8:	0001f717          	auipc	a4,0x1f
    800014cc:	ea070713          	addi	a4,a4,-352 # 80020368 <uxPendedTicks>
    800014d0:	631c                	ld	a5,0(a4)
    800014d2:	0785                	addi	a5,a5,1
    800014d4:	e31c                	sd	a5,0(a4)
BaseType_t xSwitchRequired = pdFALSE;
    800014d6:	4981                	li	s3,0
		if( xYieldPending != pdFALSE )
    800014d8:	0001f797          	auipc	a5,0x1f
    800014dc:	e887b783          	ld	a5,-376(a5) # 80020360 <xYieldPending>
    800014e0:	c391                	beqz	a5,800014e4 <xTaskIncrementTick+0x152>
			xSwitchRequired = pdTRUE;
    800014e2:	4985                	li	s3,1
}
    800014e4:	854e                	mv	a0,s3
    800014e6:	70a2                	ld	ra,40(sp)
    800014e8:	7402                	ld	s0,32(sp)
    800014ea:	64e2                	ld	s1,24(sp)
    800014ec:	6942                	ld	s2,16(sp)
    800014ee:	69a2                	ld	s3,8(sp)
    800014f0:	6145                	addi	sp,sp,48
    800014f2:	8082                	ret

00000000800014f4 <vTaskSwitchContext>:
	if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
    800014f4:	0001f797          	auipc	a5,0x1f
    800014f8:	e4c7b783          	ld	a5,-436(a5) # 80020340 <uxSchedulerSuspended>
    800014fc:	c799                	beqz	a5,8000150a <vTaskSwitchContext+0x16>
		xYieldPending = pdTRUE;
    800014fe:	4785                	li	a5,1
    80001500:	0001f717          	auipc	a4,0x1f
    80001504:	e6f73023          	sd	a5,-416(a4) # 80020360 <xYieldPending>
    80001508:	8082                	ret
{
    8000150a:	1141                	addi	sp,sp,-16
    8000150c:	e406                	sd	ra,8(sp)
		xYieldPending = pdFALSE;
    8000150e:	0001f797          	auipc	a5,0x1f
    80001512:	e407b923          	sd	zero,-430(a5) # 80020360 <xYieldPending>
		taskCHECK_FOR_STACK_OVERFLOW();
    80001516:	0001f797          	auipc	a5,0x1f
    8000151a:	e927b783          	ld	a5,-366(a5) # 800203a8 <pxCurrentTCB>
    8000151e:	73b8                	ld	a4,96(a5)
    80001520:	4314                	lw	a3,0(a4)
    80001522:	a5a5a7b7          	lui	a5,0xa5a5a
    80001526:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ec75>
    8000152a:	00f69963          	bne	a3,a5,8000153c <vTaskSwitchContext+0x48>
    8000152e:	4354                	lw	a3,4(a4)
    80001530:	a5a5a7b7          	lui	a5,0xa5a5a
    80001534:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ec75>
    80001538:	04f68963          	beq	a3,a5,8000158a <vTaskSwitchContext+0x96>
    8000153c:	0001f797          	auipc	a5,0x1f
    80001540:	e6c78793          	addi	a5,a5,-404 # 800203a8 <pxCurrentTCB>
    80001544:	6388                	ld	a0,0(a5)
    80001546:	638c                	ld	a1,0(a5)
    80001548:	06858593          	addi	a1,a1,104
    8000154c:	44c020ef          	jal	ra,80003998 <vApplicationStackOverflowHook>
		taskSELECT_HIGHEST_PRIORITY_TASK();
    80001550:	0001f717          	auipc	a4,0x1f
    80001554:	e2873703          	ld	a4,-472(a4) # 80020378 <uxTopReadyPriority>
    80001558:	00271793          	slli	a5,a4,0x2
    8000155c:	97ba                	add	a5,a5,a4
    8000155e:	00379713          	slli	a4,a5,0x3
    80001562:	0001f797          	auipc	a5,0x1f
    80001566:	15678793          	addi	a5,a5,342 # 800206b8 <xSuspendedTaskList>
    8000156a:	97ba                	add	a5,a5,a4
    8000156c:	6bbc                	ld	a5,80(a5)
    8000156e:	e3a1                	bnez	a5,800015ae <vTaskSwitchContext+0xba>
    80001570:	0001f797          	auipc	a5,0x1f
    80001574:	e087b783          	ld	a5,-504(a5) # 80020378 <uxTopReadyPriority>
    80001578:	cb85                	beqz	a5,800015a8 <vTaskSwitchContext+0xb4>
    8000157a:	0001f717          	auipc	a4,0x1f
    8000157e:	dfe70713          	addi	a4,a4,-514 # 80020378 <uxTopReadyPriority>
    80001582:	631c                	ld	a5,0(a4)
    80001584:	17fd                	addi	a5,a5,-1
    80001586:	e31c                	sd	a5,0(a4)
    80001588:	b7e1                	j	80001550 <vTaskSwitchContext+0x5c>
		taskCHECK_FOR_STACK_OVERFLOW();
    8000158a:	4714                	lw	a3,8(a4)
    8000158c:	a5a5a7b7          	lui	a5,0xa5a5a
    80001590:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ec75>
    80001594:	faf694e3          	bne	a3,a5,8000153c <vTaskSwitchContext+0x48>
    80001598:	4758                	lw	a4,12(a4)
    8000159a:	a5a5a7b7          	lui	a5,0xa5a5a
    8000159e:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ec75>
    800015a2:	f8f71de3          	bne	a4,a5,8000153c <vTaskSwitchContext+0x48>
    800015a6:	b76d                	j	80001550 <vTaskSwitchContext+0x5c>
		taskSELECT_HIGHEST_PRIORITY_TASK();
    800015a8:	30047073          	csrci	mstatus,8
    800015ac:	a001                	j	800015ac <vTaskSwitchContext+0xb8>
    800015ae:	0001f797          	auipc	a5,0x1f
    800015b2:	dca7b783          	ld	a5,-566(a5) # 80020378 <uxTopReadyPriority>
    800015b6:	00279713          	slli	a4,a5,0x2
    800015ba:	00f706b3          	add	a3,a4,a5
    800015be:	00369613          	slli	a2,a3,0x3
    800015c2:	0001f697          	auipc	a3,0x1f
    800015c6:	0f668693          	addi	a3,a3,246 # 800206b8 <xSuspendedTaskList>
    800015ca:	96b2                	add	a3,a3,a2
    800015cc:	6eb0                	ld	a2,88(a3)
    800015ce:	6610                	ld	a2,8(a2)
    800015d0:	eeb0                	sd	a2,88(a3)
    800015d2:	973e                	add	a4,a4,a5
    800015d4:	00371693          	slli	a3,a4,0x3
    800015d8:	06c1                	addi	a3,a3,16
    800015da:	0001f717          	auipc	a4,0x1f
    800015de:	12e70713          	addi	a4,a4,302 # 80020708 <pxReadyTasksLists>
    800015e2:	9736                	add	a4,a4,a3
    800015e4:	02e60563          	beq	a2,a4,8000160e <vTaskSwitchContext+0x11a>
    800015e8:	00279713          	slli	a4,a5,0x2
    800015ec:	97ba                	add	a5,a5,a4
    800015ee:	00379713          	slli	a4,a5,0x3
    800015f2:	0001f797          	auipc	a5,0x1f
    800015f6:	0c678793          	addi	a5,a5,198 # 800206b8 <xSuspendedTaskList>
    800015fa:	97ba                	add	a5,a5,a4
    800015fc:	6fbc                	ld	a5,88(a5)
    800015fe:	6f9c                	ld	a5,24(a5)
    80001600:	0001f717          	auipc	a4,0x1f
    80001604:	daf73423          	sd	a5,-600(a4) # 800203a8 <pxCurrentTCB>
}
    80001608:	60a2                	ld	ra,8(sp)
    8000160a:	0141                	addi	sp,sp,16
    8000160c:	8082                	ret
		taskSELECT_HIGHEST_PRIORITY_TASK();
    8000160e:	6610                	ld	a2,8(a2)
    80001610:	00279713          	slli	a4,a5,0x2
    80001614:	973e                	add	a4,a4,a5
    80001616:	00371693          	slli	a3,a4,0x3
    8000161a:	0001f717          	auipc	a4,0x1f
    8000161e:	09e70713          	addi	a4,a4,158 # 800206b8 <xSuspendedTaskList>
    80001622:	9736                	add	a4,a4,a3
    80001624:	ef30                	sd	a2,88(a4)
    80001626:	b7c9                	j	800015e8 <vTaskSwitchContext+0xf4>

0000000080001628 <vTaskPlaceOnEventList>:
	configASSERT( pxEventList );
    80001628:	c131                	beqz	a0,8000166c <vTaskPlaceOnEventList+0x44>
{
    8000162a:	1101                	addi	sp,sp,-32
    8000162c:	ec06                	sd	ra,24(sp)
    8000162e:	e822                	sd	s0,16(sp)
    80001630:	e426                	sd	s1,8(sp)
    80001632:	842e                	mv	s0,a1
	vListInsert( pxEventList, &( pxCurrentTCB->xEventListItem ) );
    80001634:	0001f497          	auipc	s1,0x1f
    80001638:	d7448493          	addi	s1,s1,-652 # 800203a8 <pxCurrentTCB>
    8000163c:	608c                	ld	a1,0(s1)
    8000163e:	03058593          	addi	a1,a1,48
    80001642:	f2ffe0ef          	jal	ra,80000570 <vListInsert>
	if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80001646:	6088                	ld	a0,0(s1)
    80001648:	0521                	addi	a0,a0,8
    8000164a:	f55fe0ef          	jal	ra,8000059e <uxListRemove>
		if( xTicksToWait == portMAX_DELAY )
    8000164e:	57fd                	li	a5,-1
    80001650:	02f40163          	beq	s0,a5,80001672 <vTaskPlaceOnEventList+0x4a>
			xTimeToWake = xTickCount + xTicksToWait;
    80001654:	0001f517          	auipc	a0,0x1f
    80001658:	d2c52503          	lw	a0,-724(a0) # 80020380 <xTickCount>
			prvAddCurrentTaskToDelayedList( xTimeToWake );
    8000165c:	9d21                	addw	a0,a0,s0
    8000165e:	ba5ff0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
}
    80001662:	60e2                	ld	ra,24(sp)
    80001664:	6442                	ld	s0,16(sp)
    80001666:	64a2                	ld	s1,8(sp)
    80001668:	6105                	addi	sp,sp,32
    8000166a:	8082                	ret
	configASSERT( pxEventList );
    8000166c:	30047073          	csrci	mstatus,8
    80001670:	a001                	j	80001670 <vTaskPlaceOnEventList+0x48>
			vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    80001672:	0001f597          	auipc	a1,0x1f
    80001676:	d365b583          	ld	a1,-714(a1) # 800203a8 <pxCurrentTCB>
    8000167a:	05a1                	addi	a1,a1,8
    8000167c:	0001f517          	auipc	a0,0x1f
    80001680:	03c50513          	addi	a0,a0,60 # 800206b8 <xSuspendedTaskList>
    80001684:	ed7fe0ef          	jal	ra,8000055a <vListInsertEnd>
    80001688:	bfe9                	j	80001662 <vTaskPlaceOnEventList+0x3a>

000000008000168a <vTaskPlaceOnUnorderedEventList>:
	configASSERT( pxEventList );
    8000168a:	cd11                	beqz	a0,800016a6 <vTaskPlaceOnUnorderedEventList+0x1c>
{
    8000168c:	1101                	addi	sp,sp,-32
    8000168e:	ec06                	sd	ra,24(sp)
    80001690:	e822                	sd	s0,16(sp)
    80001692:	e426                	sd	s1,8(sp)
    80001694:	8432                	mv	s0,a2
	configASSERT( uxSchedulerSuspended != 0 );
    80001696:	0001f797          	auipc	a5,0x1f
    8000169a:	caa7b783          	ld	a5,-854(a5) # 80020340 <uxSchedulerSuspended>
    8000169e:	e799                	bnez	a5,800016ac <vTaskPlaceOnUnorderedEventList+0x22>
    800016a0:	30047073          	csrci	mstatus,8
    800016a4:	a001                	j	800016a4 <vTaskPlaceOnUnorderedEventList+0x1a>
	configASSERT( pxEventList );
    800016a6:	30047073          	csrci	mstatus,8
    800016aa:	a001                	j	800016aa <vTaskPlaceOnUnorderedEventList+0x20>
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ), xItemValue | taskEVENT_LIST_ITEM_VALUE_IN_USE );
    800016ac:	0001f497          	auipc	s1,0x1f
    800016b0:	cfc48493          	addi	s1,s1,-772 # 800203a8 <pxCurrentTCB>
    800016b4:	609c                	ld	a5,0(s1)
    800016b6:	80000737          	lui	a4,0x80000
    800016ba:	8dd9                	or	a1,a1,a4
    800016bc:	db8c                	sw	a1,48(a5)
	vListInsertEnd( pxEventList, &( pxCurrentTCB->xEventListItem ) );
    800016be:	608c                	ld	a1,0(s1)
    800016c0:	03058593          	addi	a1,a1,48
    800016c4:	e97fe0ef          	jal	ra,8000055a <vListInsertEnd>
	if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    800016c8:	6088                	ld	a0,0(s1)
    800016ca:	0521                	addi	a0,a0,8
    800016cc:	ed3fe0ef          	jal	ra,8000059e <uxListRemove>
		if( xTicksToWait == portMAX_DELAY )
    800016d0:	57fd                	li	a5,-1
    800016d2:	00f40e63          	beq	s0,a5,800016ee <vTaskPlaceOnUnorderedEventList+0x64>
			xTimeToWake = xTickCount + xTicksToWait;
    800016d6:	0001f517          	auipc	a0,0x1f
    800016da:	caa52503          	lw	a0,-854(a0) # 80020380 <xTickCount>
			prvAddCurrentTaskToDelayedList( xTimeToWake );
    800016de:	9d21                	addw	a0,a0,s0
    800016e0:	b23ff0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
}
    800016e4:	60e2                	ld	ra,24(sp)
    800016e6:	6442                	ld	s0,16(sp)
    800016e8:	64a2                	ld	s1,8(sp)
    800016ea:	6105                	addi	sp,sp,32
    800016ec:	8082                	ret
			vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    800016ee:	0001f597          	auipc	a1,0x1f
    800016f2:	cba5b583          	ld	a1,-838(a1) # 800203a8 <pxCurrentTCB>
    800016f6:	05a1                	addi	a1,a1,8
    800016f8:	0001f517          	auipc	a0,0x1f
    800016fc:	fc050513          	addi	a0,a0,-64 # 800206b8 <xSuspendedTaskList>
    80001700:	e5bfe0ef          	jal	ra,8000055a <vListInsertEnd>
    80001704:	b7c5                	j	800016e4 <vTaskPlaceOnUnorderedEventList+0x5a>

0000000080001706 <vTaskPlaceOnEventListRestricted>:
		configASSERT( pxEventList );
    80001706:	c539                	beqz	a0,80001754 <vTaskPlaceOnEventListRestricted+0x4e>
	{
    80001708:	1101                	addi	sp,sp,-32
    8000170a:	ec06                	sd	ra,24(sp)
    8000170c:	e822                	sd	s0,16(sp)
    8000170e:	e426                	sd	s1,8(sp)
    80001710:	e04a                	sd	s2,0(sp)
    80001712:	84ae                	mv	s1,a1
    80001714:	8432                	mv	s0,a2
		vListInsertEnd( pxEventList, &( pxCurrentTCB->xEventListItem ) );
    80001716:	0001f917          	auipc	s2,0x1f
    8000171a:	c9290913          	addi	s2,s2,-878 # 800203a8 <pxCurrentTCB>
    8000171e:	00093583          	ld	a1,0(s2)
    80001722:	03058593          	addi	a1,a1,48
    80001726:	e35fe0ef          	jal	ra,8000055a <vListInsertEnd>
		if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    8000172a:	00093503          	ld	a0,0(s2)
    8000172e:	0521                	addi	a0,a0,8
    80001730:	e6ffe0ef          	jal	ra,8000059e <uxListRemove>
			if( xWaitIndefinitely == pdTRUE )
    80001734:	4785                	li	a5,1
    80001736:	02f40263          	beq	s0,a5,8000175a <vTaskPlaceOnEventListRestricted+0x54>
				xTimeToWake = xTickCount + xTicksToWait;
    8000173a:	0001f517          	auipc	a0,0x1f
    8000173e:	c4652503          	lw	a0,-954(a0) # 80020380 <xTickCount>
				prvAddCurrentTaskToDelayedList( xTimeToWake );
    80001742:	9d25                	addw	a0,a0,s1
    80001744:	abfff0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
	}
    80001748:	60e2                	ld	ra,24(sp)
    8000174a:	6442                	ld	s0,16(sp)
    8000174c:	64a2                	ld	s1,8(sp)
    8000174e:	6902                	ld	s2,0(sp)
    80001750:	6105                	addi	sp,sp,32
    80001752:	8082                	ret
		configASSERT( pxEventList );
    80001754:	30047073          	csrci	mstatus,8
    80001758:	a001                	j	80001758 <vTaskPlaceOnEventListRestricted+0x52>
				vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    8000175a:	0001f597          	auipc	a1,0x1f
    8000175e:	c4e5b583          	ld	a1,-946(a1) # 800203a8 <pxCurrentTCB>
    80001762:	05a1                	addi	a1,a1,8
    80001764:	0001f517          	auipc	a0,0x1f
    80001768:	f5450513          	addi	a0,a0,-172 # 800206b8 <xSuspendedTaskList>
    8000176c:	deffe0ef          	jal	ra,8000055a <vListInsertEnd>
    80001770:	bfe1                	j	80001748 <vTaskPlaceOnEventListRestricted+0x42>

0000000080001772 <xTaskRemoveFromEventList>:
{
    80001772:	1101                	addi	sp,sp,-32
    80001774:	ec06                	sd	ra,24(sp)
    80001776:	e822                	sd	s0,16(sp)
    80001778:	e426                	sd	s1,8(sp)
	pxUnblockedTCB = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxEventList );
    8000177a:	6d1c                	ld	a5,24(a0)
    8000177c:	6f80                	ld	s0,24(a5)
	configASSERT( pxUnblockedTCB );
    8000177e:	c835                	beqz	s0,800017f2 <xTaskRemoveFromEventList+0x80>
	( void ) uxListRemove( &( pxUnblockedTCB->xEventListItem ) );
    80001780:	03040493          	addi	s1,s0,48
    80001784:	8526                	mv	a0,s1
    80001786:	e19fe0ef          	jal	ra,8000059e <uxListRemove>
	if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    8000178a:	0001f797          	auipc	a5,0x1f
    8000178e:	bb67b783          	ld	a5,-1098(a5) # 80020340 <uxSchedulerSuspended>
    80001792:	e3bd                	bnez	a5,800017f8 <xTaskRemoveFromEventList+0x86>
		( void ) uxListRemove( &( pxUnblockedTCB->xGenericListItem ) );
    80001794:	00840493          	addi	s1,s0,8
    80001798:	8526                	mv	a0,s1
    8000179a:	e05fe0ef          	jal	ra,8000059e <uxListRemove>
		prvAddTaskToReadyList( pxUnblockedTCB );
    8000179e:	6c38                	ld	a4,88(s0)
    800017a0:	0001f797          	auipc	a5,0x1f
    800017a4:	bd87b783          	ld	a5,-1064(a5) # 80020378 <uxTopReadyPriority>
    800017a8:	00e7f663          	bgeu	a5,a4,800017b4 <xTaskRemoveFromEventList+0x42>
    800017ac:	0001f797          	auipc	a5,0x1f
    800017b0:	bce7b623          	sd	a4,-1076(a5) # 80020378 <uxTopReadyPriority>
    800017b4:	00271793          	slli	a5,a4,0x2
    800017b8:	97ba                	add	a5,a5,a4
    800017ba:	078e                	slli	a5,a5,0x3
    800017bc:	85a6                	mv	a1,s1
    800017be:	0001f517          	auipc	a0,0x1f
    800017c2:	f4a50513          	addi	a0,a0,-182 # 80020708 <pxReadyTasksLists>
    800017c6:	953e                	add	a0,a0,a5
    800017c8:	d93fe0ef          	jal	ra,8000055a <vListInsertEnd>
	if( pxUnblockedTCB->uxPriority > pxCurrentTCB->uxPriority )
    800017cc:	6c38                	ld	a4,88(s0)
    800017ce:	0001f797          	auipc	a5,0x1f
    800017d2:	bda7b783          	ld	a5,-1062(a5) # 800203a8 <pxCurrentTCB>
    800017d6:	6fbc                	ld	a5,88(a5)
    800017d8:	02e7f863          	bgeu	a5,a4,80001808 <xTaskRemoveFromEventList+0x96>
		xYieldPending = pdTRUE;
    800017dc:	4785                	li	a5,1
    800017de:	0001f717          	auipc	a4,0x1f
    800017e2:	b8f73123          	sd	a5,-1150(a4) # 80020360 <xYieldPending>
		xReturn = pdTRUE;
    800017e6:	4505                	li	a0,1
}
    800017e8:	60e2                	ld	ra,24(sp)
    800017ea:	6442                	ld	s0,16(sp)
    800017ec:	64a2                	ld	s1,8(sp)
    800017ee:	6105                	addi	sp,sp,32
    800017f0:	8082                	ret
	configASSERT( pxUnblockedTCB );
    800017f2:	30047073          	csrci	mstatus,8
    800017f6:	a001                	j	800017f6 <xTaskRemoveFromEventList+0x84>
		vListInsertEnd( &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
    800017f8:	85a6                	mv	a1,s1
    800017fa:	0001f517          	auipc	a0,0x1f
    800017fe:	ee650513          	addi	a0,a0,-282 # 800206e0 <xPendingReadyList>
    80001802:	d59fe0ef          	jal	ra,8000055a <vListInsertEnd>
    80001806:	b7d9                	j	800017cc <xTaskRemoveFromEventList+0x5a>
		xReturn = pdFALSE;
    80001808:	4501                	li	a0,0
	return xReturn;
    8000180a:	bff9                	j	800017e8 <xTaskRemoveFromEventList+0x76>

000000008000180c <xTaskRemoveFromUnorderedEventList>:
	configASSERT( uxSchedulerSuspended != pdFALSE );
    8000180c:	0001f797          	auipc	a5,0x1f
    80001810:	b347b783          	ld	a5,-1228(a5) # 80020340 <uxSchedulerSuspended>
    80001814:	e781                	bnez	a5,8000181c <xTaskRemoveFromUnorderedEventList+0x10>
    80001816:	30047073          	csrci	mstatus,8
    8000181a:	a001                	j	8000181a <xTaskRemoveFromUnorderedEventList+0xe>
{
    8000181c:	1101                	addi	sp,sp,-32
    8000181e:	ec06                	sd	ra,24(sp)
    80001820:	e822                	sd	s0,16(sp)
    80001822:	e426                	sd	s1,8(sp)
	listSET_LIST_ITEM_VALUE( pxEventListItem, xItemValue | taskEVENT_LIST_ITEM_VALUE_IN_USE );
    80001824:	800007b7          	lui	a5,0x80000
    80001828:	8ddd                	or	a1,a1,a5
    8000182a:	c10c                	sw	a1,0(a0)
	pxUnblockedTCB = ( TCB_t * ) listGET_LIST_ITEM_OWNER( pxEventListItem );
    8000182c:	6d00                	ld	s0,24(a0)
	configASSERT( pxUnblockedTCB );
    8000182e:	c035                	beqz	s0,80001892 <xTaskRemoveFromUnorderedEventList+0x86>
	( void ) uxListRemove( pxEventListItem );
    80001830:	d6ffe0ef          	jal	ra,8000059e <uxListRemove>
	( void ) uxListRemove( &( pxUnblockedTCB->xGenericListItem ) );
    80001834:	00840493          	addi	s1,s0,8
    80001838:	8526                	mv	a0,s1
    8000183a:	d65fe0ef          	jal	ra,8000059e <uxListRemove>
	prvAddTaskToReadyList( pxUnblockedTCB );
    8000183e:	6c38                	ld	a4,88(s0)
    80001840:	0001f797          	auipc	a5,0x1f
    80001844:	b387b783          	ld	a5,-1224(a5) # 80020378 <uxTopReadyPriority>
    80001848:	00e7f663          	bgeu	a5,a4,80001854 <xTaskRemoveFromUnorderedEventList+0x48>
    8000184c:	0001f797          	auipc	a5,0x1f
    80001850:	b2e7b623          	sd	a4,-1236(a5) # 80020378 <uxTopReadyPriority>
    80001854:	00271793          	slli	a5,a4,0x2
    80001858:	97ba                	add	a5,a5,a4
    8000185a:	078e                	slli	a5,a5,0x3
    8000185c:	85a6                	mv	a1,s1
    8000185e:	0001f517          	auipc	a0,0x1f
    80001862:	eaa50513          	addi	a0,a0,-342 # 80020708 <pxReadyTasksLists>
    80001866:	953e                	add	a0,a0,a5
    80001868:	cf3fe0ef          	jal	ra,8000055a <vListInsertEnd>
	if( pxUnblockedTCB->uxPriority > pxCurrentTCB->uxPriority )
    8000186c:	6c38                	ld	a4,88(s0)
    8000186e:	0001f797          	auipc	a5,0x1f
    80001872:	b3a7b783          	ld	a5,-1222(a5) # 800203a8 <pxCurrentTCB>
    80001876:	6fbc                	ld	a5,88(a5)
    80001878:	02e7f063          	bgeu	a5,a4,80001898 <xTaskRemoveFromUnorderedEventList+0x8c>
		xYieldPending = pdTRUE;
    8000187c:	4785                	li	a5,1
    8000187e:	0001f717          	auipc	a4,0x1f
    80001882:	aef73123          	sd	a5,-1310(a4) # 80020360 <xYieldPending>
		xReturn = pdTRUE;
    80001886:	4505                	li	a0,1
}
    80001888:	60e2                	ld	ra,24(sp)
    8000188a:	6442                	ld	s0,16(sp)
    8000188c:	64a2                	ld	s1,8(sp)
    8000188e:	6105                	addi	sp,sp,32
    80001890:	8082                	ret
	configASSERT( pxUnblockedTCB );
    80001892:	30047073          	csrci	mstatus,8
    80001896:	a001                	j	80001896 <xTaskRemoveFromUnorderedEventList+0x8a>
		xReturn = pdFALSE;
    80001898:	4501                	li	a0,0
	return xReturn;
    8000189a:	b7fd                	j	80001888 <xTaskRemoveFromUnorderedEventList+0x7c>

000000008000189c <vTaskSetTimeOutState>:
	configASSERT( pxTimeOut );
    8000189c:	cd01                	beqz	a0,800018b4 <vTaskSetTimeOutState+0x18>
	pxTimeOut->xOverflowCount = xNumOfOverflows;
    8000189e:	0001f797          	auipc	a5,0x1f
    800018a2:	aba7b783          	ld	a5,-1350(a5) # 80020358 <xNumOfOverflows>
    800018a6:	e11c                	sd	a5,0(a0)
	pxTimeOut->xTimeOnEntering = xTickCount;
    800018a8:	0001f797          	auipc	a5,0x1f
    800018ac:	ad87a783          	lw	a5,-1320(a5) # 80020380 <xTickCount>
    800018b0:	c51c                	sw	a5,8(a0)
}
    800018b2:	8082                	ret
	configASSERT( pxTimeOut );
    800018b4:	30047073          	csrci	mstatus,8
    800018b8:	a001                	j	800018b8 <vTaskSetTimeOutState+0x1c>

00000000800018ba <vTaskMissedYield>:
	xYieldPending = pdTRUE;
    800018ba:	4785                	li	a5,1
    800018bc:	0001f717          	auipc	a4,0x1f
    800018c0:	aaf73223          	sd	a5,-1372(a4) # 80020360 <xYieldPending>
}
    800018c4:	8082                	ret

00000000800018c6 <uxTaskGetTaskNumber>:
		if( xTask != NULL )
    800018c6:	c119                	beqz	a0,800018cc <uxTaskGetTaskNumber+0x6>
			uxReturn = pxTCB->uxTaskNumber;
    800018c8:	6548                	ld	a0,136(a0)
    800018ca:	8082                	ret
			uxReturn = 0U;
    800018cc:	4501                	li	a0,0
	}
    800018ce:	8082                	ret

00000000800018d0 <vTaskSetTaskNumber>:
		if( xTask != NULL )
    800018d0:	c111                	beqz	a0,800018d4 <vTaskSetTaskNumber+0x4>
			pxTCB->uxTaskNumber = uxHandle;
    800018d2:	e54c                	sd	a1,136(a0)
	}
    800018d4:	8082                	ret

00000000800018d6 <xTaskGetCurrentTaskHandle>:
		an interrupt and the current TCB will always be the same for any
		individual execution thread. */
		xReturn = pxCurrentTCB;

		return xReturn;
	}
    800018d6:	0001f517          	auipc	a0,0x1f
    800018da:	ad253503          	ld	a0,-1326(a0) # 800203a8 <pxCurrentTCB>
    800018de:	8082                	ret

00000000800018e0 <xTaskGetSchedulerState>:

	BaseType_t xTaskGetSchedulerState( void )
	{
	BaseType_t xReturn;

		if( xSchedulerRunning == pdFALSE )
    800018e0:	0001f797          	auipc	a5,0x1f
    800018e4:	a907b783          	ld	a5,-1392(a5) # 80020370 <xSchedulerRunning>
    800018e8:	cb91                	beqz	a5,800018fc <xTaskGetSchedulerState+0x1c>
		{
			xReturn = taskSCHEDULER_NOT_STARTED;
		}
		else
		{
			if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    800018ea:	0001f797          	auipc	a5,0x1f
    800018ee:	a567b783          	ld	a5,-1450(a5) # 80020340 <uxSchedulerSuspended>
    800018f2:	c399                	beqz	a5,800018f8 <xTaskGetSchedulerState+0x18>
			{
				xReturn = taskSCHEDULER_RUNNING;
			}
			else
			{
				xReturn = taskSCHEDULER_SUSPENDED;
    800018f4:	4501                	li	a0,0
			}
		}

		return xReturn;
	}
    800018f6:	8082                	ret
				xReturn = taskSCHEDULER_RUNNING;
    800018f8:	4509                	li	a0,2
    800018fa:	8082                	ret
			xReturn = taskSCHEDULER_NOT_STARTED;
    800018fc:	4505                	li	a0,1
    800018fe:	8082                	ret

0000000080001900 <vTaskPriorityInherit>:
	{
	TCB_t * const pxTCB = ( TCB_t * ) pxMutexHolder;

		/* If the mutex was given back by an interrupt while the queue was
		locked then the mutex holder might now be NULL. */
		if( pxMutexHolder != NULL )
    80001900:	c15d                	beqz	a0,800019a6 <vTaskPriorityInherit+0xa6>
	{
    80001902:	1101                	addi	sp,sp,-32
    80001904:	ec06                	sd	ra,24(sp)
    80001906:	e822                	sd	s0,16(sp)
    80001908:	e426                	sd	s1,8(sp)
    8000190a:	842a                	mv	s0,a0
		{
			/* If the holder of the mutex has a priority below the priority of
			the task attempting to obtain the mutex then it will temporarily
			inherit the priority of the task attempting to obtain the mutex. */
			if( pxTCB->uxPriority < pxCurrentTCB->uxPriority )
    8000190c:	6d38                	ld	a4,88(a0)
    8000190e:	0001f797          	auipc	a5,0x1f
    80001912:	a9a7b783          	ld	a5,-1382(a5) # 800203a8 <pxCurrentTCB>
    80001916:	6fbc                	ld	a5,88(a5)
    80001918:	02f77f63          	bgeu	a4,a5,80001956 <vTaskPriorityInherit+0x56>
			{
				/* Adjust the mutex holder state to account for its new
				priority.  Only reset the event list item value if the value is
				not	being used for anything else. */
				if( ( listGET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ) ) & taskEVENT_LIST_ITEM_VALUE_IN_USE ) == 0UL )
    8000191c:	591c                	lw	a5,48(a0)
    8000191e:	0007ca63          	bltz	a5,80001932 <vTaskPriorityInherit+0x32>
				{
					listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxCurrentTCB->uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    80001922:	0001f797          	auipc	a5,0x1f
    80001926:	a867b783          	ld	a5,-1402(a5) # 800203a8 <pxCurrentTCB>
    8000192a:	4fb4                	lw	a3,88(a5)
    8000192c:	4795                	li	a5,5
    8000192e:	9f95                	subw	a5,a5,a3
    80001930:	d91c                	sw	a5,48(a0)
					mtCOVERAGE_TEST_MARKER();
				}

				/* If the task being modified is in the ready state it will need
				to be moved into a new list. */
				if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) ) != pdFALSE )
    80001932:	7414                	ld	a3,40(s0)
    80001934:	00271793          	slli	a5,a4,0x2
    80001938:	97ba                	add	a5,a5,a4
    8000193a:	078e                	slli	a5,a5,0x3
    8000193c:	0001f717          	auipc	a4,0x1f
    80001940:	dcc70713          	addi	a4,a4,-564 # 80020708 <pxReadyTasksLists>
    80001944:	97ba                	add	a5,a5,a4
    80001946:	00f68d63          	beq	a3,a5,80001960 <vTaskPriorityInherit+0x60>
					prvAddTaskToReadyList( pxTCB );
				}
				else
				{
					/* Just inherit the priority. */
					pxTCB->uxPriority = pxCurrentTCB->uxPriority;
    8000194a:	0001f797          	auipc	a5,0x1f
    8000194e:	a5e7b783          	ld	a5,-1442(a5) # 800203a8 <pxCurrentTCB>
    80001952:	6fbc                	ld	a5,88(a5)
    80001954:	ec3c                	sd	a5,88(s0)
		}
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
	}
    80001956:	60e2                	ld	ra,24(sp)
    80001958:	6442                	ld	s0,16(sp)
    8000195a:	64a2                	ld	s1,8(sp)
    8000195c:	6105                	addi	sp,sp,32
    8000195e:	8082                	ret
					if( uxListRemove( &( pxTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80001960:	00840493          	addi	s1,s0,8
    80001964:	8526                	mv	a0,s1
    80001966:	c39fe0ef          	jal	ra,8000059e <uxListRemove>
					pxTCB->uxPriority = pxCurrentTCB->uxPriority;
    8000196a:	0001f797          	auipc	a5,0x1f
    8000196e:	a3e7b783          	ld	a5,-1474(a5) # 800203a8 <pxCurrentTCB>
    80001972:	6fb8                	ld	a4,88(a5)
    80001974:	ec38                	sd	a4,88(s0)
					prvAddTaskToReadyList( pxTCB );
    80001976:	0001f797          	auipc	a5,0x1f
    8000197a:	a027b783          	ld	a5,-1534(a5) # 80020378 <uxTopReadyPriority>
    8000197e:	00e7ef63          	bltu	a5,a4,8000199c <vTaskPriorityInherit+0x9c>
    80001982:	00271793          	slli	a5,a4,0x2
    80001986:	97ba                	add	a5,a5,a4
    80001988:	078e                	slli	a5,a5,0x3
    8000198a:	85a6                	mv	a1,s1
    8000198c:	0001f517          	auipc	a0,0x1f
    80001990:	d7c50513          	addi	a0,a0,-644 # 80020708 <pxReadyTasksLists>
    80001994:	953e                	add	a0,a0,a5
    80001996:	bc5fe0ef          	jal	ra,8000055a <vListInsertEnd>
	}
    8000199a:	bf75                	j	80001956 <vTaskPriorityInherit+0x56>
					prvAddTaskToReadyList( pxTCB );
    8000199c:	0001f797          	auipc	a5,0x1f
    800019a0:	9ce7be23          	sd	a4,-1572(a5) # 80020378 <uxTopReadyPriority>
    800019a4:	bff9                	j	80001982 <vTaskPriorityInherit+0x82>
    800019a6:	8082                	ret

00000000800019a8 <xTaskPriorityDisinherit>:
	BaseType_t xTaskPriorityDisinherit( TaskHandle_t const pxMutexHolder )
	{
	TCB_t * const pxTCB = ( TCB_t * ) pxMutexHolder;
	BaseType_t xReturn = pdFALSE;

		if( pxMutexHolder != NULL )
    800019a8:	c159                	beqz	a0,80001a2e <xTaskPriorityDisinherit+0x86>
	{
    800019aa:	1101                	addi	sp,sp,-32
    800019ac:	ec06                	sd	ra,24(sp)
    800019ae:	e822                	sd	s0,16(sp)
    800019b0:	e426                	sd	s1,8(sp)
    800019b2:	842a                	mv	s0,a0
		{
			/* A task can only have an inherited priority if it holds the mutex.
			If the mutex is held by a task then it cannot be given from an
			interrupt, and if a mutex is given by the holding task then it must
			be the running state task. */
			configASSERT( pxTCB == pxCurrentTCB );
    800019b4:	0001f797          	auipc	a5,0x1f
    800019b8:	9f47b783          	ld	a5,-1548(a5) # 800203a8 <pxCurrentTCB>
    800019bc:	00a78563          	beq	a5,a0,800019c6 <xTaskPriorityDisinherit+0x1e>
    800019c0:	30047073          	csrci	mstatus,8
    800019c4:	a001                	j	800019c4 <xTaskPriorityDisinherit+0x1c>

			configASSERT( pxTCB->uxMutexesHeld );
    800019c6:	6d5c                	ld	a5,152(a0)
    800019c8:	e781                	bnez	a5,800019d0 <xTaskPriorityDisinherit+0x28>
    800019ca:	30047073          	csrci	mstatus,8
    800019ce:	a001                	j	800019ce <xTaskPriorityDisinherit+0x26>
			( pxTCB->uxMutexesHeld )--;
    800019d0:	17fd                	addi	a5,a5,-1
    800019d2:	ed5c                	sd	a5,152(a0)

			/* Has the holder of the mutex inherited the priority of another
			task? */
			if( pxTCB->uxPriority != pxTCB->uxBasePriority )
    800019d4:	6d34                	ld	a3,88(a0)
    800019d6:	6958                	ld	a4,144(a0)
    800019d8:	04e68d63          	beq	a3,a4,80001a32 <xTaskPriorityDisinherit+0x8a>
			{
				/* Only disinherit if no other mutexes are held. */
				if( pxTCB->uxMutexesHeld == ( UBaseType_t ) 0 )
    800019dc:	c799                	beqz	a5,800019ea <xTaskPriorityDisinherit+0x42>
	BaseType_t xReturn = pdFALSE;
    800019de:	4501                	li	a0,0
		{
			mtCOVERAGE_TEST_MARKER();
		}

		return xReturn;
	}
    800019e0:	60e2                	ld	ra,24(sp)
    800019e2:	6442                	ld	s0,16(sp)
    800019e4:	64a2                	ld	s1,8(sp)
    800019e6:	6105                	addi	sp,sp,32
    800019e8:	8082                	ret
					if( uxListRemove( &( pxTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    800019ea:	00850493          	addi	s1,a0,8
    800019ee:	8526                	mv	a0,s1
    800019f0:	baffe0ef          	jal	ra,8000059e <uxListRemove>
					pxTCB->uxPriority = pxTCB->uxBasePriority;
    800019f4:	685c                	ld	a5,144(s0)
    800019f6:	ec3c                	sd	a5,88(s0)
					listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxTCB->uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800019f8:	4715                	li	a4,5
    800019fa:	9f1d                	subw	a4,a4,a5
    800019fc:	d818                	sw	a4,48(s0)
					prvAddTaskToReadyList( pxTCB );
    800019fe:	0001f717          	auipc	a4,0x1f
    80001a02:	97a73703          	ld	a4,-1670(a4) # 80020378 <uxTopReadyPriority>
    80001a06:	00f77663          	bgeu	a4,a5,80001a12 <xTaskPriorityDisinherit+0x6a>
    80001a0a:	0001f717          	auipc	a4,0x1f
    80001a0e:	96f73723          	sd	a5,-1682(a4) # 80020378 <uxTopReadyPriority>
    80001a12:	00279713          	slli	a4,a5,0x2
    80001a16:	97ba                	add	a5,a5,a4
    80001a18:	078e                	slli	a5,a5,0x3
    80001a1a:	85a6                	mv	a1,s1
    80001a1c:	0001f517          	auipc	a0,0x1f
    80001a20:	cec50513          	addi	a0,a0,-788 # 80020708 <pxReadyTasksLists>
    80001a24:	953e                	add	a0,a0,a5
    80001a26:	b35fe0ef          	jal	ra,8000055a <vListInsertEnd>
					xReturn = pdTRUE;
    80001a2a:	4505                	li	a0,1
    80001a2c:	bf55                	j	800019e0 <xTaskPriorityDisinherit+0x38>
	BaseType_t xReturn = pdFALSE;
    80001a2e:	4501                	li	a0,0
	}
    80001a30:	8082                	ret
	BaseType_t xReturn = pdFALSE;
    80001a32:	4501                	li	a0,0
    80001a34:	b775                	j	800019e0 <xTaskPriorityDisinherit+0x38>

0000000080001a36 <vTaskEnterCritical>:

#if ( portCRITICAL_NESTING_IN_TCB == 1 )

	void vTaskEnterCritical( void )
	{
		portDISABLE_INTERRUPTS();
    80001a36:	30047073          	csrci	mstatus,8

		if( xSchedulerRunning != pdFALSE )
    80001a3a:	0001f797          	auipc	a5,0x1f
    80001a3e:	9367b783          	ld	a5,-1738(a5) # 80020370 <xSchedulerRunning>
    80001a42:	cb91                	beqz	a5,80001a56 <vTaskEnterCritical+0x20>
		{
			( pxCurrentTCB->uxCriticalNesting )++;
    80001a44:	0001f717          	auipc	a4,0x1f
    80001a48:	96470713          	addi	a4,a4,-1692 # 800203a8 <pxCurrentTCB>
    80001a4c:	6314                	ld	a3,0(a4)
    80001a4e:	7ebc                	ld	a5,120(a3)
    80001a50:	0785                	addi	a5,a5,1
    80001a52:	febc                	sd	a5,120(a3)
			function so	assert() if it is being called from an interrupt
			context.  Only API functions that end in "FromISR" can be used in an
			interrupt.  Only assert if the critical nesting count is 1 to
			protect against recursive calls if the assert function also uses a
			critical section. */
			if( pxCurrentTCB->uxCriticalNesting == 1 )
    80001a54:	631c                	ld	a5,0(a4)
		}
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
	}
    80001a56:	8082                	ret

0000000080001a58 <vTaskExitCritical>:

#if ( portCRITICAL_NESTING_IN_TCB == 1 )

	void vTaskExitCritical( void )
	{
		if( xSchedulerRunning != pdFALSE )
    80001a58:	0001f797          	auipc	a5,0x1f
    80001a5c:	9187b783          	ld	a5,-1768(a5) # 80020370 <xSchedulerRunning>
    80001a60:	c785                	beqz	a5,80001a88 <vTaskExitCritical+0x30>
		{
			if( pxCurrentTCB->uxCriticalNesting > 0U )
    80001a62:	0001f797          	auipc	a5,0x1f
    80001a66:	9467b783          	ld	a5,-1722(a5) # 800203a8 <pxCurrentTCB>
    80001a6a:	7fbc                	ld	a5,120(a5)
    80001a6c:	cf91                	beqz	a5,80001a88 <vTaskExitCritical+0x30>
			{
				( pxCurrentTCB->uxCriticalNesting )--;
    80001a6e:	0001f717          	auipc	a4,0x1f
    80001a72:	93a70713          	addi	a4,a4,-1734 # 800203a8 <pxCurrentTCB>
    80001a76:	6314                	ld	a3,0(a4)
    80001a78:	7ebc                	ld	a5,120(a3)
    80001a7a:	17fd                	addi	a5,a5,-1
    80001a7c:	febc                	sd	a5,120(a3)

				if( pxCurrentTCB->uxCriticalNesting == 0U )
    80001a7e:	631c                	ld	a5,0(a4)
    80001a80:	7fbc                	ld	a5,120(a5)
    80001a82:	e399                	bnez	a5,80001a88 <vTaskExitCritical+0x30>
				{
					portENABLE_INTERRUPTS();
    80001a84:	30046073          	csrsi	mstatus,8
		}
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
	}
    80001a88:	8082                	ret

0000000080001a8a <xTaskGenericCreate>:
	configASSERT( pxTaskCode );
    80001a8a:	c90d                	beqz	a0,80001abc <xTaskGenericCreate+0x32>
{
    80001a8c:	715d                	addi	sp,sp,-80
    80001a8e:	e486                	sd	ra,72(sp)
    80001a90:	e0a2                	sd	s0,64(sp)
    80001a92:	fc26                	sd	s1,56(sp)
    80001a94:	f84a                	sd	s2,48(sp)
    80001a96:	f44e                	sd	s3,40(sp)
    80001a98:	f052                	sd	s4,32(sp)
    80001a9a:	ec56                	sd	s5,24(sp)
    80001a9c:	e85a                	sd	s6,16(sp)
    80001a9e:	e45e                	sd	s7,8(sp)
    80001aa0:	e062                	sd	s8,0(sp)
    80001aa2:	842a                	mv	s0,a0
    80001aa4:	8aae                	mv	s5,a1
    80001aa6:	8a32                	mv	s4,a2
    80001aa8:	8b36                	mv	s6,a3
    80001aaa:	89ba                	mv	s3,a4
    80001aac:	893e                	mv	s2,a5
    80001aae:	84c6                	mv	s1,a7
	configASSERT( ( ( uxPriority & ( UBaseType_t ) ( ~portPRIVILEGE_BIT ) ) < ( UBaseType_t ) configMAX_PRIORITIES ) );
    80001ab0:	4791                	li	a5,4
    80001ab2:	00e7f863          	bgeu	a5,a4,80001ac2 <xTaskGenericCreate+0x38>
    80001ab6:	30047073          	csrci	mstatus,8
    80001aba:	a001                	j	80001aba <xTaskGenericCreate+0x30>
	configASSERT( pxTaskCode );
    80001abc:	30047073          	csrci	mstatus,8
    80001ac0:	a001                	j	80001ac0 <xTaskGenericCreate+0x36>
	pxNewTCB = prvAllocateTCBAndStack( usStackDepth, puxStackBuffer );
    80001ac2:	85c2                	mv	a1,a6
    80001ac4:	8532                	mv	a0,a2
    80001ac6:	df4ff0ef          	jal	ra,800010ba <prvAllocateTCBAndStack>
    80001aca:	8baa                	mv	s7,a0
	if( pxNewTCB != NULL )
    80001acc:	0e050e63          	beqz	a0,80001bc8 <xTaskGenericCreate+0x13e>
			pxTopOfStack = pxNewTCB->pxStack + ( usStackDepth - ( uint16_t ) 1 );
    80001ad0:	06053c03          	ld	s8,96(a0)
    80001ad4:	003a1793          	slli	a5,s4,0x3
    80001ad8:	17e1                	addi	a5,a5,-8
    80001ada:	9c3e                	add	s8,s8,a5
			pxTopOfStack = ( StackType_t * ) ( ( ( portPOINTER_SIZE_TYPE ) pxTopOfStack ) & ( ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK ) ) ); /*lint !e923 MISRA exception.  Avoiding casts between pointers and integers is not practical.  Size differences accounted for using portPOINTER_SIZE_TYPE type. */
    80001adc:	ff8c7c13          	andi	s8,s8,-8
		prvInitialiseTCBVariables( pxNewTCB, pcName, uxPriority, xRegions, usStackDepth );
    80001ae0:	8752                	mv	a4,s4
    80001ae2:	86a6                	mv	a3,s1
    80001ae4:	864e                	mv	a2,s3
    80001ae6:	85d6                	mv	a1,s5
    80001ae8:	e26ff0ef          	jal	ra,8000110e <prvInitialiseTCBVariables>
			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
    80001aec:	865a                	mv	a2,s6
    80001aee:	85a2                	mv	a1,s0
    80001af0:	8562                	mv	a0,s8
    80001af2:	a17fe0ef          	jal	ra,80000508 <pxPortInitialiseStack>
    80001af6:	00abb023          	sd	a0,0(s7)
		if( ( void * ) pxCreatedTask != NULL )
    80001afa:	00090463          	beqz	s2,80001b02 <xTaskGenericCreate+0x78>
			*pxCreatedTask = ( TaskHandle_t ) pxNewTCB;
    80001afe:	01793023          	sd	s7,0(s2)
		taskENTER_CRITICAL();
    80001b02:	f35ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
			uxCurrentNumberOfTasks++;
    80001b06:	0001f717          	auipc	a4,0x1f
    80001b0a:	88270713          	addi	a4,a4,-1918 # 80020388 <uxCurrentNumberOfTasks>
    80001b0e:	631c                	ld	a5,0(a4)
    80001b10:	0785                	addi	a5,a5,1
    80001b12:	e31c                	sd	a5,0(a4)
			if( pxCurrentTCB == NULL )
    80001b14:	0001f797          	auipc	a5,0x1f
    80001b18:	8947b783          	ld	a5,-1900(a5) # 800203a8 <pxCurrentTCB>
    80001b1c:	c395                	beqz	a5,80001b40 <xTaskGenericCreate+0xb6>
				if( xSchedulerRunning == pdFALSE )
    80001b1e:	0001f797          	auipc	a5,0x1f
    80001b22:	8527b783          	ld	a5,-1966(a5) # 80020370 <xSchedulerRunning>
    80001b26:	eb85                	bnez	a5,80001b56 <xTaskGenericCreate+0xcc>
					if( pxCurrentTCB->uxPriority <= uxPriority )
    80001b28:	0001f797          	auipc	a5,0x1f
    80001b2c:	8807b783          	ld	a5,-1920(a5) # 800203a8 <pxCurrentTCB>
    80001b30:	6fbc                	ld	a5,88(a5)
    80001b32:	02f9e263          	bltu	s3,a5,80001b56 <xTaskGenericCreate+0xcc>
						pxCurrentTCB = pxNewTCB;
    80001b36:	0001f797          	auipc	a5,0x1f
    80001b3a:	8777b923          	sd	s7,-1934(a5) # 800203a8 <pxCurrentTCB>
    80001b3e:	a821                	j	80001b56 <xTaskGenericCreate+0xcc>
				pxCurrentTCB =  pxNewTCB;
    80001b40:	0001f797          	auipc	a5,0x1f
    80001b44:	8777b423          	sd	s7,-1944(a5) # 800203a8 <pxCurrentTCB>
				if( uxCurrentNumberOfTasks == ( UBaseType_t ) 1 )
    80001b48:	0001f717          	auipc	a4,0x1f
    80001b4c:	84073703          	ld	a4,-1984(a4) # 80020388 <uxCurrentNumberOfTasks>
    80001b50:	4785                	li	a5,1
    80001b52:	06f70463          	beq	a4,a5,80001bba <xTaskGenericCreate+0x130>
			uxTaskNumber++;
    80001b56:	0001e717          	auipc	a4,0x1e
    80001b5a:	7fa70713          	addi	a4,a4,2042 # 80020350 <uxTaskNumber>
    80001b5e:	631c                	ld	a5,0(a4)
    80001b60:	0785                	addi	a5,a5,1
    80001b62:	e31c                	sd	a5,0(a4)
				pxNewTCB->uxTCBNumber = uxTaskNumber;
    80001b64:	08fbb023          	sd	a5,128(s7)
			prvAddTaskToReadyList( pxNewTCB );
    80001b68:	058bb703          	ld	a4,88(s7)
    80001b6c:	0001f797          	auipc	a5,0x1f
    80001b70:	80c7b783          	ld	a5,-2036(a5) # 80020378 <uxTopReadyPriority>
    80001b74:	00e7f663          	bgeu	a5,a4,80001b80 <xTaskGenericCreate+0xf6>
    80001b78:	0001f797          	auipc	a5,0x1f
    80001b7c:	80e7b023          	sd	a4,-2048(a5) # 80020378 <uxTopReadyPriority>
    80001b80:	00271793          	slli	a5,a4,0x2
    80001b84:	97ba                	add	a5,a5,a4
    80001b86:	078e                	slli	a5,a5,0x3
    80001b88:	008b8593          	addi	a1,s7,8
    80001b8c:	0001f517          	auipc	a0,0x1f
    80001b90:	b7c50513          	addi	a0,a0,-1156 # 80020708 <pxReadyTasksLists>
    80001b94:	953e                	add	a0,a0,a5
    80001b96:	9c5fe0ef          	jal	ra,8000055a <vListInsertEnd>
		taskEXIT_CRITICAL();
    80001b9a:	ebfff0ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( xSchedulerRunning != pdFALSE )
    80001b9e:	0001e797          	auipc	a5,0x1e
    80001ba2:	7d27b783          	ld	a5,2002(a5) # 80020370 <xSchedulerRunning>
    80001ba6:	cf95                	beqz	a5,80001be2 <xTaskGenericCreate+0x158>
			if( pxCurrentTCB->uxPriority < uxPriority )
    80001ba8:	0001f797          	auipc	a5,0x1f
    80001bac:	8007b783          	ld	a5,-2048(a5) # 800203a8 <pxCurrentTCB>
    80001bb0:	6fbc                	ld	a5,88(a5)
    80001bb2:	0137e763          	bltu	a5,s3,80001bc0 <xTaskGenericCreate+0x136>
			xReturn = pdPASS;
    80001bb6:	4505                	li	a0,1
	return xReturn;
    80001bb8:	a809                	j	80001bca <xTaskGenericCreate+0x140>
					prvInitialiseTaskLists();
    80001bba:	dc2ff0ef          	jal	ra,8000117c <prvInitialiseTaskLists>
    80001bbe:	bf61                	j	80001b56 <xTaskGenericCreate+0xcc>
				taskYIELD_IF_USING_PREEMPTION();
    80001bc0:	84dfe0ef          	jal	ra,8000040c <vPortYield>
			xReturn = pdPASS;
    80001bc4:	4505                	li	a0,1
    80001bc6:	a011                	j	80001bca <xTaskGenericCreate+0x140>
		xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
    80001bc8:	557d                	li	a0,-1
}
    80001bca:	60a6                	ld	ra,72(sp)
    80001bcc:	6406                	ld	s0,64(sp)
    80001bce:	74e2                	ld	s1,56(sp)
    80001bd0:	7942                	ld	s2,48(sp)
    80001bd2:	79a2                	ld	s3,40(sp)
    80001bd4:	7a02                	ld	s4,32(sp)
    80001bd6:	6ae2                	ld	s5,24(sp)
    80001bd8:	6b42                	ld	s6,16(sp)
    80001bda:	6ba2                	ld	s7,8(sp)
    80001bdc:	6c02                	ld	s8,0(sp)
    80001bde:	6161                	addi	sp,sp,80
    80001be0:	8082                	ret
			xReturn = pdPASS;
    80001be2:	4505                	li	a0,1
    80001be4:	b7dd                	j	80001bca <xTaskGenericCreate+0x140>

0000000080001be6 <vTaskStartScheduler>:
{
    80001be6:	1141                	addi	sp,sp,-16
    80001be8:	e406                	sd	ra,8(sp)
		xReturn = xTaskCreate( prvIdleTask, "IDLE", tskIDLE_STACK_SIZE, ( void * ) NULL, ( tskIDLE_PRIORITY | portPRIVILEGE_BIT ), NULL );  /*lint !e961 MISRA exception, justified as it is not a redundant explicit cast to all supported compilers. */
    80001bea:	4881                	li	a7,0
    80001bec:	4801                	li	a6,0
    80001bee:	4781                	li	a5,0
    80001bf0:	4701                	li	a4,0
    80001bf2:	4681                	li	a3,0
    80001bf4:	40000613          	li	a2,1024
    80001bf8:	0001e597          	auipc	a1,0x1e
    80001bfc:	58858593          	addi	a1,a1,1416 # 80020180 <__rodata_start+0x180>
    80001c00:	00000517          	auipc	a0,0x0
    80001c04:	6fc50513          	addi	a0,a0,1788 # 800022fc <prvIdleTask>
    80001c08:	e83ff0ef          	jal	ra,80001a8a <xTaskGenericCreate>
		if( xReturn == pdPASS )
    80001c0c:	4785                	li	a5,1
    80001c0e:	00f50963          	beq	a0,a5,80001c20 <vTaskStartScheduler+0x3a>
	if( xReturn == pdPASS )
    80001c12:	4785                	li	a5,1
    80001c14:	00f50963          	beq	a0,a5,80001c26 <vTaskStartScheduler+0x40>
		configASSERT( xReturn );
    80001c18:	e90d                	bnez	a0,80001c4a <vTaskStartScheduler+0x64>
    80001c1a:	30047073          	csrci	mstatus,8
    80001c1e:	a001                	j	80001c1e <vTaskStartScheduler+0x38>
			xReturn = xTimerCreateTimerTask();
    80001c20:	5a5000ef          	jal	ra,800029c4 <xTimerCreateTimerTask>
    80001c24:	b7fd                	j	80001c12 <vTaskStartScheduler+0x2c>
		portDISABLE_INTERRUPTS();
    80001c26:	30047073          	csrci	mstatus,8
		xNextTaskUnblockTime = portMAX_DELAY;
    80001c2a:	57fd                	li	a5,-1
    80001c2c:	0001e717          	auipc	a4,0x1e
    80001c30:	70f72e23          	sw	a5,1820(a4) # 80020348 <xNextTaskUnblockTime>
		xSchedulerRunning = pdTRUE;
    80001c34:	4785                	li	a5,1
    80001c36:	0001e717          	auipc	a4,0x1e
    80001c3a:	72f73d23          	sd	a5,1850(a4) # 80020370 <xSchedulerRunning>
		xTickCount = ( TickType_t ) 0U;
    80001c3e:	0001e797          	auipc	a5,0x1e
    80001c42:	7407a123          	sw	zero,1858(a5) # 80020380 <xTickCount>
		if( xPortStartScheduler() != pdFALSE )
    80001c46:	e5efe0ef          	jal	ra,800002a4 <xPortStartScheduler>
}
    80001c4a:	60a2                	ld	ra,8(sp)
    80001c4c:	0141                	addi	sp,sp,16
    80001c4e:	8082                	ret

0000000080001c50 <vTaskDelete>:
	{
    80001c50:	1101                	addi	sp,sp,-32
    80001c52:	ec06                	sd	ra,24(sp)
    80001c54:	e822                	sd	s0,16(sp)
    80001c56:	e426                	sd	s1,8(sp)
    80001c58:	842a                	mv	s0,a0
		taskENTER_CRITICAL();
    80001c5a:	dddff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
			pxTCB = prvGetTCBFromHandle( xTaskToDelete );
    80001c5e:	c82d                	beqz	s0,80001cd0 <vTaskDelete+0x80>
			if( uxListRemove( &( pxTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80001c60:	00840493          	addi	s1,s0,8
    80001c64:	8526                	mv	a0,s1
    80001c66:	939fe0ef          	jal	ra,8000059e <uxListRemove>
			if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    80001c6a:	683c                	ld	a5,80(s0)
    80001c6c:	c789                	beqz	a5,80001c76 <vTaskDelete+0x26>
				( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    80001c6e:	03040513          	addi	a0,s0,48
    80001c72:	92dfe0ef          	jal	ra,8000059e <uxListRemove>
			vListInsertEnd( &xTasksWaitingTermination, &( pxTCB->xGenericListItem ) );
    80001c76:	85a6                	mv	a1,s1
    80001c78:	0001f517          	auipc	a0,0x1f
    80001c7c:	ba850513          	addi	a0,a0,-1112 # 80020820 <xTasksWaitingTermination>
    80001c80:	8dbfe0ef          	jal	ra,8000055a <vListInsertEnd>
			++uxTasksDeleted;
    80001c84:	0001e717          	auipc	a4,0x1e
    80001c88:	70c70713          	addi	a4,a4,1804 # 80020390 <uxTasksDeleted>
    80001c8c:	631c                	ld	a5,0(a4)
    80001c8e:	0785                	addi	a5,a5,1
    80001c90:	e31c                	sd	a5,0(a4)
			uxTaskNumber++;
    80001c92:	0001e717          	auipc	a4,0x1e
    80001c96:	6be70713          	addi	a4,a4,1726 # 80020350 <uxTaskNumber>
    80001c9a:	631c                	ld	a5,0(a4)
    80001c9c:	0785                	addi	a5,a5,1
    80001c9e:	e31c                	sd	a5,0(a4)
		taskEXIT_CRITICAL();
    80001ca0:	db9ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( xSchedulerRunning != pdFALSE )
    80001ca4:	0001e797          	auipc	a5,0x1e
    80001ca8:	6cc7b783          	ld	a5,1740(a5) # 80020370 <xSchedulerRunning>
    80001cac:	cf89                	beqz	a5,80001cc6 <vTaskDelete+0x76>
			if( pxTCB == pxCurrentTCB )
    80001cae:	0001e797          	auipc	a5,0x1e
    80001cb2:	6fa7b783          	ld	a5,1786(a5) # 800203a8 <pxCurrentTCB>
    80001cb6:	02878263          	beq	a5,s0,80001cda <vTaskDelete+0x8a>
				taskENTER_CRITICAL();
    80001cba:	d7dff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
					prvResetNextTaskUnblockTime();
    80001cbe:	bb0ff0ef          	jal	ra,8000106e <prvResetNextTaskUnblockTime>
				taskEXIT_CRITICAL();
    80001cc2:	d97ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
	}
    80001cc6:	60e2                	ld	ra,24(sp)
    80001cc8:	6442                	ld	s0,16(sp)
    80001cca:	64a2                	ld	s1,8(sp)
    80001ccc:	6105                	addi	sp,sp,32
    80001cce:	8082                	ret
			pxTCB = prvGetTCBFromHandle( xTaskToDelete );
    80001cd0:	0001e417          	auipc	s0,0x1e
    80001cd4:	6d843403          	ld	s0,1752(s0) # 800203a8 <pxCurrentTCB>
    80001cd8:	b761                	j	80001c60 <vTaskDelete+0x10>
				configASSERT( uxSchedulerSuspended == 0 );
    80001cda:	0001e797          	auipc	a5,0x1e
    80001cde:	6667b783          	ld	a5,1638(a5) # 80020340 <uxSchedulerSuspended>
    80001ce2:	c781                	beqz	a5,80001cea <vTaskDelete+0x9a>
    80001ce4:	30047073          	csrci	mstatus,8
    80001ce8:	a001                	j	80001ce8 <vTaskDelete+0x98>
				portYIELD_WITHIN_API();
    80001cea:	f22fe0ef          	jal	ra,8000040c <vPortYield>
    80001cee:	bfe1                	j	80001cc6 <vTaskDelete+0x76>

0000000080001cf0 <eTaskGetState>:
		configASSERT( pxTCB );
    80001cf0:	c939                	beqz	a0,80001d46 <eTaskGetState+0x56>
	{
    80001cf2:	1101                	addi	sp,sp,-32
    80001cf4:	ec06                	sd	ra,24(sp)
    80001cf6:	e822                	sd	s0,16(sp)
    80001cf8:	e426                	sd	s1,8(sp)
    80001cfa:	842a                	mv	s0,a0
		if( pxTCB == pxCurrentTCB )
    80001cfc:	0001e797          	auipc	a5,0x1e
    80001d00:	6ac7b783          	ld	a5,1708(a5) # 800203a8 <pxCurrentTCB>
    80001d04:	04a78c63          	beq	a5,a0,80001d5c <eTaskGetState+0x6c>
			taskENTER_CRITICAL();
    80001d08:	d2fff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
				pxStateList = ( List_t * ) listLIST_ITEM_CONTAINER( &( pxTCB->xGenericListItem ) );
    80001d0c:	7404                	ld	s1,40(s0)
			taskEXIT_CRITICAL();
    80001d0e:	d4bff0ef          	jal	ra,80001a58 <vTaskExitCritical>
			if( ( pxStateList == pxDelayedTaskList ) || ( pxStateList == pxOverflowDelayedTaskList ) )
    80001d12:	0001e797          	auipc	a5,0x1e
    80001d16:	68e7b783          	ld	a5,1678(a5) # 800203a0 <pxDelayedTaskList>
    80001d1a:	04978763          	beq	a5,s1,80001d68 <eTaskGetState+0x78>
    80001d1e:	0001e797          	auipc	a5,0x1e
    80001d22:	67a7b783          	ld	a5,1658(a5) # 80020398 <pxOverflowDelayedTaskList>
    80001d26:	04978363          	beq	a5,s1,80001d6c <eTaskGetState+0x7c>
				else if( pxStateList == &xSuspendedTaskList )
    80001d2a:	0001f797          	auipc	a5,0x1f
    80001d2e:	98e78793          	addi	a5,a5,-1650 # 800206b8 <xSuspendedTaskList>
    80001d32:	00f48d63          	beq	s1,a5,80001d4c <eTaskGetState+0x5c>
				else if( pxStateList == &xTasksWaitingTermination )
    80001d36:	0001f797          	auipc	a5,0x1f
    80001d3a:	aea78793          	addi	a5,a5,-1302 # 80020820 <xTasksWaitingTermination>
    80001d3e:	00f48d63          	beq	s1,a5,80001d58 <eTaskGetState+0x68>
				eReturn = eReady;
    80001d42:	4505                	li	a0,1
    80001d44:	a829                	j	80001d5e <eTaskGetState+0x6e>
		configASSERT( pxTCB );
    80001d46:	30047073          	csrci	mstatus,8
    80001d4a:	a001                	j	80001d4a <eTaskGetState+0x5a>
					if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) == NULL )
    80001d4c:	683c                	ld	a5,80(s0)
    80001d4e:	c399                	beqz	a5,80001d54 <eTaskGetState+0x64>
						eReturn = eBlocked;
    80001d50:	4509                	li	a0,2
    80001d52:	a031                	j	80001d5e <eTaskGetState+0x6e>
						eReturn = eSuspended;
    80001d54:	450d                	li	a0,3
    80001d56:	a021                	j	80001d5e <eTaskGetState+0x6e>
					eReturn = eDeleted;
    80001d58:	4511                	li	a0,4
    80001d5a:	a011                	j	80001d5e <eTaskGetState+0x6e>
			eReturn = eRunning;
    80001d5c:	4501                	li	a0,0
	} /*lint !e818 xTask cannot be a pointer to const because it is a typedef. */
    80001d5e:	60e2                	ld	ra,24(sp)
    80001d60:	6442                	ld	s0,16(sp)
    80001d62:	64a2                	ld	s1,8(sp)
    80001d64:	6105                	addi	sp,sp,32
    80001d66:	8082                	ret
				eReturn = eBlocked;
    80001d68:	4509                	li	a0,2
    80001d6a:	bfd5                	j	80001d5e <eTaskGetState+0x6e>
    80001d6c:	4509                	li	a0,2
    80001d6e:	bfc5                	j	80001d5e <eTaskGetState+0x6e>

0000000080001d70 <uxTaskPriorityGet>:
	{
    80001d70:	1141                	addi	sp,sp,-16
    80001d72:	e406                	sd	ra,8(sp)
    80001d74:	e022                	sd	s0,0(sp)
    80001d76:	842a                	mv	s0,a0
		taskENTER_CRITICAL();
    80001d78:	cbfff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
			pxTCB = prvGetTCBFromHandle( xTask );
    80001d7c:	c809                	beqz	s0,80001d8e <uxTaskPriorityGet+0x1e>
			uxReturn = pxTCB->uxPriority;
    80001d7e:	6c20                	ld	s0,88(s0)
		taskEXIT_CRITICAL();
    80001d80:	cd9ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
	}
    80001d84:	8522                	mv	a0,s0
    80001d86:	60a2                	ld	ra,8(sp)
    80001d88:	6402                	ld	s0,0(sp)
    80001d8a:	0141                	addi	sp,sp,16
    80001d8c:	8082                	ret
			pxTCB = prvGetTCBFromHandle( xTask );
    80001d8e:	0001e417          	auipc	s0,0x1e
    80001d92:	61a43403          	ld	s0,1562(s0) # 800203a8 <pxCurrentTCB>
    80001d96:	b7e5                	j	80001d7e <uxTaskPriorityGet+0xe>

0000000080001d98 <vTaskPrioritySet>:
		configASSERT( ( uxNewPriority < configMAX_PRIORITIES ) );
    80001d98:	4791                	li	a5,4
    80001d9a:	00b7f563          	bgeu	a5,a1,80001da4 <vTaskPrioritySet+0xc>
    80001d9e:	30047073          	csrci	mstatus,8
    80001da2:	a001                	j	80001da2 <vTaskPrioritySet+0xa>
	{
    80001da4:	1101                	addi	sp,sp,-32
    80001da6:	ec06                	sd	ra,24(sp)
    80001da8:	e822                	sd	s0,16(sp)
    80001daa:	e426                	sd	s1,8(sp)
    80001dac:	e04a                	sd	s2,0(sp)
    80001dae:	842a                	mv	s0,a0
    80001db0:	84ae                	mv	s1,a1
		taskENTER_CRITICAL();
    80001db2:	c85ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
			pxTCB = prvGetTCBFromHandle( xTask );
    80001db6:	c40d                	beqz	s0,80001de0 <vTaskPrioritySet+0x48>
				uxCurrentBasePriority = pxTCB->uxBasePriority;
    80001db8:	685c                	ld	a5,144(s0)
			if( uxCurrentBasePriority != uxNewPriority )
    80001dba:	06f48763          	beq	s1,a5,80001e28 <vTaskPrioritySet+0x90>
				if( uxNewPriority > uxCurrentBasePriority )
    80001dbe:	0297f663          	bgeu	a5,s1,80001dea <vTaskPrioritySet+0x52>
					if( pxTCB != pxCurrentTCB )
    80001dc2:	0001e717          	auipc	a4,0x1e
    80001dc6:	5e673703          	ld	a4,1510(a4) # 800203a8 <pxCurrentTCB>
    80001dca:	06870763          	beq	a4,s0,80001e38 <vTaskPrioritySet+0xa0>
						if( uxNewPriority >= pxCurrentTCB->uxPriority )
    80001dce:	0001e717          	auipc	a4,0x1e
    80001dd2:	5da73703          	ld	a4,1498(a4) # 800203a8 <pxCurrentTCB>
    80001dd6:	6f38                	ld	a4,88(a4)
    80001dd8:	06e4f263          	bgeu	s1,a4,80001e3c <vTaskPrioritySet+0xa4>
	BaseType_t xYieldRequired = pdFALSE;
    80001ddc:	4901                	li	s2,0
    80001dde:	a829                	j	80001df8 <vTaskPrioritySet+0x60>
			pxTCB = prvGetTCBFromHandle( xTask );
    80001de0:	0001e417          	auipc	s0,0x1e
    80001de4:	5c843403          	ld	s0,1480(s0) # 800203a8 <pxCurrentTCB>
    80001de8:	bfc1                	j	80001db8 <vTaskPrioritySet+0x20>
				else if( pxTCB == pxCurrentTCB )
    80001dea:	0001e717          	auipc	a4,0x1e
    80001dee:	5be73703          	ld	a4,1470(a4) # 800203a8 <pxCurrentTCB>
    80001df2:	04870763          	beq	a4,s0,80001e40 <vTaskPrioritySet+0xa8>
	BaseType_t xYieldRequired = pdFALSE;
    80001df6:	4901                	li	s2,0
				uxPriorityUsedOnEntry = pxTCB->uxPriority;
    80001df8:	6c38                	ld	a4,88(s0)
					if( pxTCB->uxBasePriority == pxTCB->uxPriority )
    80001dfa:	04e78563          	beq	a5,a4,80001e44 <vTaskPrioritySet+0xac>
					pxTCB->uxBasePriority = uxNewPriority;
    80001dfe:	e844                	sd	s1,144(s0)
				if( ( listGET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ) ) & taskEVENT_LIST_ITEM_VALUE_IN_USE ) == 0UL )
    80001e00:	581c                	lw	a5,48(s0)
    80001e02:	0007c563          	bltz	a5,80001e0c <vTaskPrioritySet+0x74>
					listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxNewPriority ) ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    80001e06:	4795                	li	a5,5
    80001e08:	9f85                	subw	a5,a5,s1
    80001e0a:	d81c                	sw	a5,48(s0)
				if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ uxPriorityUsedOnEntry ] ), &( pxTCB->xGenericListItem ) ) != pdFALSE )
    80001e0c:	7414                	ld	a3,40(s0)
    80001e0e:	00271793          	slli	a5,a4,0x2
    80001e12:	97ba                	add	a5,a5,a4
    80001e14:	078e                	slli	a5,a5,0x3
    80001e16:	0001f717          	auipc	a4,0x1f
    80001e1a:	8f270713          	addi	a4,a4,-1806 # 80020708 <pxReadyTasksLists>
    80001e1e:	97ba                	add	a5,a5,a4
    80001e20:	02f68463          	beq	a3,a5,80001e48 <vTaskPrioritySet+0xb0>
				if( xYieldRequired == pdTRUE )
    80001e24:	04091f63          	bnez	s2,80001e82 <vTaskPrioritySet+0xea>
		taskEXIT_CRITICAL();
    80001e28:	c31ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
	}
    80001e2c:	60e2                	ld	ra,24(sp)
    80001e2e:	6442                	ld	s0,16(sp)
    80001e30:	64a2                	ld	s1,8(sp)
    80001e32:	6902                	ld	s2,0(sp)
    80001e34:	6105                	addi	sp,sp,32
    80001e36:	8082                	ret
	BaseType_t xYieldRequired = pdFALSE;
    80001e38:	4901                	li	s2,0
    80001e3a:	bf7d                	j	80001df8 <vTaskPrioritySet+0x60>
							xYieldRequired = pdTRUE;
    80001e3c:	4905                	li	s2,1
    80001e3e:	bf6d                	j	80001df8 <vTaskPrioritySet+0x60>
					xYieldRequired = pdTRUE;
    80001e40:	4905                	li	s2,1
    80001e42:	bf5d                	j	80001df8 <vTaskPrioritySet+0x60>
						pxTCB->uxPriority = uxNewPriority;
    80001e44:	ec24                	sd	s1,88(s0)
    80001e46:	bf65                	j	80001dfe <vTaskPrioritySet+0x66>
					if( uxListRemove( &( pxTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80001e48:	00840493          	addi	s1,s0,8
    80001e4c:	8526                	mv	a0,s1
    80001e4e:	f50fe0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    80001e52:	6c38                	ld	a4,88(s0)
    80001e54:	0001e797          	auipc	a5,0x1e
    80001e58:	5247b783          	ld	a5,1316(a5) # 80020378 <uxTopReadyPriority>
    80001e5c:	00e7f663          	bgeu	a5,a4,80001e68 <vTaskPrioritySet+0xd0>
    80001e60:	0001e797          	auipc	a5,0x1e
    80001e64:	50e7bc23          	sd	a4,1304(a5) # 80020378 <uxTopReadyPriority>
    80001e68:	00271793          	slli	a5,a4,0x2
    80001e6c:	97ba                	add	a5,a5,a4
    80001e6e:	078e                	slli	a5,a5,0x3
    80001e70:	85a6                	mv	a1,s1
    80001e72:	0001f517          	auipc	a0,0x1f
    80001e76:	89650513          	addi	a0,a0,-1898 # 80020708 <pxReadyTasksLists>
    80001e7a:	953e                	add	a0,a0,a5
    80001e7c:	edefe0ef          	jal	ra,8000055a <vListInsertEnd>
    80001e80:	b755                	j	80001e24 <vTaskPrioritySet+0x8c>
					taskYIELD_IF_USING_PREEMPTION();
    80001e82:	d8afe0ef          	jal	ra,8000040c <vPortYield>
    80001e86:	b74d                	j	80001e28 <vTaskPrioritySet+0x90>

0000000080001e88 <vTaskSuspend>:
	{
    80001e88:	1101                	addi	sp,sp,-32
    80001e8a:	ec06                	sd	ra,24(sp)
    80001e8c:	e822                	sd	s0,16(sp)
    80001e8e:	e426                	sd	s1,8(sp)
    80001e90:	842a                	mv	s0,a0
		taskENTER_CRITICAL();
    80001e92:	ba5ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
			pxTCB = prvGetTCBFromHandle( xTaskToSuspend );
    80001e96:	c429                	beqz	s0,80001ee0 <vTaskSuspend+0x58>
			if( uxListRemove( &( pxTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80001e98:	00840493          	addi	s1,s0,8
    80001e9c:	8526                	mv	a0,s1
    80001e9e:	f00fe0ef          	jal	ra,8000059e <uxListRemove>
			if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    80001ea2:	683c                	ld	a5,80(s0)
    80001ea4:	c789                	beqz	a5,80001eae <vTaskSuspend+0x26>
				( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    80001ea6:	03040513          	addi	a0,s0,48
    80001eaa:	ef4fe0ef          	jal	ra,8000059e <uxListRemove>
			vListInsertEnd( &xSuspendedTaskList, &( pxTCB->xGenericListItem ) );
    80001eae:	85a6                	mv	a1,s1
    80001eb0:	0001f517          	auipc	a0,0x1f
    80001eb4:	80850513          	addi	a0,a0,-2040 # 800206b8 <xSuspendedTaskList>
    80001eb8:	ea2fe0ef          	jal	ra,8000055a <vListInsertEnd>
		taskEXIT_CRITICAL();
    80001ebc:	b9dff0ef          	jal	ra,80001a58 <vTaskExitCritical>
		if( pxTCB == pxCurrentTCB )
    80001ec0:	0001e797          	auipc	a5,0x1e
    80001ec4:	4e87b783          	ld	a5,1256(a5) # 800203a8 <pxCurrentTCB>
    80001ec8:	02878163          	beq	a5,s0,80001eea <vTaskSuspend+0x62>
			if( xSchedulerRunning != pdFALSE )
    80001ecc:	0001e797          	auipc	a5,0x1e
    80001ed0:	4a47b783          	ld	a5,1188(a5) # 80020370 <xSchedulerRunning>
    80001ed4:	efa9                	bnez	a5,80001f2e <vTaskSuspend+0xa6>
	}
    80001ed6:	60e2                	ld	ra,24(sp)
    80001ed8:	6442                	ld	s0,16(sp)
    80001eda:	64a2                	ld	s1,8(sp)
    80001edc:	6105                	addi	sp,sp,32
    80001ede:	8082                	ret
			pxTCB = prvGetTCBFromHandle( xTaskToSuspend );
    80001ee0:	0001e417          	auipc	s0,0x1e
    80001ee4:	4c843403          	ld	s0,1224(s0) # 800203a8 <pxCurrentTCB>
    80001ee8:	bf45                	j	80001e98 <vTaskSuspend+0x10>
			if( xSchedulerRunning != pdFALSE )
    80001eea:	0001e797          	auipc	a5,0x1e
    80001eee:	4867b783          	ld	a5,1158(a5) # 80020370 <xSchedulerRunning>
    80001ef2:	cf81                	beqz	a5,80001f0a <vTaskSuspend+0x82>
				configASSERT( uxSchedulerSuspended == 0 );
    80001ef4:	0001e797          	auipc	a5,0x1e
    80001ef8:	44c7b783          	ld	a5,1100(a5) # 80020340 <uxSchedulerSuspended>
    80001efc:	c781                	beqz	a5,80001f04 <vTaskSuspend+0x7c>
    80001efe:	30047073          	csrci	mstatus,8
    80001f02:	a001                	j	80001f02 <vTaskSuspend+0x7a>
				portYIELD_WITHIN_API();
    80001f04:	d08fe0ef          	jal	ra,8000040c <vPortYield>
    80001f08:	b7f9                	j	80001ed6 <vTaskSuspend+0x4e>
				if( listCURRENT_LIST_LENGTH( &xSuspendedTaskList ) == uxCurrentNumberOfTasks )
    80001f0a:	0001e717          	auipc	a4,0x1e
    80001f0e:	7ae73703          	ld	a4,1966(a4) # 800206b8 <xSuspendedTaskList>
    80001f12:	0001e797          	auipc	a5,0x1e
    80001f16:	4767b783          	ld	a5,1142(a5) # 80020388 <uxCurrentNumberOfTasks>
    80001f1a:	00f71763          	bne	a4,a5,80001f28 <vTaskSuspend+0xa0>
					pxCurrentTCB = NULL;
    80001f1e:	0001e797          	auipc	a5,0x1e
    80001f22:	4807b523          	sd	zero,1162(a5) # 800203a8 <pxCurrentTCB>
    80001f26:	bf45                	j	80001ed6 <vTaskSuspend+0x4e>
					vTaskSwitchContext();
    80001f28:	dccff0ef          	jal	ra,800014f4 <vTaskSwitchContext>
    80001f2c:	b76d                	j	80001ed6 <vTaskSuspend+0x4e>
				taskENTER_CRITICAL();
    80001f2e:	b09ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
					prvResetNextTaskUnblockTime();
    80001f32:	93cff0ef          	jal	ra,8000106e <prvResetNextTaskUnblockTime>
				taskEXIT_CRITICAL();
    80001f36:	b23ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
	}
    80001f3a:	bf71                	j	80001ed6 <vTaskSuspend+0x4e>

0000000080001f3c <vTaskResume>:
		configASSERT( xTaskToResume );
    80001f3c:	c91d                	beqz	a0,80001f72 <vTaskResume+0x36>
	{
    80001f3e:	1101                	addi	sp,sp,-32
    80001f40:	ec06                	sd	ra,24(sp)
    80001f42:	e822                	sd	s0,16(sp)
    80001f44:	e426                	sd	s1,8(sp)
    80001f46:	842a                	mv	s0,a0
		if( ( pxTCB != NULL ) && ( pxTCB != pxCurrentTCB ) )
    80001f48:	0001e797          	auipc	a5,0x1e
    80001f4c:	4607b783          	ld	a5,1120(a5) # 800203a8 <pxCurrentTCB>
    80001f50:	00a78c63          	beq	a5,a0,80001f68 <vTaskResume+0x2c>
			taskENTER_CRITICAL();
    80001f54:	ae3ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
				if( prvTaskIsTaskSuspended( pxTCB ) == pdTRUE )
    80001f58:	8522                	mv	a0,s0
    80001f5a:	802ff0ef          	jal	ra,80000f5c <prvTaskIsTaskSuspended>
    80001f5e:	4785                	li	a5,1
    80001f60:	00f50c63          	beq	a0,a5,80001f78 <vTaskResume+0x3c>
			taskEXIT_CRITICAL();
    80001f64:	af5ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
	}
    80001f68:	60e2                	ld	ra,24(sp)
    80001f6a:	6442                	ld	s0,16(sp)
    80001f6c:	64a2                	ld	s1,8(sp)
    80001f6e:	6105                	addi	sp,sp,32
    80001f70:	8082                	ret
		configASSERT( xTaskToResume );
    80001f72:	30047073          	csrci	mstatus,8
    80001f76:	a001                	j	80001f76 <vTaskResume+0x3a>
					( void ) uxListRemove(  &( pxTCB->xGenericListItem ) );
    80001f78:	00840493          	addi	s1,s0,8
    80001f7c:	8526                	mv	a0,s1
    80001f7e:	e20fe0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    80001f82:	6c38                	ld	a4,88(s0)
    80001f84:	0001e797          	auipc	a5,0x1e
    80001f88:	3f47b783          	ld	a5,1012(a5) # 80020378 <uxTopReadyPriority>
    80001f8c:	00e7f663          	bgeu	a5,a4,80001f98 <vTaskResume+0x5c>
    80001f90:	0001e797          	auipc	a5,0x1e
    80001f94:	3ee7b423          	sd	a4,1000(a5) # 80020378 <uxTopReadyPriority>
    80001f98:	00271793          	slli	a5,a4,0x2
    80001f9c:	97ba                	add	a5,a5,a4
    80001f9e:	078e                	slli	a5,a5,0x3
    80001fa0:	85a6                	mv	a1,s1
    80001fa2:	0001e517          	auipc	a0,0x1e
    80001fa6:	76650513          	addi	a0,a0,1894 # 80020708 <pxReadyTasksLists>
    80001faa:	953e                	add	a0,a0,a5
    80001fac:	daefe0ef          	jal	ra,8000055a <vListInsertEnd>
					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    80001fb0:	6c38                	ld	a4,88(s0)
    80001fb2:	0001e797          	auipc	a5,0x1e
    80001fb6:	3f67b783          	ld	a5,1014(a5) # 800203a8 <pxCurrentTCB>
    80001fba:	6fbc                	ld	a5,88(a5)
    80001fbc:	faf764e3          	bltu	a4,a5,80001f64 <vTaskResume+0x28>
						taskYIELD_IF_USING_PREEMPTION();
    80001fc0:	c4cfe0ef          	jal	ra,8000040c <vPortYield>
    80001fc4:	b745                	j	80001f64 <vTaskResume+0x28>

0000000080001fc6 <xTaskResumeAll>:
	configASSERT( uxSchedulerSuspended );
    80001fc6:	0001e797          	auipc	a5,0x1e
    80001fca:	37a7b783          	ld	a5,890(a5) # 80020340 <uxSchedulerSuspended>
    80001fce:	e781                	bnez	a5,80001fd6 <xTaskResumeAll+0x10>
    80001fd0:	30047073          	csrci	mstatus,8
    80001fd4:	a001                	j	80001fd4 <xTaskResumeAll+0xe>
{
    80001fd6:	1101                	addi	sp,sp,-32
    80001fd8:	ec06                	sd	ra,24(sp)
    80001fda:	e822                	sd	s0,16(sp)
    80001fdc:	e426                	sd	s1,8(sp)
	taskENTER_CRITICAL();
    80001fde:	a59ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		--uxSchedulerSuspended;
    80001fe2:	0001e797          	auipc	a5,0x1e
    80001fe6:	35e78793          	addi	a5,a5,862 # 80020340 <uxSchedulerSuspended>
    80001fea:	6398                	ld	a4,0(a5)
    80001fec:	177d                	addi	a4,a4,-1
    80001fee:	e398                	sd	a4,0(a5)
		if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    80001ff0:	639c                	ld	a5,0(a5)
    80001ff2:	e7f9                	bnez	a5,800020c0 <xTaskResumeAll+0xfa>
			if( uxCurrentNumberOfTasks > ( UBaseType_t ) 0U )
    80001ff4:	0001e797          	auipc	a5,0x1e
    80001ff8:	3947b783          	ld	a5,916(a5) # 80020388 <uxCurrentNumberOfTasks>
    80001ffc:	e79d                	bnez	a5,8000202a <xTaskResumeAll+0x64>
BaseType_t xAlreadyYielded = pdFALSE;
    80001ffe:	4401                	li	s0,0
    80002000:	a0c9                	j	800020c2 <xTaskResumeAll+0xfc>
					prvAddTaskToReadyList( pxTCB );
    80002002:	00271793          	slli	a5,a4,0x2
    80002006:	97ba                	add	a5,a5,a4
    80002008:	078e                	slli	a5,a5,0x3
    8000200a:	85a6                	mv	a1,s1
    8000200c:	0001e517          	auipc	a0,0x1e
    80002010:	6fc50513          	addi	a0,a0,1788 # 80020708 <pxReadyTasksLists>
    80002014:	953e                	add	a0,a0,a5
    80002016:	d44fe0ef          	jal	ra,8000055a <vListInsertEnd>
					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    8000201a:	6c38                	ld	a4,88(s0)
    8000201c:	0001e797          	auipc	a5,0x1e
    80002020:	38c7b783          	ld	a5,908(a5) # 800203a8 <pxCurrentTCB>
    80002024:	6fbc                	ld	a5,88(a5)
    80002026:	04f77163          	bgeu	a4,a5,80002068 <xTaskResumeAll+0xa2>
				while( listLIST_IS_EMPTY( &xPendingReadyList ) == pdFALSE )
    8000202a:	0001e797          	auipc	a5,0x1e
    8000202e:	6b67b783          	ld	a5,1718(a5) # 800206e0 <xPendingReadyList>
    80002032:	c3a9                	beqz	a5,80002074 <xTaskResumeAll+0xae>
					pxTCB = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) );
    80002034:	0001e797          	auipc	a5,0x1e
    80002038:	6c47b783          	ld	a5,1732(a5) # 800206f8 <xPendingReadyList+0x18>
    8000203c:	6f80                	ld	s0,24(a5)
					( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    8000203e:	03040513          	addi	a0,s0,48
    80002042:	d5cfe0ef          	jal	ra,8000059e <uxListRemove>
					( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    80002046:	00840493          	addi	s1,s0,8
    8000204a:	8526                	mv	a0,s1
    8000204c:	d52fe0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    80002050:	6c38                	ld	a4,88(s0)
    80002052:	0001e797          	auipc	a5,0x1e
    80002056:	3267b783          	ld	a5,806(a5) # 80020378 <uxTopReadyPriority>
    8000205a:	fae7f4e3          	bgeu	a5,a4,80002002 <xTaskResumeAll+0x3c>
    8000205e:	0001e797          	auipc	a5,0x1e
    80002062:	30e7bd23          	sd	a4,794(a5) # 80020378 <uxTopReadyPriority>
    80002066:	bf71                	j	80002002 <xTaskResumeAll+0x3c>
						xYieldPending = pdTRUE;
    80002068:	4785                	li	a5,1
    8000206a:	0001e717          	auipc	a4,0x1e
    8000206e:	2ef73b23          	sd	a5,758(a4) # 80020360 <xYieldPending>
    80002072:	bf65                	j	8000202a <xTaskResumeAll+0x64>
				if( uxPendedTicks > ( UBaseType_t ) 0U )
    80002074:	0001e797          	auipc	a5,0x1e
    80002078:	2f47b783          	ld	a5,756(a5) # 80020368 <uxPendedTicks>
    8000207c:	e38d                	bnez	a5,8000209e <xTaskResumeAll+0xd8>
				if( xYieldPending == pdTRUE )
    8000207e:	0001e417          	auipc	s0,0x1e
    80002082:	2e243403          	ld	s0,738(s0) # 80020360 <xYieldPending>
    80002086:	4785                	li	a5,1
    80002088:	02f40963          	beq	s0,a5,800020ba <xTaskResumeAll+0xf4>
BaseType_t xAlreadyYielded = pdFALSE;
    8000208c:	4401                	li	s0,0
    8000208e:	a815                	j	800020c2 <xTaskResumeAll+0xfc>
						--uxPendedTicks;
    80002090:	0001e717          	auipc	a4,0x1e
    80002094:	2d870713          	addi	a4,a4,728 # 80020368 <uxPendedTicks>
    80002098:	631c                	ld	a5,0(a4)
    8000209a:	17fd                	addi	a5,a5,-1
    8000209c:	e31c                	sd	a5,0(a4)
					while( uxPendedTicks > ( UBaseType_t ) 0U )
    8000209e:	0001e797          	auipc	a5,0x1e
    800020a2:	2ca7b783          	ld	a5,714(a5) # 80020368 <uxPendedTicks>
    800020a6:	dfe1                	beqz	a5,8000207e <xTaskResumeAll+0xb8>
						if( xTaskIncrementTick() != pdFALSE )
    800020a8:	aeaff0ef          	jal	ra,80001392 <xTaskIncrementTick>
    800020ac:	d175                	beqz	a0,80002090 <xTaskResumeAll+0xca>
							xYieldPending = pdTRUE;
    800020ae:	4785                	li	a5,1
    800020b0:	0001e717          	auipc	a4,0x1e
    800020b4:	2af73823          	sd	a5,688(a4) # 80020360 <xYieldPending>
    800020b8:	bfe1                	j	80002090 <xTaskResumeAll+0xca>
					taskYIELD_IF_USING_PREEMPTION();
    800020ba:	b52fe0ef          	jal	ra,8000040c <vPortYield>
    800020be:	a011                	j	800020c2 <xTaskResumeAll+0xfc>
BaseType_t xAlreadyYielded = pdFALSE;
    800020c0:	4401                	li	s0,0
	taskEXIT_CRITICAL();
    800020c2:	997ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    800020c6:	8522                	mv	a0,s0
    800020c8:	60e2                	ld	ra,24(sp)
    800020ca:	6442                	ld	s0,16(sp)
    800020cc:	64a2                	ld	s1,8(sp)
    800020ce:	6105                	addi	sp,sp,32
    800020d0:	8082                	ret

00000000800020d2 <vTaskDelayUntil>:
		configASSERT( pxPreviousWakeTime );
    800020d2:	c919                	beqz	a0,800020e8 <vTaskDelayUntil+0x16>
	{
    800020d4:	1101                	addi	sp,sp,-32
    800020d6:	ec06                	sd	ra,24(sp)
    800020d8:	e822                	sd	s0,16(sp)
    800020da:	e426                	sd	s1,8(sp)
    800020dc:	842a                	mv	s0,a0
    800020de:	84ae                	mv	s1,a1
		configASSERT( ( xTimeIncrement > 0U ) );
    800020e0:	e599                	bnez	a1,800020ee <vTaskDelayUntil+0x1c>
    800020e2:	30047073          	csrci	mstatus,8
    800020e6:	a001                	j	800020e6 <vTaskDelayUntil+0x14>
		configASSERT( pxPreviousWakeTime );
    800020e8:	30047073          	csrci	mstatus,8
    800020ec:	a001                	j	800020ec <vTaskDelayUntil+0x1a>
		configASSERT( uxSchedulerSuspended == 0 );
    800020ee:	0001e797          	auipc	a5,0x1e
    800020f2:	2527b783          	ld	a5,594(a5) # 80020340 <uxSchedulerSuspended>
    800020f6:	c781                	beqz	a5,800020fe <vTaskDelayUntil+0x2c>
    800020f8:	30047073          	csrci	mstatus,8
    800020fc:	a001                	j	800020fc <vTaskDelayUntil+0x2a>
		vTaskSuspendAll();
    800020fe:	a5aff0ef          	jal	ra,80001358 <vTaskSuspendAll>
			const TickType_t xConstTickCount = xTickCount;
    80002102:	0001e717          	auipc	a4,0x1e
    80002106:	27e72703          	lw	a4,638(a4) # 80020380 <xTickCount>
			xTimeToWake = *pxPreviousWakeTime + xTimeIncrement;
    8000210a:	401c                	lw	a5,0(s0)
    8000210c:	009785bb          	addw	a1,a5,s1
    80002110:	0005849b          	sext.w	s1,a1
			if( xConstTickCount < *pxPreviousWakeTime )
    80002114:	00f77c63          	bgeu	a4,a5,8000212c <vTaskDelayUntil+0x5a>
				if( ( xTimeToWake < *pxPreviousWakeTime ) && ( xTimeToWake > xConstTickCount ) )
    80002118:	00f4e463          	bltu	s1,a5,80002120 <vTaskDelayUntil+0x4e>
			*pxPreviousWakeTime = xTimeToWake;
    8000211c:	c00c                	sw	a1,0(s0)
			if( xShouldDelay != pdFALSE )
    8000211e:	a035                	j	8000214a <vTaskDelayUntil+0x78>
				if( ( xTimeToWake < *pxPreviousWakeTime ) && ( xTimeToWake > xConstTickCount ) )
    80002120:	00976463          	bltu	a4,s1,80002128 <vTaskDelayUntil+0x56>
			*pxPreviousWakeTime = xTimeToWake;
    80002124:	c00c                	sw	a1,0(s0)
			if( xShouldDelay != pdFALSE )
    80002126:	a015                	j	8000214a <vTaskDelayUntil+0x78>
			*pxPreviousWakeTime = xTimeToWake;
    80002128:	c00c                	sw	a1,0(s0)
			if( xShouldDelay != pdFALSE )
    8000212a:	a031                	j	80002136 <vTaskDelayUntil+0x64>
				if( ( xTimeToWake < *pxPreviousWakeTime ) || ( xTimeToWake > xConstTickCount ) )
    8000212c:	00f4e463          	bltu	s1,a5,80002134 <vTaskDelayUntil+0x62>
    80002130:	02977563          	bgeu	a4,s1,8000215a <vTaskDelayUntil+0x88>
			*pxPreviousWakeTime = xTimeToWake;
    80002134:	c00c                	sw	a1,0(s0)
				if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80002136:	0001e517          	auipc	a0,0x1e
    8000213a:	27253503          	ld	a0,626(a0) # 800203a8 <pxCurrentTCB>
    8000213e:	0521                	addi	a0,a0,8
    80002140:	c5efe0ef          	jal	ra,8000059e <uxListRemove>
				prvAddCurrentTaskToDelayedList( xTimeToWake );
    80002144:	8526                	mv	a0,s1
    80002146:	8bcff0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
		xAlreadyYielded = xTaskResumeAll();
    8000214a:	e7dff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
		if( xAlreadyYielded == pdFALSE )
    8000214e:	c901                	beqz	a0,8000215e <vTaskDelayUntil+0x8c>
	}
    80002150:	60e2                	ld	ra,24(sp)
    80002152:	6442                	ld	s0,16(sp)
    80002154:	64a2                	ld	s1,8(sp)
    80002156:	6105                	addi	sp,sp,32
    80002158:	8082                	ret
			*pxPreviousWakeTime = xTimeToWake;
    8000215a:	c00c                	sw	a1,0(s0)
			if( xShouldDelay != pdFALSE )
    8000215c:	b7fd                	j	8000214a <vTaskDelayUntil+0x78>
			portYIELD_WITHIN_API();
    8000215e:	aaefe0ef          	jal	ra,8000040c <vPortYield>
	}
    80002162:	b7fd                	j	80002150 <vTaskDelayUntil+0x7e>

0000000080002164 <vTaskDelay>:
	{
    80002164:	1141                	addi	sp,sp,-16
    80002166:	e406                	sd	ra,8(sp)
    80002168:	e022                	sd	s0,0(sp)
		if( xTicksToDelay > ( TickType_t ) 0U )
    8000216a:	cd15                	beqz	a0,800021a6 <vTaskDelay+0x42>
    8000216c:	842a                	mv	s0,a0
			configASSERT( uxSchedulerSuspended == 0 );
    8000216e:	0001e797          	auipc	a5,0x1e
    80002172:	1d27b783          	ld	a5,466(a5) # 80020340 <uxSchedulerSuspended>
    80002176:	c781                	beqz	a5,8000217e <vTaskDelay+0x1a>
    80002178:	30047073          	csrci	mstatus,8
    8000217c:	a001                	j	8000217c <vTaskDelay+0x18>
			vTaskSuspendAll();
    8000217e:	9daff0ef          	jal	ra,80001358 <vTaskSuspendAll>
				xTimeToWake = xTickCount + xTicksToDelay;
    80002182:	0001e797          	auipc	a5,0x1e
    80002186:	1fe7a783          	lw	a5,510(a5) # 80020380 <xTickCount>
    8000218a:	9c3d                	addw	s0,s0,a5
				if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    8000218c:	0001e517          	auipc	a0,0x1e
    80002190:	21c53503          	ld	a0,540(a0) # 800203a8 <pxCurrentTCB>
    80002194:	0521                	addi	a0,a0,8
    80002196:	c08fe0ef          	jal	ra,8000059e <uxListRemove>
				prvAddCurrentTaskToDelayedList( xTimeToWake );
    8000219a:	8522                	mv	a0,s0
    8000219c:	866ff0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
			xAlreadyYielded = xTaskResumeAll();
    800021a0:	e27ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
		if( xAlreadyYielded == pdFALSE )
    800021a4:	e119                	bnez	a0,800021aa <vTaskDelay+0x46>
			portYIELD_WITHIN_API();
    800021a6:	a66fe0ef          	jal	ra,8000040c <vPortYield>
	}
    800021aa:	60a2                	ld	ra,8(sp)
    800021ac:	6402                	ld	s0,0(sp)
    800021ae:	0141                	addi	sp,sp,16
    800021b0:	8082                	ret

00000000800021b2 <uxTaskGetSystemState>:
	{
    800021b2:	7179                	addi	sp,sp,-48
    800021b4:	f406                	sd	ra,40(sp)
    800021b6:	f022                	sd	s0,32(sp)
    800021b8:	ec26                	sd	s1,24(sp)
    800021ba:	e84a                	sd	s2,16(sp)
    800021bc:	e44e                	sd	s3,8(sp)
    800021be:	892a                	mv	s2,a0
    800021c0:	842e                	mv	s0,a1
    800021c2:	84b2                	mv	s1,a2
		vTaskSuspendAll();
    800021c4:	994ff0ef          	jal	ra,80001358 <vTaskSuspendAll>
			if( uxArraySize >= uxCurrentNumberOfTasks )
    800021c8:	0001e797          	auipc	a5,0x1e
    800021cc:	1c07b783          	ld	a5,448(a5) # 80020388 <uxCurrentNumberOfTasks>
    800021d0:	0af46163          	bltu	s0,a5,80002272 <uxTaskGetSystemState+0xc0>
	UBaseType_t uxTask = 0, uxQueue = configMAX_PRIORITIES;
    800021d4:	4995                	li	s3,5
    800021d6:	4401                	li	s0,0
					uxQueue--;
    800021d8:	19fd                	addi	s3,s3,-1
					uxTask += prvListTaskWithinSingleList( &( pxTaskStatusArray[ uxTask ] ), &( pxReadyTasksLists[ uxQueue ] ), eReady );
    800021da:	00341513          	slli	a0,s0,0x3
    800021de:	8d01                	sub	a0,a0,s0
    800021e0:	050e                	slli	a0,a0,0x3
    800021e2:	00299793          	slli	a5,s3,0x2
    800021e6:	97ce                	add	a5,a5,s3
    800021e8:	078e                	slli	a5,a5,0x3
    800021ea:	4605                	li	a2,1
    800021ec:	0001e597          	auipc	a1,0x1e
    800021f0:	51c58593          	addi	a1,a1,1308 # 80020708 <pxReadyTasksLists>
    800021f4:	95be                	add	a1,a1,a5
    800021f6:	954a                	add	a0,a0,s2
    800021f8:	db9fe0ef          	jal	ra,80000fb0 <prvListTaskWithinSingleList>
    800021fc:	942a                	add	s0,s0,a0
				} while( uxQueue > ( UBaseType_t ) tskIDLE_PRIORITY ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800021fe:	fc099de3          	bnez	s3,800021d8 <uxTaskGetSystemState+0x26>
				uxTask += prvListTaskWithinSingleList( &( pxTaskStatusArray[ uxTask ] ), ( List_t * ) pxDelayedTaskList, eBlocked );
    80002202:	00341513          	slli	a0,s0,0x3
    80002206:	8d01                	sub	a0,a0,s0
    80002208:	050e                	slli	a0,a0,0x3
    8000220a:	4609                	li	a2,2
    8000220c:	0001e597          	auipc	a1,0x1e
    80002210:	1945b583          	ld	a1,404(a1) # 800203a0 <pxDelayedTaskList>
    80002214:	954a                	add	a0,a0,s2
    80002216:	d9bfe0ef          	jal	ra,80000fb0 <prvListTaskWithinSingleList>
    8000221a:	942a                	add	s0,s0,a0
				uxTask += prvListTaskWithinSingleList( &( pxTaskStatusArray[ uxTask ] ), ( List_t * ) pxOverflowDelayedTaskList, eBlocked );
    8000221c:	00341513          	slli	a0,s0,0x3
    80002220:	8d01                	sub	a0,a0,s0
    80002222:	050e                	slli	a0,a0,0x3
    80002224:	4609                	li	a2,2
    80002226:	0001e597          	auipc	a1,0x1e
    8000222a:	1725b583          	ld	a1,370(a1) # 80020398 <pxOverflowDelayedTaskList>
    8000222e:	954a                	add	a0,a0,s2
    80002230:	d81fe0ef          	jal	ra,80000fb0 <prvListTaskWithinSingleList>
    80002234:	942a                	add	s0,s0,a0
					uxTask += prvListTaskWithinSingleList( &( pxTaskStatusArray[ uxTask ] ), &xTasksWaitingTermination, eDeleted );
    80002236:	00341513          	slli	a0,s0,0x3
    8000223a:	8d01                	sub	a0,a0,s0
    8000223c:	050e                	slli	a0,a0,0x3
    8000223e:	4611                	li	a2,4
    80002240:	0001e597          	auipc	a1,0x1e
    80002244:	5e058593          	addi	a1,a1,1504 # 80020820 <xTasksWaitingTermination>
    80002248:	954a                	add	a0,a0,s2
    8000224a:	d67fe0ef          	jal	ra,80000fb0 <prvListTaskWithinSingleList>
    8000224e:	942a                	add	s0,s0,a0
					uxTask += prvListTaskWithinSingleList( &( pxTaskStatusArray[ uxTask ] ), &xSuspendedTaskList, eSuspended );
    80002250:	00341513          	slli	a0,s0,0x3
    80002254:	8d01                	sub	a0,a0,s0
    80002256:	050e                	slli	a0,a0,0x3
    80002258:	460d                	li	a2,3
    8000225a:	0001e597          	auipc	a1,0x1e
    8000225e:	45e58593          	addi	a1,a1,1118 # 800206b8 <xSuspendedTaskList>
    80002262:	954a                	add	a0,a0,s2
    80002264:	d4dfe0ef          	jal	ra,80000fb0 <prvListTaskWithinSingleList>
    80002268:	942a                	add	s0,s0,a0
					if( pulTotalRunTime != NULL )
    8000226a:	c489                	beqz	s1,80002274 <uxTaskGetSystemState+0xc2>
						*pulTotalRunTime = 0;
    8000226c:	0004a023          	sw	zero,0(s1)
    80002270:	a011                	j	80002274 <uxTaskGetSystemState+0xc2>
	UBaseType_t uxTask = 0, uxQueue = configMAX_PRIORITIES;
    80002272:	4401                	li	s0,0
		( void ) xTaskResumeAll();
    80002274:	d53ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
	}
    80002278:	8522                	mv	a0,s0
    8000227a:	70a2                	ld	ra,40(sp)
    8000227c:	7402                	ld	s0,32(sp)
    8000227e:	64e2                	ld	s1,24(sp)
    80002280:	6942                	ld	s2,16(sp)
    80002282:	69a2                	ld	s3,8(sp)
    80002284:	6145                	addi	sp,sp,48
    80002286:	8082                	ret

0000000080002288 <prvCheckTasksWaitingTermination>:
		while( uxTasksDeleted > ( UBaseType_t ) 0U )
    80002288:	0001e797          	auipc	a5,0x1e
    8000228c:	1087b783          	ld	a5,264(a5) # 80020390 <uxTasksDeleted>
    80002290:	c7ad                	beqz	a5,800022fa <prvCheckTasksWaitingTermination+0x72>
{
    80002292:	1141                	addi	sp,sp,-16
    80002294:	e406                	sd	ra,8(sp)
    80002296:	e022                	sd	s0,0(sp)
			vTaskSuspendAll();
    80002298:	8c0ff0ef          	jal	ra,80001358 <vTaskSuspendAll>
				xListIsEmpty = listLIST_IS_EMPTY( &xTasksWaitingTermination );
    8000229c:	0001e417          	auipc	s0,0x1e
    800022a0:	58443403          	ld	s0,1412(s0) # 80020820 <xTasksWaitingTermination>
			( void ) xTaskResumeAll();
    800022a4:	d23ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
			if( xListIsEmpty == pdFALSE )
    800022a8:	e811                	bnez	s0,800022bc <prvCheckTasksWaitingTermination+0x34>
		while( uxTasksDeleted > ( UBaseType_t ) 0U )
    800022aa:	0001e797          	auipc	a5,0x1e
    800022ae:	0e67b783          	ld	a5,230(a5) # 80020390 <uxTasksDeleted>
    800022b2:	f3fd                	bnez	a5,80002298 <prvCheckTasksWaitingTermination+0x10>
}
    800022b4:	60a2                	ld	ra,8(sp)
    800022b6:	6402                	ld	s0,0(sp)
    800022b8:	0141                	addi	sp,sp,16
    800022ba:	8082                	ret
				taskENTER_CRITICAL();
    800022bc:	f7aff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
					pxTCB = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( ( &xTasksWaitingTermination ) );
    800022c0:	0001e797          	auipc	a5,0x1e
    800022c4:	5787b783          	ld	a5,1400(a5) # 80020838 <xTasksWaitingTermination+0x18>
    800022c8:	6f80                	ld	s0,24(a5)
					( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    800022ca:	00840513          	addi	a0,s0,8
    800022ce:	ad0fe0ef          	jal	ra,8000059e <uxListRemove>
					--uxCurrentNumberOfTasks;
    800022d2:	0001e717          	auipc	a4,0x1e
    800022d6:	0b670713          	addi	a4,a4,182 # 80020388 <uxCurrentNumberOfTasks>
    800022da:	631c                	ld	a5,0(a4)
    800022dc:	17fd                	addi	a5,a5,-1
    800022de:	e31c                	sd	a5,0(a4)
					--uxTasksDeleted;
    800022e0:	0001e717          	auipc	a4,0x1e
    800022e4:	0b070713          	addi	a4,a4,176 # 80020390 <uxTasksDeleted>
    800022e8:	631c                	ld	a5,0(a4)
    800022ea:	17fd                	addi	a5,a5,-1
    800022ec:	e31c                	sd	a5,0(a4)
				taskEXIT_CRITICAL();
    800022ee:	f6aff0ef          	jal	ra,80001a58 <vTaskExitCritical>
				prvDeleteTCB( pxTCB );
    800022f2:	8522                	mv	a0,s0
    800022f4:	dabfe0ef          	jal	ra,8000109e <prvDeleteTCB>
    800022f8:	bf4d                	j	800022aa <prvCheckTasksWaitingTermination+0x22>
    800022fa:	8082                	ret

00000000800022fc <prvIdleTask>:
{
    800022fc:	1141                	addi	sp,sp,-16
    800022fe:	e406                	sd	ra,8(sp)
		prvCheckTasksWaitingTermination();
    80002300:	f89ff0ef          	jal	ra,80002288 <prvCheckTasksWaitingTermination>
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( UBaseType_t ) 1 )
    80002304:	0001e717          	auipc	a4,0x1e
    80002308:	40473703          	ld	a4,1028(a4) # 80020708 <pxReadyTasksLists>
    8000230c:	4785                	li	a5,1
    8000230e:	fee7f9e3          	bgeu	a5,a4,80002300 <prvIdleTask+0x4>
				taskYIELD();
    80002312:	8fafe0ef          	jal	ra,8000040c <vPortYield>
    80002316:	b7ed                	j	80002300 <prvIdleTask+0x4>

0000000080002318 <xTaskGetTickCount>:
{
    80002318:	1141                	addi	sp,sp,-16
    8000231a:	e406                	sd	ra,8(sp)
    8000231c:	e022                	sd	s0,0(sp)
	portTICK_TYPE_ENTER_CRITICAL();
    8000231e:	f18ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		xTicks = xTickCount;
    80002322:	0001e417          	auipc	s0,0x1e
    80002326:	05e42403          	lw	s0,94(s0) # 80020380 <xTickCount>
	portTICK_TYPE_EXIT_CRITICAL();
    8000232a:	f2eff0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    8000232e:	8522                	mv	a0,s0
    80002330:	60a2                	ld	ra,8(sp)
    80002332:	6402                	ld	s0,0(sp)
    80002334:	0141                	addi	sp,sp,16
    80002336:	8082                	ret

0000000080002338 <xTaskCheckForTimeOut>:
	configASSERT( pxTimeOut );
    80002338:	c139                	beqz	a0,8000237e <xTaskCheckForTimeOut+0x46>
{
    8000233a:	1101                	addi	sp,sp,-32
    8000233c:	ec06                	sd	ra,24(sp)
    8000233e:	e822                	sd	s0,16(sp)
    80002340:	e426                	sd	s1,8(sp)
    80002342:	842a                	mv	s0,a0
    80002344:	84ae                	mv	s1,a1
	configASSERT( pxTicksToWait );
    80002346:	cd9d                	beqz	a1,80002384 <xTaskCheckForTimeOut+0x4c>
	taskENTER_CRITICAL();
    80002348:	eeeff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		const TickType_t xConstTickCount = xTickCount;
    8000234c:	0001e717          	auipc	a4,0x1e
    80002350:	03472703          	lw	a4,52(a4) # 80020380 <xTickCount>
			if( *pxTicksToWait == portMAX_DELAY )
    80002354:	409c                	lw	a5,0(s1)
    80002356:	56fd                	li	a3,-1
    80002358:	04d78163          	beq	a5,a3,8000239a <xTaskCheckForTimeOut+0x62>
		if( ( xNumOfOverflows != pxTimeOut->xOverflowCount ) && ( xConstTickCount >= pxTimeOut->xTimeOnEntering ) ) /*lint !e525 Indentation preferred as is to make code within pre-processor directives clearer. */
    8000235c:	6010                	ld	a2,0(s0)
    8000235e:	0001e697          	auipc	a3,0x1e
    80002362:	ffa6b683          	ld	a3,-6(a3) # 80020358 <xNumOfOverflows>
    80002366:	00d60563          	beq	a2,a3,80002370 <xTaskCheckForTimeOut+0x38>
    8000236a:	4414                	lw	a3,8(s0)
    8000236c:	04d77063          	bgeu	a4,a3,800023ac <xTaskCheckForTimeOut+0x74>
		else if( ( xConstTickCount - pxTimeOut->xTimeOnEntering ) < *pxTicksToWait )
    80002370:	4414                	lw	a3,8(s0)
    80002372:	40d7063b          	subw	a2,a4,a3
    80002376:	00f66a63          	bltu	a2,a5,8000238a <xTaskCheckForTimeOut+0x52>
			xReturn = pdTRUE;
    8000237a:	4405                	li	s0,1
    8000237c:	a005                	j	8000239c <xTaskCheckForTimeOut+0x64>
	configASSERT( pxTimeOut );
    8000237e:	30047073          	csrci	mstatus,8
    80002382:	a001                	j	80002382 <xTaskCheckForTimeOut+0x4a>
	configASSERT( pxTicksToWait );
    80002384:	30047073          	csrci	mstatus,8
    80002388:	a001                	j	80002388 <xTaskCheckForTimeOut+0x50>
			*pxTicksToWait -= ( xConstTickCount -  pxTimeOut->xTimeOnEntering );
    8000238a:	9e99                	subw	a3,a3,a4
    8000238c:	9fb5                	addw	a5,a5,a3
    8000238e:	c09c                	sw	a5,0(s1)
			vTaskSetTimeOutState( pxTimeOut );
    80002390:	8522                	mv	a0,s0
    80002392:	d0aff0ef          	jal	ra,8000189c <vTaskSetTimeOutState>
			xReturn = pdFALSE;
    80002396:	4401                	li	s0,0
    80002398:	a011                	j	8000239c <xTaskCheckForTimeOut+0x64>
				xReturn = pdFALSE;
    8000239a:	4401                	li	s0,0
	taskEXIT_CRITICAL();
    8000239c:	ebcff0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    800023a0:	8522                	mv	a0,s0
    800023a2:	60e2                	ld	ra,24(sp)
    800023a4:	6442                	ld	s0,16(sp)
    800023a6:	64a2                	ld	s1,8(sp)
    800023a8:	6105                	addi	sp,sp,32
    800023aa:	8082                	ret
			xReturn = pdTRUE;
    800023ac:	4405                	li	s0,1
    800023ae:	b7fd                	j	8000239c <xTaskCheckForTimeOut+0x64>

00000000800023b0 <uxTaskResetEventItemValue>:

TickType_t uxTaskResetEventItemValue( void )
{
TickType_t uxReturn;

	uxReturn = listGET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ) );
    800023b0:	0001e797          	auipc	a5,0x1e
    800023b4:	ff878793          	addi	a5,a5,-8 # 800203a8 <pxCurrentTCB>
    800023b8:	6398                	ld	a4,0(a5)
    800023ba:	5b08                	lw	a0,48(a4)

	/* Reset the event list item to its normal value - so it can be used with
	queues and semaphores. */
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ), ( ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxCurrentTCB->uxPriority ) ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    800023bc:	6398                	ld	a4,0(a5)
    800023be:	4f34                	lw	a3,88(a4)
    800023c0:	6398                	ld	a4,0(a5)
    800023c2:	4795                	li	a5,5
    800023c4:	9f95                	subw	a5,a5,a3
    800023c6:	db1c                	sw	a5,48(a4)

	return uxReturn;
}
    800023c8:	8082                	ret

00000000800023ca <pvTaskIncrementMutexHeldCount>:

	void *pvTaskIncrementMutexHeldCount( void )
	{
		/* If xSemaphoreCreateMutex() is called before any tasks have been created
		then pxCurrentTCB will be NULL. */
		if( pxCurrentTCB != NULL )
    800023ca:	0001e797          	auipc	a5,0x1e
    800023ce:	fde7b783          	ld	a5,-34(a5) # 800203a8 <pxCurrentTCB>
    800023d2:	cb81                	beqz	a5,800023e2 <pvTaskIncrementMutexHeldCount+0x18>
		{
			( pxCurrentTCB->uxMutexesHeld )++;
    800023d4:	0001e717          	auipc	a4,0x1e
    800023d8:	fd473703          	ld	a4,-44(a4) # 800203a8 <pxCurrentTCB>
    800023dc:	6f5c                	ld	a5,152(a4)
    800023de:	0785                	addi	a5,a5,1
    800023e0:	ef5c                	sd	a5,152(a4)
		}

		return pxCurrentTCB;
	}
    800023e2:	0001e517          	auipc	a0,0x1e
    800023e6:	fc653503          	ld	a0,-58(a0) # 800203a8 <pxCurrentTCB>
    800023ea:	8082                	ret

00000000800023ec <ulTaskNotifyTake>:
/*-----------------------------------------------------------*/

#if( configUSE_TASK_NOTIFICATIONS == 1 )

	uint32_t ulTaskNotifyTake( BaseType_t xClearCountOnExit, TickType_t xTicksToWait )
	{
    800023ec:	1101                	addi	sp,sp,-32
    800023ee:	ec06                	sd	ra,24(sp)
    800023f0:	e822                	sd	s0,16(sp)
    800023f2:	e426                	sd	s1,8(sp)
    800023f4:	84aa                	mv	s1,a0
    800023f6:	842e                	mv	s0,a1
	TickType_t xTimeToWake;
	uint32_t ulReturn;

		taskENTER_CRITICAL();
    800023f8:	e3eff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			/* Only block if the notification count is not already non-zero. */
			if( pxCurrentTCB->ulNotifiedValue == 0UL )
    800023fc:	0001e797          	auipc	a5,0x1e
    80002400:	fac7b783          	ld	a5,-84(a5) # 800203a8 <pxCurrentTCB>
    80002404:	0a07a783          	lw	a5,160(a5)
    80002408:	2781                	sext.w	a5,a5
    8000240a:	eb89                	bnez	a5,8000241c <ulTaskNotifyTake+0x30>
			{
				/* Mark this task as waiting for a notification. */
				pxCurrentTCB->eNotifyState = eWaitingNotification;
    8000240c:	0001e797          	auipc	a5,0x1e
    80002410:	f9c7b783          	ld	a5,-100(a5) # 800203a8 <pxCurrentTCB>
    80002414:	4705                	li	a4,1
    80002416:	0ae7a223          	sw	a4,164(a5)

				if( xTicksToWait > ( TickType_t ) 0 )
    8000241a:	e031                	bnez	s0,8000245e <ulTaskNotifyTake+0x72>
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}
		taskEXIT_CRITICAL();
    8000241c:	e3cff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		taskENTER_CRITICAL();
    80002420:	e16ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			traceTASK_NOTIFY_TAKE();
			ulReturn = pxCurrentTCB->ulNotifiedValue;
    80002424:	0001e797          	auipc	a5,0x1e
    80002428:	f847b783          	ld	a5,-124(a5) # 800203a8 <pxCurrentTCB>
    8000242c:	0a07a403          	lw	s0,160(a5)
    80002430:	2401                	sext.w	s0,s0

			if( ulReturn != 0UL )
    80002432:	c801                	beqz	s0,80002442 <ulTaskNotifyTake+0x56>
			{
				if( xClearCountOnExit != pdFALSE )
    80002434:	c4ad                	beqz	s1,8000249e <ulTaskNotifyTake+0xb2>
				{
					pxCurrentTCB->ulNotifiedValue = 0UL;
    80002436:	0001e797          	auipc	a5,0x1e
    8000243a:	f727b783          	ld	a5,-142(a5) # 800203a8 <pxCurrentTCB>
    8000243e:	0a07a023          	sw	zero,160(a5)
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}

			pxCurrentTCB->eNotifyState = eNotWaitingNotification;
    80002442:	0001e797          	auipc	a5,0x1e
    80002446:	f667b783          	ld	a5,-154(a5) # 800203a8 <pxCurrentTCB>
    8000244a:	0a07a223          	sw	zero,164(a5)
		}
		taskEXIT_CRITICAL();
    8000244e:	e0aff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		return ulReturn;
	}
    80002452:	8522                	mv	a0,s0
    80002454:	60e2                	ld	ra,24(sp)
    80002456:	6442                	ld	s0,16(sp)
    80002458:	64a2                	ld	s1,8(sp)
    8000245a:	6105                	addi	sp,sp,32
    8000245c:	8082                	ret
					if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    8000245e:	0001e517          	auipc	a0,0x1e
    80002462:	f4a53503          	ld	a0,-182(a0) # 800203a8 <pxCurrentTCB>
    80002466:	0521                	addi	a0,a0,8
    80002468:	936fe0ef          	jal	ra,8000059e <uxListRemove>
						if( xTicksToWait == portMAX_DELAY )
    8000246c:	57fd                	li	a5,-1
    8000246e:	00f40c63          	beq	s0,a5,80002486 <ulTaskNotifyTake+0x9a>
							xTimeToWake = xTickCount + xTicksToWait;
    80002472:	0001e517          	auipc	a0,0x1e
    80002476:	f0e52503          	lw	a0,-242(a0) # 80020380 <xTickCount>
							prvAddCurrentTaskToDelayedList( xTimeToWake );
    8000247a:	9d21                	addw	a0,a0,s0
    8000247c:	d87fe0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
					portYIELD_WITHIN_API();
    80002480:	f8dfd0ef          	jal	ra,8000040c <vPortYield>
    80002484:	bf61                	j	8000241c <ulTaskNotifyTake+0x30>
							vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    80002486:	0001e597          	auipc	a1,0x1e
    8000248a:	f225b583          	ld	a1,-222(a1) # 800203a8 <pxCurrentTCB>
    8000248e:	05a1                	addi	a1,a1,8
    80002490:	0001e517          	auipc	a0,0x1e
    80002494:	22850513          	addi	a0,a0,552 # 800206b8 <xSuspendedTaskList>
    80002498:	8c2fe0ef          	jal	ra,8000055a <vListInsertEnd>
    8000249c:	b7d5                	j	80002480 <ulTaskNotifyTake+0x94>
					( pxCurrentTCB->ulNotifiedValue )--;
    8000249e:	0001e717          	auipc	a4,0x1e
    800024a2:	f0a73703          	ld	a4,-246(a4) # 800203a8 <pxCurrentTCB>
    800024a6:	0a072783          	lw	a5,160(a4)
    800024aa:	37fd                	addiw	a5,a5,-1
    800024ac:	0af72023          	sw	a5,160(a4)
    800024b0:	bf49                	j	80002442 <ulTaskNotifyTake+0x56>

00000000800024b2 <xTaskNotifyWait>:
/*-----------------------------------------------------------*/

#if( configUSE_TASK_NOTIFICATIONS == 1 )

	BaseType_t xTaskNotifyWait( uint32_t ulBitsToClearOnEntry, uint32_t ulBitsToClearOnExit, uint32_t *pulNotificationValue, TickType_t xTicksToWait )
	{
    800024b2:	7179                	addi	sp,sp,-48
    800024b4:	f406                	sd	ra,40(sp)
    800024b6:	f022                	sd	s0,32(sp)
    800024b8:	ec26                	sd	s1,24(sp)
    800024ba:	e84a                	sd	s2,16(sp)
    800024bc:	e44e                	sd	s3,8(sp)
    800024be:	89aa                	mv	s3,a0
    800024c0:	842e                	mv	s0,a1
    800024c2:	84b2                	mv	s1,a2
    800024c4:	8936                	mv	s2,a3
	TickType_t xTimeToWake;
	BaseType_t xReturn;

		taskENTER_CRITICAL();
    800024c6:	d70ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			/* Only block if a notification is not already pending. */
			if( pxCurrentTCB->eNotifyState != eNotified )
    800024ca:	0001e797          	auipc	a5,0x1e
    800024ce:	ede7b783          	ld	a5,-290(a5) # 800203a8 <pxCurrentTCB>
    800024d2:	0a47a783          	lw	a5,164(a5)
    800024d6:	2781                	sext.w	a5,a5
    800024d8:	4709                	li	a4,2
    800024da:	02e78463          	beq	a5,a4,80002502 <xTaskNotifyWait+0x50>
			{
				/* Clear bits in the task's notification value as bits may get
				set	by the notifying task or interrupt.  This can be used to
				clear the value to zero. */
				pxCurrentTCB->ulNotifiedValue &= ~ulBitsToClearOnEntry;
    800024de:	0001e717          	auipc	a4,0x1e
    800024e2:	eca70713          	addi	a4,a4,-310 # 800203a8 <pxCurrentTCB>
    800024e6:	6314                	ld	a3,0(a4)
    800024e8:	0a06a783          	lw	a5,160(a3)
    800024ec:	fff9c513          	not	a0,s3
    800024f0:	8fe9                	and	a5,a5,a0
    800024f2:	0af6a023          	sw	a5,160(a3)

				/* Mark this task as waiting for a notification. */
				pxCurrentTCB->eNotifyState = eWaitingNotification;
    800024f6:	631c                	ld	a5,0(a4)
    800024f8:	4705                	li	a4,1
    800024fa:	0ae7a223          	sw	a4,164(a5)

				if( xTicksToWait > ( TickType_t ) 0 )
    800024fe:	06091463          	bnez	s2,80002566 <xTaskNotifyWait+0xb4>
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}
		taskEXIT_CRITICAL();
    80002502:	d56ff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		taskENTER_CRITICAL();
    80002506:	d30ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			traceTASK_NOTIFY_WAIT();

			if( pulNotificationValue != NULL )
    8000250a:	c881                	beqz	s1,8000251a <xTaskNotifyWait+0x68>
			{
				/* Output the current notification value, which may or may not
				have changed. */
				*pulNotificationValue = pxCurrentTCB->ulNotifiedValue;
    8000250c:	0001e797          	auipc	a5,0x1e
    80002510:	e9c7b783          	ld	a5,-356(a5) # 800203a8 <pxCurrentTCB>
    80002514:	0a07a783          	lw	a5,160(a5)
    80002518:	c09c                	sw	a5,0(s1)

			/* If eNotifyValue is set then either the task never entered the
			blocked state (because a notification was already pending) or the
			task unblocked because of a notification.  Otherwise the task
			unblocked because of a timeout. */
			if( pxCurrentTCB->eNotifyState == eWaitingNotification )
    8000251a:	0001e797          	auipc	a5,0x1e
    8000251e:	e8e7b783          	ld	a5,-370(a5) # 800203a8 <pxCurrentTCB>
    80002522:	0a47a783          	lw	a5,164(a5)
    80002526:	2781                	sext.w	a5,a5
    80002528:	4705                	li	a4,1
    8000252a:	06e78f63          	beq	a5,a4,800025a8 <xTaskNotifyWait+0xf6>
			}
			else
			{
				/* A notification was already pending or a notification was
				received while the task was waiting. */
				pxCurrentTCB->ulNotifiedValue &= ~ulBitsToClearOnExit;
    8000252e:	0001e717          	auipc	a4,0x1e
    80002532:	e7a73703          	ld	a4,-390(a4) # 800203a8 <pxCurrentTCB>
    80002536:	0a072783          	lw	a5,160(a4)
    8000253a:	fff44413          	not	s0,s0
    8000253e:	8fe1                	and	a5,a5,s0
    80002540:	0af72023          	sw	a5,160(a4)
				xReturn = pdTRUE;
    80002544:	4405                	li	s0,1
			}

			pxCurrentTCB->eNotifyState = eNotWaitingNotification;
    80002546:	0001e797          	auipc	a5,0x1e
    8000254a:	e627b783          	ld	a5,-414(a5) # 800203a8 <pxCurrentTCB>
    8000254e:	0a07a223          	sw	zero,164(a5)
		}
		taskEXIT_CRITICAL();
    80002552:	d06ff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		return xReturn;
	}
    80002556:	8522                	mv	a0,s0
    80002558:	70a2                	ld	ra,40(sp)
    8000255a:	7402                	ld	s0,32(sp)
    8000255c:	64e2                	ld	s1,24(sp)
    8000255e:	6942                	ld	s2,16(sp)
    80002560:	69a2                	ld	s3,8(sp)
    80002562:	6145                	addi	sp,sp,48
    80002564:	8082                	ret
					if( uxListRemove( &( pxCurrentTCB->xGenericListItem ) ) == ( UBaseType_t ) 0 )
    80002566:	0001e517          	auipc	a0,0x1e
    8000256a:	e4253503          	ld	a0,-446(a0) # 800203a8 <pxCurrentTCB>
    8000256e:	0521                	addi	a0,a0,8
    80002570:	82efe0ef          	jal	ra,8000059e <uxListRemove>
						if( xTicksToWait == portMAX_DELAY )
    80002574:	57fd                	li	a5,-1
    80002576:	00f90d63          	beq	s2,a5,80002590 <xTaskNotifyWait+0xde>
							xTimeToWake = xTickCount + xTicksToWait;
    8000257a:	0001e517          	auipc	a0,0x1e
    8000257e:	e0652503          	lw	a0,-506(a0) # 80020380 <xTickCount>
							prvAddCurrentTaskToDelayedList( xTimeToWake );
    80002582:	0125053b          	addw	a0,a0,s2
    80002586:	c7dfe0ef          	jal	ra,80001202 <prvAddCurrentTaskToDelayedList>
					portYIELD_WITHIN_API();
    8000258a:	e83fd0ef          	jal	ra,8000040c <vPortYield>
    8000258e:	bf95                	j	80002502 <xTaskNotifyWait+0x50>
							vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xGenericListItem ) );
    80002590:	0001e597          	auipc	a1,0x1e
    80002594:	e185b583          	ld	a1,-488(a1) # 800203a8 <pxCurrentTCB>
    80002598:	05a1                	addi	a1,a1,8
    8000259a:	0001e517          	auipc	a0,0x1e
    8000259e:	11e50513          	addi	a0,a0,286 # 800206b8 <xSuspendedTaskList>
    800025a2:	fb9fd0ef          	jal	ra,8000055a <vListInsertEnd>
    800025a6:	b7d5                	j	8000258a <xTaskNotifyWait+0xd8>
				xReturn = pdFALSE;
    800025a8:	4401                	li	s0,0
    800025aa:	bf71                	j	80002546 <xTaskNotifyWait+0x94>

00000000800025ac <xTaskGenericNotify>:
	{
	TCB_t * pxTCB;
	eNotifyValue eOriginalNotifyState;
	BaseType_t xReturn = pdPASS;

		configASSERT( xTaskToNotify );
    800025ac:	c939                	beqz	a0,80002602 <xTaskGenericNotify+0x56>
	{
    800025ae:	7179                	addi	sp,sp,-48
    800025b0:	f406                	sd	ra,40(sp)
    800025b2:	f022                	sd	s0,32(sp)
    800025b4:	ec26                	sd	s1,24(sp)
    800025b6:	e84a                	sd	s2,16(sp)
    800025b8:	e44e                	sd	s3,8(sp)
    800025ba:	842a                	mv	s0,a0
    800025bc:	89ae                	mv	s3,a1
    800025be:	84b2                	mv	s1,a2
    800025c0:	8936                	mv	s2,a3
		pxTCB = ( TCB_t * ) xTaskToNotify;

		taskENTER_CRITICAL();
    800025c2:	c74ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			if( pulPreviousNotificationValue != NULL )
    800025c6:	00090663          	beqz	s2,800025d2 <xTaskGenericNotify+0x26>
			{
				*pulPreviousNotificationValue = pxTCB->ulNotifiedValue;
    800025ca:	0a042783          	lw	a5,160(s0)
    800025ce:	00f92023          	sw	a5,0(s2)
			}

			eOriginalNotifyState = pxTCB->eNotifyState;
    800025d2:	0a442783          	lw	a5,164(s0)
    800025d6:	2781                	sext.w	a5,a5

			pxTCB->eNotifyState = eNotified;
    800025d8:	4709                	li	a4,2
    800025da:	0ae42223          	sw	a4,164(s0)

			switch( eAction )
    800025de:	470d                	li	a4,3
    800025e0:	06e48663          	beq	s1,a4,8000264c <xTaskGenericNotify+0xa0>
    800025e4:	02976463          	bltu	a4,s1,8000260c <xTaskGenericNotify+0x60>
    800025e8:	4705                	li	a4,1
    800025ea:	04e48963          	beq	s1,a4,8000263c <xTaskGenericNotify+0x90>
    800025ee:	4709                	li	a4,2
    800025f0:	00e49c63          	bne	s1,a4,80002608 <xTaskGenericNotify+0x5c>
				case eSetBits	:
					pxTCB->ulNotifiedValue |= ulValue;
					break;

				case eIncrement	:
					( pxTCB->ulNotifiedValue )++;
    800025f4:	0a042703          	lw	a4,160(s0)
    800025f8:	2705                	addiw	a4,a4,1
    800025fa:	0ae42023          	sw	a4,160(s0)
	BaseType_t xReturn = pdPASS;
    800025fe:	4485                	li	s1,1
					break;
    80002600:	a00d                	j	80002622 <xTaskGenericNotify+0x76>
		configASSERT( xTaskToNotify );
    80002602:	30047073          	csrci	mstatus,8
    80002606:	a001                	j	80002606 <xTaskGenericNotify+0x5a>
			switch( eAction )
    80002608:	4485                	li	s1,1
    8000260a:	a821                	j	80002622 <xTaskGenericNotify+0x76>
    8000260c:	4711                	li	a4,4
    8000260e:	00e49963          	bne	s1,a4,80002620 <xTaskGenericNotify+0x74>
				case eSetValueWithOverwrite	:
					pxTCB->ulNotifiedValue = ulValue;
					break;

				case eSetValueWithoutOverwrite :
					if( eOriginalNotifyState != eNotified )
    80002612:	4709                	li	a4,2
    80002614:	04e78063          	beq	a5,a4,80002654 <xTaskGenericNotify+0xa8>
					{
						pxTCB->ulNotifiedValue = ulValue;
    80002618:	0b342023          	sw	s3,160(s0)
	BaseType_t xReturn = pdPASS;
    8000261c:	4485                	li	s1,1
    8000261e:	a011                	j	80002622 <xTaskGenericNotify+0x76>
			switch( eAction )
    80002620:	4485                	li	s1,1

			traceTASK_NOTIFY();

			/* If the task is in the blocked state specifically to wait for a
			notification then unblock it now. */
			if( eOriginalNotifyState == eWaitingNotification )
    80002622:	4705                	li	a4,1
    80002624:	02e78a63          	beq	a5,a4,80002658 <xTaskGenericNotify+0xac>
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}
		taskEXIT_CRITICAL();
    80002628:	c30ff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		return xReturn;
	}
    8000262c:	8526                	mv	a0,s1
    8000262e:	70a2                	ld	ra,40(sp)
    80002630:	7402                	ld	s0,32(sp)
    80002632:	64e2                	ld	s1,24(sp)
    80002634:	6942                	ld	s2,16(sp)
    80002636:	69a2                	ld	s3,8(sp)
    80002638:	6145                	addi	sp,sp,48
    8000263a:	8082                	ret
					pxTCB->ulNotifiedValue |= ulValue;
    8000263c:	0a042703          	lw	a4,160(s0)
    80002640:	01376733          	or	a4,a4,s3
    80002644:	0ae42023          	sw	a4,160(s0)
	BaseType_t xReturn = pdPASS;
    80002648:	4485                	li	s1,1
					break;
    8000264a:	bfe1                	j	80002622 <xTaskGenericNotify+0x76>
					pxTCB->ulNotifiedValue = ulValue;
    8000264c:	0b342023          	sw	s3,160(s0)
	BaseType_t xReturn = pdPASS;
    80002650:	4485                	li	s1,1
					break;
    80002652:	bfc1                	j	80002622 <xTaskGenericNotify+0x76>
						xReturn = pdFAIL;
    80002654:	4481                	li	s1,0
    80002656:	b7f1                	j	80002622 <xTaskGenericNotify+0x76>
				( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    80002658:	00840913          	addi	s2,s0,8
    8000265c:	854a                	mv	a0,s2
    8000265e:	f41fd0ef          	jal	ra,8000059e <uxListRemove>
				prvAddTaskToReadyList( pxTCB );
    80002662:	6c38                	ld	a4,88(s0)
    80002664:	0001e797          	auipc	a5,0x1e
    80002668:	d147b783          	ld	a5,-748(a5) # 80020378 <uxTopReadyPriority>
    8000266c:	00e7f663          	bgeu	a5,a4,80002678 <xTaskGenericNotify+0xcc>
    80002670:	0001e797          	auipc	a5,0x1e
    80002674:	d0e7b423          	sd	a4,-760(a5) # 80020378 <uxTopReadyPriority>
    80002678:	00271793          	slli	a5,a4,0x2
    8000267c:	97ba                	add	a5,a5,a4
    8000267e:	078e                	slli	a5,a5,0x3
    80002680:	85ca                	mv	a1,s2
    80002682:	0001e517          	auipc	a0,0x1e
    80002686:	08650513          	addi	a0,a0,134 # 80020708 <pxReadyTasksLists>
    8000268a:	953e                	add	a0,a0,a5
    8000268c:	ecffd0ef          	jal	ra,8000055a <vListInsertEnd>
				configASSERT( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) == NULL );
    80002690:	683c                	ld	a5,80(s0)
    80002692:	c781                	beqz	a5,8000269a <xTaskGenericNotify+0xee>
    80002694:	30047073          	csrci	mstatus,8
    80002698:	a001                	j	80002698 <xTaskGenericNotify+0xec>
				if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
    8000269a:	6c38                	ld	a4,88(s0)
    8000269c:	0001e797          	auipc	a5,0x1e
    800026a0:	d0c7b783          	ld	a5,-756(a5) # 800203a8 <pxCurrentTCB>
    800026a4:	6fbc                	ld	a5,88(a5)
    800026a6:	f8e7f1e3          	bgeu	a5,a4,80002628 <xTaskGenericNotify+0x7c>
					taskYIELD_IF_USING_PREEMPTION();
    800026aa:	d63fd0ef          	jal	ra,8000040c <vPortYield>
    800026ae:	bfad                	j	80002628 <xTaskGenericNotify+0x7c>

00000000800026b0 <xTaskGenericNotifyFromISR>:
	TCB_t * pxTCB;
	eNotifyValue eOriginalNotifyState;
	BaseType_t xReturn = pdPASS;
	UBaseType_t uxSavedInterruptStatus;

		configASSERT( xTaskToNotify );
    800026b0:	cd39                	beqz	a0,8000270e <xTaskGenericNotifyFromISR+0x5e>
	{
    800026b2:	7139                	addi	sp,sp,-64
    800026b4:	fc06                	sd	ra,56(sp)
    800026b6:	f822                	sd	s0,48(sp)
    800026b8:	f426                	sd	s1,40(sp)
    800026ba:	f04a                	sd	s2,32(sp)
    800026bc:	ec4e                	sd	s3,24(sp)
    800026be:	e852                	sd	s4,16(sp)
    800026c0:	e456                	sd	s5,8(sp)
    800026c2:	842a                	mv	s0,a0
    800026c4:	8a2e                	mv	s4,a1
    800026c6:	84b2                	mv	s1,a2
    800026c8:	8936                	mv	s2,a3
    800026ca:	89ba                	mv	s3,a4
		http://www.freertos.org/RTOS-Cortex-M3-M4.html */
		portASSERT_IF_INTERRUPT_PRIORITY_INVALID();

		pxTCB = ( TCB_t * ) xTaskToNotify;

		uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    800026cc:	e31fd0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    800026d0:	8aaa                	mv	s5,a0
		{
			if( pulPreviousNotificationValue != NULL )
    800026d2:	00090663          	beqz	s2,800026de <xTaskGenericNotifyFromISR+0x2e>
			{
				*pulPreviousNotificationValue = pxTCB->ulNotifiedValue;
    800026d6:	0a042783          	lw	a5,160(s0)
    800026da:	00f92023          	sw	a5,0(s2)
			}

			eOriginalNotifyState = pxTCB->eNotifyState;
    800026de:	0a442783          	lw	a5,164(s0)
    800026e2:	2781                	sext.w	a5,a5
			pxTCB->eNotifyState = eNotified;
    800026e4:	4709                	li	a4,2
    800026e6:	0ae42223          	sw	a4,164(s0)

			switch( eAction )
    800026ea:	470d                	li	a4,3
    800026ec:	06e48163          	beq	s1,a4,8000274e <xTaskGenericNotifyFromISR+0x9e>
    800026f0:	02976463          	bltu	a4,s1,80002718 <xTaskGenericNotifyFromISR+0x68>
    800026f4:	4705                	li	a4,1
    800026f6:	04e48463          	beq	s1,a4,8000273e <xTaskGenericNotifyFromISR+0x8e>
    800026fa:	4709                	li	a4,2
    800026fc:	00e49c63          	bne	s1,a4,80002714 <xTaskGenericNotifyFromISR+0x64>
				case eSetBits	:
					pxTCB->ulNotifiedValue |= ulValue;
					break;

				case eIncrement	:
					( pxTCB->ulNotifiedValue )++;
    80002700:	0a042703          	lw	a4,160(s0)
    80002704:	2705                	addiw	a4,a4,1
    80002706:	0ae42023          	sw	a4,160(s0)
	BaseType_t xReturn = pdPASS;
    8000270a:	4485                	li	s1,1
					break;
    8000270c:	a00d                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>
		configASSERT( xTaskToNotify );
    8000270e:	30047073          	csrci	mstatus,8
    80002712:	a001                	j	80002712 <xTaskGenericNotifyFromISR+0x62>
			switch( eAction )
    80002714:	4485                	li	s1,1
    80002716:	a821                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>
    80002718:	4711                	li	a4,4
    8000271a:	00e49963          	bne	s1,a4,8000272c <xTaskGenericNotifyFromISR+0x7c>
				case eSetValueWithOverwrite	:
					pxTCB->ulNotifiedValue = ulValue;
					break;

				case eSetValueWithoutOverwrite :
					if( eOriginalNotifyState != eNotified )
    8000271e:	4709                	li	a4,2
    80002720:	02e78b63          	beq	a5,a4,80002756 <xTaskGenericNotifyFromISR+0xa6>
					{
						pxTCB->ulNotifiedValue = ulValue;
    80002724:	0b442023          	sw	s4,160(s0)
	BaseType_t xReturn = pdPASS;
    80002728:	4485                	li	s1,1
    8000272a:	a011                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>
			switch( eAction )
    8000272c:	4485                	li	s1,1

			traceTASK_NOTIFY_FROM_ISR();

			/* If the task is in the blocked state specifically to wait for a
			notification then unblock it now. */
			if( eOriginalNotifyState == eWaitingNotification )
    8000272e:	4705                	li	a4,1
    80002730:	08e79363          	bne	a5,a4,800027b6 <xTaskGenericNotifyFromISR+0x106>
			{
				/* The task should not have been on an event list. */
				configASSERT( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) == NULL );
    80002734:	683c                	ld	a5,80(s0)
    80002736:	c395                	beqz	a5,8000275a <xTaskGenericNotifyFromISR+0xaa>
    80002738:	30047073          	csrci	mstatus,8
    8000273c:	a001                	j	8000273c <xTaskGenericNotifyFromISR+0x8c>
					pxTCB->ulNotifiedValue |= ulValue;
    8000273e:	0a042703          	lw	a4,160(s0)
    80002742:	01476733          	or	a4,a4,s4
    80002746:	0ae42023          	sw	a4,160(s0)
	BaseType_t xReturn = pdPASS;
    8000274a:	4485                	li	s1,1
					break;
    8000274c:	b7cd                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>
					pxTCB->ulNotifiedValue = ulValue;
    8000274e:	0b442023          	sw	s4,160(s0)
	BaseType_t xReturn = pdPASS;
    80002752:	4485                	li	s1,1
					break;
    80002754:	bfe9                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>
						xReturn = pdFAIL;
    80002756:	4481                	li	s1,0
    80002758:	bfd9                	j	8000272e <xTaskGenericNotifyFromISR+0x7e>

				if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    8000275a:	0001e797          	auipc	a5,0x1e
    8000275e:	be67b783          	ld	a5,-1050(a5) # 80020340 <uxSchedulerSuspended>
    80002762:	e7bd                	bnez	a5,800027d0 <xTaskGenericNotifyFromISR+0x120>
				{
					( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    80002764:	00840913          	addi	s2,s0,8
    80002768:	854a                	mv	a0,s2
    8000276a:	e35fd0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    8000276e:	6c38                	ld	a4,88(s0)
    80002770:	0001e797          	auipc	a5,0x1e
    80002774:	c087b783          	ld	a5,-1016(a5) # 80020378 <uxTopReadyPriority>
    80002778:	00e7f663          	bgeu	a5,a4,80002784 <xTaskGenericNotifyFromISR+0xd4>
    8000277c:	0001e797          	auipc	a5,0x1e
    80002780:	bee7be23          	sd	a4,-1028(a5) # 80020378 <uxTopReadyPriority>
    80002784:	00271793          	slli	a5,a4,0x2
    80002788:	97ba                	add	a5,a5,a4
    8000278a:	078e                	slli	a5,a5,0x3
    8000278c:	85ca                	mv	a1,s2
    8000278e:	0001e517          	auipc	a0,0x1e
    80002792:	f7a50513          	addi	a0,a0,-134 # 80020708 <pxReadyTasksLists>
    80002796:	953e                	add	a0,a0,a5
    80002798:	dc3fd0ef          	jal	ra,8000055a <vListInsertEnd>
					/* The delayed and ready lists cannot be accessed, so hold
					this task pending until the scheduler is resumed. */
					vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
				}

				if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
    8000279c:	6c38                	ld	a4,88(s0)
    8000279e:	0001e797          	auipc	a5,0x1e
    800027a2:	c0a7b783          	ld	a5,-1014(a5) # 800203a8 <pxCurrentTCB>
    800027a6:	6fbc                	ld	a5,88(a5)
    800027a8:	00e7f763          	bgeu	a5,a4,800027b6 <xTaskGenericNotifyFromISR+0x106>
				{
					/* The notified task has a priority above the currently
					executing task so a yield is required. */
					if( pxHigherPriorityTaskWoken != NULL )
    800027ac:	00098563          	beqz	s3,800027b6 <xTaskGenericNotifyFromISR+0x106>
					{
						*pxHigherPriorityTaskWoken = pdTRUE;
    800027b0:	4785                	li	a5,1
    800027b2:	00f9b023          	sd	a5,0(s3)
				{
					mtCOVERAGE_TEST_MARKER();
				}
			}
		}
		portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    800027b6:	8556                	mv	a0,s5
    800027b8:	d3ffd0ef          	jal	ra,800004f6 <vPortClearInterruptMask>

		return xReturn;
	}
    800027bc:	8526                	mv	a0,s1
    800027be:	70e2                	ld	ra,56(sp)
    800027c0:	7442                	ld	s0,48(sp)
    800027c2:	74a2                	ld	s1,40(sp)
    800027c4:	7902                	ld	s2,32(sp)
    800027c6:	69e2                	ld	s3,24(sp)
    800027c8:	6a42                	ld	s4,16(sp)
    800027ca:	6aa2                	ld	s5,8(sp)
    800027cc:	6121                	addi	sp,sp,64
    800027ce:	8082                	ret
					vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
    800027d0:	03040593          	addi	a1,s0,48
    800027d4:	0001e517          	auipc	a0,0x1e
    800027d8:	f0c50513          	addi	a0,a0,-244 # 800206e0 <xPendingReadyList>
    800027dc:	d7ffd0ef          	jal	ra,8000055a <vListInsertEnd>
    800027e0:	bf75                	j	8000279c <xTaskGenericNotifyFromISR+0xec>

00000000800027e2 <vTaskNotifyGiveFromISR>:
	{
	TCB_t * pxTCB;
	eNotifyValue eOriginalNotifyState;
	UBaseType_t uxSavedInterruptStatus;

		configASSERT( xTaskToNotify );
    800027e2:	cd1d                	beqz	a0,80002820 <vTaskNotifyGiveFromISR+0x3e>
	{
    800027e4:	7179                	addi	sp,sp,-48
    800027e6:	f406                	sd	ra,40(sp)
    800027e8:	f022                	sd	s0,32(sp)
    800027ea:	ec26                	sd	s1,24(sp)
    800027ec:	e84a                	sd	s2,16(sp)
    800027ee:	e44e                	sd	s3,8(sp)
    800027f0:	842a                	mv	s0,a0
    800027f2:	84ae                	mv	s1,a1
		http://www.freertos.org/RTOS-Cortex-M3-M4.html */
		portASSERT_IF_INTERRUPT_PRIORITY_INVALID();

		pxTCB = ( TCB_t * ) xTaskToNotify;

		uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    800027f4:	d09fd0ef          	jal	ra,800004fc <vPortSetInterruptMask>
    800027f8:	892a                	mv	s2,a0
		{
			eOriginalNotifyState = pxTCB->eNotifyState;
    800027fa:	0a442783          	lw	a5,164(s0)
    800027fe:	2781                	sext.w	a5,a5
			pxTCB->eNotifyState = eNotified;
    80002800:	4709                	li	a4,2
    80002802:	0ae42223          	sw	a4,164(s0)

			/* 'Giving' is equivalent to incrementing a count in a counting
			semaphore. */
			( pxTCB->ulNotifiedValue )++;
    80002806:	0a042703          	lw	a4,160(s0)
    8000280a:	2705                	addiw	a4,a4,1
    8000280c:	0ae42023          	sw	a4,160(s0)

			traceTASK_NOTIFY_GIVE_FROM_ISR();

			/* If the task is in the blocked state specifically to wait for a
			notification then unblock it now. */
			if( eOriginalNotifyState == eWaitingNotification )
    80002810:	4705                	li	a4,1
    80002812:	06e79663          	bne	a5,a4,8000287e <vTaskNotifyGiveFromISR+0x9c>
			{
				/* The task should not have been on an event list. */
				configASSERT( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) == NULL );
    80002816:	683c                	ld	a5,80(s0)
    80002818:	c799                	beqz	a5,80002826 <vTaskNotifyGiveFromISR+0x44>
    8000281a:	30047073          	csrci	mstatus,8
    8000281e:	a001                	j	8000281e <vTaskNotifyGiveFromISR+0x3c>
		configASSERT( xTaskToNotify );
    80002820:	30047073          	csrci	mstatus,8
    80002824:	a001                	j	80002824 <vTaskNotifyGiveFromISR+0x42>

				if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    80002826:	0001e797          	auipc	a5,0x1e
    8000282a:	b1a7b783          	ld	a5,-1254(a5) # 80020340 <uxSchedulerSuspended>
    8000282e:	e3b5                	bnez	a5,80002892 <vTaskNotifyGiveFromISR+0xb0>
				{
					( void ) uxListRemove( &( pxTCB->xGenericListItem ) );
    80002830:	00840993          	addi	s3,s0,8
    80002834:	854e                	mv	a0,s3
    80002836:	d69fd0ef          	jal	ra,8000059e <uxListRemove>
					prvAddTaskToReadyList( pxTCB );
    8000283a:	6c38                	ld	a4,88(s0)
    8000283c:	0001e797          	auipc	a5,0x1e
    80002840:	b3c7b783          	ld	a5,-1220(a5) # 80020378 <uxTopReadyPriority>
    80002844:	00e7f663          	bgeu	a5,a4,80002850 <vTaskNotifyGiveFromISR+0x6e>
    80002848:	0001e797          	auipc	a5,0x1e
    8000284c:	b2e7b823          	sd	a4,-1232(a5) # 80020378 <uxTopReadyPriority>
    80002850:	00271793          	slli	a5,a4,0x2
    80002854:	97ba                	add	a5,a5,a4
    80002856:	078e                	slli	a5,a5,0x3
    80002858:	85ce                	mv	a1,s3
    8000285a:	0001e517          	auipc	a0,0x1e
    8000285e:	eae50513          	addi	a0,a0,-338 # 80020708 <pxReadyTasksLists>
    80002862:	953e                	add	a0,a0,a5
    80002864:	cf7fd0ef          	jal	ra,8000055a <vListInsertEnd>
					/* The delayed and ready lists cannot be accessed, so hold
					this task pending until the scheduler is resumed. */
					vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
				}

				if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
    80002868:	6c38                	ld	a4,88(s0)
    8000286a:	0001e797          	auipc	a5,0x1e
    8000286e:	b3e7b783          	ld	a5,-1218(a5) # 800203a8 <pxCurrentTCB>
    80002872:	6fbc                	ld	a5,88(a5)
    80002874:	00e7f563          	bgeu	a5,a4,8000287e <vTaskNotifyGiveFromISR+0x9c>
				{
					/* The notified task has a priority above the currently
					executing task so a yield is required. */
					if( pxHigherPriorityTaskWoken != NULL )
    80002878:	c099                	beqz	s1,8000287e <vTaskNotifyGiveFromISR+0x9c>
					{
						*pxHigherPriorityTaskWoken = pdTRUE;
    8000287a:	4785                	li	a5,1
    8000287c:	e09c                	sd	a5,0(s1)
				{
					mtCOVERAGE_TEST_MARKER();
				}
			}
		}
		portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    8000287e:	854a                	mv	a0,s2
    80002880:	c77fd0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
	}
    80002884:	70a2                	ld	ra,40(sp)
    80002886:	7402                	ld	s0,32(sp)
    80002888:	64e2                	ld	s1,24(sp)
    8000288a:	6942                	ld	s2,16(sp)
    8000288c:	69a2                	ld	s3,8(sp)
    8000288e:	6145                	addi	sp,sp,48
    80002890:	8082                	ret
					vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
    80002892:	03040593          	addi	a1,s0,48
    80002896:	0001e517          	auipc	a0,0x1e
    8000289a:	e4a50513          	addi	a0,a0,-438 # 800206e0 <xPendingReadyList>
    8000289e:	cbdfd0ef          	jal	ra,8000055a <vListInsertEnd>
    800028a2:	b7d9                	j	80002868 <vTaskNotifyGiveFromISR+0x86>

00000000800028a4 <xTaskNotifyStateClear>:
/*-----------------------------------------------------------*/

#if( configUSE_TASK_NOTIFICATIONS == 1 )

	BaseType_t xTaskNotifyStateClear( TaskHandle_t xTask )
	{
    800028a4:	1141                	addi	sp,sp,-16
    800028a6:	e406                	sd	ra,8(sp)
    800028a8:	e022                	sd	s0,0(sp)
    800028aa:	842a                	mv	s0,a0

		pxTCB = ( TCB_t * ) xTask;

		/* If null is passed in here then it is the calling task that is having
		its notification state cleared. */
		pxTCB = prvGetTCBFromHandle( pxTCB );
    800028ac:	c10d                	beqz	a0,800028ce <xTaskNotifyStateClear+0x2a>

		taskENTER_CRITICAL();
    800028ae:	988ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		{
			if( pxTCB->eNotifyState == eNotified )
    800028b2:	0a442783          	lw	a5,164(s0)
    800028b6:	2781                	sext.w	a5,a5
    800028b8:	4709                	li	a4,2
    800028ba:	00e78f63          	beq	a5,a4,800028d8 <xTaskNotifyStateClear+0x34>
				pxTCB->eNotifyState = eNotWaitingNotification;
				xReturn = pdPASS;
			}
			else
			{
				xReturn = pdFAIL;
    800028be:	4401                	li	s0,0
			}
		}
		taskEXIT_CRITICAL();
    800028c0:	998ff0ef          	jal	ra,80001a58 <vTaskExitCritical>

		return xReturn;
	}
    800028c4:	8522                	mv	a0,s0
    800028c6:	60a2                	ld	ra,8(sp)
    800028c8:	6402                	ld	s0,0(sp)
    800028ca:	0141                	addi	sp,sp,16
    800028cc:	8082                	ret
		pxTCB = prvGetTCBFromHandle( pxTCB );
    800028ce:	0001e417          	auipc	s0,0x1e
    800028d2:	ada43403          	ld	s0,-1318(s0) # 800203a8 <pxCurrentTCB>
    800028d6:	bfe1                	j	800028ae <xTaskNotifyStateClear+0xa>
				pxTCB->eNotifyState = eNotWaitingNotification;
    800028d8:	0a042223          	sw	zero,164(s0)
				xReturn = pdPASS;
    800028dc:	4405                	li	s0,1
    800028de:	b7cd                	j	800028c0 <xTaskNotifyStateClear+0x1c>

00000000800028e0 <prvGetNextExpireTime>:
	the timer with the nearest expiry time will expire.  If there are no
	active timers then just set the next expire time to 0.  That will cause
	this task to unblock when the tick count overflows, at which point the
	timer lists will be switched and the next expiry time can be
	re-assessed.  */
	*pxListWasEmpty = listLIST_IS_EMPTY( pxCurrentTimerList );
    800028e0:	0001e717          	auipc	a4,0x1e
    800028e4:	ae873703          	ld	a4,-1304(a4) # 800203c8 <pxCurrentTimerList>
    800028e8:	631c                	ld	a5,0(a4)
    800028ea:	0017b793          	seqz	a5,a5
    800028ee:	e11c                	sd	a5,0(a0)
	if( *pxListWasEmpty == pdFALSE )
    800028f0:	e781                	bnez	a5,800028f8 <prvGetNextExpireTime+0x18>
	{
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
    800028f2:	6f1c                	ld	a5,24(a4)
    800028f4:	4388                	lw	a0,0(a5)
    800028f6:	8082                	ret
	}
	else
	{
		/* Ensure the task unblocks when the tick count rolls over. */
		xNextExpireTime = ( TickType_t ) 0U;
    800028f8:	4501                	li	a0,0
	}

	return xNextExpireTime;
}
    800028fa:	8082                	ret

00000000800028fc <prvInsertTimerInActiveList>:
	return xTimeNow;
}
/*-----------------------------------------------------------*/

static BaseType_t prvInsertTimerInActiveList( Timer_t * const pxTimer, const TickType_t xNextExpiryTime, const TickType_t xTimeNow, const TickType_t xCommandTime )
{
    800028fc:	1141                	addi	sp,sp,-16
    800028fe:	e406                	sd	ra,8(sp)
BaseType_t xProcessTimerNow = pdFALSE;

	listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xNextExpiryTime );
    80002900:	c50c                	sw	a1,8(a0)
	listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
    80002902:	f108                	sd	a0,32(a0)

	if( xNextExpiryTime <= xTimeNow )
    80002904:	02b66463          	bltu	a2,a1,8000292c <prvInsertTimerInActiveList+0x30>
	{
		/* Has the expiry time elapsed between the command to start/reset a
		timer was issued, and the time the command was processed? */
		if( ( xTimeNow - xCommandTime ) >= pxTimer->xTimerPeriodInTicks )
    80002908:	9e15                	subw	a2,a2,a3
    8000290a:	591c                	lw	a5,48(a0)
    8000290c:	00f66663          	bltu	a2,a5,80002918 <prvInsertTimerInActiveList+0x1c>
		{
			/* The time between a command being issued and the command being
			processed actually exceeds the timers period.  */
			xProcessTimerNow = pdTRUE;
    80002910:	4505                	li	a0,1
			vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
		}
	}

	return xProcessTimerNow;
}
    80002912:	60a2                	ld	ra,8(sp)
    80002914:	0141                	addi	sp,sp,16
    80002916:	8082                	ret
			vListInsert( pxOverflowTimerList, &( pxTimer->xTimerListItem ) );
    80002918:	00850593          	addi	a1,a0,8
    8000291c:	0001e517          	auipc	a0,0x1e
    80002920:	aa453503          	ld	a0,-1372(a0) # 800203c0 <pxOverflowTimerList>
    80002924:	c4dfd0ef          	jal	ra,80000570 <vListInsert>
BaseType_t xProcessTimerNow = pdFALSE;
    80002928:	4501                	li	a0,0
    8000292a:	b7e5                	j	80002912 <prvInsertTimerInActiveList+0x16>
		if( ( xTimeNow < xCommandTime ) && ( xNextExpiryTime >= xCommandTime ) )
    8000292c:	00d67463          	bgeu	a2,a3,80002934 <prvInsertTimerInActiveList+0x38>
    80002930:	00d5fc63          	bgeu	a1,a3,80002948 <prvInsertTimerInActiveList+0x4c>
			vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
    80002934:	00850593          	addi	a1,a0,8
    80002938:	0001e517          	auipc	a0,0x1e
    8000293c:	a9053503          	ld	a0,-1392(a0) # 800203c8 <pxCurrentTimerList>
    80002940:	c31fd0ef          	jal	ra,80000570 <vListInsert>
BaseType_t xProcessTimerNow = pdFALSE;
    80002944:	4501                	li	a0,0
    80002946:	b7f1                	j	80002912 <prvInsertTimerInActiveList+0x16>
			xProcessTimerNow = pdTRUE;
    80002948:	4505                	li	a0,1
	return xProcessTimerNow;
    8000294a:	b7e1                	j	80002912 <prvInsertTimerInActiveList+0x16>

000000008000294c <prvCheckForValidListAndQueue>:
	pxOverflowTimerList = pxTemp;
}
/*-----------------------------------------------------------*/

static void prvCheckForValidListAndQueue( void )
{
    8000294c:	1101                	addi	sp,sp,-32
    8000294e:	ec06                	sd	ra,24(sp)
    80002950:	e822                	sd	s0,16(sp)
    80002952:	e426                	sd	s1,8(sp)
	/* Check that the list from which active timers are referenced, and the
	queue used to communicate with the timer service, have been
	initialised. */
	taskENTER_CRITICAL();
    80002954:	8e2ff0ef          	jal	ra,80001a36 <vTaskEnterCritical>
	{
		if( xTimerQueue == NULL )
    80002958:	0001e797          	auipc	a5,0x1e
    8000295c:	a607b783          	ld	a5,-1440(a5) # 800203b8 <xTimerQueue>
    80002960:	cb81                	beqz	a5,80002970 <prvCheckForValidListAndQueue+0x24>
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
	}
	taskEXIT_CRITICAL();
    80002962:	8f6ff0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    80002966:	60e2                	ld	ra,24(sp)
    80002968:	6442                	ld	s0,16(sp)
    8000296a:	64a2                	ld	s1,8(sp)
    8000296c:	6105                	addi	sp,sp,32
    8000296e:	8082                	ret
			vListInitialise( &xActiveTimerList1 );
    80002970:	0001e497          	auipc	s1,0x1e
    80002974:	ed848493          	addi	s1,s1,-296 # 80020848 <xActiveTimerList1>
    80002978:	8526                	mv	a0,s1
    8000297a:	bc7fd0ef          	jal	ra,80000540 <vListInitialise>
			vListInitialise( &xActiveTimerList2 );
    8000297e:	0001e417          	auipc	s0,0x1e
    80002982:	ef240413          	addi	s0,s0,-270 # 80020870 <xActiveTimerList2>
    80002986:	8522                	mv	a0,s0
    80002988:	bb9fd0ef          	jal	ra,80000540 <vListInitialise>
			pxCurrentTimerList = &xActiveTimerList1;
    8000298c:	0001e797          	auipc	a5,0x1e
    80002990:	a297be23          	sd	s1,-1476(a5) # 800203c8 <pxCurrentTimerList>
			pxOverflowTimerList = &xActiveTimerList2;
    80002994:	0001e797          	auipc	a5,0x1e
    80002998:	a287b623          	sd	s0,-1492(a5) # 800203c0 <pxOverflowTimerList>
			xTimerQueue = xQueueCreate( ( UBaseType_t ) configTIMER_QUEUE_LENGTH, sizeof( DaemonTaskMessage_t ) );
    8000299c:	4601                	li	a2,0
    8000299e:	45e1                	li	a1,24
    800029a0:	4509                	li	a0,2
    800029a2:	e09fd0ef          	jal	ra,800007aa <xQueueGenericCreate>
    800029a6:	0001e797          	auipc	a5,0x1e
    800029aa:	a0a7b923          	sd	a0,-1518(a5) # 800203b8 <xTimerQueue>
			configASSERT( xTimerQueue );
    800029ae:	c901                	beqz	a0,800029be <prvCheckForValidListAndQueue+0x72>
					vQueueAddToRegistry( xTimerQueue, "TmrQ" );
    800029b0:	0001d597          	auipc	a1,0x1d
    800029b4:	7d858593          	addi	a1,a1,2008 # 80020188 <__rodata_start+0x188>
    800029b8:	cc4fe0ef          	jal	ra,80000e7c <vQueueAddToRegistry>
    800029bc:	b75d                	j	80002962 <prvCheckForValidListAndQueue+0x16>
			configASSERT( xTimerQueue );
    800029be:	30047073          	csrci	mstatus,8
    800029c2:	a001                	j	800029c2 <prvCheckForValidListAndQueue+0x76>

00000000800029c4 <xTimerCreateTimerTask>:
{
    800029c4:	1141                	addi	sp,sp,-16
    800029c6:	e406                	sd	ra,8(sp)
	prvCheckForValidListAndQueue();
    800029c8:	f85ff0ef          	jal	ra,8000294c <prvCheckForValidListAndQueue>
	if( xTimerQueue != NULL )
    800029cc:	0001e797          	auipc	a5,0x1e
    800029d0:	9ec7b783          	ld	a5,-1556(a5) # 800203b8 <xTimerQueue>
    800029d4:	c39d                	beqz	a5,800029fa <xTimerCreateTimerTask+0x36>
			xReturn = xTaskCreate( prvTimerTask, "Tmr Svc", ( uint16_t ) configTIMER_TASK_STACK_DEPTH, NULL, ( ( UBaseType_t ) configTIMER_TASK_PRIORITY ) | portPRIVILEGE_BIT, NULL);
    800029d6:	4881                	li	a7,0
    800029d8:	4801                	li	a6,0
    800029da:	4781                	li	a5,0
    800029dc:	4709                	li	a4,2
    800029de:	4681                	li	a3,0
    800029e0:	40000613          	li	a2,1024
    800029e4:	0001d597          	auipc	a1,0x1d
    800029e8:	7ac58593          	addi	a1,a1,1964 # 80020190 <__rodata_start+0x190>
    800029ec:	00000517          	auipc	a0,0x0
    800029f0:	37050513          	addi	a0,a0,880 # 80002d5c <prvTimerTask>
    800029f4:	896ff0ef          	jal	ra,80001a8a <xTaskGenericCreate>
	configASSERT( xReturn );
    800029f8:	e501                	bnez	a0,80002a00 <xTimerCreateTimerTask+0x3c>
    800029fa:	30047073          	csrci	mstatus,8
    800029fe:	a001                	j	800029fe <xTimerCreateTimerTask+0x3a>
}
    80002a00:	60a2                	ld	ra,8(sp)
    80002a02:	0141                	addi	sp,sp,16
    80002a04:	8082                	ret

0000000080002a06 <xTimerCreate>:
{
    80002a06:	7139                	addi	sp,sp,-64
    80002a08:	fc06                	sd	ra,56(sp)
    80002a0a:	f822                	sd	s0,48(sp)
    80002a0c:	f426                	sd	s1,40(sp)
    80002a0e:	f04a                	sd	s2,32(sp)
    80002a10:	ec4e                	sd	s3,24(sp)
    80002a12:	e852                	sd	s4,16(sp)
    80002a14:	e456                	sd	s5,8(sp)
    80002a16:	842e                	mv	s0,a1
	if( xTimerPeriodInTicks == ( TickType_t ) 0U )
    80002a18:	c99d                	beqz	a1,80002a4e <xTimerCreate+0x48>
    80002a1a:	8aaa                	mv	s5,a0
    80002a1c:	8a32                	mv	s4,a2
    80002a1e:	89b6                	mv	s3,a3
    80002a20:	893a                	mv	s2,a4
		pxNewTimer = ( Timer_t * ) pvPortMalloc( sizeof( Timer_t ) );
    80002a22:	05800513          	li	a0,88
    80002a26:	7b0000ef          	jal	ra,800031d6 <pvPortMalloc>
    80002a2a:	84aa                	mv	s1,a0
		if( pxNewTimer != NULL )
    80002a2c:	c115                	beqz	a0,80002a50 <xTimerCreate+0x4a>
			prvCheckForValidListAndQueue();
    80002a2e:	f1fff0ef          	jal	ra,8000294c <prvCheckForValidListAndQueue>
			pxNewTimer->pcTimerName = pcTimerName;
    80002a32:	0154b023          	sd	s5,0(s1)
			pxNewTimer->xTimerPeriodInTicks = xTimerPeriodInTicks;
    80002a36:	d880                	sw	s0,48(s1)
			pxNewTimer->uxAutoReload = uxAutoReload;
    80002a38:	0344bc23          	sd	s4,56(s1)
			pxNewTimer->pvTimerID = pvTimerID;
    80002a3c:	0534b023          	sd	s3,64(s1)
			pxNewTimer->pxCallbackFunction = pxCallbackFunction;
    80002a40:	0524b423          	sd	s2,72(s1)
			vListInitialiseItem( &( pxNewTimer->xTimerListItem ) );
    80002a44:	00848513          	addi	a0,s1,8
    80002a48:	b0dfd0ef          	jal	ra,80000554 <vListInitialiseItem>
			traceTIMER_CREATE( pxNewTimer );
    80002a4c:	a011                	j	80002a50 <xTimerCreate+0x4a>
		pxNewTimer = NULL;
    80002a4e:	4481                	li	s1,0
	configASSERT( ( xTimerPeriodInTicks > 0 ) );
    80002a50:	e401                	bnez	s0,80002a58 <xTimerCreate+0x52>
    80002a52:	30047073          	csrci	mstatus,8
    80002a56:	a001                	j	80002a56 <xTimerCreate+0x50>
}
    80002a58:	8526                	mv	a0,s1
    80002a5a:	70e2                	ld	ra,56(sp)
    80002a5c:	7442                	ld	s0,48(sp)
    80002a5e:	74a2                	ld	s1,40(sp)
    80002a60:	7902                	ld	s2,32(sp)
    80002a62:	69e2                	ld	s3,24(sp)
    80002a64:	6a42                	ld	s4,16(sp)
    80002a66:	6aa2                	ld	s5,8(sp)
    80002a68:	6121                	addi	sp,sp,64
    80002a6a:	8082                	ret

0000000080002a6c <xTimerGenericCommand>:
	configASSERT( xTimer );
    80002a6c:	c129                	beqz	a0,80002aae <xTimerGenericCommand+0x42>
{
    80002a6e:	7179                	addi	sp,sp,-48
    80002a70:	f406                	sd	ra,40(sp)
    80002a72:	f022                	sd	s0,32(sp)
    80002a74:	87aa                	mv	a5,a0
    80002a76:	8836                	mv	a6,a3
    80002a78:	843a                	mv	s0,a4
	if( xTimerQueue != NULL )
    80002a7a:	0001e517          	auipc	a0,0x1e
    80002a7e:	93e53503          	ld	a0,-1730(a0) # 800203b8 <xTimerQueue>
    80002a82:	cd21                	beqz	a0,80002ada <xTimerGenericCommand+0x6e>
		xMessage.xMessageID = xCommandID;
    80002a84:	e42e                	sd	a1,8(sp)
		xMessage.u.xTimerParameters.xMessageValue = xOptionalValue;
    80002a86:	c832                	sw	a2,16(sp)
		xMessage.u.xTimerParameters.pxTimer = ( Timer_t * ) xTimer;
    80002a88:	ec3e                	sd	a5,24(sp)
		if( xCommandID < tmrFIRST_FROM_ISR_COMMAND )
    80002a8a:	4795                	li	a5,5
    80002a8c:	02b7ce63          	blt	a5,a1,80002ac8 <xTimerGenericCommand+0x5c>
			if( xTaskGetSchedulerState() == taskSCHEDULER_RUNNING )
    80002a90:	e51fe0ef          	jal	ra,800018e0 <xTaskGetSchedulerState>
    80002a94:	4789                	li	a5,2
    80002a96:	00f50f63          	beq	a0,a5,80002ab4 <xTimerGenericCommand+0x48>
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, tmrNO_DELAY );
    80002a9a:	4681                	li	a3,0
    80002a9c:	4601                	li	a2,0
    80002a9e:	002c                	addi	a1,sp,8
    80002aa0:	0001e517          	auipc	a0,0x1e
    80002aa4:	91853503          	ld	a0,-1768(a0) # 800203b8 <xTimerQueue>
    80002aa8:	da3fd0ef          	jal	ra,8000084a <xQueueGenericSend>
    80002aac:	a01d                	j	80002ad2 <xTimerGenericCommand+0x66>
	configASSERT( xTimer );
    80002aae:	30047073          	csrci	mstatus,8
    80002ab2:	a001                	j	80002ab2 <xTimerGenericCommand+0x46>
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, xTicksToWait );
    80002ab4:	4681                	li	a3,0
    80002ab6:	8622                	mv	a2,s0
    80002ab8:	002c                	addi	a1,sp,8
    80002aba:	0001e517          	auipc	a0,0x1e
    80002abe:	8fe53503          	ld	a0,-1794(a0) # 800203b8 <xTimerQueue>
    80002ac2:	d89fd0ef          	jal	ra,8000084a <xQueueGenericSend>
    80002ac6:	a031                	j	80002ad2 <xTimerGenericCommand+0x66>
			xReturn = xQueueSendToBackFromISR( xTimerQueue, &xMessage, pxHigherPriorityTaskWoken );
    80002ac8:	4681                	li	a3,0
    80002aca:	8642                	mv	a2,a6
    80002acc:	002c                	addi	a1,sp,8
    80002ace:	f53fd0ef          	jal	ra,80000a20 <xQueueGenericSendFromISR>
}
    80002ad2:	70a2                	ld	ra,40(sp)
    80002ad4:	7402                	ld	s0,32(sp)
    80002ad6:	6145                	addi	sp,sp,48
    80002ad8:	8082                	ret
BaseType_t xReturn = pdFAIL;
    80002ada:	4501                	li	a0,0
	return xReturn;
    80002adc:	bfdd                	j	80002ad2 <xTimerGenericCommand+0x66>

0000000080002ade <prvSwitchTimerLists>:
	while( listLIST_IS_EMPTY( pxCurrentTimerList ) == pdFALSE )
    80002ade:	0001e797          	auipc	a5,0x1e
    80002ae2:	8ea7b783          	ld	a5,-1814(a5) # 800203c8 <pxCurrentTimerList>
    80002ae6:	6398                	ld	a4,0(a5)
    80002ae8:	cb41                	beqz	a4,80002b78 <prvSwitchTimerLists+0x9a>
{
    80002aea:	1101                	addi	sp,sp,-32
    80002aec:	ec06                	sd	ra,24(sp)
    80002aee:	e822                	sd	s0,16(sp)
    80002af0:	e426                	sd	s1,8(sp)
    80002af2:	e04a                	sd	s2,0(sp)
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
    80002af4:	6f9c                	ld	a5,24(a5)
    80002af6:	0007a903          	lw	s2,0(a5)
		pxTimer = ( Timer_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
    80002afa:	6f80                	ld	s0,24(a5)
		( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
    80002afc:	00840493          	addi	s1,s0,8
    80002b00:	8526                	mv	a0,s1
    80002b02:	a9dfd0ef          	jal	ra,8000059e <uxListRemove>
		pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );
    80002b06:	643c                	ld	a5,72(s0)
    80002b08:	8522                	mv	a0,s0
    80002b0a:	9782                	jalr	a5
		if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
    80002b0c:	7c18                	ld	a4,56(s0)
    80002b0e:	4785                	li	a5,1
    80002b10:	02f70863          	beq	a4,a5,80002b40 <prvSwitchTimerLists+0x62>
	while( listLIST_IS_EMPTY( pxCurrentTimerList ) == pdFALSE )
    80002b14:	0001e797          	auipc	a5,0x1e
    80002b18:	8b47b783          	ld	a5,-1868(a5) # 800203c8 <pxCurrentTimerList>
    80002b1c:	6398                	ld	a4,0(a5)
    80002b1e:	fb79                	bnez	a4,80002af4 <prvSwitchTimerLists+0x16>
	pxCurrentTimerList = pxOverflowTimerList;
    80002b20:	0001e717          	auipc	a4,0x1e
    80002b24:	8a070713          	addi	a4,a4,-1888 # 800203c0 <pxOverflowTimerList>
    80002b28:	6314                	ld	a3,0(a4)
    80002b2a:	0001e617          	auipc	a2,0x1e
    80002b2e:	88d63f23          	sd	a3,-1890(a2) # 800203c8 <pxCurrentTimerList>
	pxOverflowTimerList = pxTemp;
    80002b32:	e31c                	sd	a5,0(a4)
}
    80002b34:	60e2                	ld	ra,24(sp)
    80002b36:	6442                	ld	s0,16(sp)
    80002b38:	64a2                	ld	s1,8(sp)
    80002b3a:	6902                	ld	s2,0(sp)
    80002b3c:	6105                	addi	sp,sp,32
    80002b3e:	8082                	ret
			xReloadTime = ( xNextExpireTime + pxTimer->xTimerPeriodInTicks );
    80002b40:	581c                	lw	a5,48(s0)
    80002b42:	012787bb          	addw	a5,a5,s2
    80002b46:	0007871b          	sext.w	a4,a5
			if( xReloadTime > xNextExpireTime )
    80002b4a:	00e97c63          	bgeu	s2,a4,80002b62 <prvSwitchTimerLists+0x84>
				listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xReloadTime );
    80002b4e:	c41c                	sw	a5,8(s0)
				listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
    80002b50:	f000                	sd	s0,32(s0)
				vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
    80002b52:	85a6                	mv	a1,s1
    80002b54:	0001e517          	auipc	a0,0x1e
    80002b58:	87453503          	ld	a0,-1932(a0) # 800203c8 <pxCurrentTimerList>
    80002b5c:	a15fd0ef          	jal	ra,80000570 <vListInsert>
    80002b60:	bf55                	j	80002b14 <prvSwitchTimerLists+0x36>
				xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xNextExpireTime, NULL, tmrNO_DELAY );
    80002b62:	4701                	li	a4,0
    80002b64:	4681                	li	a3,0
    80002b66:	864a                	mv	a2,s2
    80002b68:	4581                	li	a1,0
    80002b6a:	8522                	mv	a0,s0
    80002b6c:	f01ff0ef          	jal	ra,80002a6c <xTimerGenericCommand>
				configASSERT( xResult );
    80002b70:	f155                	bnez	a0,80002b14 <prvSwitchTimerLists+0x36>
    80002b72:	30047073          	csrci	mstatus,8
    80002b76:	a001                	j	80002b76 <prvSwitchTimerLists+0x98>
	pxCurrentTimerList = pxOverflowTimerList;
    80002b78:	0001e717          	auipc	a4,0x1e
    80002b7c:	84870713          	addi	a4,a4,-1976 # 800203c0 <pxOverflowTimerList>
    80002b80:	6314                	ld	a3,0(a4)
    80002b82:	0001e617          	auipc	a2,0x1e
    80002b86:	84d63323          	sd	a3,-1978(a2) # 800203c8 <pxCurrentTimerList>
	pxOverflowTimerList = pxTemp;
    80002b8a:	e31c                	sd	a5,0(a4)
    80002b8c:	8082                	ret

0000000080002b8e <prvSampleTimeNow>:
{
    80002b8e:	1101                	addi	sp,sp,-32
    80002b90:	ec06                	sd	ra,24(sp)
    80002b92:	e822                	sd	s0,16(sp)
    80002b94:	e426                	sd	s1,8(sp)
    80002b96:	84aa                	mv	s1,a0
	xTimeNow = xTaskGetTickCount();
    80002b98:	f80ff0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80002b9c:	0005041b          	sext.w	s0,a0
	if( xTimeNow < xLastTime )
    80002ba0:	0001e797          	auipc	a5,0x1e
    80002ba4:	8107a783          	lw	a5,-2032(a5) # 800203b0 <xLastTime.0>
    80002ba8:	00f46e63          	bltu	s0,a5,80002bc4 <prvSampleTimeNow+0x36>
		*pxTimerListsWereSwitched = pdFALSE;
    80002bac:	0004b023          	sd	zero,0(s1)
	xLastTime = xTimeNow;
    80002bb0:	0001e797          	auipc	a5,0x1e
    80002bb4:	8087a023          	sw	s0,-2048(a5) # 800203b0 <xLastTime.0>
}
    80002bb8:	8522                	mv	a0,s0
    80002bba:	60e2                	ld	ra,24(sp)
    80002bbc:	6442                	ld	s0,16(sp)
    80002bbe:	64a2                	ld	s1,8(sp)
    80002bc0:	6105                	addi	sp,sp,32
    80002bc2:	8082                	ret
		prvSwitchTimerLists();
    80002bc4:	f1bff0ef          	jal	ra,80002ade <prvSwitchTimerLists>
		*pxTimerListsWereSwitched = pdTRUE;
    80002bc8:	4785                	li	a5,1
    80002bca:	e09c                	sd	a5,0(s1)
    80002bcc:	b7d5                	j	80002bb0 <prvSampleTimeNow+0x22>

0000000080002bce <prvProcessExpiredTimer>:
{
    80002bce:	1101                	addi	sp,sp,-32
    80002bd0:	ec06                	sd	ra,24(sp)
    80002bd2:	e822                	sd	s0,16(sp)
    80002bd4:	e426                	sd	s1,8(sp)
    80002bd6:	e04a                	sd	s2,0(sp)
    80002bd8:	84aa                	mv	s1,a0
    80002bda:	892e                	mv	s2,a1
Timer_t * const pxTimer = ( Timer_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
    80002bdc:	0001d797          	auipc	a5,0x1d
    80002be0:	7ec7b783          	ld	a5,2028(a5) # 800203c8 <pxCurrentTimerList>
    80002be4:	6f9c                	ld	a5,24(a5)
    80002be6:	6f80                	ld	s0,24(a5)
	( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
    80002be8:	00840513          	addi	a0,s0,8
    80002bec:	9b3fd0ef          	jal	ra,8000059e <uxListRemove>
	if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
    80002bf0:	7c18                	ld	a4,56(s0)
    80002bf2:	4785                	li	a5,1
    80002bf4:	00f70b63          	beq	a4,a5,80002c0a <prvProcessExpiredTimer+0x3c>
	pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );
    80002bf8:	643c                	ld	a5,72(s0)
    80002bfa:	8522                	mv	a0,s0
    80002bfc:	9782                	jalr	a5
}
    80002bfe:	60e2                	ld	ra,24(sp)
    80002c00:	6442                	ld	s0,16(sp)
    80002c02:	64a2                	ld	s1,8(sp)
    80002c04:	6902                	ld	s2,0(sp)
    80002c06:	6105                	addi	sp,sp,32
    80002c08:	8082                	ret
		if( prvInsertTimerInActiveList( pxTimer, ( xNextExpireTime + pxTimer->xTimerPeriodInTicks ), xTimeNow, xNextExpireTime ) == pdTRUE )
    80002c0a:	580c                	lw	a1,48(s0)
    80002c0c:	86a6                	mv	a3,s1
    80002c0e:	864a                	mv	a2,s2
    80002c10:	9da5                	addw	a1,a1,s1
    80002c12:	8522                	mv	a0,s0
    80002c14:	ce9ff0ef          	jal	ra,800028fc <prvInsertTimerInActiveList>
    80002c18:	4785                	li	a5,1
    80002c1a:	fcf51fe3          	bne	a0,a5,80002bf8 <prvProcessExpiredTimer+0x2a>
			xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xNextExpireTime, NULL, tmrNO_DELAY );
    80002c1e:	4701                	li	a4,0
    80002c20:	4681                	li	a3,0
    80002c22:	8626                	mv	a2,s1
    80002c24:	4581                	li	a1,0
    80002c26:	8522                	mv	a0,s0
    80002c28:	e45ff0ef          	jal	ra,80002a6c <xTimerGenericCommand>
			configASSERT( xResult );
    80002c2c:	f571                	bnez	a0,80002bf8 <prvProcessExpiredTimer+0x2a>
    80002c2e:	30047073          	csrci	mstatus,8
    80002c32:	a001                	j	80002c32 <prvProcessExpiredTimer+0x64>

0000000080002c34 <prvProcessTimerOrBlockTask>:
{
    80002c34:	7179                	addi	sp,sp,-48
    80002c36:	f406                	sd	ra,40(sp)
    80002c38:	f022                	sd	s0,32(sp)
    80002c3a:	ec26                	sd	s1,24(sp)
    80002c3c:	e84a                	sd	s2,16(sp)
    80002c3e:	892a                	mv	s2,a0
    80002c40:	842e                	mv	s0,a1
	vTaskSuspendAll();
    80002c42:	f16fe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		xTimeNow = prvSampleTimeNow( &xTimerListsWereSwitched );
    80002c46:	0028                	addi	a0,sp,8
    80002c48:	f47ff0ef          	jal	ra,80002b8e <prvSampleTimeNow>
		if( xTimerListsWereSwitched == pdFALSE )
    80002c4c:	67a2                	ld	a5,8(sp)
    80002c4e:	ebb1                	bnez	a5,80002ca2 <prvProcessTimerOrBlockTask+0x6e>
    80002c50:	0005049b          	sext.w	s1,a0
			if( ( xListWasEmpty == pdFALSE ) && ( xNextExpireTime <= xTimeNow ) )
    80002c54:	e019                	bnez	s0,80002c5a <prvProcessTimerOrBlockTask+0x26>
    80002c56:	0324fc63          	bgeu	s1,s2,80002c8e <prvProcessTimerOrBlockTask+0x5a>
				if( xListWasEmpty != pdFALSE )
    80002c5a:	c801                	beqz	s0,80002c6a <prvProcessTimerOrBlockTask+0x36>
					xListWasEmpty = listLIST_IS_EMPTY( pxOverflowTimerList );
    80002c5c:	0001d797          	auipc	a5,0x1d
    80002c60:	7647b783          	ld	a5,1892(a5) # 800203c0 <pxOverflowTimerList>
    80002c64:	6380                	ld	s0,0(a5)
    80002c66:	00143413          	seqz	s0,s0
				vQueueWaitForMessageRestricted( xTimerQueue, ( xNextExpireTime - xTimeNow ), xListWasEmpty );
    80002c6a:	8622                	mv	a2,s0
    80002c6c:	409905bb          	subw	a1,s2,s1
    80002c70:	0001d517          	auipc	a0,0x1d
    80002c74:	74853503          	ld	a0,1864(a0) # 800203b8 <xTimerQueue>
    80002c78:	a8cfe0ef          	jal	ra,80000f04 <vQueueWaitForMessageRestricted>
				if( xTaskResumeAll() == pdFALSE )
    80002c7c:	b4aff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
    80002c80:	cd11                	beqz	a0,80002c9c <prvProcessTimerOrBlockTask+0x68>
}
    80002c82:	70a2                	ld	ra,40(sp)
    80002c84:	7402                	ld	s0,32(sp)
    80002c86:	64e2                	ld	s1,24(sp)
    80002c88:	6942                	ld	s2,16(sp)
    80002c8a:	6145                	addi	sp,sp,48
    80002c8c:	8082                	ret
				( void ) xTaskResumeAll();
    80002c8e:	b38ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
				prvProcessExpiredTimer( xNextExpireTime, xTimeNow );
    80002c92:	85a6                	mv	a1,s1
    80002c94:	854a                	mv	a0,s2
    80002c96:	f39ff0ef          	jal	ra,80002bce <prvProcessExpiredTimer>
    80002c9a:	b7e5                	j	80002c82 <prvProcessTimerOrBlockTask+0x4e>
					portYIELD_WITHIN_API();
    80002c9c:	f70fd0ef          	jal	ra,8000040c <vPortYield>
    80002ca0:	b7cd                	j	80002c82 <prvProcessTimerOrBlockTask+0x4e>
			( void ) xTaskResumeAll();
    80002ca2:	b24ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
}
    80002ca6:	bff1                	j	80002c82 <prvProcessTimerOrBlockTask+0x4e>

0000000080002ca8 <prvProcessReceivedCommands>:
{
    80002ca8:	7179                	addi	sp,sp,-48
    80002caa:	f406                	sd	ra,40(sp)
    80002cac:	f022                	sd	s0,32(sp)
	while( xQueueReceive( xTimerQueue, &xMessage, tmrNO_DELAY ) != pdFAIL ) /*lint !e603 xMessage does not have to be initialised as it is passed out, not in, and it is not used unless xQueueReceive() returns pdTRUE. */
    80002cae:	4681                	li	a3,0
    80002cb0:	4601                	li	a2,0
    80002cb2:	002c                	addi	a1,sp,8
    80002cb4:	0001d517          	auipc	a0,0x1d
    80002cb8:	70453503          	ld	a0,1796(a0) # 800203b8 <xTimerQueue>
    80002cbc:	ea3fd0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80002cc0:	c951                	beqz	a0,80002d54 <prvProcessReceivedCommands+0xac>
		if( xMessage.xMessageID >= ( BaseType_t ) 0 )
    80002cc2:	67a2                	ld	a5,8(sp)
    80002cc4:	fe07c5e3          	bltz	a5,80002cae <prvProcessReceivedCommands+0x6>
			pxTimer = xMessage.u.xTimerParameters.pxTimer;
    80002cc8:	6462                	ld	s0,24(sp)
			if( listIS_CONTAINED_WITHIN( NULL, &( pxTimer->xTimerListItem ) ) == pdFALSE )
    80002cca:	741c                	ld	a5,40(s0)
    80002ccc:	c789                	beqz	a5,80002cd6 <prvProcessReceivedCommands+0x2e>
				( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
    80002cce:	00840513          	addi	a0,s0,8
    80002cd2:	8cdfd0ef          	jal	ra,8000059e <uxListRemove>
			xTimeNow = prvSampleTimeNow( &xTimerListsWereSwitched );
    80002cd6:	850a                	mv	a0,sp
    80002cd8:	eb7ff0ef          	jal	ra,80002b8e <prvSampleTimeNow>
    80002cdc:	0005061b          	sext.w	a2,a0
			switch( xMessage.xMessageID )
    80002ce0:	67a2                	ld	a5,8(sp)
    80002ce2:	4725                	li	a4,9
    80002ce4:	fcf765e3          	bltu	a4,a5,80002cae <prvProcessReceivedCommands+0x6>
    80002ce8:	078a                	slli	a5,a5,0x2
    80002cea:	0001d717          	auipc	a4,0x1d
    80002cee:	31670713          	addi	a4,a4,790 # 80020000 <__rodata_start>
    80002cf2:	97ba                	add	a5,a5,a4
    80002cf4:	439c                	lw	a5,0(a5)
    80002cf6:	97ba                	add	a5,a5,a4
    80002cf8:	8782                	jr	a5
					if( prvInsertTimerInActiveList( pxTimer,  xMessage.u.xTimerParameters.xMessageValue + pxTimer->xTimerPeriodInTicks, xTimeNow, xMessage.u.xTimerParameters.xMessageValue ) == pdTRUE )
    80002cfa:	46c2                	lw	a3,16(sp)
    80002cfc:	580c                	lw	a1,48(s0)
    80002cfe:	9db5                	addw	a1,a1,a3
    80002d00:	8522                	mv	a0,s0
    80002d02:	bfbff0ef          	jal	ra,800028fc <prvInsertTimerInActiveList>
    80002d06:	4785                	li	a5,1
    80002d08:	faf513e3          	bne	a0,a5,80002cae <prvProcessReceivedCommands+0x6>
						pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );
    80002d0c:	643c                	ld	a5,72(s0)
    80002d0e:	8522                	mv	a0,s0
    80002d10:	9782                	jalr	a5
						if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
    80002d12:	7c18                	ld	a4,56(s0)
    80002d14:	4785                	li	a5,1
    80002d16:	f8f71ce3          	bne	a4,a5,80002cae <prvProcessReceivedCommands+0x6>
							xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xMessage.u.xTimerParameters.xMessageValue + pxTimer->xTimerPeriodInTicks, NULL, tmrNO_DELAY );
    80002d1a:	4642                	lw	a2,16(sp)
    80002d1c:	581c                	lw	a5,48(s0)
    80002d1e:	4701                	li	a4,0
    80002d20:	4681                	li	a3,0
    80002d22:	9e3d                	addw	a2,a2,a5
    80002d24:	4581                	li	a1,0
    80002d26:	8522                	mv	a0,s0
    80002d28:	d45ff0ef          	jal	ra,80002a6c <xTimerGenericCommand>
							configASSERT( xResult );
    80002d2c:	f149                	bnez	a0,80002cae <prvProcessReceivedCommands+0x6>
    80002d2e:	30047073          	csrci	mstatus,8
    80002d32:	a001                	j	80002d32 <prvProcessReceivedCommands+0x8a>
					pxTimer->xTimerPeriodInTicks = xMessage.u.xTimerParameters.xMessageValue;
    80002d34:	45c2                	lw	a1,16(sp)
    80002d36:	d80c                	sw	a1,48(s0)
					configASSERT( ( pxTimer->xTimerPeriodInTicks > 0 ) );
    80002d38:	c599                	beqz	a1,80002d46 <prvProcessReceivedCommands+0x9e>
					( void ) prvInsertTimerInActiveList( pxTimer, ( xTimeNow + pxTimer->xTimerPeriodInTicks ), xTimeNow, xTimeNow );
    80002d3a:	86b2                	mv	a3,a2
    80002d3c:	9db1                	addw	a1,a1,a2
    80002d3e:	8522                	mv	a0,s0
    80002d40:	bbdff0ef          	jal	ra,800028fc <prvInsertTimerInActiveList>
					break;
    80002d44:	b7ad                	j	80002cae <prvProcessReceivedCommands+0x6>
					configASSERT( ( pxTimer->xTimerPeriodInTicks > 0 ) );
    80002d46:	30047073          	csrci	mstatus,8
    80002d4a:	a001                	j	80002d4a <prvProcessReceivedCommands+0xa2>
					vPortFree( pxTimer );
    80002d4c:	8522                	mv	a0,s0
    80002d4e:	55a000ef          	jal	ra,800032a8 <vPortFree>
					break;
    80002d52:	bfb1                	j	80002cae <prvProcessReceivedCommands+0x6>
}
    80002d54:	70a2                	ld	ra,40(sp)
    80002d56:	7402                	ld	s0,32(sp)
    80002d58:	6145                	addi	sp,sp,48
    80002d5a:	8082                	ret

0000000080002d5c <prvTimerTask>:
{
    80002d5c:	1101                	addi	sp,sp,-32
    80002d5e:	ec06                	sd	ra,24(sp)
		xNextExpireTime = prvGetNextExpireTime( &xListWasEmpty );
    80002d60:	0028                	addi	a0,sp,8
    80002d62:	b7fff0ef          	jal	ra,800028e0 <prvGetNextExpireTime>
		prvProcessTimerOrBlockTask( xNextExpireTime, xListWasEmpty );
    80002d66:	65a2                	ld	a1,8(sp)
    80002d68:	2501                	sext.w	a0,a0
    80002d6a:	ecbff0ef          	jal	ra,80002c34 <prvProcessTimerOrBlockTask>
		prvProcessReceivedCommands();
    80002d6e:	f3bff0ef          	jal	ra,80002ca8 <prvProcessReceivedCommands>
	for( ;; )
    80002d72:	b7fd                	j	80002d60 <prvTimerTask+0x4>

0000000080002d74 <pcTimerGetTimerName>:
	configASSERT( xTimer );
    80002d74:	c119                	beqz	a0,80002d7a <pcTimerGetTimerName+0x6>
}
    80002d76:	6108                	ld	a0,0(a0)
    80002d78:	8082                	ret
	configASSERT( xTimer );
    80002d7a:	30047073          	csrci	mstatus,8
    80002d7e:	a001                	j	80002d7e <pcTimerGetTimerName+0xa>

0000000080002d80 <xTimerIsTimerActive>:
BaseType_t xTimerIsTimerActive( TimerHandle_t xTimer )
{
BaseType_t xTimerIsInActiveList;
Timer_t *pxTimer = ( Timer_t * ) xTimer;

	configASSERT( xTimer );
    80002d80:	c10d                	beqz	a0,80002da2 <xTimerIsTimerActive+0x22>
{
    80002d82:	1141                	addi	sp,sp,-16
    80002d84:	e406                	sd	ra,8(sp)
    80002d86:	e022                	sd	s0,0(sp)
    80002d88:	842a                	mv	s0,a0

	/* Is the timer in the list of active timers? */
	taskENTER_CRITICAL();
    80002d8a:	cadfe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
	{
		/* Checking to see if it is in the NULL list in effect checks to see if
		it is referenced from either the current or the overflow timer lists in
		one go, but the logic has to be reversed, hence the '!'. */
		xTimerIsInActiveList = ( BaseType_t ) !( listIS_CONTAINED_WITHIN( NULL, &( pxTimer->xTimerListItem ) ) );
    80002d8e:	7400                	ld	s0,40(s0)
    80002d90:	00803433          	snez	s0,s0
	}
	taskEXIT_CRITICAL();
    80002d94:	cc5fe0ef          	jal	ra,80001a58 <vTaskExitCritical>

	return xTimerIsInActiveList;
} /*lint !e818 Can't be pointer to const due to the typedef. */
    80002d98:	8522                	mv	a0,s0
    80002d9a:	60a2                	ld	ra,8(sp)
    80002d9c:	6402                	ld	s0,0(sp)
    80002d9e:	0141                	addi	sp,sp,16
    80002da0:	8082                	ret
	configASSERT( xTimer );
    80002da2:	30047073          	csrci	mstatus,8
    80002da6:	a001                	j	80002da6 <xTimerIsTimerActive+0x26>

0000000080002da8 <pvTimerGetTimerID>:
void *pvTimerGetTimerID( const TimerHandle_t xTimer )
{
Timer_t * const pxTimer = ( Timer_t * ) xTimer;
void *pvReturn;

	configASSERT( xTimer );
    80002da8:	cd19                	beqz	a0,80002dc6 <pvTimerGetTimerID+0x1e>
{
    80002daa:	1141                	addi	sp,sp,-16
    80002dac:	e406                	sd	ra,8(sp)
    80002dae:	e022                	sd	s0,0(sp)
    80002db0:	842a                	mv	s0,a0

	taskENTER_CRITICAL();
    80002db2:	c85fe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
	{
		pvReturn = pxTimer->pvTimerID;
    80002db6:	6020                	ld	s0,64(s0)
	}
	taskEXIT_CRITICAL();
    80002db8:	ca1fe0ef          	jal	ra,80001a58 <vTaskExitCritical>

	return pvReturn;
}
    80002dbc:	8522                	mv	a0,s0
    80002dbe:	60a2                	ld	ra,8(sp)
    80002dc0:	6402                	ld	s0,0(sp)
    80002dc2:	0141                	addi	sp,sp,16
    80002dc4:	8082                	ret
	configASSERT( xTimer );
    80002dc6:	30047073          	csrci	mstatus,8
    80002dca:	a001                	j	80002dca <pvTimerGetTimerID+0x22>

0000000080002dcc <vTimerSetTimerID>:

void vTimerSetTimerID( TimerHandle_t xTimer, void *pvNewID )
{
Timer_t * const pxTimer = ( Timer_t * ) xTimer;

	configASSERT( xTimer );
    80002dcc:	c10d                	beqz	a0,80002dee <vTimerSetTimerID+0x22>
{
    80002dce:	1101                	addi	sp,sp,-32
    80002dd0:	ec06                	sd	ra,24(sp)
    80002dd2:	e822                	sd	s0,16(sp)
    80002dd4:	e426                	sd	s1,8(sp)
    80002dd6:	842a                	mv	s0,a0
    80002dd8:	84ae                	mv	s1,a1

	taskENTER_CRITICAL();
    80002dda:	c5dfe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
	{
		pxTimer->pvTimerID = pvNewID;
    80002dde:	e024                	sd	s1,64(s0)
	}
	taskEXIT_CRITICAL();
    80002de0:	c79fe0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    80002de4:	60e2                	ld	ra,24(sp)
    80002de6:	6442                	ld	s0,16(sp)
    80002de8:	64a2                	ld	s1,8(sp)
    80002dea:	6105                	addi	sp,sp,32
    80002dec:	8082                	ret
	configASSERT( xTimer );
    80002dee:	30047073          	csrci	mstatus,8
    80002df2:	a001                	j	80002df2 <vTimerSetTimerID+0x26>

0000000080002df4 <prvTestWaitCondition>:

static BaseType_t prvTestWaitCondition( const EventBits_t uxCurrentEventBits, const EventBits_t uxBitsToWaitFor, const BaseType_t xWaitForAllBits )
{
BaseType_t xWaitConditionMet = pdFALSE;

	if( xWaitForAllBits == pdFALSE )
    80002df4:	e609                	bnez	a2,80002dfe <prvTestWaitCondition+0xa>
	{
		/* Task only has to wait for one bit within uxBitsToWaitFor to be
		set.  Is one already set? */
		if( ( uxCurrentEventBits & uxBitsToWaitFor ) != ( EventBits_t ) 0 )
    80002df6:	8d6d                	and	a0,a0,a1
    80002df8:	e901                	bnez	a0,80002e08 <prvTestWaitCondition+0x14>
BaseType_t xWaitConditionMet = pdFALSE;
    80002dfa:	8532                	mv	a0,a2
    80002dfc:	8082                	ret
	}
	else
	{
		/* Task has to wait for all the bits in uxBitsToWaitFor to be set.
		Are they set already? */
		if( ( uxCurrentEventBits & uxBitsToWaitFor ) == uxBitsToWaitFor )
    80002dfe:	8d6d                	and	a0,a0,a1
    80002e00:	00b50663          	beq	a0,a1,80002e0c <prvTestWaitCondition+0x18>
BaseType_t xWaitConditionMet = pdFALSE;
    80002e04:	4501                	li	a0,0
    80002e06:	8082                	ret
			xWaitConditionMet = pdTRUE;
    80002e08:	4505                	li	a0,1
    80002e0a:	8082                	ret
		{
			xWaitConditionMet = pdTRUE;
    80002e0c:	4505                	li	a0,1
			mtCOVERAGE_TEST_MARKER();
		}
	}

	return xWaitConditionMet;
}
    80002e0e:	8082                	ret

0000000080002e10 <xEventGroupCreate>:
{
    80002e10:	1141                	addi	sp,sp,-16
    80002e12:	e406                	sd	ra,8(sp)
    80002e14:	e022                	sd	s0,0(sp)
	pxEventBits = ( EventGroup_t * ) pvPortMalloc( sizeof( EventGroup_t ) );
    80002e16:	03800513          	li	a0,56
    80002e1a:	3bc000ef          	jal	ra,800031d6 <pvPortMalloc>
    80002e1e:	842a                	mv	s0,a0
	if( pxEventBits != NULL )
    80002e20:	c511                	beqz	a0,80002e2c <xEventGroupCreate+0x1c>
		pxEventBits->uxEventBits = 0;
    80002e22:	00052023          	sw	zero,0(a0)
		vListInitialise( &( pxEventBits->xTasksWaitingForBits ) );
    80002e26:	0521                	addi	a0,a0,8
    80002e28:	f18fd0ef          	jal	ra,80000540 <vListInitialise>
}
    80002e2c:	8522                	mv	a0,s0
    80002e2e:	60a2                	ld	ra,8(sp)
    80002e30:	6402                	ld	s0,0(sp)
    80002e32:	0141                	addi	sp,sp,16
    80002e34:	8082                	ret

0000000080002e36 <xEventGroupWaitBits>:
	configASSERT( xEventGroup );
    80002e36:	c51d                	beqz	a0,80002e64 <xEventGroupWaitBits+0x2e>
{
    80002e38:	7139                	addi	sp,sp,-64
    80002e3a:	fc06                	sd	ra,56(sp)
    80002e3c:	f822                	sd	s0,48(sp)
    80002e3e:	f426                	sd	s1,40(sp)
    80002e40:	f04a                	sd	s2,32(sp)
    80002e42:	ec4e                	sd	s3,24(sp)
    80002e44:	e852                	sd	s4,16(sp)
    80002e46:	e456                	sd	s5,8(sp)
    80002e48:	e05a                	sd	s6,0(sp)
    80002e4a:	892a                	mv	s2,a0
    80002e4c:	842e                	mv	s0,a1
    80002e4e:	8ab2                	mv	s5,a2
    80002e50:	8a36                	mv	s4,a3
    80002e52:	89ba                	mv	s3,a4
	configASSERT( ( uxBitsToWaitFor & eventEVENT_BITS_CONTROL_BYTES ) == 0 );
    80002e54:	ff0004b7          	lui	s1,0xff000
    80002e58:	8ced                	and	s1,s1,a1
    80002e5a:	2481                	sext.w	s1,s1
    80002e5c:	c499                	beqz	s1,80002e6a <xEventGroupWaitBits+0x34>
    80002e5e:	30047073          	csrci	mstatus,8
    80002e62:	a001                	j	80002e62 <xEventGroupWaitBits+0x2c>
	configASSERT( xEventGroup );
    80002e64:	30047073          	csrci	mstatus,8
    80002e68:	a001                	j	80002e68 <xEventGroupWaitBits+0x32>
	configASSERT( uxBitsToWaitFor != 0 );
    80002e6a:	e581                	bnez	a1,80002e72 <xEventGroupWaitBits+0x3c>
    80002e6c:	30047073          	csrci	mstatus,8
    80002e70:	a001                	j	80002e70 <xEventGroupWaitBits+0x3a>
		configASSERT( !( ( xTaskGetSchedulerState() == taskSCHEDULER_SUSPENDED ) && ( xTicksToWait != 0 ) ) );
    80002e72:	a6ffe0ef          	jal	ra,800018e0 <xTaskGetSchedulerState>
    80002e76:	e511                	bnez	a0,80002e82 <xEventGroupWaitBits+0x4c>
    80002e78:	00098563          	beqz	s3,80002e82 <xEventGroupWaitBits+0x4c>
    80002e7c:	30047073          	csrci	mstatus,8
    80002e80:	a001                	j	80002e80 <xEventGroupWaitBits+0x4a>
	vTaskSuspendAll();
    80002e82:	cd6fe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		const EventBits_t uxCurrentEventBits = pxEventBits->uxEventBits;
    80002e86:	00092b03          	lw	s6,0(s2)
		xWaitConditionMet = prvTestWaitCondition( uxCurrentEventBits, uxBitsToWaitFor, xWaitForAllBits );
    80002e8a:	8652                	mv	a2,s4
    80002e8c:	85a2                	mv	a1,s0
    80002e8e:	855a                	mv	a0,s6
    80002e90:	f65ff0ef          	jal	ra,80002df4 <prvTestWaitCondition>
		if( xWaitConditionMet != pdFALSE )
    80002e94:	c539                	beqz	a0,80002ee2 <xEventGroupWaitBits+0xac>
			if( xClearOnExit != pdFALSE )
    80002e96:	000a8863          	beqz	s5,80002ea6 <xEventGroupWaitBits+0x70>
				pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
    80002e9a:	fff44793          	not	a5,s0
    80002e9e:	0167f7b3          	and	a5,a5,s6
    80002ea2:	00f92023          	sw	a5,0(s2)
	xAlreadyYielded = xTaskResumeAll();
    80002ea6:	920ff0ef          	jal	ra,80001fc6 <xTaskResumeAll>
	if( xTicksToWait != ( TickType_t ) 0 )
    80002eaa:	c08d                	beqz	s1,80002ecc <xEventGroupWaitBits+0x96>
		if( xAlreadyYielded == pdFALSE )
    80002eac:	c535                	beqz	a0,80002f18 <xEventGroupWaitBits+0xe2>
		uxReturn = uxTaskResetEventItemValue();
    80002eae:	d02ff0ef          	jal	ra,800023b0 <uxTaskResetEventItemValue>
    80002eb2:	00050b1b          	sext.w	s6,a0
		if( ( uxReturn & eventUNBLOCKED_DUE_TO_BIT_SET ) == ( EventBits_t ) 0 )
    80002eb6:	020007b7          	lui	a5,0x2000
    80002eba:	00fb77b3          	and	a5,s6,a5
    80002ebe:	2781                	sext.w	a5,a5
    80002ec0:	cfb9                	beqz	a5,80002f1e <xEventGroupWaitBits+0xe8>
		uxReturn &= ~eventEVENT_BITS_CONTROL_BYTES;
    80002ec2:	010007b7          	lui	a5,0x1000
    80002ec6:	17fd                	addi	a5,a5,-1
    80002ec8:	00fb7b33          	and	s6,s6,a5
}
    80002ecc:	855a                	mv	a0,s6
    80002ece:	70e2                	ld	ra,56(sp)
    80002ed0:	7442                	ld	s0,48(sp)
    80002ed2:	74a2                	ld	s1,40(sp)
    80002ed4:	7902                	ld	s2,32(sp)
    80002ed6:	69e2                	ld	s3,24(sp)
    80002ed8:	6a42                	ld	s4,16(sp)
    80002eda:	6aa2                	ld	s5,8(sp)
    80002edc:	6b02                	ld	s6,0(sp)
    80002ede:	6121                	addi	sp,sp,64
    80002ee0:	8082                	ret
		else if( xTicksToWait == ( TickType_t ) 0 )
    80002ee2:	02098963          	beqz	s3,80002f14 <xEventGroupWaitBits+0xde>
			if( xClearOnExit != pdFALSE )
    80002ee6:	020a9463          	bnez	s5,80002f0e <xEventGroupWaitBits+0xd8>
EventBits_t uxReturn, uxControlBits = 0;
    80002eea:	87a6                	mv	a5,s1
			if( xWaitForAllBits != pdFALSE )
    80002eec:	000a0663          	beqz	s4,80002ef8 <xEventGroupWaitBits+0xc2>
				uxControlBits |= eventWAIT_FOR_ALL_BITS;
    80002ef0:	04000737          	lui	a4,0x4000
    80002ef4:	8fd9                	or	a5,a5,a4
    80002ef6:	2781                	sext.w	a5,a5
			vTaskPlaceOnUnorderedEventList( &( pxEventBits->xTasksWaitingForBits ), ( uxBitsToWaitFor | uxControlBits ), xTicksToWait );
    80002ef8:	8fc1                	or	a5,a5,s0
    80002efa:	864e                	mv	a2,s3
    80002efc:	0007859b          	sext.w	a1,a5
    80002f00:	00890513          	addi	a0,s2,8
    80002f04:	f86fe0ef          	jal	ra,8000168a <vTaskPlaceOnUnorderedEventList>
			uxReturn = 0;
    80002f08:	8b26                	mv	s6,s1
			vTaskPlaceOnUnorderedEventList( &( pxEventBits->xTasksWaitingForBits ), ( uxBitsToWaitFor | uxControlBits ), xTicksToWait );
    80002f0a:	84ce                	mv	s1,s3
    80002f0c:	bf69                	j	80002ea6 <xEventGroupWaitBits+0x70>
				uxControlBits |= eventCLEAR_EVENTS_ON_EXIT_BIT;
    80002f0e:	010007b7          	lui	a5,0x1000
    80002f12:	bfe9                	j	80002eec <xEventGroupWaitBits+0xb6>
    80002f14:	84ce                	mv	s1,s3
    80002f16:	bf41                	j	80002ea6 <xEventGroupWaitBits+0x70>
			portYIELD_WITHIN_API();
    80002f18:	cf4fd0ef          	jal	ra,8000040c <vPortYield>
    80002f1c:	bf49                	j	80002eae <xEventGroupWaitBits+0x78>
			taskENTER_CRITICAL();
    80002f1e:	b19fe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
				uxReturn = pxEventBits->uxEventBits;
    80002f22:	00092b03          	lw	s6,0(s2)
				if( prvTestWaitCondition( uxReturn, uxBitsToWaitFor, xWaitForAllBits ) != pdFALSE )
    80002f26:	8652                	mv	a2,s4
    80002f28:	85a2                	mv	a1,s0
    80002f2a:	855a                	mv	a0,s6
    80002f2c:	ec9ff0ef          	jal	ra,80002df4 <prvTestWaitCondition>
    80002f30:	c909                	beqz	a0,80002f42 <xEventGroupWaitBits+0x10c>
					if( xClearOnExit != pdFALSE )
    80002f32:	000a8863          	beqz	s5,80002f42 <xEventGroupWaitBits+0x10c>
						pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
    80002f36:	fff44793          	not	a5,s0
    80002f3a:	0167f7b3          	and	a5,a5,s6
    80002f3e:	00f92023          	sw	a5,0(s2)
			taskEXIT_CRITICAL();
    80002f42:	b17fe0ef          	jal	ra,80001a58 <vTaskExitCritical>
			xTimeoutOccurred = pdFALSE;
    80002f46:	bfb5                	j	80002ec2 <xEventGroupWaitBits+0x8c>

0000000080002f48 <xEventGroupClearBits>:
	configASSERT( xEventGroup );
    80002f48:	c105                	beqz	a0,80002f68 <xEventGroupClearBits+0x20>
{
    80002f4a:	1101                	addi	sp,sp,-32
    80002f4c:	ec06                	sd	ra,24(sp)
    80002f4e:	e822                	sd	s0,16(sp)
    80002f50:	e426                	sd	s1,8(sp)
    80002f52:	e04a                	sd	s2,0(sp)
    80002f54:	84aa                	mv	s1,a0
    80002f56:	842e                	mv	s0,a1
	configASSERT( ( uxBitsToClear & eventEVENT_BITS_CONTROL_BYTES ) == 0 );
    80002f58:	ff0007b7          	lui	a5,0xff000
    80002f5c:	8fed                	and	a5,a5,a1
    80002f5e:	2781                	sext.w	a5,a5
    80002f60:	c799                	beqz	a5,80002f6e <xEventGroupClearBits+0x26>
    80002f62:	30047073          	csrci	mstatus,8
    80002f66:	a001                	j	80002f66 <xEventGroupClearBits+0x1e>
	configASSERT( xEventGroup );
    80002f68:	30047073          	csrci	mstatus,8
    80002f6c:	a001                	j	80002f6c <xEventGroupClearBits+0x24>
	taskENTER_CRITICAL();
    80002f6e:	ac9fe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
		uxReturn = pxEventBits->uxEventBits;
    80002f72:	0004a903          	lw	s2,0(s1) # ffffffffff000000 <__stack+0xffffffff7efc46d0>
		pxEventBits->uxEventBits &= ~uxBitsToClear;
    80002f76:	fff44793          	not	a5,s0
    80002f7a:	0127f7b3          	and	a5,a5,s2
    80002f7e:	c09c                	sw	a5,0(s1)
	taskEXIT_CRITICAL();
    80002f80:	ad9fe0ef          	jal	ra,80001a58 <vTaskExitCritical>
}
    80002f84:	854a                	mv	a0,s2
    80002f86:	60e2                	ld	ra,24(sp)
    80002f88:	6442                	ld	s0,16(sp)
    80002f8a:	64a2                	ld	s1,8(sp)
    80002f8c:	6902                	ld	s2,0(sp)
    80002f8e:	6105                	addi	sp,sp,32
    80002f90:	8082                	ret

0000000080002f92 <xEventGroupGetBitsFromISR>:
{
    80002f92:	1141                	addi	sp,sp,-16
    80002f94:	e406                	sd	ra,8(sp)
    80002f96:	e022                	sd	s0,0(sp)
    80002f98:	842a                	mv	s0,a0
	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    80002f9a:	d62fd0ef          	jal	ra,800004fc <vPortSetInterruptMask>
		uxReturn = pxEventBits->uxEventBits;
    80002f9e:	4000                	lw	s0,0(s0)
	portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    80002fa0:	d56fd0ef          	jal	ra,800004f6 <vPortClearInterruptMask>
}
    80002fa4:	8522                	mv	a0,s0
    80002fa6:	60a2                	ld	ra,8(sp)
    80002fa8:	6402                	ld	s0,0(sp)
    80002faa:	0141                	addi	sp,sp,16
    80002fac:	8082                	ret

0000000080002fae <xEventGroupSetBits>:
	configASSERT( xEventGroup );
    80002fae:	c10d                	beqz	a0,80002fd0 <xEventGroupSetBits+0x22>
{
    80002fb0:	7179                	addi	sp,sp,-48
    80002fb2:	f406                	sd	ra,40(sp)
    80002fb4:	f022                	sd	s0,32(sp)
    80002fb6:	ec26                	sd	s1,24(sp)
    80002fb8:	e84a                	sd	s2,16(sp)
    80002fba:	e44e                	sd	s3,8(sp)
    80002fbc:	842a                	mv	s0,a0
    80002fbe:	892e                	mv	s2,a1
	configASSERT( ( uxBitsToSet & eventEVENT_BITS_CONTROL_BYTES ) == 0 );
    80002fc0:	ff0004b7          	lui	s1,0xff000
    80002fc4:	8ced                	and	s1,s1,a1
    80002fc6:	2481                	sext.w	s1,s1
    80002fc8:	c499                	beqz	s1,80002fd6 <xEventGroupSetBits+0x28>
    80002fca:	30047073          	csrci	mstatus,8
    80002fce:	a001                	j	80002fce <xEventGroupSetBits+0x20>
	configASSERT( xEventGroup );
    80002fd0:	30047073          	csrci	mstatus,8
    80002fd4:	a001                	j	80002fd4 <xEventGroupSetBits+0x26>
	pxListEnd = listGET_END_MARKER( pxList ); /*lint !e826 !e740 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    80002fd6:	01850993          	addi	s3,a0,24
	vTaskSuspendAll();
    80002fda:	b7efe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		pxListItem = listGET_HEAD_ENTRY( pxList );
    80002fde:	7008                	ld	a0,32(s0)
		pxEventBits->uxEventBits |= uxBitsToSet;
    80002fe0:	401c                	lw	a5,0(s0)
    80002fe2:	0127e7b3          	or	a5,a5,s2
    80002fe6:	c01c                	sw	a5,0(s0)
		while( pxListItem != pxListEnd )
    80002fe8:	a831                	j	80003004 <xEventGroupSetBits+0x56>
			else if( ( uxBitsWaitedFor & pxEventBits->uxEventBits ) == uxBitsWaitedFor )
    80002fea:	4018                	lw	a4,0(s0)
    80002fec:	8f7d                	and	a4,a4,a5
    80002fee:	00f71a63          	bne	a4,a5,80003002 <xEventGroupSetBits+0x54>
    80002ff2:	a815                	j	80003026 <xEventGroupSetBits+0x78>
				( void ) xTaskRemoveFromUnorderedEventList( pxListItem, pxEventBits->uxEventBits | eventUNBLOCKED_DUE_TO_BIT_SET );
    80002ff4:	400c                	lw	a1,0(s0)
    80002ff6:	020007b7          	lui	a5,0x2000
    80002ffa:	8ddd                	or	a1,a1,a5
    80002ffc:	2581                	sext.w	a1,a1
    80002ffe:	80ffe0ef          	jal	ra,8000180c <xTaskRemoveFromUnorderedEventList>
{
    80003002:	854a                	mv	a0,s2
		while( pxListItem != pxListEnd )
    80003004:	03350863          	beq	a0,s3,80003034 <xEventGroupSetBits+0x86>
			pxNext = listGET_NEXT( pxListItem );
    80003008:	00853903          	ld	s2,8(a0)
			uxBitsWaitedFor = listGET_LIST_ITEM_VALUE( pxListItem );
    8000300c:	4114                	lw	a3,0(a0)
			uxBitsWaitedFor &= ~eventEVENT_BITS_CONTROL_BYTES;
    8000300e:	010007b7          	lui	a5,0x1000
    80003012:	17fd                	addi	a5,a5,-1
    80003014:	8ff5                	and	a5,a5,a3
			if( ( uxControlBits & eventWAIT_FOR_ALL_BITS ) == ( EventBits_t ) 0 )
    80003016:	04000737          	lui	a4,0x4000
    8000301a:	8f75                	and	a4,a4,a3
    8000301c:	2701                	sext.w	a4,a4
    8000301e:	f771                	bnez	a4,80002fea <xEventGroupSetBits+0x3c>
				if( ( uxBitsWaitedFor & pxEventBits->uxEventBits ) != ( EventBits_t ) 0 )
    80003020:	4018                	lw	a4,0(s0)
    80003022:	8f7d                	and	a4,a4,a5
    80003024:	df79                	beqz	a4,80003002 <xEventGroupSetBits+0x54>
				if( ( uxControlBits & eventCLEAR_EVENTS_ON_EXIT_BIT ) != ( EventBits_t ) 0 )
    80003026:	01000737          	lui	a4,0x1000
    8000302a:	8ef9                	and	a3,a3,a4
    8000302c:	2681                	sext.w	a3,a3
    8000302e:	d2f9                	beqz	a3,80002ff4 <xEventGroupSetBits+0x46>
					uxBitsToClear |= uxBitsWaitedFor;
    80003030:	8cdd                	or	s1,s1,a5
    80003032:	b7c9                	j	80002ff4 <xEventGroupSetBits+0x46>
		pxEventBits->uxEventBits &= ~uxBitsToClear;
    80003034:	fff4c493          	not	s1,s1
    80003038:	401c                	lw	a5,0(s0)
    8000303a:	8fe5                	and	a5,a5,s1
    8000303c:	c01c                	sw	a5,0(s0)
	( void ) xTaskResumeAll();
    8000303e:	f89fe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
}
    80003042:	4008                	lw	a0,0(s0)
    80003044:	70a2                	ld	ra,40(sp)
    80003046:	7402                	ld	s0,32(sp)
    80003048:	64e2                	ld	s1,24(sp)
    8000304a:	6942                	ld	s2,16(sp)
    8000304c:	69a2                	ld	s3,8(sp)
    8000304e:	6145                	addi	sp,sp,48
    80003050:	8082                	ret

0000000080003052 <xEventGroupSync>:
{
    80003052:	7139                	addi	sp,sp,-64
    80003054:	fc06                	sd	ra,56(sp)
    80003056:	f822                	sd	s0,48(sp)
    80003058:	f426                	sd	s1,40(sp)
    8000305a:	f04a                	sd	s2,32(sp)
    8000305c:	ec4e                	sd	s3,24(sp)
    8000305e:	e852                	sd	s4,16(sp)
    80003060:	e456                	sd	s5,8(sp)
	configASSERT( ( uxBitsToWaitFor & eventEVENT_BITS_CONTROL_BYTES ) == 0 );
    80003062:	ff000437          	lui	s0,0xff000
    80003066:	8c71                	and	s0,s0,a2
    80003068:	2401                	sext.w	s0,s0
    8000306a:	c401                	beqz	s0,80003072 <xEventGroupSync+0x20>
    8000306c:	30047073          	csrci	mstatus,8
    80003070:	a001                	j	80003070 <xEventGroupSync+0x1e>
    80003072:	8a2a                	mv	s4,a0
    80003074:	892e                	mv	s2,a1
    80003076:	84b2                	mv	s1,a2
    80003078:	89b6                	mv	s3,a3
	configASSERT( uxBitsToWaitFor != 0 );
    8000307a:	e601                	bnez	a2,80003082 <xEventGroupSync+0x30>
    8000307c:	30047073          	csrci	mstatus,8
    80003080:	a001                	j	80003080 <xEventGroupSync+0x2e>
		configASSERT( !( ( xTaskGetSchedulerState() == taskSCHEDULER_SUSPENDED ) && ( xTicksToWait != 0 ) ) );
    80003082:	85ffe0ef          	jal	ra,800018e0 <xTaskGetSchedulerState>
    80003086:	e511                	bnez	a0,80003092 <xEventGroupSync+0x40>
    80003088:	00098563          	beqz	s3,80003092 <xEventGroupSync+0x40>
    8000308c:	30047073          	csrci	mstatus,8
    80003090:	a001                	j	80003090 <xEventGroupSync+0x3e>
	vTaskSuspendAll();
    80003092:	ac6fe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		uxOriginalBitValue = pxEventBits->uxEventBits;
    80003096:	000a2a83          	lw	s5,0(s4)
		( void ) xEventGroupSetBits( xEventGroup, uxBitsToSet );
    8000309a:	85ca                	mv	a1,s2
    8000309c:	8552                	mv	a0,s4
    8000309e:	f11ff0ef          	jal	ra,80002fae <xEventGroupSetBits>
		if( ( ( uxOriginalBitValue | uxBitsToSet ) & uxBitsToWaitFor ) == uxBitsToWaitFor )
    800030a2:	012ae933          	or	s2,s5,s2
    800030a6:	009977b3          	and	a5,s2,s1
    800030aa:	04978463          	beq	a5,s1,800030f2 <xEventGroupSync+0xa0>
			if( xTicksToWait != ( TickType_t ) 0 )
    800030ae:	04099b63          	bnez	s3,80003104 <xEventGroupSync+0xb2>
				uxReturn = pxEventBits->uxEventBits;
    800030b2:	000a2903          	lw	s2,0(s4)
	xAlreadyYielded = xTaskResumeAll();
    800030b6:	f11fe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
	if( xTicksToWait != ( TickType_t ) 0 )
    800030ba:	02098263          	beqz	s3,800030de <xEventGroupSync+0x8c>
		if( xAlreadyYielded == pdFALSE )
    800030be:	cd31                	beqz	a0,8000311a <xEventGroupSync+0xc8>
		uxReturn = uxTaskResetEventItemValue();
    800030c0:	af0ff0ef          	jal	ra,800023b0 <uxTaskResetEventItemValue>
    800030c4:	0005091b          	sext.w	s2,a0
		if( ( uxReturn & eventUNBLOCKED_DUE_TO_BIT_SET ) == ( EventBits_t ) 0 )
    800030c8:	020007b7          	lui	a5,0x2000
    800030cc:	00f977b3          	and	a5,s2,a5
    800030d0:	2781                	sext.w	a5,a5
    800030d2:	c7b9                	beqz	a5,80003120 <xEventGroupSync+0xce>
		uxReturn &= ~eventEVENT_BITS_CONTROL_BYTES;
    800030d4:	010007b7          	lui	a5,0x1000
    800030d8:	17fd                	addi	a5,a5,-1
    800030da:	00f97933          	and	s2,s2,a5
}
    800030de:	854a                	mv	a0,s2
    800030e0:	70e2                	ld	ra,56(sp)
    800030e2:	7442                	ld	s0,48(sp)
    800030e4:	74a2                	ld	s1,40(sp)
    800030e6:	7902                	ld	s2,32(sp)
    800030e8:	69e2                	ld	s3,24(sp)
    800030ea:	6a42                	ld	s4,16(sp)
    800030ec:	6aa2                	ld	s5,8(sp)
    800030ee:	6121                	addi	sp,sp,64
    800030f0:	8082                	ret
			pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
    800030f2:	fff4c713          	not	a4,s1
    800030f6:	000a2783          	lw	a5,0(s4)
    800030fa:	8ff9                	and	a5,a5,a4
    800030fc:	00fa2023          	sw	a5,0(s4)
			xTicksToWait = 0;
    80003100:	89a2                	mv	s3,s0
    80003102:	bf55                	j	800030b6 <xEventGroupSync+0x64>
				vTaskPlaceOnUnorderedEventList( &( pxEventBits->xTasksWaitingForBits ), ( uxBitsToWaitFor | eventCLEAR_EVENTS_ON_EXIT_BIT | eventWAIT_FOR_ALL_BITS ), xTicksToWait );
    80003104:	050005b7          	lui	a1,0x5000
    80003108:	8dc5                	or	a1,a1,s1
    8000310a:	864e                	mv	a2,s3
    8000310c:	2581                	sext.w	a1,a1
    8000310e:	008a0513          	addi	a0,s4,8
    80003112:	d78fe0ef          	jal	ra,8000168a <vTaskPlaceOnUnorderedEventList>
				uxReturn = 0;
    80003116:	8922                	mv	s2,s0
    80003118:	bf79                	j	800030b6 <xEventGroupSync+0x64>
			portYIELD_WITHIN_API();
    8000311a:	af2fd0ef          	jal	ra,8000040c <vPortYield>
    8000311e:	b74d                	j	800030c0 <xEventGroupSync+0x6e>
			taskENTER_CRITICAL();
    80003120:	917fe0ef          	jal	ra,80001a36 <vTaskEnterCritical>
				uxReturn = pxEventBits->uxEventBits;
    80003124:	000a2903          	lw	s2,0(s4)
				if( ( uxReturn & uxBitsToWaitFor ) == uxBitsToWaitFor )
    80003128:	0124f7b3          	and	a5,s1,s2
    8000312c:	00978563          	beq	a5,s1,80003136 <xEventGroupSync+0xe4>
			taskEXIT_CRITICAL();
    80003130:	929fe0ef          	jal	ra,80001a58 <vTaskExitCritical>
			xTimeoutOccurred = pdTRUE;
    80003134:	b745                	j	800030d4 <xEventGroupSync+0x82>
					pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
    80003136:	fff4c793          	not	a5,s1
    8000313a:	0127f7b3          	and	a5,a5,s2
    8000313e:	00fa2023          	sw	a5,0(s4)
    80003142:	b7fd                	j	80003130 <xEventGroupSync+0xde>

0000000080003144 <vEventGroupDelete>:
{
    80003144:	1141                	addi	sp,sp,-16
    80003146:	e406                	sd	ra,8(sp)
    80003148:	e022                	sd	s0,0(sp)
    8000314a:	842a                	mv	s0,a0
	vTaskSuspendAll();
    8000314c:	a0cfe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		while( listCURRENT_LIST_LENGTH( pxTasksWaitingForBits ) > ( UBaseType_t ) 0 )
    80003150:	641c                	ld	a5,8(s0)
    80003152:	cf91                	beqz	a5,8000316e <vEventGroupDelete+0x2a>
			configASSERT( pxTasksWaitingForBits->xListEnd.pxNext != ( ListItem_t * ) &( pxTasksWaitingForBits->xListEnd ) );
    80003154:	7008                	ld	a0,32(s0)
    80003156:	01840793          	addi	a5,s0,24 # ffffffffff000018 <__stack+0xffffffff7efc46e8>
    8000315a:	00f50763          	beq	a0,a5,80003168 <vEventGroupDelete+0x24>
			( void ) xTaskRemoveFromUnorderedEventList( pxTasksWaitingForBits->xListEnd.pxNext, eventUNBLOCKED_DUE_TO_BIT_SET );
    8000315e:	020005b7          	lui	a1,0x2000
    80003162:	eaafe0ef          	jal	ra,8000180c <xTaskRemoveFromUnorderedEventList>
    80003166:	b7ed                	j	80003150 <vEventGroupDelete+0xc>
			configASSERT( pxTasksWaitingForBits->xListEnd.pxNext != ( ListItem_t * ) &( pxTasksWaitingForBits->xListEnd ) );
    80003168:	30047073          	csrci	mstatus,8
    8000316c:	a001                	j	8000316c <vEventGroupDelete+0x28>
		vPortFree( pxEventBits );
    8000316e:	8522                	mv	a0,s0
    80003170:	138000ef          	jal	ra,800032a8 <vPortFree>
	( void ) xTaskResumeAll();
    80003174:	e53fe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
}
    80003178:	60a2                	ld	ra,8(sp)
    8000317a:	6402                	ld	s0,0(sp)
    8000317c:	0141                	addi	sp,sp,16
    8000317e:	8082                	ret

0000000080003180 <vEventGroupSetBitsCallback>:
{
    80003180:	1141                	addi	sp,sp,-16
    80003182:	e406                	sd	ra,8(sp)
	( void ) xEventGroupSetBits( pvEventGroup, ( EventBits_t ) ulBitsToSet );
    80003184:	e2bff0ef          	jal	ra,80002fae <xEventGroupSetBits>
}
    80003188:	60a2                	ld	ra,8(sp)
    8000318a:	0141                	addi	sp,sp,16
    8000318c:	8082                	ret

000000008000318e <vEventGroupClearBitsCallback>:
{
    8000318e:	1141                	addi	sp,sp,-16
    80003190:	e406                	sd	ra,8(sp)
	( void ) xEventGroupClearBits( pvEventGroup, ( EventBits_t ) ulBitsToClear );
    80003192:	db7ff0ef          	jal	ra,80002f48 <xEventGroupClearBits>
}
    80003196:	60a2                	ld	ra,8(sp)
    80003198:	0141                	addi	sp,sp,16
    8000319a:	8082                	ret

000000008000319c <uxEventGroupGetNumber>:
	UBaseType_t uxEventGroupGetNumber( void* xEventGroup )
	{
	UBaseType_t xReturn;
	EventGroup_t *pxEventBits = ( EventGroup_t * ) xEventGroup;

		if( xEventGroup == NULL )
    8000319c:	c119                	beqz	a0,800031a2 <uxEventGroupGetNumber+0x6>
		{
			xReturn = 0;
		}
		else
		{
			xReturn = pxEventBits->uxEventGroupNumber;
    8000319e:	7908                	ld	a0,48(a0)
    800031a0:	8082                	ret
			xReturn = 0;
    800031a2:	4501                	li	a0,0
		}

		return xReturn;
	}
    800031a4:	8082                	ret

00000000800031a6 <prvHeapInit>:
{
BlockLink_t *pxFirstFreeBlock;
uint8_t *pucAlignedHeap;

	/* Ensure the heap starts on a correctly aligned boundary. */
	pucAlignedHeap = ( uint8_t * ) ( ( ( portPOINTER_SIZE_TYPE ) &ucHeap[ portBYTE_ALIGNMENT ] ) & ( ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK ) ) );
    800031a6:	0001d797          	auipc	a5,0x1d
    800031aa:	71a78793          	addi	a5,a5,1818 # 800208c0 <ucHeap+0x8>
    800031ae:	9be1                	andi	a5,a5,-8

	/* xStart is used to hold a pointer to the first item in the list of free
	blocks.  The void cast is used to prevent compiler warnings. */
	xStart.pxNextFreeBlock = ( void * ) pucAlignedHeap;
    800031b0:	0001d697          	auipc	a3,0x1d
    800031b4:	6e868693          	addi	a3,a3,1768 # 80020898 <xStart>
    800031b8:	e29c                	sd	a5,0(a3)
	xStart.xBlockSize = ( size_t ) 0;
    800031ba:	0006b423          	sd	zero,8(a3)

	/* xEnd is used to mark the end of the list of free blocks. */
	xEnd.xBlockSize = configADJUSTED_HEAP_SIZE;
    800031be:	6765                	lui	a4,0x19
    800031c0:	1761                	addi	a4,a4,-8
    800031c2:	ee98                	sd	a4,24(a3)
	xEnd.pxNextFreeBlock = NULL;
    800031c4:	0006b823          	sd	zero,16(a3)

	/* To start with there is a single free block that is sized to take up the
	entire heap space. */
	pxFirstFreeBlock = ( void * ) pucAlignedHeap;
	pxFirstFreeBlock->xBlockSize = configADJUSTED_HEAP_SIZE;
    800031c8:	e798                	sd	a4,8(a5)
	pxFirstFreeBlock->pxNextFreeBlock = &xEnd;
    800031ca:	0001d717          	auipc	a4,0x1d
    800031ce:	6de70713          	addi	a4,a4,1758 # 800208a8 <xEnd>
    800031d2:	e398                	sd	a4,0(a5)
}
    800031d4:	8082                	ret

00000000800031d6 <pvPortMalloc>:
{
    800031d6:	1101                	addi	sp,sp,-32
    800031d8:	ec06                	sd	ra,24(sp)
    800031da:	e822                	sd	s0,16(sp)
    800031dc:	e426                	sd	s1,8(sp)
    800031de:	842a                	mv	s0,a0
	vTaskSuspendAll();
    800031e0:	978fe0ef          	jal	ra,80001358 <vTaskSuspendAll>
		if( xHeapHasBeenInitialised == pdFALSE )
    800031e4:	0001d797          	auipc	a5,0x1d
    800031e8:	1ec7b783          	ld	a5,492(a5) # 800203d0 <xHeapHasBeenInitialised.0>
    800031ec:	c785                	beqz	a5,80003214 <pvPortMalloc+0x3e>
		if( xWantedSize > 0 )
    800031ee:	c419                	beqz	s0,800031fc <pvPortMalloc+0x26>
			xWantedSize += heapSTRUCT_SIZE;
    800031f0:	0441                	addi	s0,s0,16
			if( ( xWantedSize & portBYTE_ALIGNMENT_MASK ) != 0 )
    800031f2:	00747793          	andi	a5,s0,7
    800031f6:	c399                	beqz	a5,800031fc <pvPortMalloc+0x26>
				xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
    800031f8:	9861                	andi	s0,s0,-8
    800031fa:	0421                	addi	s0,s0,8
		if( ( xWantedSize > 0 ) && ( xWantedSize < configADJUSTED_HEAP_SIZE ) )
    800031fc:	fff40713          	addi	a4,s0,-1
    80003200:	67e5                	lui	a5,0x19
    80003202:	17d9                	addi	a5,a5,-10
    80003204:	02e7e063          	bltu	a5,a4,80003224 <pvPortMalloc+0x4e>
			pxBlock = xStart.pxNextFreeBlock;
    80003208:	0001d697          	auipc	a3,0x1d
    8000320c:	69068693          	addi	a3,a3,1680 # 80020898 <xStart>
    80003210:	629c                	ld	a5,0(a3)
			while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    80003212:	a035                	j	8000323e <pvPortMalloc+0x68>
			prvHeapInit();
    80003214:	f93ff0ef          	jal	ra,800031a6 <prvHeapInit>
			xHeapHasBeenInitialised = pdTRUE;
    80003218:	4785                	li	a5,1
    8000321a:	0001d717          	auipc	a4,0x1d
    8000321e:	1af73b23          	sd	a5,438(a4) # 800203d0 <xHeapHasBeenInitialised.0>
    80003222:	b7f1                	j	800031ee <pvPortMalloc+0x18>
	( void ) xTaskResumeAll();
    80003224:	da3fe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
void *pvReturn = NULL;
    80003228:	4481                	li	s1,0
			vApplicationMallocFailedHook();
    8000322a:	766000ef          	jal	ra,80003990 <vApplicationMallocFailedHook>
}
    8000322e:	8526                	mv	a0,s1
    80003230:	60e2                	ld	ra,24(sp)
    80003232:	6442                	ld	s0,16(sp)
    80003234:	64a2                	ld	s1,8(sp)
    80003236:	6105                	addi	sp,sp,32
    80003238:	8082                	ret
				pxPreviousBlock = pxBlock;
    8000323a:	86be                	mv	a3,a5
				pxBlock = pxBlock->pxNextFreeBlock;
    8000323c:	87ba                	mv	a5,a4
			while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    8000323e:	6798                	ld	a4,8(a5)
    80003240:	00877463          	bgeu	a4,s0,80003248 <pvPortMalloc+0x72>
    80003244:	6398                	ld	a4,0(a5)
    80003246:	fb75                	bnez	a4,8000323a <pvPortMalloc+0x64>
			if( pxBlock != &xEnd )
    80003248:	0001d717          	auipc	a4,0x1d
    8000324c:	66070713          	addi	a4,a4,1632 # 800208a8 <xEnd>
    80003250:	04e78863          	beq	a5,a4,800032a0 <pvPortMalloc+0xca>
				pvReturn = ( void * ) ( ( ( uint8_t * ) pxPreviousBlock->pxNextFreeBlock ) + heapSTRUCT_SIZE );
    80003254:	6284                	ld	s1,0(a3)
    80003256:	04c1                	addi	s1,s1,16
				pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
    80003258:	6398                	ld	a4,0(a5)
    8000325a:	e298                	sd	a4,0(a3)
				if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    8000325c:	6798                	ld	a4,8(a5)
    8000325e:	8f01                	sub	a4,a4,s0
    80003260:	02000693          	li	a3,32
    80003264:	02e6f263          	bgeu	a3,a4,80003288 <pvPortMalloc+0xb2>
					pxNewBlockLink = ( void * ) ( ( ( uint8_t * ) pxBlock ) + xWantedSize );
    80003268:	00878533          	add	a0,a5,s0
					pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
    8000326c:	e518                	sd	a4,8(a0)
					pxBlock->xBlockSize = xWantedSize;
    8000326e:	e780                	sd	s0,8(a5)
					prvInsertBlockIntoFreeList( ( pxNewBlockLink ) );
    80003270:	650c                	ld	a1,8(a0)
    80003272:	0001d717          	auipc	a4,0x1d
    80003276:	62670713          	addi	a4,a4,1574 # 80020898 <xStart>
    8000327a:	863a                	mv	a2,a4
    8000327c:	6318                	ld	a4,0(a4)
    8000327e:	6714                	ld	a3,8(a4)
    80003280:	feb6ede3          	bltu	a3,a1,8000327a <pvPortMalloc+0xa4>
    80003284:	e118                	sd	a4,0(a0)
    80003286:	e208                	sd	a0,0(a2)
				xFreeBytesRemaining -= pxBlock->xBlockSize;
    80003288:	6794                	ld	a3,8(a5)
    8000328a:	0001d717          	auipc	a4,0x1d
    8000328e:	28e70713          	addi	a4,a4,654 # 80020518 <xFreeBytesRemaining>
    80003292:	631c                	ld	a5,0(a4)
    80003294:	8f95                	sub	a5,a5,a3
    80003296:	e31c                	sd	a5,0(a4)
	( void ) xTaskResumeAll();
    80003298:	d2ffe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
		if( pvReturn == NULL )
    8000329c:	f8c9                	bnez	s1,8000322e <pvPortMalloc+0x58>
    8000329e:	b771                	j	8000322a <pvPortMalloc+0x54>
	( void ) xTaskResumeAll();
    800032a0:	d27fe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
void *pvReturn = NULL;
    800032a4:	4481                	li	s1,0
    800032a6:	b751                	j	8000322a <pvPortMalloc+0x54>

00000000800032a8 <vPortFree>:
	if( pv != NULL )
    800032a8:	c921                	beqz	a0,800032f8 <vPortFree+0x50>
{
    800032aa:	1101                	addi	sp,sp,-32
    800032ac:	ec06                	sd	ra,24(sp)
    800032ae:	e822                	sd	s0,16(sp)
    800032b0:	e426                	sd	s1,8(sp)
    800032b2:	842a                	mv	s0,a0
		puc -= heapSTRUCT_SIZE;
    800032b4:	ff050493          	addi	s1,a0,-16
		vTaskSuspendAll();
    800032b8:	8a0fe0ef          	jal	ra,80001358 <vTaskSuspendAll>
			prvInsertBlockIntoFreeList( ( ( BlockLink_t * ) pxLink ) );
    800032bc:	ff843603          	ld	a2,-8(s0)
    800032c0:	0001d797          	auipc	a5,0x1d
    800032c4:	5d878793          	addi	a5,a5,1496 # 80020898 <xStart>
    800032c8:	86be                	mv	a3,a5
    800032ca:	639c                	ld	a5,0(a5)
    800032cc:	6798                	ld	a4,8(a5)
    800032ce:	fec76de3          	bltu	a4,a2,800032c8 <vPortFree+0x20>
    800032d2:	fef43823          	sd	a5,-16(s0)
    800032d6:	e284                	sd	s1,0(a3)
			xFreeBytesRemaining += pxLink->xBlockSize;
    800032d8:	ff843683          	ld	a3,-8(s0)
    800032dc:	0001d717          	auipc	a4,0x1d
    800032e0:	23c70713          	addi	a4,a4,572 # 80020518 <xFreeBytesRemaining>
    800032e4:	631c                	ld	a5,0(a4)
    800032e6:	97b6                	add	a5,a5,a3
    800032e8:	e31c                	sd	a5,0(a4)
		( void ) xTaskResumeAll();
    800032ea:	cddfe0ef          	jal	ra,80001fc6 <xTaskResumeAll>
}
    800032ee:	60e2                	ld	ra,24(sp)
    800032f0:	6442                	ld	s0,16(sp)
    800032f2:	64a2                	ld	s1,8(sp)
    800032f4:	6105                	addi	sp,sp,32
    800032f6:	8082                	ret
    800032f8:	8082                	ret

00000000800032fa <xPortGetFreeHeapSize>:
}
    800032fa:	0001d517          	auipc	a0,0x1d
    800032fe:	21e53503          	ld	a0,542(a0) # 80020518 <xFreeBytesRemaining>
    80003302:	8082                	ret

0000000080003304 <vPortInitialiseBlocks>:
}
    80003304:	8082                	ret

0000000080003306 <memcpy>:
void* memcpy(void* dest, const void* src, size_t len)
{
  const char* s = src;
  char *d = dest;

  if ((((uintptr_t)dest | (uintptr_t)src) & (sizeof(uintptr_t)-1)) == 0) {
    80003306:	00a5e7b3          	or	a5,a1,a0
    8000330a:	8b9d                	andi	a5,a5,7
    8000330c:	c399                	beqz	a5,80003312 <memcpy+0xc>
  char *d = dest;
    8000330e:	87aa                	mv	a5,a0
    80003310:	a015                	j	80003334 <memcpy+0x2e>
    80003312:	87aa                	mv	a5,a0
    while ((void*)d < (dest + len - (sizeof(uintptr_t)-1))) {
    80003314:	ff960713          	addi	a4,a2,-7
    80003318:	972a                	add	a4,a4,a0
    8000331a:	00e7fd63          	bgeu	a5,a4,80003334 <memcpy+0x2e>
      *(uintptr_t*)d = *(const uintptr_t*)s;
    8000331e:	6198                	ld	a4,0(a1)
    80003320:	e398                	sd	a4,0(a5)
      d += sizeof(uintptr_t);
    80003322:	07a1                	addi	a5,a5,8
      s += sizeof(uintptr_t);
    80003324:	05a1                	addi	a1,a1,8
    80003326:	b7fd                	j	80003314 <memcpy+0xe>
    }
  }

  while (d < (char*)(dest + len))
    *d++ = *s++;
    80003328:	0005c703          	lbu	a4,0(a1) # 2000000 <_HEAP_SIZE+0x1fff000>
    8000332c:	00e78023          	sb	a4,0(a5)
    80003330:	0785                	addi	a5,a5,1
    80003332:	0585                	addi	a1,a1,1
  while (d < (char*)(dest + len))
    80003334:	00c50733          	add	a4,a0,a2
    80003338:	fee7e8e3          	bltu	a5,a4,80003328 <memcpy+0x22>

  return dest;
}
    8000333c:	8082                	ret

000000008000333e <memset>:

void* memset(void* dest, int byte, size_t len)
{
  if ((((uintptr_t)dest | len) & (sizeof(uintptr_t)-1)) == 0) {
    8000333e:	00c567b3          	or	a5,a0,a2
    80003342:	8b9d                	andi	a5,a5,7
    80003344:	ef8d                	bnez	a5,8000337e <memset+0x40>
    uintptr_t word = byte & 0xFF;
    80003346:	0ff5f593          	zext.b	a1,a1
    word |= word << 8;
    8000334a:	00859713          	slli	a4,a1,0x8
    8000334e:	8f4d                	or	a4,a4,a1
    word |= word << 16;
    80003350:	01071793          	slli	a5,a4,0x10
    80003354:	8fd9                	or	a5,a5,a4
    word |= word << 16 << 16;
    80003356:	02079693          	slli	a3,a5,0x20
    8000335a:	8edd                	or	a3,a3,a5

    uintptr_t *d = dest;
    8000335c:	87aa                	mv	a5,a0
    while (d < (uintptr_t*)(dest + len))
    8000335e:	a019                	j	80003364 <memset+0x26>
      *d++ = word;
    80003360:	e394                	sd	a3,0(a5)
    80003362:	07a1                	addi	a5,a5,8
    while (d < (uintptr_t*)(dest + len))
    80003364:	00c50733          	add	a4,a0,a2
    80003368:	fee7ece3          	bltu	a5,a4,80003360 <memset+0x22>
    8000336c:	8082                	ret
  } else {
    char *d = dest;
    while (d < (char*)(dest + len))
      *d++ = byte;
    8000336e:	00b78023          	sb	a1,0(a5)
    80003372:	0785                	addi	a5,a5,1
    while (d < (char*)(dest + len))
    80003374:	00c50733          	add	a4,a0,a2
    80003378:	fee7ebe3          	bltu	a5,a4,8000336e <memset+0x30>
  }
  return dest;
}
    8000337c:	8082                	ret
    char *d = dest;
    8000337e:	87aa                	mv	a5,a0
    80003380:	bfd5                	j	80003374 <memset+0x36>

0000000080003382 <strlen>:

size_t strlen(const char *s)
{
  const char *p = s;
    80003382:	87aa                	mv	a5,a0
  while (*p)
    80003384:	a011                	j	80003388 <strlen+0x6>
    p++;
    80003386:	0785                	addi	a5,a5,1
  while (*p)
    80003388:	0007c703          	lbu	a4,0(a5)
    8000338c:	ff6d                	bnez	a4,80003386 <strlen+0x4>
  return p - s;
}
    8000338e:	40a78533          	sub	a0,a5,a0
    80003392:	8082                	ret

0000000080003394 <strcmp>:
int strcmp(const char* s1, const char* s2)
{
  unsigned char c1, c2;

  do {
    c1 = *s1++;
    80003394:	00054703          	lbu	a4,0(a0)
    80003398:	0505                	addi	a0,a0,1
    c2 = *s2++;
    8000339a:	0005c783          	lbu	a5,0(a1)
    8000339e:	0585                	addi	a1,a1,1
  } while (c1 != 0 && c1 == c2);
    800033a0:	c319                	beqz	a4,800033a6 <strcmp+0x12>
    800033a2:	fef709e3          	beq	a4,a5,80003394 <strcmp>

  return c1 - c2;
}
    800033a6:	40f7053b          	subw	a0,a4,a5
    800033aa:	8082                	ret

00000000800033ac <strcpy>:

char* strcpy(char* dest, const char* src)
{
  char* d = dest;
    800033ac:	86aa                	mv	a3,a0
  while ((*d++ = *src++))
    800033ae:	0005c703          	lbu	a4,0(a1)
    800033b2:	0585                	addi	a1,a1,1
    800033b4:	00e68023          	sb	a4,0(a3)
    800033b8:	0685                	addi	a3,a3,1
    800033ba:	fb75                	bnez	a4,800033ae <strcpy+0x2>
    ;
  return dest;
}
    800033bc:	8082                	ret

00000000800033be <atol>:

long atol(const char* str)
{
    800033be:	87aa                	mv	a5,a0
  long res = 0;
  int sign = 0;

  while (*str == ' ')
    800033c0:	a011                	j	800033c4 <atol+0x6>
    str++;
    800033c2:	0785                	addi	a5,a5,1
  while (*str == ' ')
    800033c4:	0007c703          	lbu	a4,0(a5)
    800033c8:	02000693          	li	a3,32
    800033cc:	fed70be3          	beq	a4,a3,800033c2 <atol+0x4>

  if (*str == '-' || *str == '+') {
    800033d0:	02d00693          	li	a3,45
    800033d4:	00d70863          	beq	a4,a3,800033e4 <atol+0x26>
    800033d8:	02b00693          	li	a3,43
    800033dc:	00d70463          	beq	a4,a3,800033e4 <atol+0x26>
  int sign = 0;
    800033e0:	4601                	li	a2,0
    800033e2:	a031                	j	800033ee <atol+0x30>
    sign = *str == '-';
    800033e4:	fd370713          	addi	a4,a4,-45
    800033e8:	00173613          	seqz	a2,a4
    str++;
    800033ec:	0785                	addi	a5,a5,1
  int sign = 0;
    800033ee:	4501                	li	a0,0
    800033f0:	a811                	j	80003404 <atol+0x46>
  }

  while (*str) {
    res *= 10;
    800033f2:	00251713          	slli	a4,a0,0x2
    800033f6:	972a                	add	a4,a4,a0
    800033f8:	0706                	slli	a4,a4,0x1
    res += *str++ - '0';
    800033fa:	0785                	addi	a5,a5,1
    800033fc:	fd06869b          	addiw	a3,a3,-48
    80003400:	00e68533          	add	a0,a3,a4
  while (*str) {
    80003404:	0007c683          	lbu	a3,0(a5)
    80003408:	f6ed                	bnez	a3,800033f2 <atol+0x34>
  }

  return sign ? -res : res;
    8000340a:	c219                	beqz	a2,80003410 <atol+0x52>
    8000340c:	40a00533          	neg	a0,a0
}
    80003410:	8082                	ret

0000000080003412 <zeroExtend>:
	uint64_t ret = val;
	#if __riscv_xlen == 32
		ret = (0x00000000ffffffff & val);
	#endif
	return ret;
}
    80003412:	8082                	ret

0000000080003414 <prvSyscallExit>:
}
/*-----------------------------------------------------------*/

/* Exit systemcall */
static void prvSyscallExit(long code)
{
    80003414:	1141                	addi	sp,sp,-16
    80003416:	e406                	sd	ra,8(sp)
	uint64_t zcode = zeroExtend(code);
    80003418:	ffbff0ef          	jal	ra,80003412 <zeroExtend>
	tohost = ((zcode << 1) | 1);
    8000341c:	00151793          	slli	a5,a0,0x1
    80003420:	0017e793          	ori	a5,a5,1
    80003424:	0001d717          	auipc	a4,0x1d
    80003428:	00f73e23          	sd	a5,28(a4) # 80020440 <tohost>
	for(;;) { }
    8000342c:	a001                	j	8000342c <prvSyscallExit+0x18>

000000008000342e <prvSyscallToHost>:
{
    8000342e:	7135                	addi	sp,sp,-160
    80003430:	ed06                	sd	ra,152(sp)
    80003432:	e922                	sd	s0,144(sp)
    80003434:	e526                	sd	s1,136(sp)
    80003436:	e14a                	sd	s2,128(sp)
    80003438:	fcce                	sd	s3,120(sp)
    8000343a:	89ae                	mv	s3,a1
    8000343c:	8932                	mv	s2,a2
    8000343e:	84b6                	mv	s1,a3
    80003440:	03f10413          	addi	s0,sp,63
    80003444:	fc047413          	andi	s0,s0,-64
	magic_mem[0] = zeroExtend(which);
    80003448:	fcbff0ef          	jal	ra,80003412 <zeroExtend>
    8000344c:	e008                	sd	a0,0(s0)
	magic_mem[1] = zeroExtend(arg0);
    8000344e:	854e                	mv	a0,s3
    80003450:	fc3ff0ef          	jal	ra,80003412 <zeroExtend>
    80003454:	e408                	sd	a0,8(s0)
	magic_mem[2] = zeroExtend(arg1);
    80003456:	854a                	mv	a0,s2
    80003458:	fbbff0ef          	jal	ra,80003412 <zeroExtend>
    8000345c:	e808                	sd	a0,16(s0)
	magic_mem[3] = zeroExtend(arg2);
    8000345e:	8526                	mv	a0,s1
    80003460:	fb3ff0ef          	jal	ra,80003412 <zeroExtend>
    80003464:	ec08                	sd	a0,24(s0)
	__sync_synchronize();
    80003466:	0ff0000f          	fence
    tohost = zeroExtend(magic_mem);
    8000346a:	8522                	mv	a0,s0
    8000346c:	fa7ff0ef          	jal	ra,80003412 <zeroExtend>
    80003470:	0001d797          	auipc	a5,0x1d
    80003474:	fca7b823          	sd	a0,-48(a5) # 80020440 <tohost>
	return magic_mem[0];
    80003478:	6008                	ld	a0,0(s0)
}
    8000347a:	60ea                	ld	ra,152(sp)
    8000347c:	644a                	ld	s0,144(sp)
    8000347e:	64aa                	ld	s1,136(sp)
    80003480:	690a                	ld	s2,128(sp)
    80003482:	79e6                	ld	s3,120(sp)
    80003484:	610d                	addi	sp,sp,160
    80003486:	8082                	ret

0000000080003488 <syscall>:
/*-----------------------------------------------------------*/

/* Fires a syscall */
long syscall(long num, long arg0, long arg1, long arg2)
{
	register long a7 asm("a7") = num;
    80003488:	88aa                	mv	a7,a0
	register long a0 asm("a0") = arg0;
    8000348a:	852e                	mv	a0,a1
	register long a1 asm("a1") = arg1;
    8000348c:	85b2                	mv	a1,a2
	register long a2 asm("a2") = arg2;
    8000348e:	8636                	mv	a2,a3
	asm volatile ("scall":"+r"(a0) : "r"(a1), "r"(a2), "r"(a7));
    80003490:	00000073          	ecall
	return a0;
}
    80003494:	8082                	ret

0000000080003496 <printstr>:
{
    80003496:	1141                	addi	sp,sp,-16
    80003498:	e406                	sd	ra,8(sp)
    8000349a:	e022                	sd	s0,0(sp)
    8000349c:	842a                	mv	s0,a0
	syscall(SYS_write, 1, (long) s, strlen(s));
    8000349e:	ee5ff0ef          	jal	ra,80003382 <strlen>
    800034a2:	86aa                	mv	a3,a0
    800034a4:	8622                	mv	a2,s0
    800034a6:	4585                	li	a1,1
    800034a8:	04000513          	li	a0,64
    800034ac:	fddff0ef          	jal	ra,80003488 <syscall>
}
    800034b0:	60a2                	ld	ra,8(sp)
    800034b2:	6402                	ld	s0,0(sp)
    800034b4:	0141                	addi	sp,sp,16
    800034b6:	8082                	ret
/*-----------------------------------------------------------*/

/* Programs need to override this function. */
int __attribute__((weak)) main(__attribute__ ((unused)) int argc, __attribute__ ((unused)) char** argv)
{
    800034b8:	1141                	addi	sp,sp,-16
    800034ba:	e406                	sd	ra,8(sp)
	printstr("Implement a main function!\n");
    800034bc:	0001d517          	auipc	a0,0x1d
    800034c0:	cdc50513          	addi	a0,a0,-804 # 80020198 <__rodata_start+0x198>
    800034c4:	fd3ff0ef          	jal	ra,80003496 <printstr>
	return -1;
}
    800034c8:	557d                	li	a0,-1
    800034ca:	60a2                	ld	ra,8(sp)
    800034cc:	0141                	addi	sp,sp,16
    800034ce:	8082                	ret

00000000800034d0 <vSyscallInit>:
/*-----------------------------------------------------------*/

/* Starts main function. */
void vSyscallInit(void)
{
    800034d0:	1141                	addi	sp,sp,-16
    800034d2:	e406                	sd	ra,8(sp)
	int ret = main(0, 0);
    800034d4:	4581                	li	a1,0
    800034d6:	4501                	li	a0,0
    800034d8:	462000ef          	jal	ra,8000393a <main>
	exit(ret);
    800034dc:	336000ef          	jal	ra,80003812 <exit>
}
    800034e0:	60a2                	ld	ra,8(sp)
    800034e2:	0141                	addi	sp,sp,16
    800034e4:	8082                	ret

00000000800034e6 <ulSyscallTrap>:
/*-----------------------------------------------------------*/

/* Trap handeler */
unsigned long ulSyscallTrap(long cause, long epc, long regs[32])
{
    800034e6:	1101                	addi	sp,sp,-32
    800034e8:	ec06                	sd	ra,24(sp)
    800034ea:	e822                	sd	s0,16(sp)
    800034ec:	e426                	sd	s1,8(sp)
	long returnValue = 0;

	if (cause != CAUSE_MACHINE_ECALL) {
    800034ee:	47ad                	li	a5,11
    800034f0:	02f51663          	bne	a0,a5,8000351c <ulSyscallTrap+0x36>
    800034f4:	84ae                	mv	s1,a1
    800034f6:	8432                	mv	s0,a2
		prvSyscallExit(cause);
	} else if (regs[17] == SYS_exit) {
    800034f8:	6648                	ld	a0,136(a2)
    800034fa:	05d00793          	li	a5,93
    800034fe:	02f50163          	beq	a0,a5,80003520 <ulSyscallTrap+0x3a>
		prvSyscallExit(regs[10]);
	} else {
		returnValue = prvSyscallToHost(regs[17], regs[10], regs[11], regs[12]);
    80003502:	7234                	ld	a3,96(a2)
    80003504:	6e30                	ld	a2,88(a2)
    80003506:	682c                	ld	a1,80(s0)
    80003508:	f27ff0ef          	jal	ra,8000342e <prvSyscallToHost>
	}

	regs[10] = returnValue;
    8000350c:	e828                	sd	a0,80(s0)
	return epc + 4;
}
    8000350e:	00448513          	addi	a0,s1,4 # ffffffffff000004 <__stack+0xffffffff7efc46d4>
    80003512:	60e2                	ld	ra,24(sp)
    80003514:	6442                	ld	s0,16(sp)
    80003516:	64a2                	ld	s1,8(sp)
    80003518:	6105                	addi	sp,sp,32
    8000351a:	8082                	ret
		prvSyscallExit(cause);
    8000351c:	ef9ff0ef          	jal	ra,80003414 <prvSyscallExit>
		prvSyscallExit(regs[10]);
    80003520:	6a28                	ld	a0,80(a2)
    80003522:	ef3ff0ef          	jal	ra,80003414 <prvSyscallExit>

0000000080003526 <getuint>:
/*-----------------------------------------------------------*/

/* Returns unsigned integer from argument list. */
static unsigned long long getuint(va_list *ap, int lflag)
{
	if (lflag >= 2) {
    80003526:	4785                	li	a5,1
    80003528:	00b7c963          	blt	a5,a1,8000353a <getuint+0x14>
		return va_arg(*ap, unsigned long long);
	} else if (lflag) {
    8000352c:	cd89                	beqz	a1,80003546 <getuint+0x20>
		return va_arg(*ap, unsigned long);
    8000352e:	611c                	ld	a5,0(a0)
    80003530:	00878713          	addi	a4,a5,8
    80003534:	e118                	sd	a4,0(a0)
    80003536:	6388                	ld	a0,0(a5)
    80003538:	8082                	ret
		return va_arg(*ap, unsigned long long);
    8000353a:	611c                	ld	a5,0(a0)
    8000353c:	00878713          	addi	a4,a5,8
    80003540:	e118                	sd	a4,0(a0)
    80003542:	6388                	ld	a0,0(a5)
    80003544:	8082                	ret
	} else {
		return va_arg(*ap, unsigned int);
    80003546:	611c                	ld	a5,0(a0)
    80003548:	00878713          	addi	a4,a5,8
    8000354c:	e118                	sd	a4,0(a0)
    8000354e:	0007e503          	lwu	a0,0(a5)
	}
}
    80003552:	8082                	ret

0000000080003554 <getint>:
/*-----------------------------------------------------------*/

/* Returns signed integer from argument list. */
static long long getint(va_list *ap, int lflag)
{
	if (lflag >= 2) {
    80003554:	4785                	li	a5,1
    80003556:	00b7c963          	blt	a5,a1,80003568 <getint+0x14>
			return va_arg(*ap, long long);
	} else if (lflag) {
    8000355a:	cd89                	beqz	a1,80003574 <getint+0x20>
			return va_arg(*ap, long);
    8000355c:	611c                	ld	a5,0(a0)
    8000355e:	00878713          	addi	a4,a5,8
    80003562:	e118                	sd	a4,0(a0)
    80003564:	6388                	ld	a0,0(a5)
    80003566:	8082                	ret
			return va_arg(*ap, long long);
    80003568:	611c                	ld	a5,0(a0)
    8000356a:	00878713          	addi	a4,a5,8
    8000356e:	e118                	sd	a4,0(a0)
    80003570:	6388                	ld	a0,0(a5)
    80003572:	8082                	ret
	} else {
			return va_arg(*ap, int);
    80003574:	611c                	ld	a5,0(a0)
    80003576:	00878713          	addi	a4,a5,8
    8000357a:	e118                	sd	a4,0(a0)
    8000357c:	4388                	lw	a0,0(a5)
	}
}
    8000357e:	8082                	ret

0000000080003580 <sprintf_putch.0>:
	char* str0 = str;
	va_start(ap, fmt);

	void sprintf_putch(int ch, void** data) {
		char** pstr = (char**) data;
		**pstr = ch;
    80003580:	619c                	ld	a5,0(a1)
    80003582:	00a78023          	sb	a0,0(a5)
		(*pstr)++;
    80003586:	619c                	ld	a5,0(a1)
    80003588:	0785                	addi	a5,a5,1
    8000358a:	e19c                	sd	a5,0(a1)
	}
    8000358c:	8082                	ret

000000008000358e <putchar>:
	buf[buflen++] = ch;
    8000358e:	0001d797          	auipc	a5,0x1d
    80003592:	eba78793          	addi	a5,a5,-326 # 80020448 <buflen.2>
    80003596:	4398                	lw	a4,0(a5)
    80003598:	0017061b          	addiw	a2,a4,1
    8000359c:	0006069b          	sext.w	a3,a2
    800035a0:	c390                	sw	a2,0(a5)
    800035a2:	00036797          	auipc	a5,0x36
    800035a6:	31e78793          	addi	a5,a5,798 # 800398c0 <buf.1>
    800035aa:	97ba                	add	a5,a5,a4
    800035ac:	00a78023          	sb	a0,0(a5)
	if (ch == '\n' || buflen == sizeof(buf)) {
    800035b0:	47a9                	li	a5,10
    800035b2:	00f50863          	beq	a0,a5,800035c2 <putchar+0x34>
    800035b6:	04000793          	li	a5,64
    800035ba:	00f68463          	beq	a3,a5,800035c2 <putchar+0x34>
}
    800035be:	4501                	li	a0,0
    800035c0:	8082                	ret
{
    800035c2:	1141                	addi	sp,sp,-16
    800035c4:	e406                	sd	ra,8(sp)
		syscall(SYS_write, 1, (long) buf, buflen);
    800035c6:	00036617          	auipc	a2,0x36
    800035ca:	2fa60613          	addi	a2,a2,762 # 800398c0 <buf.1>
    800035ce:	4585                	li	a1,1
    800035d0:	04000513          	li	a0,64
    800035d4:	eb5ff0ef          	jal	ra,80003488 <syscall>
		buflen = 0;
    800035d8:	0001d797          	auipc	a5,0x1d
    800035dc:	e607a823          	sw	zero,-400(a5) # 80020448 <buflen.2>
}
    800035e0:	4501                	li	a0,0
    800035e2:	60a2                	ld	ra,8(sp)
    800035e4:	0141                	addi	sp,sp,16
    800035e6:	8082                	ret

00000000800035e8 <vFormatPrintString>:
{
    800035e8:	714d                	addi	sp,sp,-336
    800035ea:	e686                	sd	ra,328(sp)
    800035ec:	e2a2                	sd	s0,320(sp)
    800035ee:	fe26                	sd	s1,312(sp)
    800035f0:	fa4a                	sd	s2,304(sp)
    800035f2:	f64e                	sd	s3,296(sp)
    800035f4:	f252                	sd	s4,288(sp)
    800035f6:	ee56                	sd	s5,280(sp)
    800035f8:	ea5a                	sd	s6,272(sp)
    800035fa:	892a                	mv	s2,a0
    800035fc:	84ae                	mv	s1,a1
    800035fe:	8432                	mv	s0,a2
    80003600:	e436                	sd	a3,8(sp)
		while ((ch = *(unsigned char *) fmt) != '%') {
    80003602:	00044503          	lbu	a0,0(s0)
    80003606:	02500793          	li	a5,37
    8000360a:	00f50863          	beq	a0,a5,8000361a <vFormatPrintString+0x32>
			if (ch == '\0')
    8000360e:	1e050863          	beqz	a0,800037fe <vFormatPrintString+0x216>
			fmt++;
    80003612:	0405                	addi	s0,s0,1
			putch(ch, putdat);
    80003614:	85a6                	mv	a1,s1
    80003616:	9902                	jalr	s2
    80003618:	b7ed                	j	80003602 <vFormatPrintString+0x1a>
		fmt++;
    8000361a:	00140993          	addi	s3,s0,1
    8000361e:	87ce                	mv	a5,s3
		padc = ' ';
    80003620:	02000a93          	li	s5,32
		precision = -1;
    80003624:	5b7d                	li	s6,-1
		width = -1;
    80003626:	5a7d                	li	s4,-1
		lflag = 0;
    80003628:	4581                	li	a1,0
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    8000362a:	00178413          	addi	s0,a5,1
    8000362e:	0007c703          	lbu	a4,0(a5)
    80003632:	0007051b          	sext.w	a0,a4
    80003636:	fdd7079b          	addiw	a5,a4,-35
    8000363a:	0ff7f613          	zext.b	a2,a5
    8000363e:	05500693          	li	a3,85
    80003642:	1ac6e863          	bltu	a3,a2,800037f2 <vFormatPrintString+0x20a>
    80003646:	00261793          	slli	a5,a2,0x2
    8000364a:	0001d697          	auipc	a3,0x1d
    8000364e:	9de68693          	addi	a3,a3,-1570 # 80020028 <__rodata_start+0x28>
    80003652:	97b6                	add	a5,a5,a3
    80003654:	439c                	lw	a5,0(a5)
    80003656:	97b6                	add	a5,a5,a3
    80003658:	8782                	jr	a5
				padc = '0';
    8000365a:	8aba                	mv	s5,a4
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    8000365c:	87a2                	mv	a5,s0
    8000365e:	b7f1                	j	8000362a <vFormatPrintString+0x42>
    80003660:	49c1                	li	s3,16
    80003662:	a8f5                	j	8000375e <vFormatPrintString+0x176>
    80003664:	4b01                	li	s6,0
					precision = precision * 10 + ch - '0';
    80003666:	002b179b          	slliw	a5,s6,0x2
    8000366a:	016787bb          	addw	a5,a5,s6
    8000366e:	0017979b          	slliw	a5,a5,0x1
    80003672:	9fa9                	addw	a5,a5,a0
    80003674:	fd078b1b          	addiw	s6,a5,-48
					ch = *fmt;
    80003678:	00044783          	lbu	a5,0(s0)
    8000367c:	0007851b          	sext.w	a0,a5
					if (ch < '0' || ch > '9')
    80003680:	fd07879b          	addiw	a5,a5,-48
    80003684:	4725                	li	a4,9
    80003686:	02f76863          	bltu	a4,a5,800036b6 <vFormatPrintString+0xce>
				for (precision = 0;; ++fmt) {
    8000368a:	0405                	addi	s0,s0,1
					precision = precision * 10 + ch - '0';
    8000368c:	bfe9                	j	80003666 <vFormatPrintString+0x7e>
				precision = va_arg(ap, int);
    8000368e:	67a2                	ld	a5,8(sp)
    80003690:	00878713          	addi	a4,a5,8
    80003694:	e43a                	sd	a4,8(sp)
    80003696:	0007ab03          	lw	s6,0(a5)
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    8000369a:	87a2                	mv	a5,s0
				process_precision: if (width < 0)
    8000369c:	f80a57e3          	bgez	s4,8000362a <vFormatPrintString+0x42>
					width = precision, precision = -1;
    800036a0:	8a5a                	mv	s4,s6
    800036a2:	5b7d                	li	s6,-1
				goto reswitch;
    800036a4:	b759                	j	8000362a <vFormatPrintString+0x42>
				if (width < 0)
    800036a6:	000a4463          	bltz	s4,800036ae <vFormatPrintString+0xc6>
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    800036aa:	87a2                	mv	a5,s0
				goto reswitch;
    800036ac:	bfbd                	j	8000362a <vFormatPrintString+0x42>
					width = 0;
    800036ae:	4a01                	li	s4,0
    800036b0:	bfed                	j	800036aa <vFormatPrintString+0xc2>
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    800036b2:	87a2                	mv	a5,s0
				goto reswitch;
    800036b4:	bf9d                	j	8000362a <vFormatPrintString+0x42>
    800036b6:	87a2                	mv	a5,s0
    800036b8:	b7d5                	j	8000369c <vFormatPrintString+0xb4>
				lflag++;
    800036ba:	2585                	addiw	a1,a1,1
		reswitch: switch (ch = *(unsigned char *) fmt++) {
    800036bc:	87a2                	mv	a5,s0
				goto reswitch;
    800036be:	b7b5                	j	8000362a <vFormatPrintString+0x42>
				putch(va_arg(ap, int), putdat);
    800036c0:	67a2                	ld	a5,8(sp)
    800036c2:	00878713          	addi	a4,a5,8
    800036c6:	e43a                	sd	a4,8(sp)
    800036c8:	85a6                	mv	a1,s1
    800036ca:	4388                	lw	a0,0(a5)
    800036cc:	9902                	jalr	s2
				break;
    800036ce:	bf15                	j	80003602 <vFormatPrintString+0x1a>
				if ((p = va_arg(ap, char *)) == NULL)
    800036d0:	67a2                	ld	a5,8(sp)
    800036d2:	00878713          	addi	a4,a5,8
    800036d6:	e43a                	sd	a4,8(sp)
    800036d8:	0007b983          	ld	s3,0(a5)
    800036dc:	00098f63          	beqz	s3,800036fa <vFormatPrintString+0x112>
				if (width > 0 && padc != '-')
    800036e0:	03405e63          	blez	s4,8000371c <vFormatPrintString+0x134>
    800036e4:	02d00793          	li	a5,45
    800036e8:	02fa8a63          	beq	s5,a5,8000371c <vFormatPrintString+0x134>
					for (width -= strnlen(p, precision); width > 0; width--)
    800036ec:	85da                	mv	a1,s6
    800036ee:	854e                	mv	a0,s3
    800036f0:	615000ef          	jal	ra,80004504 <strnlen>
    800036f4:	40aa0a3b          	subw	s4,s4,a0
    800036f8:	a819                	j	8000370e <vFormatPrintString+0x126>
					p = "(null)";
    800036fa:	0001d997          	auipc	s3,0x1d
    800036fe:	abe98993          	addi	s3,s3,-1346 # 800201b8 <__rodata_start+0x1b8>
    80003702:	bff9                	j	800036e0 <vFormatPrintString+0xf8>
						putch(padc, putdat);
    80003704:	85a6                	mv	a1,s1
    80003706:	000a851b          	sext.w	a0,s5
    8000370a:	9902                	jalr	s2
					for (width -= strnlen(p, precision); width > 0; width--)
    8000370c:	3a7d                	addiw	s4,s4,-1
    8000370e:	ff404be3          	bgtz	s4,80003704 <vFormatPrintString+0x11c>
    80003712:	a029                	j	8000371c <vFormatPrintString+0x134>
					putch(ch, putdat);
    80003714:	85a6                	mv	a1,s1
    80003716:	9902                	jalr	s2
					p++;
    80003718:	0985                	addi	s3,s3,1
				for (; (ch = *p) != '\0' && (precision < 0 || --precision >= 0); width--) {
    8000371a:	3a7d                	addiw	s4,s4,-1
    8000371c:	0009c503          	lbu	a0,0(s3)
    80003720:	cd01                	beqz	a0,80003738 <vFormatPrintString+0x150>
    80003722:	fe0b49e3          	bltz	s6,80003714 <vFormatPrintString+0x12c>
    80003726:	3b7d                	addiw	s6,s6,-1
    80003728:	fe0b56e3          	bgez	s6,80003714 <vFormatPrintString+0x12c>
    8000372c:	a031                	j	80003738 <vFormatPrintString+0x150>
					putch(' ', putdat);
    8000372e:	85a6                	mv	a1,s1
    80003730:	02000513          	li	a0,32
    80003734:	9902                	jalr	s2
				for (; width > 0; width--)
    80003736:	3a7d                	addiw	s4,s4,-1
    80003738:	ff404be3          	bgtz	s4,8000372e <vFormatPrintString+0x146>
    8000373c:	b5d9                	j	80003602 <vFormatPrintString+0x1a>
				num = getint(&ap, lflag);
    8000373e:	0028                	addi	a0,sp,8
    80003740:	e15ff0ef          	jal	ra,80003554 <getint>
    80003744:	89aa                	mv	s3,a0
				if ((long long) num < 0) {
    80003746:	00054463          	bltz	a0,8000374e <vFormatPrintString+0x166>
				base = 10;
    8000374a:	49a9                	li	s3,10
				goto signed_number;
    8000374c:	a821                	j	80003764 <vFormatPrintString+0x17c>
					putch('-', putdat);
    8000374e:	85a6                	mv	a1,s1
    80003750:	02d00513          	li	a0,45
    80003754:	9902                	jalr	s2
					num = -(long long) num;
    80003756:	41300533          	neg	a0,s3
    8000375a:	bfc5                	j	8000374a <vFormatPrintString+0x162>
				base = 8;
    8000375c:	49a1                	li	s3,8
				unsigned_number: num = getuint(&ap, lflag);
    8000375e:	0028                	addi	a0,sp,8
    80003760:	dc7ff0ef          	jal	ra,80003526 <getuint>
				signed_number: printnum(putch, putdat, num, base, width, padc);
    80003764:	0009861b          	sext.w	a2,s3
    80003768:	2a81                	sext.w	s5,s5
	int pos = 0;
    8000376a:	4781                	li	a5,0
		digs[pos++] = num % base;
    8000376c:	02061713          	slli	a4,a2,0x20
    80003770:	9301                	srli	a4,a4,0x20
    80003772:	02e576b3          	remu	a3,a0,a4
    80003776:	0017899b          	addiw	s3,a5,1
    8000377a:	078a                	slli	a5,a5,0x2
    8000377c:	11078793          	addi	a5,a5,272
    80003780:	978a                	add	a5,a5,sp
    80003782:	f0d7a023          	sw	a3,-256(a5)
		if (num < base)
    80003786:	02e56763          	bltu	a0,a4,800037b4 <vFormatPrintString+0x1cc>
		num /= base;
    8000378a:	02e55533          	divu	a0,a0,a4
		digs[pos++] = num % base;
    8000378e:	87ce                	mv	a5,s3
    80003790:	bff1                	j	8000376c <vFormatPrintString+0x184>
				putch('0', putdat);
    80003792:	85a6                	mv	a1,s1
    80003794:	03000513          	li	a0,48
    80003798:	9902                	jalr	s2
				putch('x', putdat);
    8000379a:	85a6                	mv	a1,s1
    8000379c:	07800513          	li	a0,120
    800037a0:	9902                	jalr	s2
				lflag = 1;
    800037a2:	4585                	li	a1,1
				base = 16;
    800037a4:	49c1                	li	s3,16
    800037a6:	bf65                	j	8000375e <vFormatPrintString+0x176>
				base = 10;
    800037a8:	49a9                	li	s3,10
    800037aa:	bf55                	j	8000375e <vFormatPrintString+0x176>
		putch(padc, putdat);
    800037ac:	85a6                	mv	a1,s1
    800037ae:	8556                	mv	a0,s5
    800037b0:	9902                	jalr	s2
	while (width-- > pos){
    800037b2:	8a5a                	mv	s4,s6
    800037b4:	fffa0b1b          	addiw	s6,s4,-1
    800037b8:	ff49cae3          	blt	s3,s4,800037ac <vFormatPrintString+0x1c4>
    800037bc:	a039                	j	800037ca <vFormatPrintString+0x1e2>
		putch(digs[pos] + (digs[pos] >= 10 ? 'a' - 10 : '0'), putdat);
    800037be:	03000513          	li	a0,48
    800037c2:	85a6                	mv	a1,s1
    800037c4:	9d3d                	addw	a0,a0,a5
    800037c6:	9902                	jalr	s2
	while (pos-- > 0){
    800037c8:	89d2                	mv	s3,s4
    800037ca:	fff98a1b          	addiw	s4,s3,-1
    800037ce:	e3305ae3          	blez	s3,80003602 <vFormatPrintString+0x1a>
		putch(digs[pos] + (digs[pos] >= 10 ? 'a' - 10 : '0'), putdat);
    800037d2:	002a1793          	slli	a5,s4,0x2
    800037d6:	11078793          	addi	a5,a5,272
    800037da:	978a                	add	a5,a5,sp
    800037dc:	f007a783          	lw	a5,-256(a5)
    800037e0:	4725                	li	a4,9
    800037e2:	fcf77ee3          	bgeu	a4,a5,800037be <vFormatPrintString+0x1d6>
    800037e6:	05700513          	li	a0,87
    800037ea:	bfe1                	j	800037c2 <vFormatPrintString+0x1da>
				putch(ch, putdat);
    800037ec:	85a6                	mv	a1,s1
    800037ee:	9902                	jalr	s2
				break;
    800037f0:	bd09                	j	80003602 <vFormatPrintString+0x1a>
				putch('%', putdat);
    800037f2:	85a6                	mv	a1,s1
    800037f4:	02500513          	li	a0,37
    800037f8:	9902                	jalr	s2
				fmt = last_fmt;
    800037fa:	844e                	mv	s0,s3
		while ((ch = *(unsigned char *) fmt) != '%') {
    800037fc:	b519                	j	80003602 <vFormatPrintString+0x1a>
}
    800037fe:	60b6                	ld	ra,328(sp)
    80003800:	6416                	ld	s0,320(sp)
    80003802:	74f2                	ld	s1,312(sp)
    80003804:	7952                	ld	s2,304(sp)
    80003806:	79b2                	ld	s3,296(sp)
    80003808:	7a12                	ld	s4,288(sp)
    8000380a:	6af2                	ld	s5,280(sp)
    8000380c:	6b52                	ld	s6,272(sp)
    8000380e:	6171                	addi	sp,sp,336
    80003810:	8082                	ret

0000000080003812 <exit>:
{
    80003812:	1141                	addi	sp,sp,-16
    80003814:	e406                	sd	ra,8(sp)
    80003816:	85aa                	mv	a1,a0
	syscall(SYS_exit, code, 0, 0);
    80003818:	4681                	li	a3,0
    8000381a:	4601                	li	a2,0
    8000381c:	05d00513          	li	a0,93
    80003820:	c69ff0ef          	jal	ra,80003488 <syscall>
	for(;;) { }
    80003824:	a001                	j	80003824 <exit+0x12>

0000000080003826 <printf>:
{
    80003826:	711d                	addi	sp,sp,-96
    80003828:	ec06                	sd	ra,24(sp)
    8000382a:	f42e                	sd	a1,40(sp)
    8000382c:	f832                	sd	a2,48(sp)
    8000382e:	fc36                	sd	a3,56(sp)
    80003830:	e0ba                	sd	a4,64(sp)
    80003832:	e4be                	sd	a5,72(sp)
    80003834:	e8c2                	sd	a6,80(sp)
    80003836:	ecc6                	sd	a7,88(sp)
	va_start(ap, fmt);
    80003838:	1034                	addi	a3,sp,40
    8000383a:	e436                	sd	a3,8(sp)
	vFormatPrintString((void*) putchar, 0, fmt, ap);
    8000383c:	862a                	mv	a2,a0
    8000383e:	4581                	li	a1,0
    80003840:	00000517          	auipc	a0,0x0
    80003844:	d4e50513          	addi	a0,a0,-690 # 8000358e <putchar>
    80003848:	da1ff0ef          	jal	ra,800035e8 <vFormatPrintString>
}
    8000384c:	4501                	li	a0,0
    8000384e:	60e2                	ld	ra,24(sp)
    80003850:	6125                	addi	sp,sp,96
    80003852:	8082                	ret

0000000080003854 <sprintf>:
{
    80003854:	711d                	addi	sp,sp,-96
    80003856:	f406                	sd	ra,40(sp)
    80003858:	f022                	sd	s0,32(sp)
    8000385a:	e42a                	sd	a0,8(sp)
    8000385c:	f832                	sd	a2,48(sp)
    8000385e:	fc36                	sd	a3,56(sp)
    80003860:	e0ba                	sd	a4,64(sp)
    80003862:	e4be                	sd	a5,72(sp)
    80003864:	e8c2                	sd	a6,80(sp)
    80003866:	ecc6                	sd	a7,88(sp)
	char* str0 = str;
    80003868:	842a                	mv	s0,a0
	va_start(ap, fmt);
    8000386a:	1814                	addi	a3,sp,48
    8000386c:	ec36                	sd	a3,24(sp)

	vFormatPrintString(sprintf_putch, (void**) &str, fmt, ap);
    8000386e:	862e                	mv	a2,a1
    80003870:	002c                	addi	a1,sp,8
    80003872:	00000517          	auipc	a0,0x0
    80003876:	d0e50513          	addi	a0,a0,-754 # 80003580 <sprintf_putch.0>
    8000387a:	d6fff0ef          	jal	ra,800035e8 <vFormatPrintString>
	*str = 0;
    8000387e:	67a2                	ld	a5,8(sp)
    80003880:	00078023          	sb	zero,0(a5)

	va_end(ap);
	return str - str0;
}
    80003884:	6522                	ld	a0,8(sp)
    80003886:	9d01                	subw	a0,a0,s0
    80003888:	70a2                	ld	ra,40(sp)
    8000388a:	7402                	ld	s0,32(sp)
    8000388c:	6125                	addi	sp,sp,96
    8000388e:	8082                	ret

0000000080003890 <prvCheckTimerCallback>:
}
/*-----------------------------------------------------------*/

/* See the description at the top of this file. */
static void prvCheckTimerCallback(__attribute__ ((unused)) TimerHandle_t xTimer )
{
    80003890:	1141                	addi	sp,sp,-16
    80003892:	e406                	sd	ra,8(sp)
    80003894:	e022                	sd	s0,0(sp)
unsigned long ulErrorFound = pdFALSE;

	/* Check all the demo and test tasks to ensure that they are all still
	running, and that none have detected an error. */

	if( xAreBlockTimeTestTasksStillRunning() != pdPASS )
    80003896:	5c2000ef          	jal	ra,80003e58 <xAreBlockTimeTestTasksStillRunning>
    8000389a:	4785                	li	a5,1
    8000389c:	02f51f63          	bne	a0,a5,800038da <prvCheckTimerCallback+0x4a>
unsigned long ulErrorFound = pdFALSE;
    800038a0:	4401                	li	s0,0
	{
		printf("Error in block time test tasks \r\n");
		ulErrorFound |= ( 0x01UL << 1UL );
	}

	if( xAreCountingSemaphoreTasksStillRunning() != pdPASS )
    800038a2:	02d000ef          	jal	ra,800040ce <xAreCountingSemaphoreTasksStillRunning>
    800038a6:	4785                	li	a5,1
    800038a8:	04f51163          	bne	a0,a5,800038ea <prvCheckTimerCallback+0x5a>
	{
		printf("Error in counting semaphore tasks \r\n");
		ulErrorFound |= ( 0x01UL << 2UL );
	}

	if( xAreRecursiveMutexTasksStillRunning() != pdPASS )
    800038ac:	3b3000ef          	jal	ra,8000445e <xAreRecursiveMutexTasksStillRunning>
    800038b0:	4785                	li	a5,1
    800038b2:	04f51563          	bne	a0,a5,800038fc <prvCheckTimerCallback+0x6c>
	{
		printf("Error in recursive mutex tasks \r\n");
		ulErrorFound |= ( 0x01UL << 3UL );
	}

	if( ulErrorFound != pdFALSE )
    800038b6:	cc21                	beqz	s0,8000390e <prvCheckTimerCallback+0x7e>
	{
		__asm volatile("li t6, 0xbeefdead");
    800038b8:	0005ffb7          	lui	t6,0x5f
    800038bc:	77ff8f9b          	addiw	t6,t6,1919
    800038c0:	0fb6                	slli	t6,t6,0xd
    800038c2:	eadf8f93          	addi	t6,t6,-339 # 5eead <_HEAP_SIZE+0x5dead>
		printf("One or more threads has exited! \r\n");
    800038c6:	0001d517          	auipc	a0,0x1d
    800038ca:	97250513          	addi	a0,a0,-1678 # 80020238 <__rodata_start+0x238>
    800038ce:	f59ff0ef          	jal	ra,80003826 <printf>

    /* Do _not_ stop the scheduler; this would halt the system, but was left for reference on how to do so */
	/* Stop scheduler */
//    vTaskEndScheduler();

}
    800038d2:	60a2                	ld	ra,8(sp)
    800038d4:	6402                	ld	s0,0(sp)
    800038d6:	0141                	addi	sp,sp,16
    800038d8:	8082                	ret
		printf("Error in block time test tasks \r\n");
    800038da:	0001d517          	auipc	a0,0x1d
    800038de:	8e650513          	addi	a0,a0,-1818 # 800201c0 <__rodata_start+0x1c0>
    800038e2:	f45ff0ef          	jal	ra,80003826 <printf>
		ulErrorFound |= ( 0x01UL << 1UL );
    800038e6:	4409                	li	s0,2
    800038e8:	bf6d                	j	800038a2 <prvCheckTimerCallback+0x12>
		printf("Error in counting semaphore tasks \r\n");
    800038ea:	0001d517          	auipc	a0,0x1d
    800038ee:	8fe50513          	addi	a0,a0,-1794 # 800201e8 <__rodata_start+0x1e8>
    800038f2:	f35ff0ef          	jal	ra,80003826 <printf>
		ulErrorFound |= ( 0x01UL << 2UL );
    800038f6:	00446413          	ori	s0,s0,4
    800038fa:	bf4d                	j	800038ac <prvCheckTimerCallback+0x1c>
		printf("Error in recursive mutex tasks \r\n");
    800038fc:	0001d517          	auipc	a0,0x1d
    80003900:	91450513          	addi	a0,a0,-1772 # 80020210 <__rodata_start+0x210>
    80003904:	f23ff0ef          	jal	ra,80003826 <printf>
		ulErrorFound |= ( 0x01UL << 3UL );
    80003908:	00846413          	ori	s0,s0,8
    8000390c:	b76d                	j	800038b6 <prvCheckTimerCallback+0x26>
		__asm volatile("li t6, 0xdeadbeef");
    8000390e:	00038fb7          	lui	t6,0x38
    80003912:	ab7f8f9b          	addiw	t6,t6,-1353
    80003916:	0fba                	slli	t6,t6,0xe
    80003918:	eeff8f93          	addi	t6,t6,-273 # 37eef <_HEAP_SIZE+0x36eef>
		printf("[%d] All threads still alive! \r\n", count++);
    8000391c:	0001d797          	auipc	a5,0x1d
    80003920:	b3078793          	addi	a5,a5,-1232 # 8002044c <count.0>
    80003924:	438c                	lw	a1,0(a5)
    80003926:	0015871b          	addiw	a4,a1,1
    8000392a:	c398                	sw	a4,0(a5)
    8000392c:	0001d517          	auipc	a0,0x1d
    80003930:	93450513          	addi	a0,a0,-1740 # 80020260 <__rodata_start+0x260>
    80003934:	ef3ff0ef          	jal	ra,80003826 <printf>
}
    80003938:	bf69                	j	800038d2 <prvCheckTimerCallback+0x42>

000000008000393a <main>:
{
    8000393a:	1141                	addi	sp,sp,-16
    8000393c:	e406                	sd	ra,8(sp)
    8000393e:	e022                	sd	s0,0(sp)
	vCreateBlockTimeTasks();
    80003940:	4a6000ef          	jal	ra,80003de6 <vCreateBlockTimeTasks>
	vStartCountingSemaphoreTasks();
    80003944:	6cc000ef          	jal	ra,80004010 <vStartCountingSemaphoreTasks>
	vStartRecursiveMutexTasks();
    80003948:	277000ef          	jal	ra,800043be <vStartRecursiveMutexTasks>
	xCheckTimer = xTimerCreate( "CheckTimer",					/* A text name, purely to help debugging. */
    8000394c:	00000717          	auipc	a4,0x0
    80003950:	f4470713          	addi	a4,a4,-188 # 80003890 <prvCheckTimerCallback>
    80003954:	4681                	li	a3,0
    80003956:	4605                	li	a2,1
    80003958:	6585                	lui	a1,0x1
    8000395a:	bb858593          	addi	a1,a1,-1096 # bb8 <_HEAP_SIZE-0x448>
    8000395e:	0001d517          	auipc	a0,0x1d
    80003962:	92a50513          	addi	a0,a0,-1750 # 80020288 <__rodata_start+0x288>
    80003966:	8a0ff0ef          	jal	ra,80002a06 <xTimerCreate>
	if( xCheckTimer != NULL )
    8000396a:	cd01                	beqz	a0,80003982 <main+0x48>
    8000396c:	842a                	mv	s0,a0
		xTimerStart( xCheckTimer, mainDONT_BLOCK );
    8000396e:	9abfe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003972:	4701                	li	a4,0
    80003974:	4681                	li	a3,0
    80003976:	0005061b          	sext.w	a2,a0
    8000397a:	4585                	li	a1,1
    8000397c:	8522                	mv	a0,s0
    8000397e:	8eeff0ef          	jal	ra,80002a6c <xTimerGenericCommand>
	vTaskStartScheduler();
    80003982:	a64fe0ef          	jal	ra,80001be6 <vTaskStartScheduler>
}
    80003986:	4501                	li	a0,0
    80003988:	60a2                	ld	ra,8(sp)
    8000398a:	6402                	ld	s0,0(sp)
    8000398c:	0141                	addi	sp,sp,16
    8000398e:	8082                	ret

0000000080003990 <vApplicationMallocFailedHook>:
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	taskDISABLE_INTERRUPTS();
    80003990:	30047073          	csrci	mstatus,8
	for( ;; );
    80003994:	a001                	j	80003994 <vApplicationMallocFailedHook+0x4>

0000000080003996 <vApplicationIdleHook>:
	specified, or call vTaskDelay()).  If the application makes use of the
	vTaskDelete() API function (as this demo application does) then it is also
	important that vApplicationIdleHook() is permitted to return to its calling
	function, because it is the responsibility of the idle task to clean up
	memory allocated by the kernel to any task that has since been deleted. */
}
    80003996:	8082                	ret

0000000080003998 <vApplicationStackOverflowHook>:
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
    80003998:	30047073          	csrci	mstatus,8
	for( ;; );
    8000399c:	a001                	j	8000399c <vApplicationStackOverflowHook+0x4>

000000008000399e <vSecondaryBlockTimeTestTask>:
	}
}
/*-----------------------------------------------------------*/

static void vSecondaryBlockTimeTestTask( void *pvParameters )
{
    8000399e:	7179                	addi	sp,sp,-48
    800039a0:	f406                	sd	ra,40(sp)
    800039a2:	f022                	sd	s0,32(sp)
    800039a4:	ec26                	sd	s1,24(sp)
    800039a6:	e84a                	sd	s2,16(sp)
    800039a8:	a01d                	j	800039ce <vSecondaryBlockTimeTestTask+0x30>
		/* We should of not blocked for much longer than bktALLOWABLE_MARGIN
		either.  A margin is permitted as we would not necessarily run as soon
		as we unblocked. */
		if( xBlockedTime > ( bktTIME_TO_BLOCK + bktALLOWABLE_MARGIN ) )
		{
			xErrorOccurred = pdTRUE;
    800039aa:	4785                	li	a5,1
    800039ac:	0001d717          	auipc	a4,0x1d
    800039b0:	aaf73e23          	sd	a5,-1348(a4) # 80020468 <xErrorOccurred>
		}

		xRunIndicator = bktRUN_INDICATOR;
    800039b4:	05500793          	li	a5,85
    800039b8:	0001d717          	auipc	a4,0x1d
    800039bc:	aaf73423          	sd	a5,-1368(a4) # 80020460 <xRunIndicator>

		xSecondaryCycles++;
    800039c0:	0001d717          	auipc	a4,0x1d
    800039c4:	ab070713          	addi	a4,a4,-1360 # 80020470 <xSecondaryCycles>
    800039c8:	631c                	ld	a5,0(a4)
    800039ca:	0785                	addi	a5,a5,1
    800039cc:	e31c                	sd	a5,0(a4)
		vTaskSuspend( NULL );
    800039ce:	4501                	li	a0,0
    800039d0:	cb8fe0ef          	jal	ra,80001e88 <vTaskSuspend>
		xTimeWhenBlocking = xTaskGetTickCount();
    800039d4:	945fe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    800039d8:	0005041b          	sext.w	s0,a0
		xData = 0;
    800039dc:	e402                	sd	zero,8(sp)
		xRunIndicator = bktRUN_INDICATOR;
    800039de:	05500793          	li	a5,85
    800039e2:	0001d717          	auipc	a4,0x1d
    800039e6:	a6f73f23          	sd	a5,-1410(a4) # 80020460 <xRunIndicator>
		if( xQueueSend( xTestQueue, &xData, bktTIME_TO_BLOCK ) != errQUEUE_FULL )
    800039ea:	4681                	li	a3,0
    800039ec:	0af00613          	li	a2,175
    800039f0:	002c                	addi	a1,sp,8
    800039f2:	0001d517          	auipc	a0,0x1d
    800039f6:	a9653503          	ld	a0,-1386(a0) # 80020488 <xTestQueue>
    800039fa:	e51fc0ef          	jal	ra,8000084a <xQueueGenericSend>
    800039fe:	c511                	beqz	a0,80003a0a <vSecondaryBlockTimeTestTask+0x6c>
			xErrorOccurred = pdTRUE;
    80003a00:	4785                	li	a5,1
    80003a02:	0001d717          	auipc	a4,0x1d
    80003a06:	a6f73323          	sd	a5,-1434(a4) # 80020468 <xErrorOccurred>
		xBlockedTime = xTaskGetTickCount() - xTimeWhenBlocking;
    80003a0a:	90ffe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003a0e:	9d01                	subw	a0,a0,s0
		if( xBlockedTime < bktTIME_TO_BLOCK )
    80003a10:	0ae00793          	li	a5,174
    80003a14:	00a7e763          	bltu	a5,a0,80003a22 <vSecondaryBlockTimeTestTask+0x84>
			xErrorOccurred = pdTRUE;
    80003a18:	4785                	li	a5,1
    80003a1a:	0001d717          	auipc	a4,0x1d
    80003a1e:	a4f73723          	sd	a5,-1458(a4) # 80020468 <xErrorOccurred>
		if( xBlockedTime > ( bktTIME_TO_BLOCK + bktALLOWABLE_MARGIN ) )
    80003a22:	0be00793          	li	a5,190
    80003a26:	00a7f763          	bgeu	a5,a0,80003a34 <vSecondaryBlockTimeTestTask+0x96>
			xErrorOccurred = pdTRUE;
    80003a2a:	4785                	li	a5,1
    80003a2c:	0001d717          	auipc	a4,0x1d
    80003a30:	a2f73e23          	sd	a5,-1476(a4) # 80020468 <xErrorOccurred>
		xRunIndicator = bktRUN_INDICATOR;
    80003a34:	0001d497          	auipc	s1,0x1d
    80003a38:	a2c48493          	addi	s1,s1,-1492 # 80020460 <xRunIndicator>
    80003a3c:	05500913          	li	s2,85
    80003a40:	0124b023          	sd	s2,0(s1)
		vTaskSuspend( NULL );
    80003a44:	4501                	li	a0,0
    80003a46:	c42fe0ef          	jal	ra,80001e88 <vTaskSuspend>
		xTimeWhenBlocking = xTaskGetTickCount();
    80003a4a:	8cffe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003a4e:	0005041b          	sext.w	s0,a0
		xRunIndicator = bktRUN_INDICATOR;
    80003a52:	0124b023          	sd	s2,0(s1)
		if( xQueueReceive( xTestQueue, &xData, bktTIME_TO_BLOCK ) != errQUEUE_EMPTY )
    80003a56:	4681                	li	a3,0
    80003a58:	0af00613          	li	a2,175
    80003a5c:	002c                	addi	a1,sp,8
    80003a5e:	0001d517          	auipc	a0,0x1d
    80003a62:	a2a53503          	ld	a0,-1494(a0) # 80020488 <xTestQueue>
    80003a66:	8f8fd0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003a6a:	c511                	beqz	a0,80003a76 <vSecondaryBlockTimeTestTask+0xd8>
			xErrorOccurred = pdTRUE;
    80003a6c:	4785                	li	a5,1
    80003a6e:	0001d717          	auipc	a4,0x1d
    80003a72:	9ef73d23          	sd	a5,-1542(a4) # 80020468 <xErrorOccurred>
		xBlockedTime = xTaskGetTickCount() - xTimeWhenBlocking;
    80003a76:	8a3fe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003a7a:	9d01                	subw	a0,a0,s0
		if( xBlockedTime < bktTIME_TO_BLOCK )
    80003a7c:	0ae00793          	li	a5,174
    80003a80:	00a7e763          	bltu	a5,a0,80003a8e <vSecondaryBlockTimeTestTask+0xf0>
			xErrorOccurred = pdTRUE;
    80003a84:	4785                	li	a5,1
    80003a86:	0001d717          	auipc	a4,0x1d
    80003a8a:	9ef73123          	sd	a5,-1566(a4) # 80020468 <xErrorOccurred>
		if( xBlockedTime > ( bktTIME_TO_BLOCK + bktALLOWABLE_MARGIN ) )
    80003a8e:	0be00793          	li	a5,190
    80003a92:	f2a7f1e3          	bgeu	a5,a0,800039b4 <vSecondaryBlockTimeTestTask+0x16>
    80003a96:	bf11                	j	800039aa <vSecondaryBlockTimeTestTask+0xc>

0000000080003a98 <vPrimaryBlockTimeTestTask>:
{
    80003a98:	7179                	addi	sp,sp,-48
    80003a9a:	f406                	sd	ra,40(sp)
    80003a9c:	f022                	sd	s0,32(sp)
    80003a9e:	ec26                	sd	s1,24(sp)
    80003aa0:	e84a                	sd	s2,16(sp)
    80003aa2:	a681                	j	80003de2 <vPrimaryBlockTimeTestTask+0x34a>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003aa4:	67a2                	ld	a5,8(sp)
    80003aa6:	0785                	addi	a5,a5,1
    80003aa8:	e43e                	sd	a5,8(sp)
    80003aaa:	67a2                	ld	a5,8(sp)
    80003aac:	4711                	li	a4,4
    80003aae:	04f74d63          	blt	a4,a5,80003b08 <vPrimaryBlockTimeTestTask+0x70>
			xTimeToBlock = ( TickType_t ) ( bktPRIMARY_BLOCK_TIME << xItem );
    80003ab2:	4429                	li	s0,10
    80003ab4:	00f4143b          	sllw	s0,s0,a5
    80003ab8:	0004091b          	sext.w	s2,s0
			xTimeWhenBlocking = xTaskGetTickCount();
    80003abc:	85dfe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003ac0:	0005049b          	sext.w	s1,a0
			if( xQueueReceive( xTestQueue, &xData, xTimeToBlock ) != errQUEUE_EMPTY )
    80003ac4:	4681                	li	a3,0
    80003ac6:	864a                	mv	a2,s2
    80003ac8:	858a                	mv	a1,sp
    80003aca:	0001d517          	auipc	a0,0x1d
    80003ace:	9be53503          	ld	a0,-1602(a0) # 80020488 <xTestQueue>
    80003ad2:	88cfd0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003ad6:	c511                	beqz	a0,80003ae2 <vPrimaryBlockTimeTestTask+0x4a>
				xErrorOccurred = pdTRUE;
    80003ad8:	4785                	li	a5,1
    80003ada:	0001d717          	auipc	a4,0x1d
    80003ade:	98f73723          	sd	a5,-1650(a4) # 80020468 <xErrorOccurred>
			xBlockedTime = xTaskGetTickCount() - xTimeWhenBlocking;
    80003ae2:	837fe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003ae6:	9d05                	subw	a0,a0,s1
			if( xBlockedTime < xTimeToBlock )
    80003ae8:	01257763          	bgeu	a0,s2,80003af6 <vPrimaryBlockTimeTestTask+0x5e>
				xErrorOccurred = pdTRUE;
    80003aec:	4785                	li	a5,1
    80003aee:	0001d717          	auipc	a4,0x1d
    80003af2:	96f73d23          	sd	a5,-1670(a4) # 80020468 <xErrorOccurred>
			if( xBlockedTime > ( xTimeToBlock + bktALLOWABLE_MARGIN ) )
    80003af6:	243d                	addiw	s0,s0,15
    80003af8:	faa476e3          	bgeu	s0,a0,80003aa4 <vPrimaryBlockTimeTestTask+0xc>
				xErrorOccurred = pdTRUE;
    80003afc:	4785                	li	a5,1
    80003afe:	0001d717          	auipc	a4,0x1d
    80003b02:	96f73523          	sd	a5,-1686(a4) # 80020468 <xErrorOccurred>
    80003b06:	bf79                	j	80003aa4 <vPrimaryBlockTimeTestTask+0xc>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003b08:	e402                	sd	zero,8(sp)
    80003b0a:	a801                	j	80003b1a <vPrimaryBlockTimeTestTask+0x82>
				xErrorOccurred = pdTRUE;
    80003b0c:	0001d717          	auipc	a4,0x1d
    80003b10:	94f73e23          	sd	a5,-1700(a4) # 80020468 <xErrorOccurred>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003b14:	67a2                	ld	a5,8(sp)
    80003b16:	0785                	addi	a5,a5,1
    80003b18:	e43e                	sd	a5,8(sp)
    80003b1a:	6722                	ld	a4,8(sp)
    80003b1c:	4791                	li	a5,4
    80003b1e:	00e7cf63          	blt	a5,a4,80003b3c <vPrimaryBlockTimeTestTask+0xa4>
			if( xQueueSend( xTestQueue, &xItem, bktDONT_BLOCK ) != pdPASS )
    80003b22:	4681                	li	a3,0
    80003b24:	4601                	li	a2,0
    80003b26:	002c                	addi	a1,sp,8
    80003b28:	0001d517          	auipc	a0,0x1d
    80003b2c:	96053503          	ld	a0,-1696(a0) # 80020488 <xTestQueue>
    80003b30:	d1bfc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003b34:	4785                	li	a5,1
    80003b36:	fcf51be3          	bne	a0,a5,80003b0c <vPrimaryBlockTimeTestTask+0x74>
    80003b3a:	bfe9                	j	80003b14 <vPrimaryBlockTimeTestTask+0x7c>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003b3c:	e402                	sd	zero,8(sp)
    80003b3e:	a021                	j	80003b46 <vPrimaryBlockTimeTestTask+0xae>
    80003b40:	67a2                	ld	a5,8(sp)
    80003b42:	0785                	addi	a5,a5,1
    80003b44:	e43e                	sd	a5,8(sp)
    80003b46:	67a2                	ld	a5,8(sp)
    80003b48:	4711                	li	a4,4
    80003b4a:	04f74d63          	blt	a4,a5,80003ba4 <vPrimaryBlockTimeTestTask+0x10c>
			xTimeToBlock = ( TickType_t ) ( bktPRIMARY_BLOCK_TIME << xItem );
    80003b4e:	4429                	li	s0,10
    80003b50:	00f4143b          	sllw	s0,s0,a5
    80003b54:	0004091b          	sext.w	s2,s0
			xTimeWhenBlocking = xTaskGetTickCount();
    80003b58:	fc0fe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003b5c:	0005049b          	sext.w	s1,a0
			if( xQueueSend( xTestQueue, &xItem, xTimeToBlock ) != errQUEUE_FULL )
    80003b60:	4681                	li	a3,0
    80003b62:	864a                	mv	a2,s2
    80003b64:	002c                	addi	a1,sp,8
    80003b66:	0001d517          	auipc	a0,0x1d
    80003b6a:	92253503          	ld	a0,-1758(a0) # 80020488 <xTestQueue>
    80003b6e:	cddfc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003b72:	c511                	beqz	a0,80003b7e <vPrimaryBlockTimeTestTask+0xe6>
				xErrorOccurred = pdTRUE;
    80003b74:	4785                	li	a5,1
    80003b76:	0001d717          	auipc	a4,0x1d
    80003b7a:	8ef73923          	sd	a5,-1806(a4) # 80020468 <xErrorOccurred>
			xBlockedTime = xTaskGetTickCount() - xTimeWhenBlocking;
    80003b7e:	f9afe0ef          	jal	ra,80002318 <xTaskGetTickCount>
    80003b82:	9d05                	subw	a0,a0,s1
			if( xBlockedTime < xTimeToBlock )
    80003b84:	01257763          	bgeu	a0,s2,80003b92 <vPrimaryBlockTimeTestTask+0xfa>
				xErrorOccurred = pdTRUE;
    80003b88:	4785                	li	a5,1
    80003b8a:	0001d717          	auipc	a4,0x1d
    80003b8e:	8cf73f23          	sd	a5,-1826(a4) # 80020468 <xErrorOccurred>
			if( xBlockedTime > ( xTimeToBlock + bktALLOWABLE_MARGIN ) )
    80003b92:	243d                	addiw	s0,s0,15
    80003b94:	faa476e3          	bgeu	s0,a0,80003b40 <vPrimaryBlockTimeTestTask+0xa8>
				xErrorOccurred = pdTRUE;
    80003b98:	4785                	li	a5,1
    80003b9a:	0001d717          	auipc	a4,0x1d
    80003b9e:	8cf73723          	sd	a5,-1842(a4) # 80020468 <xErrorOccurred>
    80003ba2:	bf79                	j	80003b40 <vPrimaryBlockTimeTestTask+0xa8>
		xRunIndicator = 0;
    80003ba4:	0001d797          	auipc	a5,0x1d
    80003ba8:	8a07be23          	sd	zero,-1860(a5) # 80020460 <xRunIndicator>
		vTaskResume( xSecondary );
    80003bac:	0001d517          	auipc	a0,0x1d
    80003bb0:	8d453503          	ld	a0,-1836(a0) # 80020480 <xSecondary>
    80003bb4:	b88fe0ef          	jal	ra,80001f3c <vTaskResume>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003bb8:	a021                	j	80003bc0 <vPrimaryBlockTimeTestTask+0x128>
			vTaskDelay( bktSHORT_WAIT );
    80003bba:	4551                	li	a0,20
    80003bbc:	da8fe0ef          	jal	ra,80002164 <vTaskDelay>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003bc0:	0001d717          	auipc	a4,0x1d
    80003bc4:	8a073703          	ld	a4,-1888(a4) # 80020460 <xRunIndicator>
    80003bc8:	05500793          	li	a5,85
    80003bcc:	fef717e3          	bne	a4,a5,80003bba <vPrimaryBlockTimeTestTask+0x122>
		vTaskDelay( bktSHORT_WAIT );
    80003bd0:	4551                	li	a0,20
    80003bd2:	d92fe0ef          	jal	ra,80002164 <vTaskDelay>
		xRunIndicator = 0;
    80003bd6:	0001d797          	auipc	a5,0x1d
    80003bda:	8807b523          	sd	zero,-1910(a5) # 80020460 <xRunIndicator>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003bde:	e402                	sd	zero,8(sp)
    80003be0:	a0b5                	j	80003c4c <vPrimaryBlockTimeTestTask+0x1b4>
				xErrorOccurred = pdTRUE;
    80003be2:	0001d717          	auipc	a4,0x1d
    80003be6:	88f73323          	sd	a5,-1914(a4) # 80020468 <xErrorOccurred>
			if( xQueueSend( xTestQueue, &xItem, bktDONT_BLOCK ) != pdPASS )
    80003bea:	4681                	li	a3,0
    80003bec:	4601                	li	a2,0
    80003bee:	002c                	addi	a1,sp,8
    80003bf0:	0001d517          	auipc	a0,0x1d
    80003bf4:	89853503          	ld	a0,-1896(a0) # 80020488 <xTestQueue>
    80003bf8:	c53fc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003bfc:	4785                	li	a5,1
    80003bfe:	00f50663          	beq	a0,a5,80003c0a <vPrimaryBlockTimeTestTask+0x172>
				xErrorOccurred = pdTRUE;
    80003c02:	0001d717          	auipc	a4,0x1d
    80003c06:	86f73323          	sd	a5,-1946(a4) # 80020468 <xErrorOccurred>
			if( xRunIndicator == bktRUN_INDICATOR )
    80003c0a:	0001d717          	auipc	a4,0x1d
    80003c0e:	85673703          	ld	a4,-1962(a4) # 80020460 <xRunIndicator>
    80003c12:	05500793          	li	a5,85
    80003c16:	04f70c63          	beq	a4,a5,80003c6e <vPrimaryBlockTimeTestTask+0x1d6>
			vTaskPrioritySet( xSecondary, bktPRIMARY_PRIORITY + 2 );
    80003c1a:	4591                	li	a1,4
    80003c1c:	0001d517          	auipc	a0,0x1d
    80003c20:	86453503          	ld	a0,-1948(a0) # 80020480 <xSecondary>
    80003c24:	974fe0ef          	jal	ra,80001d98 <vTaskPrioritySet>
			if( xRunIndicator == bktRUN_INDICATOR )
    80003c28:	0001d717          	auipc	a4,0x1d
    80003c2c:	83873703          	ld	a4,-1992(a4) # 80020460 <xRunIndicator>
    80003c30:	05500793          	li	a5,85
    80003c34:	04f70363          	beq	a4,a5,80003c7a <vPrimaryBlockTimeTestTask+0x1e2>
			vTaskPrioritySet( xSecondary, bktSECONDARY_PRIORITY );
    80003c38:	4585                	li	a1,1
    80003c3a:	0001d517          	auipc	a0,0x1d
    80003c3e:	84653503          	ld	a0,-1978(a0) # 80020480 <xSecondary>
    80003c42:	956fe0ef          	jal	ra,80001d98 <vTaskPrioritySet>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003c46:	67a2                	ld	a5,8(sp)
    80003c48:	0785                	addi	a5,a5,1
    80003c4a:	e43e                	sd	a5,8(sp)
    80003c4c:	6722                	ld	a4,8(sp)
    80003c4e:	4791                	li	a5,4
    80003c50:	02e7ce63          	blt	a5,a4,80003c8c <vPrimaryBlockTimeTestTask+0x1f4>
			if( xQueueReceive( xTestQueue, &xData, bktDONT_BLOCK ) != pdPASS )
    80003c54:	4681                	li	a3,0
    80003c56:	4601                	li	a2,0
    80003c58:	858a                	mv	a1,sp
    80003c5a:	0001d517          	auipc	a0,0x1d
    80003c5e:	82e53503          	ld	a0,-2002(a0) # 80020488 <xTestQueue>
    80003c62:	efdfc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003c66:	4785                	li	a5,1
    80003c68:	f6f51de3          	bne	a0,a5,80003be2 <vPrimaryBlockTimeTestTask+0x14a>
    80003c6c:	bfbd                	j	80003bea <vPrimaryBlockTimeTestTask+0x152>
				xErrorOccurred = pdTRUE;
    80003c6e:	4785                	li	a5,1
    80003c70:	0001c717          	auipc	a4,0x1c
    80003c74:	7ef73c23          	sd	a5,2040(a4) # 80020468 <xErrorOccurred>
    80003c78:	b74d                	j	80003c1a <vPrimaryBlockTimeTestTask+0x182>
				xErrorOccurred = pdTRUE;
    80003c7a:	4785                	li	a5,1
    80003c7c:	0001c717          	auipc	a4,0x1c
    80003c80:	7ef73623          	sd	a5,2028(a4) # 80020468 <xErrorOccurred>
    80003c84:	bf55                	j	80003c38 <vPrimaryBlockTimeTestTask+0x1a0>
			vTaskDelay( bktSHORT_WAIT );
    80003c86:	4551                	li	a0,20
    80003c88:	cdcfe0ef          	jal	ra,80002164 <vTaskDelay>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003c8c:	0001c717          	auipc	a4,0x1c
    80003c90:	7d473703          	ld	a4,2004(a4) # 80020460 <xRunIndicator>
    80003c94:	05500793          	li	a5,85
    80003c98:	fef717e3          	bne	a4,a5,80003c86 <vPrimaryBlockTimeTestTask+0x1ee>
		vTaskDelay( bktSHORT_WAIT );
    80003c9c:	4551                	li	a0,20
    80003c9e:	cc6fe0ef          	jal	ra,80002164 <vTaskDelay>
		xRunIndicator = 0;
    80003ca2:	0001c797          	auipc	a5,0x1c
    80003ca6:	7a07bf23          	sd	zero,1982(a5) # 80020460 <xRunIndicator>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003caa:	e402                	sd	zero,8(sp)
    80003cac:	a801                	j	80003cbc <vPrimaryBlockTimeTestTask+0x224>
				xErrorOccurred = pdTRUE;
    80003cae:	0001c717          	auipc	a4,0x1c
    80003cb2:	7af73d23          	sd	a5,1978(a4) # 80020468 <xErrorOccurred>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003cb6:	67a2                	ld	a5,8(sp)
    80003cb8:	0785                	addi	a5,a5,1
    80003cba:	e43e                	sd	a5,8(sp)
    80003cbc:	6722                	ld	a4,8(sp)
    80003cbe:	4791                	li	a5,4
    80003cc0:	00e7cf63          	blt	a5,a4,80003cde <vPrimaryBlockTimeTestTask+0x246>
			if( xQueueReceive( xTestQueue, &xData, bktDONT_BLOCK ) != pdPASS )
    80003cc4:	4681                	li	a3,0
    80003cc6:	4601                	li	a2,0
    80003cc8:	858a                	mv	a1,sp
    80003cca:	0001c517          	auipc	a0,0x1c
    80003cce:	7be53503          	ld	a0,1982(a0) # 80020488 <xTestQueue>
    80003cd2:	e8dfc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003cd6:	4785                	li	a5,1
    80003cd8:	fcf51be3          	bne	a0,a5,80003cae <vPrimaryBlockTimeTestTask+0x216>
    80003cdc:	bfe9                	j	80003cb6 <vPrimaryBlockTimeTestTask+0x21e>
		vTaskResume( xSecondary );
    80003cde:	0001c517          	auipc	a0,0x1c
    80003ce2:	7a253503          	ld	a0,1954(a0) # 80020480 <xSecondary>
    80003ce6:	a56fe0ef          	jal	ra,80001f3c <vTaskResume>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003cea:	a021                	j	80003cf2 <vPrimaryBlockTimeTestTask+0x25a>
			vTaskDelay( bktSHORT_WAIT );
    80003cec:	4551                	li	a0,20
    80003cee:	c76fe0ef          	jal	ra,80002164 <vTaskDelay>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003cf2:	0001c717          	auipc	a4,0x1c
    80003cf6:	76e73703          	ld	a4,1902(a4) # 80020460 <xRunIndicator>
    80003cfa:	05500793          	li	a5,85
    80003cfe:	fef717e3          	bne	a4,a5,80003cec <vPrimaryBlockTimeTestTask+0x254>
		vTaskDelay( bktSHORT_WAIT );
    80003d02:	4551                	li	a0,20
    80003d04:	c60fe0ef          	jal	ra,80002164 <vTaskDelay>
		xRunIndicator = 0;
    80003d08:	0001c797          	auipc	a5,0x1c
    80003d0c:	7407bc23          	sd	zero,1880(a5) # 80020460 <xRunIndicator>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003d10:	e402                	sd	zero,8(sp)
    80003d12:	a0b5                	j	80003d7e <vPrimaryBlockTimeTestTask+0x2e6>
				xErrorOccurred = pdTRUE;
    80003d14:	0001c717          	auipc	a4,0x1c
    80003d18:	74f73a23          	sd	a5,1876(a4) # 80020468 <xErrorOccurred>
			if( xQueueReceive( xTestQueue, &xData, bktDONT_BLOCK ) != pdPASS )
    80003d1c:	4681                	li	a3,0
    80003d1e:	4601                	li	a2,0
    80003d20:	858a                	mv	a1,sp
    80003d22:	0001c517          	auipc	a0,0x1c
    80003d26:	76653503          	ld	a0,1894(a0) # 80020488 <xTestQueue>
    80003d2a:	e35fc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003d2e:	4785                	li	a5,1
    80003d30:	00f50663          	beq	a0,a5,80003d3c <vPrimaryBlockTimeTestTask+0x2a4>
				xErrorOccurred = pdTRUE;
    80003d34:	0001c717          	auipc	a4,0x1c
    80003d38:	72f73a23          	sd	a5,1844(a4) # 80020468 <xErrorOccurred>
			if( xRunIndicator == bktRUN_INDICATOR )
    80003d3c:	0001c717          	auipc	a4,0x1c
    80003d40:	72473703          	ld	a4,1828(a4) # 80020460 <xRunIndicator>
    80003d44:	05500793          	li	a5,85
    80003d48:	04f70c63          	beq	a4,a5,80003da0 <vPrimaryBlockTimeTestTask+0x308>
			vTaskPrioritySet( xSecondary, bktPRIMARY_PRIORITY + 2 );
    80003d4c:	4591                	li	a1,4
    80003d4e:	0001c517          	auipc	a0,0x1c
    80003d52:	73253503          	ld	a0,1842(a0) # 80020480 <xSecondary>
    80003d56:	842fe0ef          	jal	ra,80001d98 <vTaskPrioritySet>
			if( xRunIndicator == bktRUN_INDICATOR )
    80003d5a:	0001c717          	auipc	a4,0x1c
    80003d5e:	70673703          	ld	a4,1798(a4) # 80020460 <xRunIndicator>
    80003d62:	05500793          	li	a5,85
    80003d66:	04f70363          	beq	a4,a5,80003dac <vPrimaryBlockTimeTestTask+0x314>
			vTaskPrioritySet( xSecondary, bktSECONDARY_PRIORITY );
    80003d6a:	4585                	li	a1,1
    80003d6c:	0001c517          	auipc	a0,0x1c
    80003d70:	71453503          	ld	a0,1812(a0) # 80020480 <xSecondary>
    80003d74:	824fe0ef          	jal	ra,80001d98 <vTaskPrioritySet>
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003d78:	67a2                	ld	a5,8(sp)
    80003d7a:	0785                	addi	a5,a5,1
    80003d7c:	e43e                	sd	a5,8(sp)
    80003d7e:	6722                	ld	a4,8(sp)
    80003d80:	4791                	li	a5,4
    80003d82:	02e7ce63          	blt	a5,a4,80003dbe <vPrimaryBlockTimeTestTask+0x326>
			if( xQueueSend( xTestQueue, &xItem, bktDONT_BLOCK ) != pdPASS )
    80003d86:	4681                	li	a3,0
    80003d88:	4601                	li	a2,0
    80003d8a:	002c                	addi	a1,sp,8
    80003d8c:	0001c517          	auipc	a0,0x1c
    80003d90:	6fc53503          	ld	a0,1788(a0) # 80020488 <xTestQueue>
    80003d94:	ab7fc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003d98:	4785                	li	a5,1
    80003d9a:	f6f51de3          	bne	a0,a5,80003d14 <vPrimaryBlockTimeTestTask+0x27c>
    80003d9e:	bfbd                	j	80003d1c <vPrimaryBlockTimeTestTask+0x284>
				xErrorOccurred = pdTRUE;
    80003da0:	4785                	li	a5,1
    80003da2:	0001c717          	auipc	a4,0x1c
    80003da6:	6cf73323          	sd	a5,1734(a4) # 80020468 <xErrorOccurred>
    80003daa:	b74d                	j	80003d4c <vPrimaryBlockTimeTestTask+0x2b4>
				xErrorOccurred = pdTRUE;
    80003dac:	4785                	li	a5,1
    80003dae:	0001c717          	auipc	a4,0x1c
    80003db2:	6af73d23          	sd	a5,1722(a4) # 80020468 <xErrorOccurred>
    80003db6:	bf55                	j	80003d6a <vPrimaryBlockTimeTestTask+0x2d2>
			vTaskDelay( bktSHORT_WAIT );
    80003db8:	4551                	li	a0,20
    80003dba:	baafe0ef          	jal	ra,80002164 <vTaskDelay>
		while( xRunIndicator != bktRUN_INDICATOR )
    80003dbe:	0001c717          	auipc	a4,0x1c
    80003dc2:	6a273703          	ld	a4,1698(a4) # 80020460 <xRunIndicator>
    80003dc6:	05500793          	li	a5,85
    80003dca:	fef717e3          	bne	a4,a5,80003db8 <vPrimaryBlockTimeTestTask+0x320>
		vTaskDelay( bktSHORT_WAIT );
    80003dce:	4551                	li	a0,20
    80003dd0:	b94fe0ef          	jal	ra,80002164 <vTaskDelay>
		xPrimaryCycles++;
    80003dd4:	0001c717          	auipc	a4,0x1c
    80003dd8:	6a470713          	addi	a4,a4,1700 # 80020478 <xPrimaryCycles>
    80003ddc:	631c                	ld	a5,0(a4)
    80003dde:	0785                	addi	a5,a5,1
    80003de0:	e31c                	sd	a5,0(a4)
		for( xItem = 0; xItem < bktQUEUE_LENGTH; xItem++ )
    80003de2:	e402                	sd	zero,8(sp)
    80003de4:	b1d9                	j	80003aaa <vPrimaryBlockTimeTestTask+0x12>

0000000080003de6 <vCreateBlockTimeTasks>:
{
    80003de6:	1141                	addi	sp,sp,-16
    80003de8:	e406                	sd	ra,8(sp)
    xTestQueue = xQueueCreate( bktQUEUE_LENGTH, sizeof( BaseType_t ) );
    80003dea:	4601                	li	a2,0
    80003dec:	45a1                	li	a1,8
    80003dee:	4515                	li	a0,5
    80003df0:	9bbfc0ef          	jal	ra,800007aa <xQueueGenericCreate>
    80003df4:	0001c717          	auipc	a4,0x1c
    80003df8:	68a73a23          	sd	a0,1684(a4) # 80020488 <xTestQueue>
	vQueueAddToRegistry( xTestQueue, "Block_Time_Queue" );
    80003dfc:	0001c597          	auipc	a1,0x1c
    80003e00:	49c58593          	addi	a1,a1,1180 # 80020298 <__rodata_start+0x298>
    80003e04:	878fd0ef          	jal	ra,80000e7c <vQueueAddToRegistry>
	xTaskCreate( vPrimaryBlockTimeTestTask, "BTest1", configMINIMAL_STACK_SIZE, NULL, bktPRIMARY_PRIORITY, NULL );
    80003e08:	4881                	li	a7,0
    80003e0a:	4801                	li	a6,0
    80003e0c:	4781                	li	a5,0
    80003e0e:	4709                	li	a4,2
    80003e10:	4681                	li	a3,0
    80003e12:	40000613          	li	a2,1024
    80003e16:	0001c597          	auipc	a1,0x1c
    80003e1a:	49a58593          	addi	a1,a1,1178 # 800202b0 <__rodata_start+0x2b0>
    80003e1e:	00000517          	auipc	a0,0x0
    80003e22:	c7a50513          	addi	a0,a0,-902 # 80003a98 <vPrimaryBlockTimeTestTask>
    80003e26:	c65fd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
	xTaskCreate( vSecondaryBlockTimeTestTask, "BTest2", configMINIMAL_STACK_SIZE, NULL, bktSECONDARY_PRIORITY, &xSecondary );
    80003e2a:	4881                	li	a7,0
    80003e2c:	4801                	li	a6,0
    80003e2e:	0001c797          	auipc	a5,0x1c
    80003e32:	65278793          	addi	a5,a5,1618 # 80020480 <xSecondary>
    80003e36:	4705                	li	a4,1
    80003e38:	4681                	li	a3,0
    80003e3a:	40000613          	li	a2,1024
    80003e3e:	0001c597          	auipc	a1,0x1c
    80003e42:	47a58593          	addi	a1,a1,1146 # 800202b8 <__rodata_start+0x2b8>
    80003e46:	00000517          	auipc	a0,0x0
    80003e4a:	b5850513          	addi	a0,a0,-1192 # 8000399e <vSecondaryBlockTimeTestTask>
    80003e4e:	c3dfd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
}
    80003e52:	60a2                	ld	ra,8(sp)
    80003e54:	0141                	addi	sp,sp,16
    80003e56:	8082                	ret

0000000080003e58 <xAreBlockTimeTestTasksStillRunning>:
static BaseType_t xLastPrimaryCycleCount = 0, xLastSecondaryCycleCount = 0;
BaseType_t xReturn = pdPASS;

	/* Have both tasks performed at least one cycle since this function was
	last called? */
	if( xPrimaryCycles == xLastPrimaryCycleCount )
    80003e58:	0001c717          	auipc	a4,0x1c
    80003e5c:	62073703          	ld	a4,1568(a4) # 80020478 <xPrimaryCycles>
    80003e60:	0001c797          	auipc	a5,0x1c
    80003e64:	5f87b783          	ld	a5,1528(a5) # 80020458 <xLastPrimaryCycleCount.1>
    80003e68:	04f70563          	beq	a4,a5,80003eb2 <xAreBlockTimeTestTasksStillRunning+0x5a>
BaseType_t xReturn = pdPASS;
    80003e6c:	4505                	li	a0,1
	{
		xReturn = pdFAIL;
	}

	if( xSecondaryCycles == xLastSecondaryCycleCount )
    80003e6e:	0001c717          	auipc	a4,0x1c
    80003e72:	60273703          	ld	a4,1538(a4) # 80020470 <xSecondaryCycles>
    80003e76:	0001c797          	auipc	a5,0x1c
    80003e7a:	5da7b783          	ld	a5,1498(a5) # 80020450 <xLastSecondaryCycleCount.0>
    80003e7e:	02f70c63          	beq	a4,a5,80003eb6 <xAreBlockTimeTestTasksStillRunning+0x5e>
	{
		xReturn = pdFAIL;
	}

	if( xErrorOccurred == pdTRUE )
    80003e82:	0001c717          	auipc	a4,0x1c
    80003e86:	5e673703          	ld	a4,1510(a4) # 80020468 <xErrorOccurred>
    80003e8a:	4785                	li	a5,1
    80003e8c:	02f70763          	beq	a4,a5,80003eba <xAreBlockTimeTestTasksStillRunning+0x62>
	{
		xReturn = pdFAIL;
	}

	xLastSecondaryCycleCount = xSecondaryCycles;
    80003e90:	0001c797          	auipc	a5,0x1c
    80003e94:	5e07b783          	ld	a5,1504(a5) # 80020470 <xSecondaryCycles>
    80003e98:	0001c717          	auipc	a4,0x1c
    80003e9c:	5af73c23          	sd	a5,1464(a4) # 80020450 <xLastSecondaryCycleCount.0>
	xLastPrimaryCycleCount = xPrimaryCycles;
    80003ea0:	0001c797          	auipc	a5,0x1c
    80003ea4:	5d87b783          	ld	a5,1496(a5) # 80020478 <xPrimaryCycles>
    80003ea8:	0001c717          	auipc	a4,0x1c
    80003eac:	5af73823          	sd	a5,1456(a4) # 80020458 <xLastPrimaryCycleCount.1>

	return xReturn;
}
    80003eb0:	8082                	ret
		xReturn = pdFAIL;
    80003eb2:	4501                	li	a0,0
    80003eb4:	bf6d                	j	80003e6e <xAreBlockTimeTestTasksStillRunning+0x16>
		xReturn = pdFAIL;
    80003eb6:	4501                	li	a0,0
    80003eb8:	b7e9                	j	80003e82 <xAreBlockTimeTestTasksStillRunning+0x2a>
		xReturn = pdFAIL;
    80003eba:	4501                	li	a0,0
    80003ebc:	bfd1                	j	80003e90 <xAreBlockTimeTestTasksStillRunning+0x38>

0000000080003ebe <prvIncrementSemaphoreCount>:
	}
}
/*-----------------------------------------------------------*/

static void prvIncrementSemaphoreCount( SemaphoreHandle_t xSemaphore, UBaseType_t *puxLoopCounter )
{
    80003ebe:	1101                	addi	sp,sp,-32
    80003ec0:	ec06                	sd	ra,24(sp)
    80003ec2:	e822                	sd	s0,16(sp)
    80003ec4:	e426                	sd	s1,8(sp)
    80003ec6:	e04a                	sd	s2,0(sp)
    80003ec8:	892a                	mv	s2,a0
    80003eca:	84ae                	mv	s1,a1
UBaseType_t ux;

	/* If the semaphore count is zero then we should not be able to	'take' 
	the semaphore. */
	if( xSemaphoreTake( xSemaphore, countDONT_BLOCK ) == pdPASS )
    80003ecc:	4681                	li	a3,0
    80003ece:	4601                	li	a2,0
    80003ed0:	4581                	li	a1,0
    80003ed2:	c8dfc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003ed6:	4785                	li	a5,1
    80003ed8:	00f50463          	beq	a0,a5,80003ee0 <prvIncrementSemaphoreCount+0x22>
{
    80003edc:	4401                	li	s0,0
    80003ede:	a811                	j	80003ef2 <prvIncrementSemaphoreCount+0x34>
	{
		xErrorDetected = pdTRUE;
    80003ee0:	0001c717          	auipc	a4,0x1c
    80003ee4:	5cf73023          	sd	a5,1472(a4) # 800204a0 <xErrorDetected>
    80003ee8:	bfd5                	j	80003edc <prvIncrementSemaphoreCount+0x1e>
		{
			/* We expected to be able to take the semaphore. */
			xErrorDetected = pdTRUE;
		}

		( *puxLoopCounter )++;
    80003eea:	609c                	ld	a5,0(s1)
    80003eec:	0785                	addi	a5,a5,1
    80003eee:	e09c                	sd	a5,0(s1)
	for( ux = 0; ux < countMAX_COUNT_VALUE; ux++ )
    80003ef0:	0405                	addi	s0,s0,1
    80003ef2:	0c700793          	li	a5,199
    80003ef6:	0287e063          	bltu	a5,s0,80003f16 <prvIncrementSemaphoreCount+0x58>
		if( xSemaphoreGive( xSemaphore ) != pdPASS )
    80003efa:	4681                	li	a3,0
    80003efc:	4601                	li	a2,0
    80003efe:	4581                	li	a1,0
    80003f00:	854a                	mv	a0,s2
    80003f02:	949fc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003f06:	4785                	li	a5,1
    80003f08:	fef501e3          	beq	a0,a5,80003eea <prvIncrementSemaphoreCount+0x2c>
			xErrorDetected = pdTRUE;
    80003f0c:	0001c717          	auipc	a4,0x1c
    80003f10:	58f73a23          	sd	a5,1428(a4) # 800204a0 <xErrorDetected>
    80003f14:	bfd9                	j	80003eea <prvIncrementSemaphoreCount+0x2c>
		taskYIELD();
	#endif

	/* If the semaphore count is at its maximum then we should not be able to
	'give' the semaphore. */
	if( xSemaphoreGive( xSemaphore ) == pdPASS )
    80003f16:	4681                	li	a3,0
    80003f18:	4601                	li	a2,0
    80003f1a:	4581                	li	a1,0
    80003f1c:	854a                	mv	a0,s2
    80003f1e:	92dfc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003f22:	4785                	li	a5,1
    80003f24:	00f50863          	beq	a0,a5,80003f34 <prvIncrementSemaphoreCount+0x76>
	{
		xErrorDetected = pdTRUE;
	}
}
    80003f28:	60e2                	ld	ra,24(sp)
    80003f2a:	6442                	ld	s0,16(sp)
    80003f2c:	64a2                	ld	s1,8(sp)
    80003f2e:	6902                	ld	s2,0(sp)
    80003f30:	6105                	addi	sp,sp,32
    80003f32:	8082                	ret
		xErrorDetected = pdTRUE;
    80003f34:	0001c717          	auipc	a4,0x1c
    80003f38:	56f73623          	sd	a5,1388(a4) # 800204a0 <xErrorDetected>
}
    80003f3c:	b7f5                	j	80003f28 <prvIncrementSemaphoreCount+0x6a>

0000000080003f3e <prvDecrementSemaphoreCount>:
{
    80003f3e:	1101                	addi	sp,sp,-32
    80003f40:	ec06                	sd	ra,24(sp)
    80003f42:	e822                	sd	s0,16(sp)
    80003f44:	e426                	sd	s1,8(sp)
    80003f46:	e04a                	sd	s2,0(sp)
    80003f48:	892a                	mv	s2,a0
    80003f4a:	84ae                	mv	s1,a1
	if( xSemaphoreGive( xSemaphore ) == pdPASS )
    80003f4c:	4681                	li	a3,0
    80003f4e:	4601                	li	a2,0
    80003f50:	4581                	li	a1,0
    80003f52:	8f9fc0ef          	jal	ra,8000084a <xQueueGenericSend>
    80003f56:	4785                	li	a5,1
    80003f58:	00f50463          	beq	a0,a5,80003f60 <prvDecrementSemaphoreCount+0x22>
{
    80003f5c:	4401                	li	s0,0
    80003f5e:	a811                	j	80003f72 <prvDecrementSemaphoreCount+0x34>
		xErrorDetected = pdTRUE;
    80003f60:	0001c717          	auipc	a4,0x1c
    80003f64:	54f73023          	sd	a5,1344(a4) # 800204a0 <xErrorDetected>
    80003f68:	bfd5                	j	80003f5c <prvDecrementSemaphoreCount+0x1e>
		( *puxLoopCounter )++;
    80003f6a:	609c                	ld	a5,0(s1)
    80003f6c:	0785                	addi	a5,a5,1
    80003f6e:	e09c                	sd	a5,0(s1)
	for( ux = 0; ux < countMAX_COUNT_VALUE; ux++ )
    80003f70:	0405                	addi	s0,s0,1
    80003f72:	0c700793          	li	a5,199
    80003f76:	0287e063          	bltu	a5,s0,80003f96 <prvDecrementSemaphoreCount+0x58>
		if( xSemaphoreTake( xSemaphore, countDONT_BLOCK ) != pdPASS )
    80003f7a:	4681                	li	a3,0
    80003f7c:	4601                	li	a2,0
    80003f7e:	4581                	li	a1,0
    80003f80:	854a                	mv	a0,s2
    80003f82:	bddfc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003f86:	4785                	li	a5,1
    80003f88:	fef501e3          	beq	a0,a5,80003f6a <prvDecrementSemaphoreCount+0x2c>
			xErrorDetected = pdTRUE;
    80003f8c:	0001c717          	auipc	a4,0x1c
    80003f90:	50f73a23          	sd	a5,1300(a4) # 800204a0 <xErrorDetected>
    80003f94:	bfd9                	j	80003f6a <prvDecrementSemaphoreCount+0x2c>
	if( xSemaphoreTake( xSemaphore, countDONT_BLOCK ) == pdPASS )
    80003f96:	4681                	li	a3,0
    80003f98:	4601                	li	a2,0
    80003f9a:	4581                	li	a1,0
    80003f9c:	854a                	mv	a0,s2
    80003f9e:	bc1fc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003fa2:	4785                	li	a5,1
    80003fa4:	00f50863          	beq	a0,a5,80003fb4 <prvDecrementSemaphoreCount+0x76>
}
    80003fa8:	60e2                	ld	ra,24(sp)
    80003faa:	6442                	ld	s0,16(sp)
    80003fac:	64a2                	ld	s1,8(sp)
    80003fae:	6902                	ld	s2,0(sp)
    80003fb0:	6105                	addi	sp,sp,32
    80003fb2:	8082                	ret
		xErrorDetected = pdTRUE;
    80003fb4:	0001c717          	auipc	a4,0x1c
    80003fb8:	4ef73623          	sd	a5,1260(a4) # 800204a0 <xErrorDetected>
}
    80003fbc:	b7f5                	j	80003fa8 <prvDecrementSemaphoreCount+0x6a>

0000000080003fbe <prvCountingSemaphoreTask>:
/*-----------------------------------------------------------*/

static void prvCountingSemaphoreTask( void *pvParameters )
{
    80003fbe:	1101                	addi	sp,sp,-32
    80003fc0:	ec06                	sd	ra,24(sp)
    80003fc2:	e822                	sd	s0,16(sp)
    80003fc4:	e426                	sd	s1,8(sp)
    80003fc6:	842a                	mv	s0,a0
	/* The semaphore to be used was passed as the parameter. */
	pxParameter = ( xCountSemStruct * ) pvParameters;

	/* Did we expect to find the semaphore already at its max count value, or
	at zero? */
	if( pxParameter->uxExpectedStartCount == countSTART_AT_MAX_COUNT )
    80003fc8:	6518                	ld	a4,8(a0)
    80003fca:	0aa00793          	li	a5,170
    80003fce:	02f70663          	beq	a4,a5,80003ffa <prvCountingSemaphoreTask+0x3c>
		prvDecrementSemaphoreCount( pxParameter->xSemaphore, &( pxParameter->uxLoopCounter ) );
	}

	/* Now we expect the semaphore count to be 0, so this time there is an
	error if we can take the semaphore. */
	if( xSemaphoreTake( pxParameter->xSemaphore, 0 ) == pdPASS )
    80003fd2:	4681                	li	a3,0
    80003fd4:	4601                	li	a2,0
    80003fd6:	4581                	li	a1,0
    80003fd8:	6008                	ld	a0,0(s0)
    80003fda:	b85fc0ef          	jal	ra,80000b5e <xQueueGenericReceive>
    80003fde:	4785                	li	a5,1
    80003fe0:	02f50363          	beq	a0,a5,80004006 <prvCountingSemaphoreTask+0x48>
		xErrorDetected = pdTRUE;
	}

	for( ;; )
	{
		prvIncrementSemaphoreCount( pxParameter->xSemaphore, &( pxParameter->uxLoopCounter ) );
    80003fe4:	01040493          	addi	s1,s0,16
    80003fe8:	85a6                	mv	a1,s1
    80003fea:	6008                	ld	a0,0(s0)
    80003fec:	ed3ff0ef          	jal	ra,80003ebe <prvIncrementSemaphoreCount>
		prvDecrementSemaphoreCount( pxParameter->xSemaphore, &( pxParameter->uxLoopCounter ) );
    80003ff0:	85a6                	mv	a1,s1
    80003ff2:	6008                	ld	a0,0(s0)
    80003ff4:	f4bff0ef          	jal	ra,80003f3e <prvDecrementSemaphoreCount>
	for( ;; )
    80003ff8:	b7f5                	j	80003fe4 <prvCountingSemaphoreTask+0x26>
		prvDecrementSemaphoreCount( pxParameter->xSemaphore, &( pxParameter->uxLoopCounter ) );
    80003ffa:	01050593          	addi	a1,a0,16
    80003ffe:	6108                	ld	a0,0(a0)
    80004000:	f3fff0ef          	jal	ra,80003f3e <prvDecrementSemaphoreCount>
    80004004:	b7f9                	j	80003fd2 <prvCountingSemaphoreTask+0x14>
		xErrorDetected = pdTRUE;
    80004006:	0001c717          	auipc	a4,0x1c
    8000400a:	48f73d23          	sd	a5,1178(a4) # 800204a0 <xErrorDetected>
    8000400e:	bfd9                	j	80003fe4 <prvCountingSemaphoreTask+0x26>

0000000080004010 <vStartCountingSemaphoreTasks>:
{
    80004010:	1141                	addi	sp,sp,-16
    80004012:	e406                	sd	ra,8(sp)
    80004014:	e022                	sd	s0,0(sp)
	xParameters[ 0 ].xSemaphore = xSemaphoreCreateCounting( countMAX_COUNT_VALUE, countMAX_COUNT_VALUE );
    80004016:	0c800593          	li	a1,200
    8000401a:	0c800513          	li	a0,200
    8000401e:	ff6fc0ef          	jal	ra,80000814 <xQueueCreateCountingSemaphore>
    80004022:	00036417          	auipc	s0,0x36
    80004026:	8de40413          	addi	s0,s0,-1826 # 80039900 <xParameters>
    8000402a:	e008                	sd	a0,0(s0)
	xParameters[ 0 ].uxExpectedStartCount = countSTART_AT_MAX_COUNT;
    8000402c:	0aa00793          	li	a5,170
    80004030:	e41c                	sd	a5,8(s0)
	xParameters[ 0 ].uxLoopCounter = 0;
    80004032:	00043823          	sd	zero,16(s0)
	xParameters[ 1 ].xSemaphore = xSemaphoreCreateCounting( countMAX_COUNT_VALUE, 0 );
    80004036:	4581                	li	a1,0
    80004038:	0c800513          	li	a0,200
    8000403c:	fd8fc0ef          	jal	ra,80000814 <xQueueCreateCountingSemaphore>
    80004040:	ec08                	sd	a0,24(s0)
	xParameters[ 1 ].uxExpectedStartCount = 0;
    80004042:	02043023          	sd	zero,32(s0)
	xParameters[ 1 ].uxLoopCounter = 0;
    80004046:	02043423          	sd	zero,40(s0)
	vQueueAddToRegistry( ( QueueHandle_t ) xParameters[ 0 ].xSemaphore, "Counting_Sem_1" );
    8000404a:	6008                	ld	a0,0(s0)
    8000404c:	0001c597          	auipc	a1,0x1c
    80004050:	27458593          	addi	a1,a1,628 # 800202c0 <__rodata_start+0x2c0>
    80004054:	e29fc0ef          	jal	ra,80000e7c <vQueueAddToRegistry>
	vQueueAddToRegistry( ( QueueHandle_t ) xParameters[ 1 ].xSemaphore, "Counting_Sem_2" );
    80004058:	6c08                	ld	a0,24(s0)
    8000405a:	0001c597          	auipc	a1,0x1c
    8000405e:	27658593          	addi	a1,a1,630 # 800202d0 <__rodata_start+0x2d0>
    80004062:	e1bfc0ef          	jal	ra,80000e7c <vQueueAddToRegistry>
	if( ( xParameters[ 0 ].xSemaphore != NULL ) || ( xParameters[ 1 ].xSemaphore != NULL ) )
    80004066:	601c                	ld	a5,0(s0)
    80004068:	cfa9                	beqz	a5,800040c2 <vStartCountingSemaphoreTasks+0xb2>
		xTaskCreate( prvCountingSemaphoreTask, "CNT1", configMINIMAL_STACK_SIZE, ( void * ) &( xParameters[ 0 ] ), tskIDLE_PRIORITY, NULL );
    8000406a:	4881                	li	a7,0
    8000406c:	4801                	li	a6,0
    8000406e:	4781                	li	a5,0
    80004070:	4701                	li	a4,0
    80004072:	00036697          	auipc	a3,0x36
    80004076:	88e68693          	addi	a3,a3,-1906 # 80039900 <xParameters>
    8000407a:	40000613          	li	a2,1024
    8000407e:	0001c597          	auipc	a1,0x1c
    80004082:	26258593          	addi	a1,a1,610 # 800202e0 <__rodata_start+0x2e0>
    80004086:	00000517          	auipc	a0,0x0
    8000408a:	f3850513          	addi	a0,a0,-200 # 80003fbe <prvCountingSemaphoreTask>
    8000408e:	9fdfd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
		xTaskCreate( prvCountingSemaphoreTask, "CNT2", configMINIMAL_STACK_SIZE, ( void * ) &( xParameters[ 1 ] ), tskIDLE_PRIORITY, NULL );		
    80004092:	4881                	li	a7,0
    80004094:	4801                	li	a6,0
    80004096:	4781                	li	a5,0
    80004098:	4701                	li	a4,0
    8000409a:	00036697          	auipc	a3,0x36
    8000409e:	87e68693          	addi	a3,a3,-1922 # 80039918 <xParameters+0x18>
    800040a2:	40000613          	li	a2,1024
    800040a6:	0001c597          	auipc	a1,0x1c
    800040aa:	24258593          	addi	a1,a1,578 # 800202e8 <__rodata_start+0x2e8>
    800040ae:	00000517          	auipc	a0,0x0
    800040b2:	f1050513          	addi	a0,a0,-240 # 80003fbe <prvCountingSemaphoreTask>
    800040b6:	9d5fd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
}
    800040ba:	60a2                	ld	ra,8(sp)
    800040bc:	6402                	ld	s0,0(sp)
    800040be:	0141                	addi	sp,sp,16
    800040c0:	8082                	ret
	if( ( xParameters[ 0 ].xSemaphore != NULL ) || ( xParameters[ 1 ].xSemaphore != NULL ) )
    800040c2:	00036797          	auipc	a5,0x36
    800040c6:	8567b783          	ld	a5,-1962(a5) # 80039918 <xParameters+0x18>
    800040ca:	f3c5                	bnez	a5,8000406a <vStartCountingSemaphoreTasks+0x5a>
    800040cc:	b7fd                	j	800040ba <vStartCountingSemaphoreTasks+0xaa>

00000000800040ce <xAreCountingSemaphoreTasksStillRunning>:
static UBaseType_t uxLastCount0 = 0, uxLastCount1 = 0;
BaseType_t xReturn = pdPASS;

	/* Return fail if any 'give' or 'take' did not result in the expected
	behaviour. */
	if( xErrorDetected != pdFALSE )
    800040ce:	0001c797          	auipc	a5,0x1c
    800040d2:	3d27b783          	ld	a5,978(a5) # 800204a0 <xErrorDetected>
    800040d6:	e7b9                	bnez	a5,80004124 <xAreCountingSemaphoreTasksStillRunning+0x56>
BaseType_t xReturn = pdPASS;
    800040d8:	4505                	li	a0,1
	{
		xReturn = pdFAIL;
	}

	/* Return fail if either task is not still incrementing its loop counter. */
	if( uxLastCount0 == xParameters[ 0 ].uxLoopCounter )
    800040da:	00036717          	auipc	a4,0x36
    800040de:	83673703          	ld	a4,-1994(a4) # 80039910 <xParameters+0x10>
    800040e2:	0001c797          	auipc	a5,0x1c
    800040e6:	3b67b783          	ld	a5,950(a5) # 80020498 <uxLastCount0.1>
    800040ea:	02f70f63          	beq	a4,a5,80004128 <xAreCountingSemaphoreTasksStillRunning+0x5a>
	{
		xReturn = pdFAIL;
	}
	else
	{
		uxLastCount0 = xParameters[ 0 ].uxLoopCounter;
    800040ee:	00036797          	auipc	a5,0x36
    800040f2:	8227b783          	ld	a5,-2014(a5) # 80039910 <xParameters+0x10>
    800040f6:	0001c717          	auipc	a4,0x1c
    800040fa:	3af73123          	sd	a5,930(a4) # 80020498 <uxLastCount0.1>
	}

	if( uxLastCount1 == xParameters[ 1 ].uxLoopCounter )
    800040fe:	00036717          	auipc	a4,0x36
    80004102:	82a73703          	ld	a4,-2006(a4) # 80039928 <xParameters+0x28>
    80004106:	0001c797          	auipc	a5,0x1c
    8000410a:	38a7b783          	ld	a5,906(a5) # 80020490 <uxLastCount1.0>
    8000410e:	00f70f63          	beq	a4,a5,8000412c <xAreCountingSemaphoreTasksStillRunning+0x5e>
	{
		xReturn = pdFAIL;
	}
	else
	{
		uxLastCount1 = xParameters[ 1 ].uxLoopCounter;
    80004112:	00036797          	auipc	a5,0x36
    80004116:	8167b783          	ld	a5,-2026(a5) # 80039928 <xParameters+0x28>
    8000411a:	0001c717          	auipc	a4,0x1c
    8000411e:	36f73b23          	sd	a5,886(a4) # 80020490 <uxLastCount1.0>
    80004122:	8082                	ret
		xReturn = pdFAIL;
    80004124:	4501                	li	a0,0
    80004126:	bf55                	j	800040da <xAreCountingSemaphoreTasksStillRunning+0xc>
		xReturn = pdFAIL;
    80004128:	4501                	li	a0,0
    8000412a:	bfd1                	j	800040fe <xAreCountingSemaphoreTasksStillRunning+0x30>
		xReturn = pdFAIL;
    8000412c:	4501                	li	a0,0
	}

	return xReturn;
}
    8000412e:	8082                	ret

0000000080004130 <prvRecursiveMutexPollingTask>:
	}
}
/*-----------------------------------------------------------*/

static void prvRecursiveMutexPollingTask( void *pvParameters )
{
    80004130:	1141                	addi	sp,sp,-16
    80004132:	e406                	sd	ra,8(sp)
    80004134:	a821                	j	8000414c <prvRecursiveMutexPollingTask+0x1c>
		happen when the controlling task is also suspended. */
		if( xSemaphoreTakeRecursive( xMutex, recmuNO_DELAY ) == pdPASS )
		{
			#if( INCLUDE_eTaskGetState == 1 )
			{
				configASSERT( eTaskGetState( xControllingTaskHandle ) == eSuspended );
    80004136:	30047073          	csrci	mstatus,8
    8000413a:	a001                	j	8000413a <prvRecursiveMutexPollingTask+0xa>
				configASSERT( eTaskGetState( xBlockingTaskHandle ) == eSuspended );
    8000413c:	30047073          	csrci	mstatus,8
    80004140:	a001                	j	80004140 <prvRecursiveMutexPollingTask+0x10>
			#endif /* INCLUDE_eTaskGetState */

			/* Is the blocking task suspended? */
			if( ( xBlockingIsSuspended != pdTRUE ) || ( xControllingIsSuspended != pdTRUE ) )
			{
				xErrorOccurred = pdTRUE;
    80004142:	4785                	li	a5,1
    80004144:	0001c717          	auipc	a4,0x1c
    80004148:	3af73a23          	sd	a5,948(a4) # 800204f8 <xErrorOccurred>
		if( xSemaphoreTakeRecursive( xMutex, recmuNO_DELAY ) == pdPASS )
    8000414c:	4581                	li	a1,0
    8000414e:	0001c517          	auipc	a0,0x1c
    80004152:	3b253503          	ld	a0,946(a0) # 80020500 <xMutex>
    80004156:	b4ffc0ef          	jal	ra,80000ca4 <xQueueTakeMutexRecursive>
    8000415a:	4785                	li	a5,1
    8000415c:	fef518e3          	bne	a0,a5,8000414c <prvRecursiveMutexPollingTask+0x1c>
				configASSERT( eTaskGetState( xControllingTaskHandle ) == eSuspended );
    80004160:	0001c517          	auipc	a0,0x1c
    80004164:	36853503          	ld	a0,872(a0) # 800204c8 <xControllingTaskHandle>
    80004168:	b89fd0ef          	jal	ra,80001cf0 <eTaskGetState>
    8000416c:	2501                	sext.w	a0,a0
    8000416e:	478d                	li	a5,3
    80004170:	fcf513e3          	bne	a0,a5,80004136 <prvRecursiveMutexPollingTask+0x6>
				configASSERT( eTaskGetState( xBlockingTaskHandle ) == eSuspended );
    80004174:	0001c517          	auipc	a0,0x1c
    80004178:	34c53503          	ld	a0,844(a0) # 800204c0 <xBlockingTaskHandle>
    8000417c:	b75fd0ef          	jal	ra,80001cf0 <eTaskGetState>
    80004180:	2501                	sext.w	a0,a0
    80004182:	478d                	li	a5,3
    80004184:	faf51ce3          	bne	a0,a5,8000413c <prvRecursiveMutexPollingTask+0xc>
			if( ( xBlockingIsSuspended != pdTRUE ) || ( xControllingIsSuspended != pdTRUE ) )
    80004188:	0001c717          	auipc	a4,0x1c
    8000418c:	36073703          	ld	a4,864(a4) # 800204e8 <xBlockingIsSuspended>
    80004190:	4785                	li	a5,1
    80004192:	faf718e3          	bne	a4,a5,80004142 <prvRecursiveMutexPollingTask+0x12>
    80004196:	0001c717          	auipc	a4,0x1c
    8000419a:	35a73703          	ld	a4,858(a4) # 800204f0 <xControllingIsSuspended>
    8000419e:	faf712e3          	bne	a4,a5,80004142 <prvRecursiveMutexPollingTask+0x12>
			}
			else
			{
				/* Keep count of the number of cycles this task has performed
				so a stall can be detected. */
				uxPollingCycles++;
    800041a2:	0001c717          	auipc	a4,0x1c
    800041a6:	32e70713          	addi	a4,a4,814 # 800204d0 <uxPollingCycles>
    800041aa:	631c                	ld	a5,0(a4)
    800041ac:	0785                	addi	a5,a5,1
    800041ae:	e31c                	sd	a5,0(a4)
				will then inherit the higher priority.  The Blocking task will
				block indefinitely when it attempts to obtain the mutex, the
				Controlling task will only block for a fixed period and an
				error will be latched if the polling task has not returned the
				mutex by the time this fixed period has expired. */
				vTaskResume( xBlockingTaskHandle );
    800041b0:	0001c517          	auipc	a0,0x1c
    800041b4:	31053503          	ld	a0,784(a0) # 800204c0 <xBlockingTaskHandle>
    800041b8:	d85fd0ef          	jal	ra,80001f3c <vTaskResume>
				#if( configUSE_PREEMPTION == 0 )
					taskYIELD();
				#endif

				vTaskResume( xControllingTaskHandle );
    800041bc:	0001c517          	auipc	a0,0x1c
    800041c0:	30c53503          	ld	a0,780(a0) # 800204c8 <xControllingTaskHandle>
    800041c4:	d79fd0ef          	jal	ra,80001f3c <vTaskResume>
					taskYIELD();
				#endif

				/* The other two tasks should now have executed and no longer
				be suspended. */
				if( ( xBlockingIsSuspended == pdTRUE ) || ( xControllingIsSuspended == pdTRUE ) )
    800041c8:	0001c717          	auipc	a4,0x1c
    800041cc:	32073703          	ld	a4,800(a4) # 800204e8 <xBlockingIsSuspended>
    800041d0:	4785                	li	a5,1
    800041d2:	00f70863          	beq	a4,a5,800041e2 <prvRecursiveMutexPollingTask+0xb2>
    800041d6:	0001c717          	auipc	a4,0x1c
    800041da:	31a73703          	ld	a4,794(a4) # 800204f0 <xControllingIsSuspended>
    800041de:	00f71763          	bne	a4,a5,800041ec <prvRecursiveMutexPollingTask+0xbc>
				{
					xErrorOccurred = pdTRUE;
    800041e2:	4785                	li	a5,1
    800041e4:	0001c717          	auipc	a4,0x1c
    800041e8:	30f73a23          	sd	a5,788(a4) # 800204f8 <xErrorOccurred>
				}

				#if( INCLUDE_uxTaskPriorityGet == 1 )
				{
					/* Check priority inherited. */
					configASSERT( uxTaskPriorityGet( NULL ) == recmuCONTROLLING_TASK_PRIORITY );
    800041ec:	4501                	li	a0,0
    800041ee:	b83fd0ef          	jal	ra,80001d70 <uxTaskPriorityGet>
    800041f2:	4789                	li	a5,2
    800041f4:	04f51d63          	bne	a0,a5,8000424e <prvRecursiveMutexPollingTask+0x11e>
				}
				#endif /* INCLUDE_uxTaskPriorityGet */

				#if( INCLUDE_eTaskGetState == 1 )
				{
					configASSERT( eTaskGetState( xControllingTaskHandle ) == eBlocked );
    800041f8:	0001c517          	auipc	a0,0x1c
    800041fc:	2d053503          	ld	a0,720(a0) # 800204c8 <xControllingTaskHandle>
    80004200:	af1fd0ef          	jal	ra,80001cf0 <eTaskGetState>
    80004204:	0005079b          	sext.w	a5,a0
    80004208:	4709                	li	a4,2
    8000420a:	04e79563          	bne	a5,a4,80004254 <prvRecursiveMutexPollingTask+0x124>
					configASSERT( eTaskGetState( xBlockingTaskHandle ) == eBlocked );
    8000420e:	0001c517          	auipc	a0,0x1c
    80004212:	2b253503          	ld	a0,690(a0) # 800204c0 <xBlockingTaskHandle>
    80004216:	adbfd0ef          	jal	ra,80001cf0 <eTaskGetState>
    8000421a:	0005079b          	sext.w	a5,a0
    8000421e:	4709                	li	a4,2
    80004220:	02e79d63          	bne	a5,a4,8000425a <prvRecursiveMutexPollingTask+0x12a>
				}
				#endif /* INCLUDE_eTaskGetState */

				/* Release the mutex, disinheriting the higher priority again. */
				if( xSemaphoreGiveRecursive( xMutex ) != pdPASS )
    80004224:	0001c517          	auipc	a0,0x1c
    80004228:	2dc53503          	ld	a0,732(a0) # 80020500 <xMutex>
    8000422c:	fb0fc0ef          	jal	ra,800009dc <xQueueGiveMutexRecursive>
    80004230:	4785                	li	a5,1
    80004232:	00f50663          	beq	a0,a5,8000423e <prvRecursiveMutexPollingTask+0x10e>
				{
					xErrorOccurred = pdTRUE;
    80004236:	0001c717          	auipc	a4,0x1c
    8000423a:	2cf73123          	sd	a5,706(a4) # 800204f8 <xErrorOccurred>
				}

				#if( INCLUDE_uxTaskPriorityGet == 1 )
				{
					/* Check priority disinherited. */
					configASSERT( uxTaskPriorityGet( NULL ) == recmuPOLLING_TASK_PRIORITY );
    8000423e:	4501                	li	a0,0
    80004240:	b31fd0ef          	jal	ra,80001d70 <uxTaskPriorityGet>
    80004244:	f00504e3          	beqz	a0,8000414c <prvRecursiveMutexPollingTask+0x1c>
    80004248:	30047073          	csrci	mstatus,8
    8000424c:	a001                	j	8000424c <prvRecursiveMutexPollingTask+0x11c>
					configASSERT( uxTaskPriorityGet( NULL ) == recmuCONTROLLING_TASK_PRIORITY );
    8000424e:	30047073          	csrci	mstatus,8
    80004252:	a001                	j	80004252 <prvRecursiveMutexPollingTask+0x122>
					configASSERT( eTaskGetState( xControllingTaskHandle ) == eBlocked );
    80004254:	30047073          	csrci	mstatus,8
    80004258:	a001                	j	80004258 <prvRecursiveMutexPollingTask+0x128>
					configASSERT( eTaskGetState( xBlockingTaskHandle ) == eBlocked );
    8000425a:	30047073          	csrci	mstatus,8
    8000425e:	a001                	j	8000425e <prvRecursiveMutexPollingTask+0x12e>

0000000080004260 <prvRecursiveMutexBlockingTask>:
{
    80004260:	1141                	addi	sp,sp,-16
    80004262:	e406                	sd	ra,8(sp)
    80004264:	e022                	sd	s0,0(sp)
    80004266:	a08d                	j	800042c8 <prvRecursiveMutexBlockingTask+0x68>
			if( xControllingIsSuspended != pdTRUE )
    80004268:	0001c717          	auipc	a4,0x1c
    8000426c:	28873703          	ld	a4,648(a4) # 800204f0 <xControllingIsSuspended>
    80004270:	00f70763          	beq	a4,a5,8000427e <prvRecursiveMutexBlockingTask+0x1e>
				xErrorOccurred = pdTRUE;
    80004274:	0001c717          	auipc	a4,0x1c
    80004278:	28f73223          	sd	a5,644(a4) # 800204f8 <xErrorOccurred>
    8000427c:	a0ad                	j	800042e6 <prvRecursiveMutexBlockingTask+0x86>
				if( xSemaphoreGiveRecursive( xMutex ) != pdPASS )
    8000427e:	0001c517          	auipc	a0,0x1c
    80004282:	28253503          	ld	a0,642(a0) # 80020500 <xMutex>
    80004286:	f56fc0ef          	jal	ra,800009dc <xQueueGiveMutexRecursive>
    8000428a:	4785                	li	a5,1
    8000428c:	00f50663          	beq	a0,a5,80004298 <prvRecursiveMutexBlockingTask+0x38>
					xErrorOccurred = pdTRUE;
    80004290:	0001c717          	auipc	a4,0x1c
    80004294:	26f73423          	sd	a5,616(a4) # 800204f8 <xErrorOccurred>
				xBlockingIsSuspended = pdTRUE;
    80004298:	0001c417          	auipc	s0,0x1c
    8000429c:	25040413          	addi	s0,s0,592 # 800204e8 <xBlockingIsSuspended>
    800042a0:	4785                	li	a5,1
    800042a2:	e01c                	sd	a5,0(s0)
				vTaskSuspend( NULL );
    800042a4:	4501                	li	a0,0
    800042a6:	be3fd0ef          	jal	ra,80001e88 <vTaskSuspend>
				xBlockingIsSuspended = pdFALSE;
    800042aa:	00043023          	sd	zero,0(s0)
    800042ae:	a825                	j	800042e6 <prvRecursiveMutexBlockingTask+0x86>
			xErrorOccurred = pdTRUE;
    800042b0:	4785                	li	a5,1
    800042b2:	0001c717          	auipc	a4,0x1c
    800042b6:	24f73323          	sd	a5,582(a4) # 800204f8 <xErrorOccurred>
		uxBlockingCycles++;
    800042ba:	0001c717          	auipc	a4,0x1c
    800042be:	21e70713          	addi	a4,a4,542 # 800204d8 <uxBlockingCycles>
    800042c2:	631c                	ld	a5,0(a4)
    800042c4:	0785                	addi	a5,a5,1
    800042c6:	e31c                	sd	a5,0(a4)
		if( xSemaphoreTakeRecursive( xMutex, ( portMAX_DELAY - 1 ) ) == pdPASS )
    800042c8:	55f9                	li	a1,-2
    800042ca:	0001c517          	auipc	a0,0x1c
    800042ce:	23653503          	ld	a0,566(a0) # 80020500 <xMutex>
    800042d2:	9d3fc0ef          	jal	ra,80000ca4 <xQueueTakeMutexRecursive>
    800042d6:	4785                	li	a5,1
    800042d8:	f8f508e3          	beq	a0,a5,80004268 <prvRecursiveMutexBlockingTask+0x8>
			xErrorOccurred = pdTRUE;
    800042dc:	4785                	li	a5,1
    800042de:	0001c717          	auipc	a4,0x1c
    800042e2:	20f73d23          	sd	a5,538(a4) # 800204f8 <xErrorOccurred>
		if( uxControllingCycles != ( uxBlockingCycles + 1 ) )
    800042e6:	0001c797          	auipc	a5,0x1c
    800042ea:	1f27b783          	ld	a5,498(a5) # 800204d8 <uxBlockingCycles>
    800042ee:	0785                	addi	a5,a5,1
    800042f0:	0001c717          	auipc	a4,0x1c
    800042f4:	1f073703          	ld	a4,496(a4) # 800204e0 <uxControllingCycles>
    800042f8:	fae79ce3          	bne	a5,a4,800042b0 <prvRecursiveMutexBlockingTask+0x50>
    800042fc:	bf7d                	j	800042ba <prvRecursiveMutexBlockingTask+0x5a>

00000000800042fe <prvRecursiveMutexControllingTask>:
{
    800042fe:	1141                	addi	sp,sp,-16
    80004300:	e406                	sd	ra,8(sp)
    80004302:	e022                	sd	s0,0(sp)
    80004304:	a055                	j	800043a8 <prvRecursiveMutexControllingTask+0xaa>
			xErrorOccurred = pdTRUE;
    80004306:	0001c717          	auipc	a4,0x1c
    8000430a:	1ef73923          	sd	a5,498(a4) # 800204f8 <xErrorOccurred>
    8000430e:	a075                	j	800043ba <prvRecursiveMutexControllingTask+0xbc>
			vTaskDelay( recmuSHORT_DELAY );
    80004310:	4551                	li	a0,20
    80004312:	e53fd0ef          	jal	ra,80002164 <vTaskDelay>
		for( ux = 0; ux < recmuMAX_COUNT; ux++ )
    80004316:	0405                	addi	s0,s0,1
    80004318:	47a5                	li	a5,9
    8000431a:	0287e163          	bltu	a5,s0,8000433c <prvRecursiveMutexControllingTask+0x3e>
			if( xSemaphoreTakeRecursive( xMutex, recmuEIGHT_TICK_DELAY ) != pdPASS )
    8000431e:	45a1                	li	a1,8
    80004320:	0001c517          	auipc	a0,0x1c
    80004324:	1e053503          	ld	a0,480(a0) # 80020500 <xMutex>
    80004328:	97dfc0ef          	jal	ra,80000ca4 <xQueueTakeMutexRecursive>
    8000432c:	4785                	li	a5,1
    8000432e:	fef501e3          	beq	a0,a5,80004310 <prvRecursiveMutexControllingTask+0x12>
				xErrorOccurred = pdTRUE;
    80004332:	0001c717          	auipc	a4,0x1c
    80004336:	1cf73323          	sd	a5,454(a4) # 800204f8 <xErrorOccurred>
    8000433a:	bfd9                	j	80004310 <prvRecursiveMutexControllingTask+0x12>
		for( ux = 0; ux < recmuMAX_COUNT; ux++ )
    8000433c:	4401                	li	s0,0
    8000433e:	a011                	j	80004342 <prvRecursiveMutexControllingTask+0x44>
    80004340:	0405                	addi	s0,s0,1
    80004342:	47a5                	li	a5,9
    80004344:	0287e363          	bltu	a5,s0,8000436a <prvRecursiveMutexControllingTask+0x6c>
			vTaskDelay( recmuSHORT_DELAY );
    80004348:	4551                	li	a0,20
    8000434a:	e1bfd0ef          	jal	ra,80002164 <vTaskDelay>
			if( xSemaphoreGiveRecursive( xMutex ) != pdPASS )
    8000434e:	0001c517          	auipc	a0,0x1c
    80004352:	1b253503          	ld	a0,434(a0) # 80020500 <xMutex>
    80004356:	e86fc0ef          	jal	ra,800009dc <xQueueGiveMutexRecursive>
    8000435a:	4785                	li	a5,1
    8000435c:	fef502e3          	beq	a0,a5,80004340 <prvRecursiveMutexControllingTask+0x42>
				xErrorOccurred = pdTRUE;
    80004360:	0001c717          	auipc	a4,0x1c
    80004364:	18f73c23          	sd	a5,408(a4) # 800204f8 <xErrorOccurred>
    80004368:	bfe1                	j	80004340 <prvRecursiveMutexControllingTask+0x42>
		if( xSemaphoreGiveRecursive( xMutex ) == pdPASS )
    8000436a:	0001c517          	auipc	a0,0x1c
    8000436e:	19653503          	ld	a0,406(a0) # 80020500 <xMutex>
    80004372:	e6afc0ef          	jal	ra,800009dc <xQueueGiveMutexRecursive>
    80004376:	4785                	li	a5,1
    80004378:	00f51663          	bne	a0,a5,80004384 <prvRecursiveMutexControllingTask+0x86>
			xErrorOccurred = pdTRUE;
    8000437c:	0001c717          	auipc	a4,0x1c
    80004380:	16f73e23          	sd	a5,380(a4) # 800204f8 <xErrorOccurred>
		uxControllingCycles++;
    80004384:	0001c717          	auipc	a4,0x1c
    80004388:	15c70713          	addi	a4,a4,348 # 800204e0 <uxControllingCycles>
    8000438c:	631c                	ld	a5,0(a4)
    8000438e:	0785                	addi	a5,a5,1
    80004390:	e31c                	sd	a5,0(a4)
		xControllingIsSuspended = pdTRUE;
    80004392:	0001c417          	auipc	s0,0x1c
    80004396:	15e40413          	addi	s0,s0,350 # 800204f0 <xControllingIsSuspended>
    8000439a:	4785                	li	a5,1
    8000439c:	e01c                	sd	a5,0(s0)
		vTaskSuspend( NULL );
    8000439e:	4501                	li	a0,0
    800043a0:	ae9fd0ef          	jal	ra,80001e88 <vTaskSuspend>
		xControllingIsSuspended = pdFALSE;
    800043a4:	00043023          	sd	zero,0(s0)
		if( xSemaphoreGiveRecursive( xMutex ) == pdPASS )
    800043a8:	0001c517          	auipc	a0,0x1c
    800043ac:	15853503          	ld	a0,344(a0) # 80020500 <xMutex>
    800043b0:	e2cfc0ef          	jal	ra,800009dc <xQueueGiveMutexRecursive>
    800043b4:	4785                	li	a5,1
    800043b6:	f4f508e3          	beq	a0,a5,80004306 <prvRecursiveMutexControllingTask+0x8>
{
    800043ba:	4401                	li	s0,0
    800043bc:	bfb1                	j	80004318 <prvRecursiveMutexControllingTask+0x1a>

00000000800043be <vStartRecursiveMutexTasks>:
{
    800043be:	1141                	addi	sp,sp,-16
    800043c0:	e406                	sd	ra,8(sp)
    800043c2:	e022                	sd	s0,0(sp)
	xMutex = xSemaphoreCreateRecursiveMutex();
    800043c4:	4511                	li	a0,4
    800043c6:	db2fc0ef          	jal	ra,80000978 <xQueueCreateMutex>
    800043ca:	0001c417          	auipc	s0,0x1c
    800043ce:	13640413          	addi	s0,s0,310 # 80020500 <xMutex>
    800043d2:	e008                	sd	a0,0(s0)
	vQueueAddToRegistry( ( QueueHandle_t ) xMutex, "Recursive_Mutex" );
    800043d4:	0001c597          	auipc	a1,0x1c
    800043d8:	f1c58593          	addi	a1,a1,-228 # 800202f0 <__rodata_start+0x2f0>
    800043dc:	aa1fc0ef          	jal	ra,80000e7c <vQueueAddToRegistry>
	if( xMutex != NULL )
    800043e0:	601c                	ld	a5,0(s0)
    800043e2:	cbb5                	beqz	a5,80004456 <vStartRecursiveMutexTasks+0x98>
		xTaskCreate( prvRecursiveMutexControllingTask, "Rec1", configMINIMAL_STACK_SIZE, NULL, recmuCONTROLLING_TASK_PRIORITY, &xControllingTaskHandle );
    800043e4:	4881                	li	a7,0
    800043e6:	4801                	li	a6,0
    800043e8:	0001c797          	auipc	a5,0x1c
    800043ec:	0e078793          	addi	a5,a5,224 # 800204c8 <xControllingTaskHandle>
    800043f0:	4709                	li	a4,2
    800043f2:	4681                	li	a3,0
    800043f4:	40000613          	li	a2,1024
    800043f8:	0001c597          	auipc	a1,0x1c
    800043fc:	f0858593          	addi	a1,a1,-248 # 80020300 <__rodata_start+0x300>
    80004400:	00000517          	auipc	a0,0x0
    80004404:	efe50513          	addi	a0,a0,-258 # 800042fe <prvRecursiveMutexControllingTask>
    80004408:	e82fd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
        xTaskCreate( prvRecursiveMutexBlockingTask, "Rec2", configMINIMAL_STACK_SIZE, NULL, recmuBLOCKING_TASK_PRIORITY, &xBlockingTaskHandle );
    8000440c:	4881                	li	a7,0
    8000440e:	4801                	li	a6,0
    80004410:	0001c797          	auipc	a5,0x1c
    80004414:	0b078793          	addi	a5,a5,176 # 800204c0 <xBlockingTaskHandle>
    80004418:	4705                	li	a4,1
    8000441a:	4681                	li	a3,0
    8000441c:	40000613          	li	a2,1024
    80004420:	0001c597          	auipc	a1,0x1c
    80004424:	ee858593          	addi	a1,a1,-280 # 80020308 <__rodata_start+0x308>
    80004428:	00000517          	auipc	a0,0x0
    8000442c:	e3850513          	addi	a0,a0,-456 # 80004260 <prvRecursiveMutexBlockingTask>
    80004430:	e5afd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
        xTaskCreate( prvRecursiveMutexPollingTask, "Rec3", configMINIMAL_STACK_SIZE, NULL, recmuPOLLING_TASK_PRIORITY, NULL );
    80004434:	4881                	li	a7,0
    80004436:	4801                	li	a6,0
    80004438:	4781                	li	a5,0
    8000443a:	4701                	li	a4,0
    8000443c:	4681                	li	a3,0
    8000443e:	40000613          	li	a2,1024
    80004442:	0001c597          	auipc	a1,0x1c
    80004446:	ece58593          	addi	a1,a1,-306 # 80020310 <__rodata_start+0x310>
    8000444a:	00000517          	auipc	a0,0x0
    8000444e:	ce650513          	addi	a0,a0,-794 # 80004130 <prvRecursiveMutexPollingTask>
    80004452:	e38fd0ef          	jal	ra,80001a8a <xTaskGenericCreate>
}
    80004456:	60a2                	ld	ra,8(sp)
    80004458:	6402                	ld	s0,0(sp)
    8000445a:	0141                	addi	sp,sp,16
    8000445c:	8082                	ret

000000008000445e <xAreRecursiveMutexTasksStillRunning>:
{
BaseType_t xReturn;
static UBaseType_t uxLastControllingCycles = 0, uxLastBlockingCycles = 0, uxLastPollingCycles = 0;

	/* Is the controlling task still cycling? */
	if( uxLastControllingCycles == uxControllingCycles )
    8000445e:	0001c717          	auipc	a4,0x1c
    80004462:	05a73703          	ld	a4,90(a4) # 800204b8 <uxLastControllingCycles.2>
    80004466:	0001c797          	auipc	a5,0x1c
    8000446a:	07a7b783          	ld	a5,122(a5) # 800204e0 <uxControllingCycles>
    8000446e:	06f70763          	beq	a4,a5,800044dc <xAreRecursiveMutexTasksStillRunning+0x7e>
	{
		xErrorOccurred = pdTRUE;
	}
	else
	{
		uxLastControllingCycles = uxControllingCycles;
    80004472:	0001c797          	auipc	a5,0x1c
    80004476:	06e7b783          	ld	a5,110(a5) # 800204e0 <uxControllingCycles>
    8000447a:	0001c717          	auipc	a4,0x1c
    8000447e:	02f73f23          	sd	a5,62(a4) # 800204b8 <uxLastControllingCycles.2>
	}

	/* Is the blocking task still cycling? */
	if( uxLastBlockingCycles == uxBlockingCycles )
    80004482:	0001c717          	auipc	a4,0x1c
    80004486:	02e73703          	ld	a4,46(a4) # 800204b0 <uxLastBlockingCycles.1>
    8000448a:	0001c797          	auipc	a5,0x1c
    8000448e:	04e7b783          	ld	a5,78(a5) # 800204d8 <uxBlockingCycles>
    80004492:	04f70b63          	beq	a4,a5,800044e8 <xAreRecursiveMutexTasksStillRunning+0x8a>
	{
		xErrorOccurred = pdTRUE;
	}
	else
	{
		uxLastBlockingCycles = uxBlockingCycles;
    80004496:	0001c797          	auipc	a5,0x1c
    8000449a:	0427b783          	ld	a5,66(a5) # 800204d8 <uxBlockingCycles>
    8000449e:	0001c717          	auipc	a4,0x1c
    800044a2:	00f73923          	sd	a5,18(a4) # 800204b0 <uxLastBlockingCycles.1>
	}

	/* Is the polling task still cycling? */
	if( uxLastPollingCycles == uxPollingCycles )
    800044a6:	0001c717          	auipc	a4,0x1c
    800044aa:	00273703          	ld	a4,2(a4) # 800204a8 <uxLastPollingCycles.0>
    800044ae:	0001c797          	auipc	a5,0x1c
    800044b2:	0227b783          	ld	a5,34(a5) # 800204d0 <uxPollingCycles>
    800044b6:	02f70f63          	beq	a4,a5,800044f4 <xAreRecursiveMutexTasksStillRunning+0x96>
	{
		xErrorOccurred = pdTRUE;
	}
	else
	{
		uxLastPollingCycles = uxPollingCycles;
    800044ba:	0001c797          	auipc	a5,0x1c
    800044be:	0167b783          	ld	a5,22(a5) # 800204d0 <uxPollingCycles>
    800044c2:	0001c717          	auipc	a4,0x1c
    800044c6:	fef73323          	sd	a5,-26(a4) # 800204a8 <uxLastPollingCycles.0>
	}

	if( xErrorOccurred == pdTRUE )
    800044ca:	0001c717          	auipc	a4,0x1c
    800044ce:	02e73703          	ld	a4,46(a4) # 800204f8 <xErrorOccurred>
    800044d2:	4785                	li	a5,1
    800044d4:	02f70663          	beq	a4,a5,80004500 <xAreRecursiveMutexTasksStillRunning+0xa2>
	{
		xReturn = pdFAIL;
	}
	else
	{
		xReturn = pdPASS;
    800044d8:	4505                	li	a0,1
	}

	return xReturn;
}
    800044da:	8082                	ret
		xErrorOccurred = pdTRUE;
    800044dc:	4785                	li	a5,1
    800044de:	0001c717          	auipc	a4,0x1c
    800044e2:	00f73d23          	sd	a5,26(a4) # 800204f8 <xErrorOccurred>
    800044e6:	bf71                	j	80004482 <xAreRecursiveMutexTasksStillRunning+0x24>
		xErrorOccurred = pdTRUE;
    800044e8:	4785                	li	a5,1
    800044ea:	0001c717          	auipc	a4,0x1c
    800044ee:	00f73723          	sd	a5,14(a4) # 800204f8 <xErrorOccurred>
    800044f2:	bf55                	j	800044a6 <xAreRecursiveMutexTasksStillRunning+0x48>
		xErrorOccurred = pdTRUE;
    800044f4:	4785                	li	a5,1
    800044f6:	0001c717          	auipc	a4,0x1c
    800044fa:	00f73123          	sd	a5,2(a4) # 800204f8 <xErrorOccurred>
    800044fe:	b7f1                	j	800044ca <xAreRecursiveMutexTasksStillRunning+0x6c>
		xReturn = pdFAIL;
    80004500:	4501                	li	a0,0
    80004502:	8082                	ret

0000000080004504 <strnlen>:
    80004504:	00b506b3          	add	a3,a0,a1
    80004508:	87aa                	mv	a5,a0
    8000450a:	e589                	bnez	a1,80004514 <strnlen+0x10>
    8000450c:	a829                	j	80004526 <strnlen+0x22>
    8000450e:	0785                	addi	a5,a5,1
    80004510:	00f68863          	beq	a3,a5,80004520 <strnlen+0x1c>
    80004514:	0007c703          	lbu	a4,0(a5)
    80004518:	fb7d                	bnez	a4,8000450e <strnlen+0xa>
    8000451a:	40a78533          	sub	a0,a5,a0
    8000451e:	8082                	ret
    80004520:	40a68533          	sub	a0,a3,a0
    80004524:	8082                	ret
    80004526:	4501                	li	a0,0
    80004528:	8082                	ret
