
riscv-spike.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <boot>:
    80000000:	6f89                	lui	t6,0x2
    80000002:	800f8f9b          	addiw	t6,t6,-2048
    80000006:	300f9073          	csrw	mstatus,t6
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
    80000040:	00000297          	auipc	t0,0x0
    80000044:	0cc28293          	addi	t0,t0,204 # 8000010c <trap_entry>
    80000048:	30529073          	csrw	mtvec,t0
    8000004c:	4081                	li	ra,0
    8000004e:	4101                	li	sp,0
    80000050:	4181                	li	gp,0
    80000052:	4201                	li	tp,0
    80000054:	4281                	li	t0,0
    80000056:	4301                	li	t1,0
    80000058:	4381                	li	t2,0
    8000005a:	4401                	li	s0,0
    8000005c:	4481                	li	s1,0
    8000005e:	4501                	li	a0,0
    80000060:	4581                	li	a1,0
    80000062:	4601                	li	a2,0
    80000064:	4681                	li	a3,0
    80000066:	4701                	li	a4,0
    80000068:	4781                	li	a5,0
    8000006a:	4801                	li	a6,0
    8000006c:	4881                	li	a7,0
    8000006e:	4901                	li	s2,0
    80000070:	4981                	li	s3,0
    80000072:	4a01                	li	s4,0
    80000074:	4a81                	li	s5,0
    80000076:	4b01                	li	s6,0
    80000078:	4b81                	li	s7,0
    8000007a:	4c01                	li	s8,0
    8000007c:	4c81                	li	s9,0
    8000007e:	4d01                	li	s10,0
    80000080:	4d81                	li	s11,0
    80000082:	4e01                	li	t3,0
    80000084:	4e81                	li	t4,0
    80000086:	4f01                	li	t5,0
    80000088:	4f81                	li	t6,0
    8000008a:	00021197          	auipc	gp,0x21
    8000008e:	b3e18193          	addi	gp,gp,-1218 # 80020bc8 <_gp>

0000000080000092 <init_bss>:
    80000092:	00020517          	auipc	a0,0x20
    80000096:	36e50513          	addi	a0,a0,878 # 80020400 <xStartContext>
    8000009a:	0003a597          	auipc	a1,0x3a
    8000009e:	91258593          	addi	a1,a1,-1774 # 800399ac <uxLastPollingCycles.0+0x4>
    800000a2:	4601                	li	a2,0
    800000a4:	10e000ef          	jal	ra,800001b2 <fill_block>

00000000800000a8 <init_sbss>:
    800000a8:	00020517          	auipc	a0,0x20
    800000ac:	29850513          	addi	a0,a0,664 # 80020340 <pxCurrentTCB>
    800000b0:	00020597          	auipc	a1,0x20
    800000b4:	31458593          	addi	a1,a1,788 # 800203c4 <fromhost+0x4>
    800000b8:	4601                	li	a2,0
    800000ba:	0f8000ef          	jal	ra,800001b2 <fill_block>

00000000800000be <write_stack_pattern>:
    800000be:	0003b517          	auipc	a0,0x3b
    800000c2:	8f250513          	addi	a0,a0,-1806 # 8003a9b0 <_heap_end>
    800000c6:	0003c597          	auipc	a1,0x3c
    800000ca:	8e658593          	addi	a1,a1,-1818 # 8003b9ac <_heap_end+0xffc>
    800000ce:	000ac637          	lui	a2,0xac
    800000d2:	abb6061b          	addiw	a2,a2,-1349
    800000d6:	0632                	slli	a2,a2,0xc
    800000d8:	bab60613          	addi	a2,a2,-1109 # abbab <_HEAP_SIZE+0xaabab>
    800000dc:	0d6000ef          	jal	ra,800001b2 <fill_block>

00000000800000e0 <init_stack>:
    800000e0:	0003c117          	auipc	sp,0x3c
    800000e4:	8d010113          	addi	sp,sp,-1840 # 8003b9b0 <__stack>
    800000e8:	65a0406f          	j	80004742 <vSyscallInit>

00000000800000ec <interrupt>:
    800000ec:	0286                	slli	t0,t0,0x1
    800000ee:	0012d293          	srli	t0,t0,0x1
    800000f2:	12f5                	addi	t0,t0,-3
    800000f4:	00028863          	beqz	t0,80000104 <softwareInterrupt>
    800000f8:	6282                	ld	t0,0(sp)
    800000fa:	0121                	addi	sp,sp,8
    800000fc:	0f80006f          	j	800001f4 <TIMER_CMP_INT>
    80000100:	30200073          	mret

0000000080000104 <softwareInterrupt>:
    80000104:	6282                	ld	t0,0(sp)
    80000106:	0121                	addi	sp,sp,8
    80000108:	30200073          	mret

000000008000010c <trap_entry>:
    8000010c:	1161                	addi	sp,sp,-8
    8000010e:	e016                	sd	t0,0(sp)
    80000110:	342022f3          	csrr	t0,mcause
    80000114:	fc02cce3          	bltz	t0,800000ec <interrupt>
    80000118:	6282                	ld	t0,0(sp)
    8000011a:	0121                	addi	sp,sp,8
    8000011c:	7111                	addi	sp,sp,-256
    8000011e:	e406                	sd	ra,8(sp)
    80000120:	e80a                	sd	sp,16(sp)
    80000122:	ec0e                	sd	gp,24(sp)
    80000124:	f012                	sd	tp,32(sp)
    80000126:	f416                	sd	t0,40(sp)
    80000128:	f81a                	sd	t1,48(sp)
    8000012a:	fc1e                	sd	t2,56(sp)
    8000012c:	e0a2                	sd	s0,64(sp)
    8000012e:	e4a6                	sd	s1,72(sp)
    80000130:	e8aa                	sd	a0,80(sp)
    80000132:	ecae                	sd	a1,88(sp)
    80000134:	f0b2                	sd	a2,96(sp)
    80000136:	f4b6                	sd	a3,104(sp)
    80000138:	f8ba                	sd	a4,112(sp)
    8000013a:	fcbe                	sd	a5,120(sp)
    8000013c:	e142                	sd	a6,128(sp)
    8000013e:	e546                	sd	a7,136(sp)
    80000140:	e94a                	sd	s2,144(sp)
    80000142:	ed4e                	sd	s3,152(sp)
    80000144:	f152                	sd	s4,160(sp)
    80000146:	f556                	sd	s5,168(sp)
    80000148:	f95a                	sd	s6,176(sp)
    8000014a:	fd5e                	sd	s7,184(sp)
    8000014c:	e1e2                	sd	s8,192(sp)
    8000014e:	e5e6                	sd	s9,200(sp)
    80000150:	e9ea                	sd	s10,208(sp)
    80000152:	edee                	sd	s11,216(sp)
    80000154:	f1f2                	sd	t3,224(sp)
    80000156:	f5f6                	sd	t4,232(sp)
    80000158:	f9fa                	sd	t5,240(sp)
    8000015a:	fdfe                	sd	t6,248(sp)
    8000015c:	34202573          	csrr	a0,mcause
    80000160:	341025f3          	csrr	a1,mepc
    80000164:	860a                	mv	a2,sp
    80000166:	5fc040ef          	jal	ra,80004762 <ulSyscallTrap>
    8000016a:	34151073          	csrw	mepc,a0
    8000016e:	60a2                	ld	ra,8(sp)
    80000170:	6142                	ld	sp,16(sp)
    80000172:	61e2                	ld	gp,24(sp)
    80000174:	7202                	ld	tp,32(sp)
    80000176:	72a2                	ld	t0,40(sp)
    80000178:	7342                	ld	t1,48(sp)
    8000017a:	73e2                	ld	t2,56(sp)
    8000017c:	6406                	ld	s0,64(sp)
    8000017e:	64a6                	ld	s1,72(sp)
    80000180:	6546                	ld	a0,80(sp)
    80000182:	65e6                	ld	a1,88(sp)
    80000184:	7606                	ld	a2,96(sp)
    80000186:	76a6                	ld	a3,104(sp)
    80000188:	7746                	ld	a4,112(sp)
    8000018a:	77e6                	ld	a5,120(sp)
    8000018c:	680a                	ld	a6,128(sp)
    8000018e:	68aa                	ld	a7,136(sp)
    80000190:	694a                	ld	s2,144(sp)
    80000192:	69ea                	ld	s3,152(sp)
    80000194:	7a0a                	ld	s4,160(sp)
    80000196:	7aaa                	ld	s5,168(sp)
    80000198:	7b4a                	ld	s6,176(sp)
    8000019a:	7bea                	ld	s7,184(sp)
    8000019c:	6c0e                	ld	s8,192(sp)
    8000019e:	6cae                	ld	s9,200(sp)
    800001a0:	6d4e                	ld	s10,208(sp)
    800001a2:	6dee                	ld	s11,216(sp)
    800001a4:	7e0e                	ld	t3,224(sp)
    800001a6:	7eae                	ld	t4,232(sp)
    800001a8:	7f4e                	ld	t5,240(sp)
    800001aa:	7fee                	ld	t6,248(sp)
    800001ac:	6111                	addi	sp,sp,256
    800001ae:	30200073          	mret

00000000800001b2 <fill_block>:
    800001b2:	c110                	sw	a2,0(a0)
    800001b4:	00b57463          	bgeu	a0,a1,800001bc <fb_end>
    800001b8:	0511                	addi	a0,a0,4
    800001ba:	bfe5                	j	800001b2 <fill_block>

00000000800001bc <fb_end>:
    800001bc:	8082                	ret
	...

00000000800001f4 <TIMER_CMP_INT>:
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
    80000238:	10c2b283          	ld	t0,268(t0) # 80020340 <pxCurrentTCB>
    8000023c:	0022b023          	sd	sp,0(t0)
    80000240:	341022f3          	csrr	t0,mepc
    80000244:	fd96                	sd	t0,248(sp)
    80000246:	354000ef          	jal	ra,8000059a <vPortSysTickHandler>
    8000024a:	00020117          	auipc	sp,0x20
    8000024e:	0f613103          	ld	sp,246(sp) # 80020340 <pxCurrentTCB>
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
    800002a4:	00020297          	auipc	t0,0x20
    800002a8:	15c28293          	addi	t0,t0,348 # 80020400 <xStartContext>
    800002ac:	0012b023          	sd	ra,0(t0)
    800002b0:	0022b423          	sd	sp,8(t0)
    800002b4:	0032b823          	sd	gp,16(t0)
    800002b8:	0042bc23          	sd	tp,24(t0)
    800002bc:	0252b023          	sd	t0,32(t0)
    800002c0:	0262b423          	sd	t1,40(t0)
    800002c4:	0272b823          	sd	t2,48(t0)
    800002c8:	0282bc23          	sd	s0,56(t0)
    800002cc:	0492b023          	sd	s1,64(t0)
    800002d0:	04a2b423          	sd	a0,72(t0)
    800002d4:	04b2b823          	sd	a1,80(t0)
    800002d8:	04c2bc23          	sd	a2,88(t0)
    800002dc:	06d2b023          	sd	a3,96(t0)
    800002e0:	06e2b423          	sd	a4,104(t0)
    800002e4:	06f2b823          	sd	a5,112(t0)
    800002e8:	0702bc23          	sd	a6,120(t0)
    800002ec:	0912b023          	sd	a7,128(t0)
    800002f0:	0922b423          	sd	s2,136(t0)
    800002f4:	0932b823          	sd	s3,144(t0)
    800002f8:	0942bc23          	sd	s4,152(t0)
    800002fc:	0b52b023          	sd	s5,160(t0)
    80000300:	0b62b423          	sd	s6,168(t0)
    80000304:	0b72b823          	sd	s7,176(t0)
    80000308:	0b82bc23          	sd	s8,184(t0)
    8000030c:	0d92b023          	sd	s9,192(t0)
    80000310:	0da2b423          	sd	s10,200(t0)
    80000314:	0db2b823          	sd	s11,208(t0)
    80000318:	0dc2bc23          	sd	t3,216(t0)
    8000031c:	0fd2b023          	sd	t4,224(t0)
    80000320:	0fe2b423          	sd	t5,232(t0)
    80000324:	0ff2b823          	sd	t6,240(t0)
    80000328:	1cc000ef          	jal	ra,800004f4 <vPortSetupTimer>
    8000032c:	00020117          	auipc	sp,0x20
    80000330:	01413103          	ld	sp,20(sp) # 80020340 <pxCurrentTCB>
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
    80000386:	00020297          	auipc	t0,0x20
    8000038a:	07a28293          	addi	t0,t0,122 # 80020400 <xStartContext>
    8000038e:	0002b083          	ld	ra,0(t0)
    80000392:	0082b103          	ld	sp,8(t0)
    80000396:	0102b183          	ld	gp,16(t0)
    8000039a:	0182b203          	ld	tp,24(t0)
    8000039e:	0202b283          	ld	t0,32(t0)
    800003a2:	0282b303          	ld	t1,40(t0)
    800003a6:	0302b383          	ld	t2,48(t0)
    800003aa:	0382b403          	ld	s0,56(t0)
    800003ae:	0402b483          	ld	s1,64(t0)
    800003b2:	0482b503          	ld	a0,72(t0)
    800003b6:	0502b583          	ld	a1,80(t0)
    800003ba:	0582b603          	ld	a2,88(t0)
    800003be:	0602b683          	ld	a3,96(t0)
    800003c2:	0682b703          	ld	a4,104(t0)
    800003c6:	0702b783          	ld	a5,112(t0)
    800003ca:	0782b803          	ld	a6,120(t0)
    800003ce:	0802b883          	ld	a7,128(t0)
    800003d2:	0882b903          	ld	s2,136(t0)
    800003d6:	0902b983          	ld	s3,144(t0)
    800003da:	0982ba03          	ld	s4,152(t0)
    800003de:	0a02ba83          	ld	s5,160(t0)
    800003e2:	0a82bb03          	ld	s6,168(t0)
    800003e6:	0b02bb83          	ld	s7,176(t0)
    800003ea:	0b82bc03          	ld	s8,184(t0)
    800003ee:	0c02bc83          	ld	s9,192(t0)
    800003f2:	0c82bd03          	ld	s10,200(t0)
    800003f6:	0d02bd83          	ld	s11,208(t0)
    800003fa:	0d82be03          	ld	t3,216(t0)
    800003fe:	0e02be83          	ld	t4,224(t0)
    80000402:	1382bf03          	ld	t5,312(t0)
    80000406:	0f02bf83          	ld	t6,240(t0)
    8000040a:	8082                	ret

000000008000040c <vPortYield>:
    8000040c:	30047073          	csrci	mstatus,8
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
    80000454:	ef02b283          	ld	t0,-272(t0) # 80020340 <pxCurrentTCB>
    80000458:	0022b023          	sd	sp,0(t0)
    8000045c:	fd86                	sd	ra,248(sp)
    8000045e:	533010ef          	jal	ra,80002190 <vTaskSwitchContext>
    80000462:	00020117          	auipc	sp,0x20
    80000466:	ede13103          	ld	sp,-290(sp) # 80020340 <pxCurrentTCB>
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
    800004bc:	00020797          	auipc	a5,0x20
    800004c0:	f1c78793          	addi	a5,a5,-228 # 800203d8 <mtime>
    800004c4:	639c                	ld	a5,0(a5)
    800004c6:	c78d                	beqz	a5,800004f0 <prvSetNextTimerInterrupt+0x34>
    800004c8:	00020797          	auipc	a5,0x20
    800004cc:	f1878793          	addi	a5,a5,-232 # 800203e0 <timecmp>
    800004d0:	639c                	ld	a5,0(a5)
    800004d2:	cf99                	beqz	a5,800004f0 <prvSetNextTimerInterrupt+0x34>
    800004d4:	00020797          	auipc	a5,0x20
    800004d8:	f0478793          	addi	a5,a5,-252 # 800203d8 <mtime>
    800004dc:	639c                	ld	a5,0(a5)
    800004de:	6398                	ld	a4,0(a5)
    800004e0:	00020797          	auipc	a5,0x20
    800004e4:	f0078793          	addi	a5,a5,-256 # 800203e0 <timecmp>
    800004e8:	639c                	ld	a5,0(a5)
    800004ea:	3e870713          	addi	a4,a4,1000
    800004ee:	e398                	sd	a4,0(a5)
    800004f0:	0001                	nop
    800004f2:	8082                	ret

00000000800004f4 <vPortSetupTimer>:
    800004f4:	1141                	addi	sp,sp,-16
    800004f6:	e406                	sd	ra,8(sp)
    800004f8:	fc5ff0ef          	jal	ra,800004bc <prvSetNextTimerInterrupt>
    800004fc:	08000793          	li	a5,128
    80000500:	3047a073          	csrs	mie,a5
    80000504:	0001                	nop
    80000506:	60a2                	ld	ra,8(sp)
    80000508:	0141                	addi	sp,sp,16
    8000050a:	8082                	ret

000000008000050c <prvTaskExitError>:
    8000050c:	00020797          	auipc	a5,0x20
    80000510:	ec478793          	addi	a5,a5,-316 # 800203d0 <uxCriticalNesting>
    80000514:	6398                	ld	a4,0(a5)
    80000516:	57fd                	li	a5,-1
    80000518:	00f70563          	beq	a4,a5,80000522 <prvTaskExitError+0x16>
    8000051c:	30047073          	csrci	mstatus,8
    80000520:	a001                	j	80000520 <prvTaskExitError+0x14>
    80000522:	30047073          	csrci	mstatus,8
    80000526:	a001                	j	80000526 <prvTaskExitError+0x1a>

0000000080000528 <vPortClearInterruptMask>:
    80000528:	1141                	addi	sp,sp,-16
    8000052a:	87aa                	mv	a5,a0
    8000052c:	c63e                	sw	a5,12(sp)
    8000052e:	47b2                	lw	a5,12(sp)
    80000530:	30479073          	csrw	mie,a5
    80000534:	0001                	nop
    80000536:	0141                	addi	sp,sp,16
    80000538:	8082                	ret

000000008000053a <vPortSetInterruptMask>:
    8000053a:	1141                	addi	sp,sp,-16
    8000053c:	304027f3          	csrr	a5,mie
    80000540:	c63e                	sw	a5,12(sp)
    80000542:	3043f073          	csrci	mie,7
    80000546:	47b2                	lw	a5,12(sp)
    80000548:	853e                	mv	a0,a5
    8000054a:	0141                	addi	sp,sp,16
    8000054c:	8082                	ret

000000008000054e <pxPortInitialiseStack>:
    8000054e:	1101                	addi	sp,sp,-32
    80000550:	ec2a                	sd	a0,24(sp)
    80000552:	e82e                	sd	a1,16(sp)
    80000554:	e432                	sd	a2,8(sp)
    80000556:	67e2                	ld	a5,24(sp)
    80000558:	17e1                	addi	a5,a5,-8
    8000055a:	ec3e                	sd	a5,24(sp)
    8000055c:	6742                	ld	a4,16(sp)
    8000055e:	67e2                	ld	a5,24(sp)
    80000560:	e398                	sd	a4,0(a5)
    80000562:	67e2                	ld	a5,24(sp)
    80000564:	f5078793          	addi	a5,a5,-176
    80000568:	ec3e                	sd	a5,24(sp)
    8000056a:	6722                	ld	a4,8(sp)
    8000056c:	67e2                	ld	a5,24(sp)
    8000056e:	e398                	sd	a4,0(a5)
    80000570:	67e2                	ld	a5,24(sp)
    80000572:	fd078793          	addi	a5,a5,-48
    80000576:	ec3e                	sd	a5,24(sp)
    80000578:	878e                	mv	a5,gp
    8000057a:	873e                	mv	a4,a5
    8000057c:	67e2                	ld	a5,24(sp)
    8000057e:	e398                	sd	a4,0(a5)
    80000580:	67e2                	ld	a5,24(sp)
    80000582:	17a1                	addi	a5,a5,-24
    80000584:	ec3e                	sd	a5,24(sp)
    80000586:	00000717          	auipc	a4,0x0
    8000058a:	f8670713          	addi	a4,a4,-122 # 8000050c <prvTaskExitError>
    8000058e:	67e2                	ld	a5,24(sp)
    80000590:	e398                	sd	a4,0(a5)
    80000592:	67e2                	ld	a5,24(sp)
    80000594:	853e                	mv	a0,a5
    80000596:	6105                	addi	sp,sp,32
    80000598:	8082                	ret

000000008000059a <vPortSysTickHandler>:
    8000059a:	1141                	addi	sp,sp,-16
    8000059c:	e406                	sd	ra,8(sp)
    8000059e:	f1fff0ef          	jal	ra,800004bc <prvSetNextTimerInterrupt>
    800005a2:	20f010ef          	jal	ra,80001fb0 <xTaskIncrementTick>
    800005a6:	87aa                	mv	a5,a0
    800005a8:	c399                	beqz	a5,800005ae <vPortSysTickHandler+0x14>
    800005aa:	3e7010ef          	jal	ra,80002190 <vTaskSwitchContext>
    800005ae:	0001                	nop
    800005b0:	60a2                	ld	ra,8(sp)
    800005b2:	0141                	addi	sp,sp,16
    800005b4:	8082                	ret

00000000800005b6 <vListInitialise>:
    800005b6:	1141                	addi	sp,sp,-16
    800005b8:	e42a                	sd	a0,8(sp)
    800005ba:	67a2                	ld	a5,8(sp)
    800005bc:	01078713          	addi	a4,a5,16
    800005c0:	67a2                	ld	a5,8(sp)
    800005c2:	e798                	sd	a4,8(a5)
    800005c4:	67a2                	ld	a5,8(sp)
    800005c6:	577d                	li	a4,-1
    800005c8:	cb98                	sw	a4,16(a5)
    800005ca:	67a2                	ld	a5,8(sp)
    800005cc:	01078713          	addi	a4,a5,16
    800005d0:	67a2                	ld	a5,8(sp)
    800005d2:	ef98                	sd	a4,24(a5)
    800005d4:	67a2                	ld	a5,8(sp)
    800005d6:	01078713          	addi	a4,a5,16
    800005da:	67a2                	ld	a5,8(sp)
    800005dc:	f398                	sd	a4,32(a5)
    800005de:	67a2                	ld	a5,8(sp)
    800005e0:	0007b023          	sd	zero,0(a5)
    800005e4:	0001                	nop
    800005e6:	0141                	addi	sp,sp,16
    800005e8:	8082                	ret

00000000800005ea <vListInitialiseItem>:
    800005ea:	1141                	addi	sp,sp,-16
    800005ec:	e42a                	sd	a0,8(sp)
    800005ee:	67a2                	ld	a5,8(sp)
    800005f0:	0207b023          	sd	zero,32(a5)
    800005f4:	0001                	nop
    800005f6:	0141                	addi	sp,sp,16
    800005f8:	8082                	ret

00000000800005fa <vListInsertEnd>:
    800005fa:	1101                	addi	sp,sp,-32
    800005fc:	e42a                	sd	a0,8(sp)
    800005fe:	e02e                	sd	a1,0(sp)
    80000600:	67a2                	ld	a5,8(sp)
    80000602:	679c                	ld	a5,8(a5)
    80000604:	ec3e                	sd	a5,24(sp)
    80000606:	6782                	ld	a5,0(sp)
    80000608:	6762                	ld	a4,24(sp)
    8000060a:	e798                	sd	a4,8(a5)
    8000060c:	67e2                	ld	a5,24(sp)
    8000060e:	6b98                	ld	a4,16(a5)
    80000610:	6782                	ld	a5,0(sp)
    80000612:	eb98                	sd	a4,16(a5)
    80000614:	67e2                	ld	a5,24(sp)
    80000616:	6b9c                	ld	a5,16(a5)
    80000618:	6702                	ld	a4,0(sp)
    8000061a:	e798                	sd	a4,8(a5)
    8000061c:	67e2                	ld	a5,24(sp)
    8000061e:	6702                	ld	a4,0(sp)
    80000620:	eb98                	sd	a4,16(a5)
    80000622:	6782                	ld	a5,0(sp)
    80000624:	6722                	ld	a4,8(sp)
    80000626:	f398                	sd	a4,32(a5)
    80000628:	67a2                	ld	a5,8(sp)
    8000062a:	639c                	ld	a5,0(a5)
    8000062c:	00178713          	addi	a4,a5,1
    80000630:	67a2                	ld	a5,8(sp)
    80000632:	e398                	sd	a4,0(a5)
    80000634:	0001                	nop
    80000636:	6105                	addi	sp,sp,32
    80000638:	8082                	ret

000000008000063a <vListInsert>:
    8000063a:	1101                	addi	sp,sp,-32
    8000063c:	e42a                	sd	a0,8(sp)
    8000063e:	e02e                	sd	a1,0(sp)
    80000640:	6782                	ld	a5,0(sp)
    80000642:	439c                	lw	a5,0(a5)
    80000644:	ca3e                	sw	a5,20(sp)
    80000646:	47d2                	lw	a5,20(sp)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	57fd                	li	a5,-1
    8000064e:	00f71663          	bne	a4,a5,8000065a <vListInsert+0x20>
    80000652:	67a2                	ld	a5,8(sp)
    80000654:	739c                	ld	a5,32(a5)
    80000656:	ec3e                	sd	a5,24(sp)
    80000658:	a839                	j	80000676 <vListInsert+0x3c>
    8000065a:	67a2                	ld	a5,8(sp)
    8000065c:	07c1                	addi	a5,a5,16
    8000065e:	ec3e                	sd	a5,24(sp)
    80000660:	a021                	j	80000668 <vListInsert+0x2e>
    80000662:	67e2                	ld	a5,24(sp)
    80000664:	679c                	ld	a5,8(a5)
    80000666:	ec3e                	sd	a5,24(sp)
    80000668:	67e2                	ld	a5,24(sp)
    8000066a:	679c                	ld	a5,8(a5)
    8000066c:	4398                	lw	a4,0(a5)
    8000066e:	47d2                	lw	a5,20(sp)
    80000670:	2781                	sext.w	a5,a5
    80000672:	fee7f8e3          	bgeu	a5,a4,80000662 <vListInsert+0x28>
    80000676:	67e2                	ld	a5,24(sp)
    80000678:	6798                	ld	a4,8(a5)
    8000067a:	6782                	ld	a5,0(sp)
    8000067c:	e798                	sd	a4,8(a5)
    8000067e:	6782                	ld	a5,0(sp)
    80000680:	679c                	ld	a5,8(a5)
    80000682:	6702                	ld	a4,0(sp)
    80000684:	eb98                	sd	a4,16(a5)
    80000686:	6782                	ld	a5,0(sp)
    80000688:	6762                	ld	a4,24(sp)
    8000068a:	eb98                	sd	a4,16(a5)
    8000068c:	67e2                	ld	a5,24(sp)
    8000068e:	6702                	ld	a4,0(sp)
    80000690:	e798                	sd	a4,8(a5)
    80000692:	6782                	ld	a5,0(sp)
    80000694:	6722                	ld	a4,8(sp)
    80000696:	f398                	sd	a4,32(a5)
    80000698:	67a2                	ld	a5,8(sp)
    8000069a:	639c                	ld	a5,0(a5)
    8000069c:	00178713          	addi	a4,a5,1
    800006a0:	67a2                	ld	a5,8(sp)
    800006a2:	e398                	sd	a4,0(a5)
    800006a4:	0001                	nop
    800006a6:	6105                	addi	sp,sp,32
    800006a8:	8082                	ret

00000000800006aa <uxListRemove>:
    800006aa:	1101                	addi	sp,sp,-32
    800006ac:	e42a                	sd	a0,8(sp)
    800006ae:	67a2                	ld	a5,8(sp)
    800006b0:	739c                	ld	a5,32(a5)
    800006b2:	ec3e                	sd	a5,24(sp)
    800006b4:	67a2                	ld	a5,8(sp)
    800006b6:	679c                	ld	a5,8(a5)
    800006b8:	6722                	ld	a4,8(sp)
    800006ba:	6b18                	ld	a4,16(a4)
    800006bc:	eb98                	sd	a4,16(a5)
    800006be:	67a2                	ld	a5,8(sp)
    800006c0:	6b9c                	ld	a5,16(a5)
    800006c2:	6722                	ld	a4,8(sp)
    800006c4:	6718                	ld	a4,8(a4)
    800006c6:	e798                	sd	a4,8(a5)
    800006c8:	67e2                	ld	a5,24(sp)
    800006ca:	679c                	ld	a5,8(a5)
    800006cc:	6722                	ld	a4,8(sp)
    800006ce:	00f71663          	bne	a4,a5,800006da <uxListRemove+0x30>
    800006d2:	67a2                	ld	a5,8(sp)
    800006d4:	6b98                	ld	a4,16(a5)
    800006d6:	67e2                	ld	a5,24(sp)
    800006d8:	e798                	sd	a4,8(a5)
    800006da:	67a2                	ld	a5,8(sp)
    800006dc:	0207b023          	sd	zero,32(a5)
    800006e0:	67e2                	ld	a5,24(sp)
    800006e2:	639c                	ld	a5,0(a5)
    800006e4:	fff78713          	addi	a4,a5,-1
    800006e8:	67e2                	ld	a5,24(sp)
    800006ea:	e398                	sd	a4,0(a5)
    800006ec:	67e2                	ld	a5,24(sp)
    800006ee:	639c                	ld	a5,0(a5)
    800006f0:	853e                	mv	a0,a5
    800006f2:	6105                	addi	sp,sp,32
    800006f4:	8082                	ret

00000000800006f6 <xQueueGenericReset>:
    800006f6:	7179                	addi	sp,sp,-48
    800006f8:	f406                	sd	ra,40(sp)
    800006fa:	e42a                	sd	a0,8(sp)
    800006fc:	e02e                	sd	a1,0(sp)
    800006fe:	67a2                	ld	a5,8(sp)
    80000700:	ec3e                	sd	a5,24(sp)
    80000702:	67e2                	ld	a5,24(sp)
    80000704:	e781                	bnez	a5,8000070c <xQueueGenericReset+0x16>
    80000706:	30047073          	csrci	mstatus,8
    8000070a:	a001                	j	8000070a <xQueueGenericReset+0x14>
    8000070c:	726020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000710:	67e2                	ld	a5,24(sp)
    80000712:	6398                	ld	a4,0(a5)
    80000714:	67e2                	ld	a5,24(sp)
    80000716:	7fb4                	ld	a3,120(a5)
    80000718:	67e2                	ld	a5,24(sp)
    8000071a:	63dc                	ld	a5,128(a5)
    8000071c:	02f687b3          	mul	a5,a3,a5
    80000720:	973e                	add	a4,a4,a5
    80000722:	67e2                	ld	a5,24(sp)
    80000724:	e798                	sd	a4,8(a5)
    80000726:	67e2                	ld	a5,24(sp)
    80000728:	0607b823          	sd	zero,112(a5)
    8000072c:	67e2                	ld	a5,24(sp)
    8000072e:	6398                	ld	a4,0(a5)
    80000730:	67e2                	ld	a5,24(sp)
    80000732:	eb98                	sd	a4,16(a5)
    80000734:	67e2                	ld	a5,24(sp)
    80000736:	6398                	ld	a4,0(a5)
    80000738:	67e2                	ld	a5,24(sp)
    8000073a:	7fbc                	ld	a5,120(a5)
    8000073c:	fff78693          	addi	a3,a5,-1
    80000740:	67e2                	ld	a5,24(sp)
    80000742:	63dc                	ld	a5,128(a5)
    80000744:	02f687b3          	mul	a5,a3,a5
    80000748:	973e                	add	a4,a4,a5
    8000074a:	67e2                	ld	a5,24(sp)
    8000074c:	ef98                	sd	a4,24(a5)
    8000074e:	67e2                	ld	a5,24(sp)
    80000750:	577d                	li	a4,-1
    80000752:	e7d8                	sd	a4,136(a5)
    80000754:	67e2                	ld	a5,24(sp)
    80000756:	577d                	li	a4,-1
    80000758:	ebd8                	sd	a4,144(a5)
    8000075a:	6782                	ld	a5,0(sp)
    8000075c:	e38d                	bnez	a5,8000077e <xQueueGenericReset+0x88>
    8000075e:	67e2                	ld	a5,24(sp)
    80000760:	739c                	ld	a5,32(a5)
    80000762:	cb95                	beqz	a5,80000796 <xQueueGenericReset+0xa0>
    80000764:	67e2                	ld	a5,24(sp)
    80000766:	02078793          	addi	a5,a5,32
    8000076a:	853e                	mv	a0,a5
    8000076c:	51f010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000770:	872a                	mv	a4,a0
    80000772:	4785                	li	a5,1
    80000774:	02f71163          	bne	a4,a5,80000796 <xQueueGenericReset+0xa0>
    80000778:	c95ff0ef          	jal	ra,8000040c <vPortYield>
    8000077c:	a829                	j	80000796 <xQueueGenericReset+0xa0>
    8000077e:	67e2                	ld	a5,24(sp)
    80000780:	02078793          	addi	a5,a5,32
    80000784:	853e                	mv	a0,a5
    80000786:	e31ff0ef          	jal	ra,800005b6 <vListInitialise>
    8000078a:	67e2                	ld	a5,24(sp)
    8000078c:	04878793          	addi	a5,a5,72
    80000790:	853e                	mv	a0,a5
    80000792:	e25ff0ef          	jal	ra,800005b6 <vListInitialise>
    80000796:	6ca020ef          	jal	ra,80002e60 <vTaskExitCritical>
    8000079a:	4785                	li	a5,1
    8000079c:	853e                	mv	a0,a5
    8000079e:	70a2                	ld	ra,40(sp)
    800007a0:	6145                	addi	sp,sp,48
    800007a2:	8082                	ret

00000000800007a4 <xQueueGenericCreate>:
    800007a4:	715d                	addi	sp,sp,-80
    800007a6:	e486                	sd	ra,72(sp)
    800007a8:	ec2a                	sd	a0,24(sp)
    800007aa:	e82e                	sd	a1,16(sp)
    800007ac:	87b2                	mv	a5,a2
    800007ae:	00f107a3          	sb	a5,15(sp)
    800007b2:	f802                	sd	zero,48(sp)
    800007b4:	67e2                	ld	a5,24(sp)
    800007b6:	e781                	bnez	a5,800007be <xQueueGenericCreate+0x1a>
    800007b8:	30047073          	csrci	mstatus,8
    800007bc:	a001                	j	800007bc <xQueueGenericCreate+0x18>
    800007be:	67c2                	ld	a5,16(sp)
    800007c0:	e399                	bnez	a5,800007c6 <xQueueGenericCreate+0x22>
    800007c2:	fc02                	sd	zero,56(sp)
    800007c4:	a039                	j	800007d2 <xQueueGenericCreate+0x2e>
    800007c6:	6762                	ld	a4,24(sp)
    800007c8:	67c2                	ld	a5,16(sp)
    800007ca:	02f707b3          	mul	a5,a4,a5
    800007ce:	0785                	addi	a5,a5,1
    800007d0:	fc3e                	sd	a5,56(sp)
    800007d2:	77e2                	ld	a5,56(sp)
    800007d4:	0a878793          	addi	a5,a5,168
    800007d8:	853e                	mv	a0,a5
    800007da:	1eb030ef          	jal	ra,800041c4 <pvPortMalloc>
    800007de:	f42a                	sd	a0,40(sp)
    800007e0:	77a2                	ld	a5,40(sp)
    800007e2:	cf8d                	beqz	a5,8000081c <xQueueGenericCreate+0x78>
    800007e4:	67c2                	ld	a5,16(sp)
    800007e6:	e789                	bnez	a5,800007f0 <xQueueGenericCreate+0x4c>
    800007e8:	77a2                	ld	a5,40(sp)
    800007ea:	7722                	ld	a4,40(sp)
    800007ec:	e398                	sd	a4,0(a5)
    800007ee:	a031                	j	800007fa <xQueueGenericCreate+0x56>
    800007f0:	77a2                	ld	a5,40(sp)
    800007f2:	0a878713          	addi	a4,a5,168
    800007f6:	77a2                	ld	a5,40(sp)
    800007f8:	e398                	sd	a4,0(a5)
    800007fa:	77a2                	ld	a5,40(sp)
    800007fc:	6762                	ld	a4,24(sp)
    800007fe:	ffb8                	sd	a4,120(a5)
    80000800:	77a2                	ld	a5,40(sp)
    80000802:	6742                	ld	a4,16(sp)
    80000804:	e3d8                	sd	a4,128(a5)
    80000806:	4585                	li	a1,1
    80000808:	7522                	ld	a0,40(sp)
    8000080a:	eedff0ef          	jal	ra,800006f6 <xQueueGenericReset>
    8000080e:	77a2                	ld	a5,40(sp)
    80000810:	00f14703          	lbu	a4,15(sp)
    80000814:	0ae78023          	sb	a4,160(a5)
    80000818:	77a2                	ld	a5,40(sp)
    8000081a:	f83e                	sd	a5,48(sp)
    8000081c:	77c2                	ld	a5,48(sp)
    8000081e:	e781                	bnez	a5,80000826 <xQueueGenericCreate+0x82>
    80000820:	30047073          	csrci	mstatus,8
    80000824:	a001                	j	80000824 <xQueueGenericCreate+0x80>
    80000826:	77c2                	ld	a5,48(sp)
    80000828:	853e                	mv	a0,a5
    8000082a:	60a6                	ld	ra,72(sp)
    8000082c:	6161                	addi	sp,sp,80
    8000082e:	8082                	ret

0000000080000830 <xQueueCreateMutex>:
    80000830:	7179                	addi	sp,sp,-48
    80000832:	f406                	sd	ra,40(sp)
    80000834:	87aa                	mv	a5,a0
    80000836:	00f107a3          	sb	a5,15(sp)
    8000083a:	0a800513          	li	a0,168
    8000083e:	187030ef          	jal	ra,800041c4 <pvPortMalloc>
    80000842:	ec2a                	sd	a0,24(sp)
    80000844:	67e2                	ld	a5,24(sp)
    80000846:	c3bd                	beqz	a5,800008ac <xQueueCreateMutex+0x7c>
    80000848:	67e2                	ld	a5,24(sp)
    8000084a:	0007b423          	sd	zero,8(a5)
    8000084e:	67e2                	ld	a5,24(sp)
    80000850:	0007b023          	sd	zero,0(a5)
    80000854:	67e2                	ld	a5,24(sp)
    80000856:	0007b823          	sd	zero,16(a5)
    8000085a:	67e2                	ld	a5,24(sp)
    8000085c:	0007bc23          	sd	zero,24(a5)
    80000860:	67e2                	ld	a5,24(sp)
    80000862:	0607b823          	sd	zero,112(a5)
    80000866:	67e2                	ld	a5,24(sp)
    80000868:	4705                	li	a4,1
    8000086a:	ffb8                	sd	a4,120(a5)
    8000086c:	67e2                	ld	a5,24(sp)
    8000086e:	0807b023          	sd	zero,128(a5)
    80000872:	67e2                	ld	a5,24(sp)
    80000874:	577d                	li	a4,-1
    80000876:	e7d8                	sd	a4,136(a5)
    80000878:	67e2                	ld	a5,24(sp)
    8000087a:	577d                	li	a4,-1
    8000087c:	ebd8                	sd	a4,144(a5)
    8000087e:	67e2                	ld	a5,24(sp)
    80000880:	00f14703          	lbu	a4,15(sp)
    80000884:	0ae78023          	sb	a4,160(a5)
    80000888:	67e2                	ld	a5,24(sp)
    8000088a:	02078793          	addi	a5,a5,32
    8000088e:	853e                	mv	a0,a5
    80000890:	d27ff0ef          	jal	ra,800005b6 <vListInitialise>
    80000894:	67e2                	ld	a5,24(sp)
    80000896:	04878793          	addi	a5,a5,72
    8000089a:	853e                	mv	a0,a5
    8000089c:	d1bff0ef          	jal	ra,800005b6 <vListInitialise>
    800008a0:	4681                	li	a3,0
    800008a2:	4601                	li	a2,0
    800008a4:	4581                	li	a1,0
    800008a6:	6562                	ld	a0,24(sp)
    800008a8:	118000ef          	jal	ra,800009c0 <xQueueGenericSend>
    800008ac:	67e2                	ld	a5,24(sp)
    800008ae:	853e                	mv	a0,a5
    800008b0:	70a2                	ld	ra,40(sp)
    800008b2:	6145                	addi	sp,sp,48
    800008b4:	8082                	ret

00000000800008b6 <xQueueGiveMutexRecursive>:
    800008b6:	7179                	addi	sp,sp,-48
    800008b8:	f406                	sd	ra,40(sp)
    800008ba:	f022                	sd	s0,32(sp)
    800008bc:	e42a                	sd	a0,8(sp)
    800008be:	67a2                	ld	a5,8(sp)
    800008c0:	e83e                	sd	a5,16(sp)
    800008c2:	67c2                	ld	a5,16(sp)
    800008c4:	e781                	bnez	a5,800008cc <xQueueGiveMutexRecursive+0x16>
    800008c6:	30047073          	csrci	mstatus,8
    800008ca:	a001                	j	800008ca <xQueueGiveMutexRecursive+0x14>
    800008cc:	67c2                	ld	a5,16(sp)
    800008ce:	6780                	ld	s0,8(a5)
    800008d0:	372020ef          	jal	ra,80002c42 <xTaskGetCurrentTaskHandle>
    800008d4:	87aa                	mv	a5,a0
    800008d6:	02f41463          	bne	s0,a5,800008fe <xQueueGiveMutexRecursive+0x48>
    800008da:	67c2                	ld	a5,16(sp)
    800008dc:	6f9c                	ld	a5,24(a5)
    800008de:	fff78713          	addi	a4,a5,-1
    800008e2:	67c2                	ld	a5,16(sp)
    800008e4:	ef98                	sd	a4,24(a5)
    800008e6:	67c2                	ld	a5,16(sp)
    800008e8:	6f9c                	ld	a5,24(a5)
    800008ea:	e799                	bnez	a5,800008f8 <xQueueGiveMutexRecursive+0x42>
    800008ec:	4681                	li	a3,0
    800008ee:	4601                	li	a2,0
    800008f0:	4581                	li	a1,0
    800008f2:	6542                	ld	a0,16(sp)
    800008f4:	0cc000ef          	jal	ra,800009c0 <xQueueGenericSend>
    800008f8:	4785                	li	a5,1
    800008fa:	ec3e                	sd	a5,24(sp)
    800008fc:	a011                	j	80000900 <xQueueGiveMutexRecursive+0x4a>
    800008fe:	ec02                	sd	zero,24(sp)
    80000900:	67e2                	ld	a5,24(sp)
    80000902:	853e                	mv	a0,a5
    80000904:	70a2                	ld	ra,40(sp)
    80000906:	7402                	ld	s0,32(sp)
    80000908:	6145                	addi	sp,sp,48
    8000090a:	8082                	ret

000000008000090c <xQueueTakeMutexRecursive>:
    8000090c:	7179                	addi	sp,sp,-48
    8000090e:	f406                	sd	ra,40(sp)
    80000910:	f022                	sd	s0,32(sp)
    80000912:	e42a                	sd	a0,8(sp)
    80000914:	87ae                	mv	a5,a1
    80000916:	c23e                	sw	a5,4(sp)
    80000918:	67a2                	ld	a5,8(sp)
    8000091a:	e83e                	sd	a5,16(sp)
    8000091c:	67c2                	ld	a5,16(sp)
    8000091e:	e781                	bnez	a5,80000926 <xQueueTakeMutexRecursive+0x1a>
    80000920:	30047073          	csrci	mstatus,8
    80000924:	a001                	j	80000924 <xQueueTakeMutexRecursive+0x18>
    80000926:	67c2                	ld	a5,16(sp)
    80000928:	6780                	ld	s0,8(a5)
    8000092a:	318020ef          	jal	ra,80002c42 <xTaskGetCurrentTaskHandle>
    8000092e:	87aa                	mv	a5,a0
    80000930:	00f41b63          	bne	s0,a5,80000946 <xQueueTakeMutexRecursive+0x3a>
    80000934:	67c2                	ld	a5,16(sp)
    80000936:	6f9c                	ld	a5,24(a5)
    80000938:	00178713          	addi	a4,a5,1
    8000093c:	67c2                	ld	a5,16(sp)
    8000093e:	ef98                	sd	a4,24(a5)
    80000940:	4785                	li	a5,1
    80000942:	ec3e                	sd	a5,24(sp)
    80000944:	a01d                	j	8000096a <xQueueTakeMutexRecursive+0x5e>
    80000946:	4792                	lw	a5,4(sp)
    80000948:	4681                	li	a3,0
    8000094a:	863e                	mv	a2,a5
    8000094c:	4581                	li	a1,0
    8000094e:	6542                	ld	a0,16(sp)
    80000950:	35c000ef          	jal	ra,80000cac <xQueueGenericReceive>
    80000954:	ec2a                	sd	a0,24(sp)
    80000956:	6762                	ld	a4,24(sp)
    80000958:	4785                	li	a5,1
    8000095a:	00f71863          	bne	a4,a5,8000096a <xQueueTakeMutexRecursive+0x5e>
    8000095e:	67c2                	ld	a5,16(sp)
    80000960:	6f9c                	ld	a5,24(a5)
    80000962:	00178713          	addi	a4,a5,1
    80000966:	67c2                	ld	a5,16(sp)
    80000968:	ef98                	sd	a4,24(a5)
    8000096a:	67e2                	ld	a5,24(sp)
    8000096c:	853e                	mv	a0,a5
    8000096e:	70a2                	ld	ra,40(sp)
    80000970:	7402                	ld	s0,32(sp)
    80000972:	6145                	addi	sp,sp,48
    80000974:	8082                	ret

0000000080000976 <xQueueCreateCountingSemaphore>:
    80000976:	7179                	addi	sp,sp,-48
    80000978:	f406                	sd	ra,40(sp)
    8000097a:	e42a                	sd	a0,8(sp)
    8000097c:	e02e                	sd	a1,0(sp)
    8000097e:	67a2                	ld	a5,8(sp)
    80000980:	e781                	bnez	a5,80000988 <xQueueCreateCountingSemaphore+0x12>
    80000982:	30047073          	csrci	mstatus,8
    80000986:	a001                	j	80000986 <xQueueCreateCountingSemaphore+0x10>
    80000988:	6702                	ld	a4,0(sp)
    8000098a:	67a2                	ld	a5,8(sp)
    8000098c:	00e7f563          	bgeu	a5,a4,80000996 <xQueueCreateCountingSemaphore+0x20>
    80000990:	30047073          	csrci	mstatus,8
    80000994:	a001                	j	80000994 <xQueueCreateCountingSemaphore+0x1e>
    80000996:	4609                	li	a2,2
    80000998:	4581                	li	a1,0
    8000099a:	6522                	ld	a0,8(sp)
    8000099c:	e09ff0ef          	jal	ra,800007a4 <xQueueGenericCreate>
    800009a0:	ec2a                	sd	a0,24(sp)
    800009a2:	67e2                	ld	a5,24(sp)
    800009a4:	c781                	beqz	a5,800009ac <xQueueCreateCountingSemaphore+0x36>
    800009a6:	67e2                	ld	a5,24(sp)
    800009a8:	6702                	ld	a4,0(sp)
    800009aa:	fbb8                	sd	a4,112(a5)
    800009ac:	67e2                	ld	a5,24(sp)
    800009ae:	e781                	bnez	a5,800009b6 <xQueueCreateCountingSemaphore+0x40>
    800009b0:	30047073          	csrci	mstatus,8
    800009b4:	a001                	j	800009b4 <xQueueCreateCountingSemaphore+0x3e>
    800009b6:	67e2                	ld	a5,24(sp)
    800009b8:	853e                	mv	a0,a5
    800009ba:	70a2                	ld	ra,40(sp)
    800009bc:	6145                	addi	sp,sp,48
    800009be:	8082                	ret

00000000800009c0 <xQueueGenericSend>:
    800009c0:	711d                	addi	sp,sp,-96
    800009c2:	ec86                	sd	ra,88(sp)
    800009c4:	ec2a                	sd	a0,24(sp)
    800009c6:	e82e                	sd	a1,16(sp)
    800009c8:	87b2                	mv	a5,a2
    800009ca:	e036                	sd	a3,0(sp)
    800009cc:	c63e                	sw	a5,12(sp)
    800009ce:	e482                	sd	zero,72(sp)
    800009d0:	67e2                	ld	a5,24(sp)
    800009d2:	e0be                	sd	a5,64(sp)
    800009d4:	6786                	ld	a5,64(sp)
    800009d6:	e781                	bnez	a5,800009de <xQueueGenericSend+0x1e>
    800009d8:	30047073          	csrci	mstatus,8
    800009dc:	a001                	j	800009dc <xQueueGenericSend+0x1c>
    800009de:	67c2                	ld	a5,16(sp)
    800009e0:	e781                	bnez	a5,800009e8 <xQueueGenericSend+0x28>
    800009e2:	6786                	ld	a5,64(sp)
    800009e4:	63dc                	ld	a5,128(a5)
    800009e6:	e399                	bnez	a5,800009ec <xQueueGenericSend+0x2c>
    800009e8:	4785                	li	a5,1
    800009ea:	a011                	j	800009ee <xQueueGenericSend+0x2e>
    800009ec:	4781                	li	a5,0
    800009ee:	e781                	bnez	a5,800009f6 <xQueueGenericSend+0x36>
    800009f0:	30047073          	csrci	mstatus,8
    800009f4:	a001                	j	800009f4 <xQueueGenericSend+0x34>
    800009f6:	6702                	ld	a4,0(sp)
    800009f8:	4789                	li	a5,2
    800009fa:	00f71763          	bne	a4,a5,80000a08 <xQueueGenericSend+0x48>
    800009fe:	6786                	ld	a5,64(sp)
    80000a00:	7fb8                	ld	a4,120(a5)
    80000a02:	4785                	li	a5,1
    80000a04:	00f71463          	bne	a4,a5,80000a0c <xQueueGenericSend+0x4c>
    80000a08:	4785                	li	a5,1
    80000a0a:	a011                	j	80000a0e <xQueueGenericSend+0x4e>
    80000a0c:	4781                	li	a5,0
    80000a0e:	e781                	bnez	a5,80000a16 <xQueueGenericSend+0x56>
    80000a10:	30047073          	csrci	mstatus,8
    80000a14:	a001                	j	80000a14 <xQueueGenericSend+0x54>
    80000a16:	242020ef          	jal	ra,80002c58 <xTaskGetSchedulerState>
    80000a1a:	87aa                	mv	a5,a0
    80000a1c:	e399                	bnez	a5,80000a22 <xQueueGenericSend+0x62>
    80000a1e:	47b2                	lw	a5,12(sp)
    80000a20:	e399                	bnez	a5,80000a26 <xQueueGenericSend+0x66>
    80000a22:	4785                	li	a5,1
    80000a24:	a011                	j	80000a28 <xQueueGenericSend+0x68>
    80000a26:	4781                	li	a5,0
    80000a28:	e781                	bnez	a5,80000a30 <xQueueGenericSend+0x70>
    80000a2a:	30047073          	csrci	mstatus,8
    80000a2e:	a001                	j	80000a2e <xQueueGenericSend+0x6e>
    80000a30:	402020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000a34:	6786                	ld	a5,64(sp)
    80000a36:	7bb8                	ld	a4,112(a5)
    80000a38:	6786                	ld	a5,64(sp)
    80000a3a:	7fbc                	ld	a5,120(a5)
    80000a3c:	00f76663          	bltu	a4,a5,80000a48 <xQueueGenericSend+0x88>
    80000a40:	6702                	ld	a4,0(sp)
    80000a42:	4789                	li	a5,2
    80000a44:	04f71063          	bne	a4,a5,80000a84 <xQueueGenericSend+0xc4>
    80000a48:	6602                	ld	a2,0(sp)
    80000a4a:	65c2                	ld	a1,16(sp)
    80000a4c:	6506                	ld	a0,64(sp)
    80000a4e:	5e0000ef          	jal	ra,8000102e <prvCopyDataToQueue>
    80000a52:	fc2a                	sd	a0,56(sp)
    80000a54:	6786                	ld	a5,64(sp)
    80000a56:	67bc                	ld	a5,72(a5)
    80000a58:	cf91                	beqz	a5,80000a74 <xQueueGenericSend+0xb4>
    80000a5a:	6786                	ld	a5,64(sp)
    80000a5c:	04878793          	addi	a5,a5,72
    80000a60:	853e                	mv	a0,a5
    80000a62:	229010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000a66:	872a                	mv	a4,a0
    80000a68:	4785                	li	a5,1
    80000a6a:	00f71963          	bne	a4,a5,80000a7c <xQueueGenericSend+0xbc>
    80000a6e:	99fff0ef          	jal	ra,8000040c <vPortYield>
    80000a72:	a029                	j	80000a7c <xQueueGenericSend+0xbc>
    80000a74:	77e2                	ld	a5,56(sp)
    80000a76:	c399                	beqz	a5,80000a7c <xQueueGenericSend+0xbc>
    80000a78:	995ff0ef          	jal	ra,8000040c <vPortYield>
    80000a7c:	3e4020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000a80:	4785                	li	a5,1
    80000a82:	a05d                	j	80000b28 <xQueueGenericSend+0x168>
    80000a84:	47b2                	lw	a5,12(sp)
    80000a86:	e789                	bnez	a5,80000a90 <xQueueGenericSend+0xd0>
    80000a88:	3d8020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000a8c:	4781                	li	a5,0
    80000a8e:	a869                	j	80000b28 <xQueueGenericSend+0x168>
    80000a90:	67a6                	ld	a5,72(sp)
    80000a92:	e799                	bnez	a5,80000aa0 <xQueueGenericSend+0xe0>
    80000a94:	103c                	addi	a5,sp,40
    80000a96:	853e                	mv	a0,a5
    80000a98:	379010ef          	jal	ra,80002610 <vTaskSetTimeOutState>
    80000a9c:	4785                	li	a5,1
    80000a9e:	e4be                	sd	a5,72(sp)
    80000aa0:	3c0020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000aa4:	21e010ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80000aa8:	38a020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000aac:	6786                	ld	a5,64(sp)
    80000aae:	67d8                	ld	a4,136(a5)
    80000ab0:	57fd                	li	a5,-1
    80000ab2:	00f71563          	bne	a4,a5,80000abc <xQueueGenericSend+0xfc>
    80000ab6:	6786                	ld	a5,64(sp)
    80000ab8:	0807b423          	sd	zero,136(a5)
    80000abc:	6786                	ld	a5,64(sp)
    80000abe:	6bd8                	ld	a4,144(a5)
    80000ac0:	57fd                	li	a5,-1
    80000ac2:	00f71563          	bne	a4,a5,80000acc <xQueueGenericSend+0x10c>
    80000ac6:	6786                	ld	a5,64(sp)
    80000ac8:	0807b823          	sd	zero,144(a5)
    80000acc:	394020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000ad0:	0078                	addi	a4,sp,12
    80000ad2:	103c                	addi	a5,sp,40
    80000ad4:	85ba                	mv	a1,a4
    80000ad6:	853e                	mv	a0,a5
    80000ad8:	36d010ef          	jal	ra,80002644 <xTaskCheckForTimeOut>
    80000adc:	87aa                	mv	a5,a0
    80000ade:	ef9d                	bnez	a5,80000b1c <xQueueGenericSend+0x15c>
    80000ae0:	6506                	ld	a0,64(sp)
    80000ae2:	74a000ef          	jal	ra,8000122c <prvIsQueueFull>
    80000ae6:	87aa                	mv	a5,a0
    80000ae8:	c785                	beqz	a5,80000b10 <xQueueGenericSend+0x150>
    80000aea:	6786                	ld	a5,64(sp)
    80000aec:	02078793          	addi	a5,a5,32
    80000af0:	4732                	lw	a4,12(sp)
    80000af2:	85ba                	mv	a1,a4
    80000af4:	853e                	mv	a0,a5
    80000af6:	7d4010ef          	jal	ra,800022ca <vTaskPlaceOnEventList>
    80000afa:	6506                	ld	a0,64(sp)
    80000afc:	654000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000b00:	1de010ef          	jal	ra,80001cde <xTaskResumeAll>
    80000b04:	87aa                	mv	a5,a0
    80000b06:	f20795e3          	bnez	a5,80000a30 <xQueueGenericSend+0x70>
    80000b0a:	903ff0ef          	jal	ra,8000040c <vPortYield>
    80000b0e:	b70d                	j	80000a30 <xQueueGenericSend+0x70>
    80000b10:	6506                	ld	a0,64(sp)
    80000b12:	63e000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000b16:	1c8010ef          	jal	ra,80001cde <xTaskResumeAll>
    80000b1a:	bf19                	j	80000a30 <xQueueGenericSend+0x70>
    80000b1c:	6506                	ld	a0,64(sp)
    80000b1e:	632000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000b22:	1bc010ef          	jal	ra,80001cde <xTaskResumeAll>
    80000b26:	4781                	li	a5,0
    80000b28:	853e                	mv	a0,a5
    80000b2a:	60e6                	ld	ra,88(sp)
    80000b2c:	6125                	addi	sp,sp,96
    80000b2e:	8082                	ret

0000000080000b30 <xQueueGenericSendFromISR>:
    80000b30:	715d                	addi	sp,sp,-80
    80000b32:	e486                	sd	ra,72(sp)
    80000b34:	ec2a                	sd	a0,24(sp)
    80000b36:	e82e                	sd	a1,16(sp)
    80000b38:	e432                	sd	a2,8(sp)
    80000b3a:	e036                	sd	a3,0(sp)
    80000b3c:	67e2                	ld	a5,24(sp)
    80000b3e:	f83e                	sd	a5,48(sp)
    80000b40:	77c2                	ld	a5,48(sp)
    80000b42:	e781                	bnez	a5,80000b4a <xQueueGenericSendFromISR+0x1a>
    80000b44:	30047073          	csrci	mstatus,8
    80000b48:	a001                	j	80000b48 <xQueueGenericSendFromISR+0x18>
    80000b4a:	67c2                	ld	a5,16(sp)
    80000b4c:	e781                	bnez	a5,80000b54 <xQueueGenericSendFromISR+0x24>
    80000b4e:	77c2                	ld	a5,48(sp)
    80000b50:	63dc                	ld	a5,128(a5)
    80000b52:	e399                	bnez	a5,80000b58 <xQueueGenericSendFromISR+0x28>
    80000b54:	4785                	li	a5,1
    80000b56:	a011                	j	80000b5a <xQueueGenericSendFromISR+0x2a>
    80000b58:	4781                	li	a5,0
    80000b5a:	e781                	bnez	a5,80000b62 <xQueueGenericSendFromISR+0x32>
    80000b5c:	30047073          	csrci	mstatus,8
    80000b60:	a001                	j	80000b60 <xQueueGenericSendFromISR+0x30>
    80000b62:	6702                	ld	a4,0(sp)
    80000b64:	4789                	li	a5,2
    80000b66:	00f71763          	bne	a4,a5,80000b74 <xQueueGenericSendFromISR+0x44>
    80000b6a:	77c2                	ld	a5,48(sp)
    80000b6c:	7fb8                	ld	a4,120(a5)
    80000b6e:	4785                	li	a5,1
    80000b70:	00f71463          	bne	a4,a5,80000b78 <xQueueGenericSendFromISR+0x48>
    80000b74:	4785                	li	a5,1
    80000b76:	a011                	j	80000b7a <xQueueGenericSendFromISR+0x4a>
    80000b78:	4781                	li	a5,0
    80000b7a:	e781                	bnez	a5,80000b82 <xQueueGenericSendFromISR+0x52>
    80000b7c:	30047073          	csrci	mstatus,8
    80000b80:	a001                	j	80000b80 <xQueueGenericSendFromISR+0x50>
    80000b82:	9b9ff0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80000b86:	87aa                	mv	a5,a0
    80000b88:	f43e                	sd	a5,40(sp)
    80000b8a:	77c2                	ld	a5,48(sp)
    80000b8c:	7bb8                	ld	a4,112(a5)
    80000b8e:	77c2                	ld	a5,48(sp)
    80000b90:	7fbc                	ld	a5,120(a5)
    80000b92:	00f76663          	bltu	a4,a5,80000b9e <xQueueGenericSendFromISR+0x6e>
    80000b96:	6702                	ld	a4,0(sp)
    80000b98:	4789                	li	a5,2
    80000b9a:	04f71663          	bne	a4,a5,80000be6 <xQueueGenericSendFromISR+0xb6>
    80000b9e:	6602                	ld	a2,0(sp)
    80000ba0:	65c2                	ld	a1,16(sp)
    80000ba2:	7542                	ld	a0,48(sp)
    80000ba4:	48a000ef          	jal	ra,8000102e <prvCopyDataToQueue>
    80000ba8:	77c2                	ld	a5,48(sp)
    80000baa:	6bd8                	ld	a4,144(a5)
    80000bac:	57fd                	li	a5,-1
    80000bae:	02f71363          	bne	a4,a5,80000bd4 <xQueueGenericSendFromISR+0xa4>
    80000bb2:	77c2                	ld	a5,48(sp)
    80000bb4:	67bc                	ld	a5,72(a5)
    80000bb6:	c78d                	beqz	a5,80000be0 <xQueueGenericSendFromISR+0xb0>
    80000bb8:	77c2                	ld	a5,48(sp)
    80000bba:	04878793          	addi	a5,a5,72
    80000bbe:	853e                	mv	a0,a5
    80000bc0:	0cb010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000bc4:	87aa                	mv	a5,a0
    80000bc6:	cf89                	beqz	a5,80000be0 <xQueueGenericSendFromISR+0xb0>
    80000bc8:	67a2                	ld	a5,8(sp)
    80000bca:	cb99                	beqz	a5,80000be0 <xQueueGenericSendFromISR+0xb0>
    80000bcc:	67a2                	ld	a5,8(sp)
    80000bce:	4705                	li	a4,1
    80000bd0:	e398                	sd	a4,0(a5)
    80000bd2:	a039                	j	80000be0 <xQueueGenericSendFromISR+0xb0>
    80000bd4:	77c2                	ld	a5,48(sp)
    80000bd6:	6bdc                	ld	a5,144(a5)
    80000bd8:	00178713          	addi	a4,a5,1
    80000bdc:	77c2                	ld	a5,48(sp)
    80000bde:	ebd8                	sd	a4,144(a5)
    80000be0:	4785                	li	a5,1
    80000be2:	fc3e                	sd	a5,56(sp)
    80000be4:	a011                	j	80000be8 <xQueueGenericSendFromISR+0xb8>
    80000be6:	fc02                	sd	zero,56(sp)
    80000be8:	77a2                	ld	a5,40(sp)
    80000bea:	2781                	sext.w	a5,a5
    80000bec:	853e                	mv	a0,a5
    80000bee:	93bff0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80000bf2:	77e2                	ld	a5,56(sp)
    80000bf4:	853e                	mv	a0,a5
    80000bf6:	60a6                	ld	ra,72(sp)
    80000bf8:	6161                	addi	sp,sp,80
    80000bfa:	8082                	ret

0000000080000bfc <xQueueGiveFromISR>:
    80000bfc:	7139                	addi	sp,sp,-64
    80000bfe:	fc06                	sd	ra,56(sp)
    80000c00:	e42a                	sd	a0,8(sp)
    80000c02:	e02e                	sd	a1,0(sp)
    80000c04:	67a2                	ld	a5,8(sp)
    80000c06:	f03e                	sd	a5,32(sp)
    80000c08:	7782                	ld	a5,32(sp)
    80000c0a:	e781                	bnez	a5,80000c12 <xQueueGiveFromISR+0x16>
    80000c0c:	30047073          	csrci	mstatus,8
    80000c10:	a001                	j	80000c10 <xQueueGiveFromISR+0x14>
    80000c12:	7782                	ld	a5,32(sp)
    80000c14:	63dc                	ld	a5,128(a5)
    80000c16:	c781                	beqz	a5,80000c1e <xQueueGiveFromISR+0x22>
    80000c18:	30047073          	csrci	mstatus,8
    80000c1c:	a001                	j	80000c1c <xQueueGiveFromISR+0x20>
    80000c1e:	7782                	ld	a5,32(sp)
    80000c20:	639c                	ld	a5,0(a5)
    80000c22:	e781                	bnez	a5,80000c2a <xQueueGiveFromISR+0x2e>
    80000c24:	7782                	ld	a5,32(sp)
    80000c26:	679c                	ld	a5,8(a5)
    80000c28:	e399                	bnez	a5,80000c2e <xQueueGiveFromISR+0x32>
    80000c2a:	4785                	li	a5,1
    80000c2c:	a011                	j	80000c30 <xQueueGiveFromISR+0x34>
    80000c2e:	4781                	li	a5,0
    80000c30:	e781                	bnez	a5,80000c38 <xQueueGiveFromISR+0x3c>
    80000c32:	30047073          	csrci	mstatus,8
    80000c36:	a001                	j	80000c36 <xQueueGiveFromISR+0x3a>
    80000c38:	903ff0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80000c3c:	87aa                	mv	a5,a0
    80000c3e:	ec3e                	sd	a5,24(sp)
    80000c40:	7782                	ld	a5,32(sp)
    80000c42:	7bb8                	ld	a4,112(a5)
    80000c44:	7782                	ld	a5,32(sp)
    80000c46:	7fbc                	ld	a5,120(a5)
    80000c48:	04f77763          	bgeu	a4,a5,80000c96 <xQueueGiveFromISR+0x9a>
    80000c4c:	7782                	ld	a5,32(sp)
    80000c4e:	7bbc                	ld	a5,112(a5)
    80000c50:	00178713          	addi	a4,a5,1
    80000c54:	7782                	ld	a5,32(sp)
    80000c56:	fbb8                	sd	a4,112(a5)
    80000c58:	7782                	ld	a5,32(sp)
    80000c5a:	6bd8                	ld	a4,144(a5)
    80000c5c:	57fd                	li	a5,-1
    80000c5e:	02f71363          	bne	a4,a5,80000c84 <xQueueGiveFromISR+0x88>
    80000c62:	7782                	ld	a5,32(sp)
    80000c64:	67bc                	ld	a5,72(a5)
    80000c66:	c78d                	beqz	a5,80000c90 <xQueueGiveFromISR+0x94>
    80000c68:	7782                	ld	a5,32(sp)
    80000c6a:	04878793          	addi	a5,a5,72
    80000c6e:	853e                	mv	a0,a5
    80000c70:	01b010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000c74:	87aa                	mv	a5,a0
    80000c76:	cf89                	beqz	a5,80000c90 <xQueueGiveFromISR+0x94>
    80000c78:	6782                	ld	a5,0(sp)
    80000c7a:	cb99                	beqz	a5,80000c90 <xQueueGiveFromISR+0x94>
    80000c7c:	6782                	ld	a5,0(sp)
    80000c7e:	4705                	li	a4,1
    80000c80:	e398                	sd	a4,0(a5)
    80000c82:	a039                	j	80000c90 <xQueueGiveFromISR+0x94>
    80000c84:	7782                	ld	a5,32(sp)
    80000c86:	6bdc                	ld	a5,144(a5)
    80000c88:	00178713          	addi	a4,a5,1
    80000c8c:	7782                	ld	a5,32(sp)
    80000c8e:	ebd8                	sd	a4,144(a5)
    80000c90:	4785                	li	a5,1
    80000c92:	f43e                	sd	a5,40(sp)
    80000c94:	a011                	j	80000c98 <xQueueGiveFromISR+0x9c>
    80000c96:	f402                	sd	zero,40(sp)
    80000c98:	67e2                	ld	a5,24(sp)
    80000c9a:	2781                	sext.w	a5,a5
    80000c9c:	853e                	mv	a0,a5
    80000c9e:	88bff0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80000ca2:	77a2                	ld	a5,40(sp)
    80000ca4:	853e                	mv	a0,a5
    80000ca6:	70e2                	ld	ra,56(sp)
    80000ca8:	6121                	addi	sp,sp,64
    80000caa:	8082                	ret

0000000080000cac <xQueueGenericReceive>:
    80000cac:	711d                	addi	sp,sp,-96
    80000cae:	ec86                	sd	ra,88(sp)
    80000cb0:	ec2a                	sd	a0,24(sp)
    80000cb2:	e82e                	sd	a1,16(sp)
    80000cb4:	87b2                	mv	a5,a2
    80000cb6:	e036                	sd	a3,0(sp)
    80000cb8:	c63e                	sw	a5,12(sp)
    80000cba:	e482                	sd	zero,72(sp)
    80000cbc:	67e2                	ld	a5,24(sp)
    80000cbe:	e0be                	sd	a5,64(sp)
    80000cc0:	6786                	ld	a5,64(sp)
    80000cc2:	e781                	bnez	a5,80000cca <xQueueGenericReceive+0x1e>
    80000cc4:	30047073          	csrci	mstatus,8
    80000cc8:	a001                	j	80000cc8 <xQueueGenericReceive+0x1c>
    80000cca:	67c2                	ld	a5,16(sp)
    80000ccc:	e781                	bnez	a5,80000cd4 <xQueueGenericReceive+0x28>
    80000cce:	6786                	ld	a5,64(sp)
    80000cd0:	63dc                	ld	a5,128(a5)
    80000cd2:	e399                	bnez	a5,80000cd8 <xQueueGenericReceive+0x2c>
    80000cd4:	4785                	li	a5,1
    80000cd6:	a011                	j	80000cda <xQueueGenericReceive+0x2e>
    80000cd8:	4781                	li	a5,0
    80000cda:	e781                	bnez	a5,80000ce2 <xQueueGenericReceive+0x36>
    80000cdc:	30047073          	csrci	mstatus,8
    80000ce0:	a001                	j	80000ce0 <xQueueGenericReceive+0x34>
    80000ce2:	777010ef          	jal	ra,80002c58 <xTaskGetSchedulerState>
    80000ce6:	87aa                	mv	a5,a0
    80000ce8:	e399                	bnez	a5,80000cee <xQueueGenericReceive+0x42>
    80000cea:	47b2                	lw	a5,12(sp)
    80000cec:	e399                	bnez	a5,80000cf2 <xQueueGenericReceive+0x46>
    80000cee:	4785                	li	a5,1
    80000cf0:	a011                	j	80000cf4 <xQueueGenericReceive+0x48>
    80000cf2:	4781                	li	a5,0
    80000cf4:	e781                	bnez	a5,80000cfc <xQueueGenericReceive+0x50>
    80000cf6:	30047073          	csrci	mstatus,8
    80000cfa:	a001                	j	80000cfa <xQueueGenericReceive+0x4e>
    80000cfc:	136020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000d00:	6786                	ld	a5,64(sp)
    80000d02:	7bbc                	ld	a5,112(a5)
    80000d04:	cfa5                	beqz	a5,80000d7c <xQueueGenericReceive+0xd0>
    80000d06:	6786                	ld	a5,64(sp)
    80000d08:	6f9c                	ld	a5,24(a5)
    80000d0a:	fc3e                	sd	a5,56(sp)
    80000d0c:	65c2                	ld	a1,16(sp)
    80000d0e:	6506                	ld	a0,64(sp)
    80000d10:	3f6000ef          	jal	ra,80001106 <prvCopyDataFromQueue>
    80000d14:	6782                	ld	a5,0(sp)
    80000d16:	ef9d                	bnez	a5,80000d54 <xQueueGenericReceive+0xa8>
    80000d18:	6786                	ld	a5,64(sp)
    80000d1a:	7bbc                	ld	a5,112(a5)
    80000d1c:	fff78713          	addi	a4,a5,-1
    80000d20:	6786                	ld	a5,64(sp)
    80000d22:	fbb8                	sd	a4,112(a5)
    80000d24:	6786                	ld	a5,64(sp)
    80000d26:	639c                	ld	a5,0(a5)
    80000d28:	e791                	bnez	a5,80000d34 <xQueueGenericReceive+0x88>
    80000d2a:	1b2020ef          	jal	ra,80002edc <pvTaskIncrementMutexHeldCount>
    80000d2e:	872a                	mv	a4,a0
    80000d30:	6786                	ld	a5,64(sp)
    80000d32:	e798                	sd	a4,8(a5)
    80000d34:	6786                	ld	a5,64(sp)
    80000d36:	739c                	ld	a5,32(a5)
    80000d38:	cf95                	beqz	a5,80000d74 <xQueueGenericReceive+0xc8>
    80000d3a:	6786                	ld	a5,64(sp)
    80000d3c:	02078793          	addi	a5,a5,32
    80000d40:	853e                	mv	a0,a5
    80000d42:	748010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000d46:	872a                	mv	a4,a0
    80000d48:	4785                	li	a5,1
    80000d4a:	02f71563          	bne	a4,a5,80000d74 <xQueueGenericReceive+0xc8>
    80000d4e:	ebeff0ef          	jal	ra,8000040c <vPortYield>
    80000d52:	a00d                	j	80000d74 <xQueueGenericReceive+0xc8>
    80000d54:	6786                	ld	a5,64(sp)
    80000d56:	7762                	ld	a4,56(sp)
    80000d58:	ef98                	sd	a4,24(a5)
    80000d5a:	6786                	ld	a5,64(sp)
    80000d5c:	67bc                	ld	a5,72(a5)
    80000d5e:	cb99                	beqz	a5,80000d74 <xQueueGenericReceive+0xc8>
    80000d60:	6786                	ld	a5,64(sp)
    80000d62:	04878793          	addi	a5,a5,72
    80000d66:	853e                	mv	a0,a5
    80000d68:	722010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000d6c:	87aa                	mv	a5,a0
    80000d6e:	c399                	beqz	a5,80000d74 <xQueueGenericReceive+0xc8>
    80000d70:	e9cff0ef          	jal	ra,8000040c <vPortYield>
    80000d74:	0ec020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000d78:	4785                	li	a5,1
    80000d7a:	a87d                	j	80000e38 <xQueueGenericReceive+0x18c>
    80000d7c:	47b2                	lw	a5,12(sp)
    80000d7e:	e789                	bnez	a5,80000d88 <xQueueGenericReceive+0xdc>
    80000d80:	0e0020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000d84:	4781                	li	a5,0
    80000d86:	a84d                	j	80000e38 <xQueueGenericReceive+0x18c>
    80000d88:	67a6                	ld	a5,72(sp)
    80000d8a:	e799                	bnez	a5,80000d98 <xQueueGenericReceive+0xec>
    80000d8c:	103c                	addi	a5,sp,40
    80000d8e:	853e                	mv	a0,a5
    80000d90:	081010ef          	jal	ra,80002610 <vTaskSetTimeOutState>
    80000d94:	4785                	li	a5,1
    80000d96:	e4be                	sd	a5,72(sp)
    80000d98:	0c8020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000d9c:	727000ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80000da0:	092020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000da4:	6786                	ld	a5,64(sp)
    80000da6:	67d8                	ld	a4,136(a5)
    80000da8:	57fd                	li	a5,-1
    80000daa:	00f71563          	bne	a4,a5,80000db4 <xQueueGenericReceive+0x108>
    80000dae:	6786                	ld	a5,64(sp)
    80000db0:	0807b423          	sd	zero,136(a5)
    80000db4:	6786                	ld	a5,64(sp)
    80000db6:	6bd8                	ld	a4,144(a5)
    80000db8:	57fd                	li	a5,-1
    80000dba:	00f71563          	bne	a4,a5,80000dc4 <xQueueGenericReceive+0x118>
    80000dbe:	6786                	ld	a5,64(sp)
    80000dc0:	0807b823          	sd	zero,144(a5)
    80000dc4:	09c020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000dc8:	0078                	addi	a4,sp,12
    80000dca:	103c                	addi	a5,sp,40
    80000dcc:	85ba                	mv	a1,a4
    80000dce:	853e                	mv	a0,a5
    80000dd0:	075010ef          	jal	ra,80002644 <xTaskCheckForTimeOut>
    80000dd4:	87aa                	mv	a5,a0
    80000dd6:	ebb9                	bnez	a5,80000e2c <xQueueGenericReceive+0x180>
    80000dd8:	6506                	ld	a0,64(sp)
    80000dda:	408000ef          	jal	ra,800011e2 <prvIsQueueEmpty>
    80000dde:	87aa                	mv	a5,a0
    80000de0:	c3a1                	beqz	a5,80000e20 <xQueueGenericReceive+0x174>
    80000de2:	6786                	ld	a5,64(sp)
    80000de4:	639c                	ld	a5,0(a5)
    80000de6:	eb91                	bnez	a5,80000dfa <xQueueGenericReceive+0x14e>
    80000de8:	04a020ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000dec:	6786                	ld	a5,64(sp)
    80000dee:	679c                	ld	a5,8(a5)
    80000df0:	853e                	mv	a0,a5
    80000df2:	697010ef          	jal	ra,80002c88 <vTaskPriorityInherit>
    80000df6:	06a020ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000dfa:	6786                	ld	a5,64(sp)
    80000dfc:	04878793          	addi	a5,a5,72
    80000e00:	4732                	lw	a4,12(sp)
    80000e02:	85ba                	mv	a1,a4
    80000e04:	853e                	mv	a0,a5
    80000e06:	4c4010ef          	jal	ra,800022ca <vTaskPlaceOnEventList>
    80000e0a:	6506                	ld	a0,64(sp)
    80000e0c:	344000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000e10:	6cf000ef          	jal	ra,80001cde <xTaskResumeAll>
    80000e14:	87aa                	mv	a5,a0
    80000e16:	ee0793e3          	bnez	a5,80000cfc <xQueueGenericReceive+0x50>
    80000e1a:	df2ff0ef          	jal	ra,8000040c <vPortYield>
    80000e1e:	bdf9                	j	80000cfc <xQueueGenericReceive+0x50>
    80000e20:	6506                	ld	a0,64(sp)
    80000e22:	32e000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000e26:	6b9000ef          	jal	ra,80001cde <xTaskResumeAll>
    80000e2a:	bdc9                	j	80000cfc <xQueueGenericReceive+0x50>
    80000e2c:	6506                	ld	a0,64(sp)
    80000e2e:	322000ef          	jal	ra,80001150 <prvUnlockQueue>
    80000e32:	6ad000ef          	jal	ra,80001cde <xTaskResumeAll>
    80000e36:	4781                	li	a5,0
    80000e38:	853e                	mv	a0,a5
    80000e3a:	60e6                	ld	ra,88(sp)
    80000e3c:	6125                	addi	sp,sp,96
    80000e3e:	8082                	ret

0000000080000e40 <xQueueReceiveFromISR>:
    80000e40:	715d                	addi	sp,sp,-80
    80000e42:	e486                	sd	ra,72(sp)
    80000e44:	ec2a                	sd	a0,24(sp)
    80000e46:	e82e                	sd	a1,16(sp)
    80000e48:	e432                	sd	a2,8(sp)
    80000e4a:	67e2                	ld	a5,24(sp)
    80000e4c:	f83e                	sd	a5,48(sp)
    80000e4e:	77c2                	ld	a5,48(sp)
    80000e50:	e781                	bnez	a5,80000e58 <xQueueReceiveFromISR+0x18>
    80000e52:	30047073          	csrci	mstatus,8
    80000e56:	a001                	j	80000e56 <xQueueReceiveFromISR+0x16>
    80000e58:	67c2                	ld	a5,16(sp)
    80000e5a:	e781                	bnez	a5,80000e62 <xQueueReceiveFromISR+0x22>
    80000e5c:	77c2                	ld	a5,48(sp)
    80000e5e:	63dc                	ld	a5,128(a5)
    80000e60:	e399                	bnez	a5,80000e66 <xQueueReceiveFromISR+0x26>
    80000e62:	4785                	li	a5,1
    80000e64:	a011                	j	80000e68 <xQueueReceiveFromISR+0x28>
    80000e66:	4781                	li	a5,0
    80000e68:	e781                	bnez	a5,80000e70 <xQueueReceiveFromISR+0x30>
    80000e6a:	30047073          	csrci	mstatus,8
    80000e6e:	a001                	j	80000e6e <xQueueReceiveFromISR+0x2e>
    80000e70:	ecaff0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80000e74:	87aa                	mv	a5,a0
    80000e76:	f43e                	sd	a5,40(sp)
    80000e78:	77c2                	ld	a5,48(sp)
    80000e7a:	7bbc                	ld	a5,112(a5)
    80000e7c:	cbb1                	beqz	a5,80000ed0 <xQueueReceiveFromISR+0x90>
    80000e7e:	65c2                	ld	a1,16(sp)
    80000e80:	7542                	ld	a0,48(sp)
    80000e82:	284000ef          	jal	ra,80001106 <prvCopyDataFromQueue>
    80000e86:	77c2                	ld	a5,48(sp)
    80000e88:	7bbc                	ld	a5,112(a5)
    80000e8a:	fff78713          	addi	a4,a5,-1
    80000e8e:	77c2                	ld	a5,48(sp)
    80000e90:	fbb8                	sd	a4,112(a5)
    80000e92:	77c2                	ld	a5,48(sp)
    80000e94:	67d8                	ld	a4,136(a5)
    80000e96:	57fd                	li	a5,-1
    80000e98:	02f71363          	bne	a4,a5,80000ebe <xQueueReceiveFromISR+0x7e>
    80000e9c:	77c2                	ld	a5,48(sp)
    80000e9e:	739c                	ld	a5,32(a5)
    80000ea0:	c78d                	beqz	a5,80000eca <xQueueReceiveFromISR+0x8a>
    80000ea2:	77c2                	ld	a5,48(sp)
    80000ea4:	02078793          	addi	a5,a5,32
    80000ea8:	853e                	mv	a0,a5
    80000eaa:	5e0010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    80000eae:	87aa                	mv	a5,a0
    80000eb0:	cf89                	beqz	a5,80000eca <xQueueReceiveFromISR+0x8a>
    80000eb2:	67a2                	ld	a5,8(sp)
    80000eb4:	cb99                	beqz	a5,80000eca <xQueueReceiveFromISR+0x8a>
    80000eb6:	67a2                	ld	a5,8(sp)
    80000eb8:	4705                	li	a4,1
    80000eba:	e398                	sd	a4,0(a5)
    80000ebc:	a039                	j	80000eca <xQueueReceiveFromISR+0x8a>
    80000ebe:	77c2                	ld	a5,48(sp)
    80000ec0:	67dc                	ld	a5,136(a5)
    80000ec2:	00178713          	addi	a4,a5,1
    80000ec6:	77c2                	ld	a5,48(sp)
    80000ec8:	e7d8                	sd	a4,136(a5)
    80000eca:	4785                	li	a5,1
    80000ecc:	fc3e                	sd	a5,56(sp)
    80000ece:	a011                	j	80000ed2 <xQueueReceiveFromISR+0x92>
    80000ed0:	fc02                	sd	zero,56(sp)
    80000ed2:	77a2                	ld	a5,40(sp)
    80000ed4:	2781                	sext.w	a5,a5
    80000ed6:	853e                	mv	a0,a5
    80000ed8:	e50ff0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80000edc:	77e2                	ld	a5,56(sp)
    80000ede:	853e                	mv	a0,a5
    80000ee0:	60a6                	ld	ra,72(sp)
    80000ee2:	6161                	addi	sp,sp,80
    80000ee4:	8082                	ret

0000000080000ee6 <xQueuePeekFromISR>:
    80000ee6:	7139                	addi	sp,sp,-64
    80000ee8:	fc06                	sd	ra,56(sp)
    80000eea:	e42a                	sd	a0,8(sp)
    80000eec:	e02e                	sd	a1,0(sp)
    80000eee:	67a2                	ld	a5,8(sp)
    80000ef0:	f03e                	sd	a5,32(sp)
    80000ef2:	7782                	ld	a5,32(sp)
    80000ef4:	e781                	bnez	a5,80000efc <xQueuePeekFromISR+0x16>
    80000ef6:	30047073          	csrci	mstatus,8
    80000efa:	a001                	j	80000efa <xQueuePeekFromISR+0x14>
    80000efc:	6782                	ld	a5,0(sp)
    80000efe:	e781                	bnez	a5,80000f06 <xQueuePeekFromISR+0x20>
    80000f00:	7782                	ld	a5,32(sp)
    80000f02:	63dc                	ld	a5,128(a5)
    80000f04:	e399                	bnez	a5,80000f0a <xQueuePeekFromISR+0x24>
    80000f06:	4785                	li	a5,1
    80000f08:	a011                	j	80000f0c <xQueuePeekFromISR+0x26>
    80000f0a:	4781                	li	a5,0
    80000f0c:	e781                	bnez	a5,80000f14 <xQueuePeekFromISR+0x2e>
    80000f0e:	30047073          	csrci	mstatus,8
    80000f12:	a001                	j	80000f12 <xQueuePeekFromISR+0x2c>
    80000f14:	7782                	ld	a5,32(sp)
    80000f16:	63dc                	ld	a5,128(a5)
    80000f18:	e781                	bnez	a5,80000f20 <xQueuePeekFromISR+0x3a>
    80000f1a:	30047073          	csrci	mstatus,8
    80000f1e:	a001                	j	80000f1e <xQueuePeekFromISR+0x38>
    80000f20:	e1aff0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80000f24:	87aa                	mv	a5,a0
    80000f26:	ec3e                	sd	a5,24(sp)
    80000f28:	7782                	ld	a5,32(sp)
    80000f2a:	7bbc                	ld	a5,112(a5)
    80000f2c:	cf91                	beqz	a5,80000f48 <xQueuePeekFromISR+0x62>
    80000f2e:	7782                	ld	a5,32(sp)
    80000f30:	6f9c                	ld	a5,24(a5)
    80000f32:	e83e                	sd	a5,16(sp)
    80000f34:	6582                	ld	a1,0(sp)
    80000f36:	7502                	ld	a0,32(sp)
    80000f38:	1ce000ef          	jal	ra,80001106 <prvCopyDataFromQueue>
    80000f3c:	7782                	ld	a5,32(sp)
    80000f3e:	6742                	ld	a4,16(sp)
    80000f40:	ef98                	sd	a4,24(a5)
    80000f42:	4785                	li	a5,1
    80000f44:	f43e                	sd	a5,40(sp)
    80000f46:	a011                	j	80000f4a <xQueuePeekFromISR+0x64>
    80000f48:	f402                	sd	zero,40(sp)
    80000f4a:	67e2                	ld	a5,24(sp)
    80000f4c:	2781                	sext.w	a5,a5
    80000f4e:	853e                	mv	a0,a5
    80000f50:	dd8ff0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80000f54:	77a2                	ld	a5,40(sp)
    80000f56:	853e                	mv	a0,a5
    80000f58:	70e2                	ld	ra,56(sp)
    80000f5a:	6121                	addi	sp,sp,64
    80000f5c:	8082                	ret

0000000080000f5e <uxQueueMessagesWaiting>:
    80000f5e:	7179                	addi	sp,sp,-48
    80000f60:	f406                	sd	ra,40(sp)
    80000f62:	e42a                	sd	a0,8(sp)
    80000f64:	67a2                	ld	a5,8(sp)
    80000f66:	e781                	bnez	a5,80000f6e <uxQueueMessagesWaiting+0x10>
    80000f68:	30047073          	csrci	mstatus,8
    80000f6c:	a001                	j	80000f6c <uxQueueMessagesWaiting+0xe>
    80000f6e:	6c5010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000f72:	67a2                	ld	a5,8(sp)
    80000f74:	7bbc                	ld	a5,112(a5)
    80000f76:	ec3e                	sd	a5,24(sp)
    80000f78:	6e9010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000f7c:	67e2                	ld	a5,24(sp)
    80000f7e:	853e                	mv	a0,a5
    80000f80:	70a2                	ld	ra,40(sp)
    80000f82:	6145                	addi	sp,sp,48
    80000f84:	8082                	ret

0000000080000f86 <uxQueueSpacesAvailable>:
    80000f86:	7179                	addi	sp,sp,-48
    80000f88:	f406                	sd	ra,40(sp)
    80000f8a:	e42a                	sd	a0,8(sp)
    80000f8c:	67a2                	ld	a5,8(sp)
    80000f8e:	ec3e                	sd	a5,24(sp)
    80000f90:	67e2                	ld	a5,24(sp)
    80000f92:	e781                	bnez	a5,80000f9a <uxQueueSpacesAvailable+0x14>
    80000f94:	30047073          	csrci	mstatus,8
    80000f98:	a001                	j	80000f98 <uxQueueSpacesAvailable+0x12>
    80000f9a:	699010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80000f9e:	67e2                	ld	a5,24(sp)
    80000fa0:	7fb8                	ld	a4,120(a5)
    80000fa2:	67e2                	ld	a5,24(sp)
    80000fa4:	7bbc                	ld	a5,112(a5)
    80000fa6:	40f707b3          	sub	a5,a4,a5
    80000faa:	e83e                	sd	a5,16(sp)
    80000fac:	6b5010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80000fb0:	67c2                	ld	a5,16(sp)
    80000fb2:	853e                	mv	a0,a5
    80000fb4:	70a2                	ld	ra,40(sp)
    80000fb6:	6145                	addi	sp,sp,48
    80000fb8:	8082                	ret

0000000080000fba <uxQueueMessagesWaitingFromISR>:
    80000fba:	1101                	addi	sp,sp,-32
    80000fbc:	e42a                	sd	a0,8(sp)
    80000fbe:	67a2                	ld	a5,8(sp)
    80000fc0:	e781                	bnez	a5,80000fc8 <uxQueueMessagesWaitingFromISR+0xe>
    80000fc2:	30047073          	csrci	mstatus,8
    80000fc6:	a001                	j	80000fc6 <uxQueueMessagesWaitingFromISR+0xc>
    80000fc8:	67a2                	ld	a5,8(sp)
    80000fca:	7bbc                	ld	a5,112(a5)
    80000fcc:	ec3e                	sd	a5,24(sp)
    80000fce:	67e2                	ld	a5,24(sp)
    80000fd0:	853e                	mv	a0,a5
    80000fd2:	6105                	addi	sp,sp,32
    80000fd4:	8082                	ret

0000000080000fd6 <vQueueDelete>:
    80000fd6:	7179                	addi	sp,sp,-48
    80000fd8:	f406                	sd	ra,40(sp)
    80000fda:	e42a                	sd	a0,8(sp)
    80000fdc:	67a2                	ld	a5,8(sp)
    80000fde:	ec3e                	sd	a5,24(sp)
    80000fe0:	67e2                	ld	a5,24(sp)
    80000fe2:	e781                	bnez	a5,80000fea <vQueueDelete+0x14>
    80000fe4:	30047073          	csrci	mstatus,8
    80000fe8:	a001                	j	80000fe8 <vQueueDelete+0x12>
    80000fea:	6562                	ld	a0,24(sp)
    80000fec:	2ee000ef          	jal	ra,800012da <vQueueUnregisterQueue>
    80000ff0:	6562                	ld	a0,24(sp)
    80000ff2:	30a030ef          	jal	ra,800042fc <vPortFree>
    80000ff6:	0001                	nop
    80000ff8:	70a2                	ld	ra,40(sp)
    80000ffa:	6145                	addi	sp,sp,48
    80000ffc:	8082                	ret

0000000080000ffe <uxQueueGetQueueNumber>:
    80000ffe:	1141                	addi	sp,sp,-16
    80001000:	e42a                	sd	a0,8(sp)
    80001002:	67a2                	ld	a5,8(sp)
    80001004:	6fdc                	ld	a5,152(a5)
    80001006:	853e                	mv	a0,a5
    80001008:	0141                	addi	sp,sp,16
    8000100a:	8082                	ret

000000008000100c <vQueueSetQueueNumber>:
    8000100c:	1141                	addi	sp,sp,-16
    8000100e:	e42a                	sd	a0,8(sp)
    80001010:	e02e                	sd	a1,0(sp)
    80001012:	67a2                	ld	a5,8(sp)
    80001014:	6702                	ld	a4,0(sp)
    80001016:	efd8                	sd	a4,152(a5)
    80001018:	0001                	nop
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <ucQueueGetQueueType>:
    8000101e:	1141                	addi	sp,sp,-16
    80001020:	e42a                	sd	a0,8(sp)
    80001022:	67a2                	ld	a5,8(sp)
    80001024:	0a07c783          	lbu	a5,160(a5)
    80001028:	853e                	mv	a0,a5
    8000102a:	0141                	addi	sp,sp,16
    8000102c:	8082                	ret

000000008000102e <prvCopyDataToQueue>:
    8000102e:	7139                	addi	sp,sp,-64
    80001030:	fc06                	sd	ra,56(sp)
    80001032:	ec2a                	sd	a0,24(sp)
    80001034:	e82e                	sd	a1,16(sp)
    80001036:	e432                	sd	a2,8(sp)
    80001038:	f402                	sd	zero,40(sp)
    8000103a:	67e2                	ld	a5,24(sp)
    8000103c:	63dc                	ld	a5,128(a5)
    8000103e:	ef91                	bnez	a5,8000105a <prvCopyDataToQueue+0x2c>
    80001040:	67e2                	ld	a5,24(sp)
    80001042:	639c                	ld	a5,0(a5)
    80001044:	e7d5                	bnez	a5,800010f0 <prvCopyDataToQueue+0xc2>
    80001046:	67e2                	ld	a5,24(sp)
    80001048:	679c                	ld	a5,8(a5)
    8000104a:	853e                	mv	a0,a5
    8000104c:	521010ef          	jal	ra,80002d6c <xTaskPriorityDisinherit>
    80001050:	f42a                	sd	a0,40(sp)
    80001052:	67e2                	ld	a5,24(sp)
    80001054:	0007b423          	sd	zero,8(a5)
    80001058:	a861                	j	800010f0 <prvCopyDataToQueue+0xc2>
    8000105a:	67a2                	ld	a5,8(sp)
    8000105c:	ef85                	bnez	a5,80001094 <prvCopyDataToQueue+0x66>
    8000105e:	67e2                	ld	a5,24(sp)
    80001060:	6b98                	ld	a4,16(a5)
    80001062:	67e2                	ld	a5,24(sp)
    80001064:	63dc                	ld	a5,128(a5)
    80001066:	863e                	mv	a2,a5
    80001068:	65c2                	ld	a1,16(sp)
    8000106a:	853a                	mv	a0,a4
    8000106c:	37a030ef          	jal	ra,800043e6 <memcpy>
    80001070:	67e2                	ld	a5,24(sp)
    80001072:	6b98                	ld	a4,16(a5)
    80001074:	67e2                	ld	a5,24(sp)
    80001076:	63dc                	ld	a5,128(a5)
    80001078:	973e                	add	a4,a4,a5
    8000107a:	67e2                	ld	a5,24(sp)
    8000107c:	eb98                	sd	a4,16(a5)
    8000107e:	67e2                	ld	a5,24(sp)
    80001080:	6b98                	ld	a4,16(a5)
    80001082:	67e2                	ld	a5,24(sp)
    80001084:	679c                	ld	a5,8(a5)
    80001086:	06f76563          	bltu	a4,a5,800010f0 <prvCopyDataToQueue+0xc2>
    8000108a:	67e2                	ld	a5,24(sp)
    8000108c:	6398                	ld	a4,0(a5)
    8000108e:	67e2                	ld	a5,24(sp)
    80001090:	eb98                	sd	a4,16(a5)
    80001092:	a8b9                	j	800010f0 <prvCopyDataToQueue+0xc2>
    80001094:	67e2                	ld	a5,24(sp)
    80001096:	6f98                	ld	a4,24(a5)
    80001098:	67e2                	ld	a5,24(sp)
    8000109a:	63dc                	ld	a5,128(a5)
    8000109c:	863e                	mv	a2,a5
    8000109e:	65c2                	ld	a1,16(sp)
    800010a0:	853a                	mv	a0,a4
    800010a2:	344030ef          	jal	ra,800043e6 <memcpy>
    800010a6:	67e2                	ld	a5,24(sp)
    800010a8:	6f98                	ld	a4,24(a5)
    800010aa:	67e2                	ld	a5,24(sp)
    800010ac:	63dc                	ld	a5,128(a5)
    800010ae:	40f007b3          	neg	a5,a5
    800010b2:	973e                	add	a4,a4,a5
    800010b4:	67e2                	ld	a5,24(sp)
    800010b6:	ef98                	sd	a4,24(a5)
    800010b8:	67e2                	ld	a5,24(sp)
    800010ba:	6f98                	ld	a4,24(a5)
    800010bc:	67e2                	ld	a5,24(sp)
    800010be:	639c                	ld	a5,0(a5)
    800010c0:	00f77b63          	bgeu	a4,a5,800010d6 <prvCopyDataToQueue+0xa8>
    800010c4:	67e2                	ld	a5,24(sp)
    800010c6:	6798                	ld	a4,8(a5)
    800010c8:	67e2                	ld	a5,24(sp)
    800010ca:	63dc                	ld	a5,128(a5)
    800010cc:	40f007b3          	neg	a5,a5
    800010d0:	973e                	add	a4,a4,a5
    800010d2:	67e2                	ld	a5,24(sp)
    800010d4:	ef98                	sd	a4,24(a5)
    800010d6:	6722                	ld	a4,8(sp)
    800010d8:	4789                	li	a5,2
    800010da:	00f71b63          	bne	a4,a5,800010f0 <prvCopyDataToQueue+0xc2>
    800010de:	67e2                	ld	a5,24(sp)
    800010e0:	7bbc                	ld	a5,112(a5)
    800010e2:	c799                	beqz	a5,800010f0 <prvCopyDataToQueue+0xc2>
    800010e4:	67e2                	ld	a5,24(sp)
    800010e6:	7bbc                	ld	a5,112(a5)
    800010e8:	fff78713          	addi	a4,a5,-1
    800010ec:	67e2                	ld	a5,24(sp)
    800010ee:	fbb8                	sd	a4,112(a5)
    800010f0:	67e2                	ld	a5,24(sp)
    800010f2:	7bbc                	ld	a5,112(a5)
    800010f4:	00178713          	addi	a4,a5,1
    800010f8:	67e2                	ld	a5,24(sp)
    800010fa:	fbb8                	sd	a4,112(a5)
    800010fc:	77a2                	ld	a5,40(sp)
    800010fe:	853e                	mv	a0,a5
    80001100:	70e2                	ld	ra,56(sp)
    80001102:	6121                	addi	sp,sp,64
    80001104:	8082                	ret

0000000080001106 <prvCopyDataFromQueue>:
    80001106:	1101                	addi	sp,sp,-32
    80001108:	ec06                	sd	ra,24(sp)
    8000110a:	e42a                	sd	a0,8(sp)
    8000110c:	e02e                	sd	a1,0(sp)
    8000110e:	67a2                	ld	a5,8(sp)
    80001110:	63dc                	ld	a5,128(a5)
    80001112:	cb9d                	beqz	a5,80001148 <prvCopyDataFromQueue+0x42>
    80001114:	67a2                	ld	a5,8(sp)
    80001116:	6f98                	ld	a4,24(a5)
    80001118:	67a2                	ld	a5,8(sp)
    8000111a:	63dc                	ld	a5,128(a5)
    8000111c:	973e                	add	a4,a4,a5
    8000111e:	67a2                	ld	a5,8(sp)
    80001120:	ef98                	sd	a4,24(a5)
    80001122:	67a2                	ld	a5,8(sp)
    80001124:	6f98                	ld	a4,24(a5)
    80001126:	67a2                	ld	a5,8(sp)
    80001128:	679c                	ld	a5,8(a5)
    8000112a:	00f76663          	bltu	a4,a5,80001136 <prvCopyDataFromQueue+0x30>
    8000112e:	67a2                	ld	a5,8(sp)
    80001130:	6398                	ld	a4,0(a5)
    80001132:	67a2                	ld	a5,8(sp)
    80001134:	ef98                	sd	a4,24(a5)
    80001136:	67a2                	ld	a5,8(sp)
    80001138:	6f98                	ld	a4,24(a5)
    8000113a:	67a2                	ld	a5,8(sp)
    8000113c:	63dc                	ld	a5,128(a5)
    8000113e:	863e                	mv	a2,a5
    80001140:	85ba                	mv	a1,a4
    80001142:	6502                	ld	a0,0(sp)
    80001144:	2a2030ef          	jal	ra,800043e6 <memcpy>
    80001148:	0001                	nop
    8000114a:	60e2                	ld	ra,24(sp)
    8000114c:	6105                	addi	sp,sp,32
    8000114e:	8082                	ret

0000000080001150 <prvUnlockQueue>:
    80001150:	1101                	addi	sp,sp,-32
    80001152:	ec06                	sd	ra,24(sp)
    80001154:	e42a                	sd	a0,8(sp)
    80001156:	4dd010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    8000115a:	a025                	j	80001182 <prvUnlockQueue+0x32>
    8000115c:	67a2                	ld	a5,8(sp)
    8000115e:	67bc                	ld	a5,72(a5)
    80001160:	c795                	beqz	a5,8000118c <prvUnlockQueue+0x3c>
    80001162:	67a2                	ld	a5,8(sp)
    80001164:	04878793          	addi	a5,a5,72
    80001168:	853e                	mv	a0,a5
    8000116a:	320010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    8000116e:	87aa                	mv	a5,a0
    80001170:	c399                	beqz	a5,80001176 <prvUnlockQueue+0x26>
    80001172:	57c010ef          	jal	ra,800026ee <vTaskMissedYield>
    80001176:	67a2                	ld	a5,8(sp)
    80001178:	6bdc                	ld	a5,144(a5)
    8000117a:	fff78713          	addi	a4,a5,-1
    8000117e:	67a2                	ld	a5,8(sp)
    80001180:	ebd8                	sd	a4,144(a5)
    80001182:	67a2                	ld	a5,8(sp)
    80001184:	6bdc                	ld	a5,144(a5)
    80001186:	fcf04be3          	bgtz	a5,8000115c <prvUnlockQueue+0xc>
    8000118a:	a011                	j	8000118e <prvUnlockQueue+0x3e>
    8000118c:	0001                	nop
    8000118e:	67a2                	ld	a5,8(sp)
    80001190:	577d                	li	a4,-1
    80001192:	ebd8                	sd	a4,144(a5)
    80001194:	4cd010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001198:	49b010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    8000119c:	a025                	j	800011c4 <prvUnlockQueue+0x74>
    8000119e:	67a2                	ld	a5,8(sp)
    800011a0:	739c                	ld	a5,32(a5)
    800011a2:	c795                	beqz	a5,800011ce <prvUnlockQueue+0x7e>
    800011a4:	67a2                	ld	a5,8(sp)
    800011a6:	02078793          	addi	a5,a5,32
    800011aa:	853e                	mv	a0,a5
    800011ac:	2de010ef          	jal	ra,8000248a <xTaskRemoveFromEventList>
    800011b0:	87aa                	mv	a5,a0
    800011b2:	c399                	beqz	a5,800011b8 <prvUnlockQueue+0x68>
    800011b4:	53a010ef          	jal	ra,800026ee <vTaskMissedYield>
    800011b8:	67a2                	ld	a5,8(sp)
    800011ba:	67dc                	ld	a5,136(a5)
    800011bc:	fff78713          	addi	a4,a5,-1
    800011c0:	67a2                	ld	a5,8(sp)
    800011c2:	e7d8                	sd	a4,136(a5)
    800011c4:	67a2                	ld	a5,8(sp)
    800011c6:	67dc                	ld	a5,136(a5)
    800011c8:	fcf04be3          	bgtz	a5,8000119e <prvUnlockQueue+0x4e>
    800011cc:	a011                	j	800011d0 <prvUnlockQueue+0x80>
    800011ce:	0001                	nop
    800011d0:	67a2                	ld	a5,8(sp)
    800011d2:	577d                	li	a4,-1
    800011d4:	e7d8                	sd	a4,136(a5)
    800011d6:	48b010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800011da:	0001                	nop
    800011dc:	60e2                	ld	ra,24(sp)
    800011de:	6105                	addi	sp,sp,32
    800011e0:	8082                	ret

00000000800011e2 <prvIsQueueEmpty>:
    800011e2:	7179                	addi	sp,sp,-48
    800011e4:	f406                	sd	ra,40(sp)
    800011e6:	e42a                	sd	a0,8(sp)
    800011e8:	44b010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    800011ec:	67a2                	ld	a5,8(sp)
    800011ee:	7bbc                	ld	a5,112(a5)
    800011f0:	e781                	bnez	a5,800011f8 <prvIsQueueEmpty+0x16>
    800011f2:	4785                	li	a5,1
    800011f4:	ec3e                	sd	a5,24(sp)
    800011f6:	a011                	j	800011fa <prvIsQueueEmpty+0x18>
    800011f8:	ec02                	sd	zero,24(sp)
    800011fa:	467010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800011fe:	67e2                	ld	a5,24(sp)
    80001200:	853e                	mv	a0,a5
    80001202:	70a2                	ld	ra,40(sp)
    80001204:	6145                	addi	sp,sp,48
    80001206:	8082                	ret

0000000080001208 <xQueueIsQueueEmptyFromISR>:
    80001208:	1101                	addi	sp,sp,-32
    8000120a:	e42a                	sd	a0,8(sp)
    8000120c:	67a2                	ld	a5,8(sp)
    8000120e:	e781                	bnez	a5,80001216 <xQueueIsQueueEmptyFromISR+0xe>
    80001210:	30047073          	csrci	mstatus,8
    80001214:	a001                	j	80001214 <xQueueIsQueueEmptyFromISR+0xc>
    80001216:	67a2                	ld	a5,8(sp)
    80001218:	7bbc                	ld	a5,112(a5)
    8000121a:	e781                	bnez	a5,80001222 <xQueueIsQueueEmptyFromISR+0x1a>
    8000121c:	4785                	li	a5,1
    8000121e:	ec3e                	sd	a5,24(sp)
    80001220:	a011                	j	80001224 <xQueueIsQueueEmptyFromISR+0x1c>
    80001222:	ec02                	sd	zero,24(sp)
    80001224:	67e2                	ld	a5,24(sp)
    80001226:	853e                	mv	a0,a5
    80001228:	6105                	addi	sp,sp,32
    8000122a:	8082                	ret

000000008000122c <prvIsQueueFull>:
    8000122c:	7179                	addi	sp,sp,-48
    8000122e:	f406                	sd	ra,40(sp)
    80001230:	e42a                	sd	a0,8(sp)
    80001232:	401010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001236:	67a2                	ld	a5,8(sp)
    80001238:	7bb8                	ld	a4,112(a5)
    8000123a:	67a2                	ld	a5,8(sp)
    8000123c:	7fbc                	ld	a5,120(a5)
    8000123e:	00f71563          	bne	a4,a5,80001248 <prvIsQueueFull+0x1c>
    80001242:	4785                	li	a5,1
    80001244:	ec3e                	sd	a5,24(sp)
    80001246:	a011                	j	8000124a <prvIsQueueFull+0x1e>
    80001248:	ec02                	sd	zero,24(sp)
    8000124a:	417010ef          	jal	ra,80002e60 <vTaskExitCritical>
    8000124e:	67e2                	ld	a5,24(sp)
    80001250:	853e                	mv	a0,a5
    80001252:	70a2                	ld	ra,40(sp)
    80001254:	6145                	addi	sp,sp,48
    80001256:	8082                	ret

0000000080001258 <xQueueIsQueueFullFromISR>:
    80001258:	1101                	addi	sp,sp,-32
    8000125a:	e42a                	sd	a0,8(sp)
    8000125c:	67a2                	ld	a5,8(sp)
    8000125e:	e781                	bnez	a5,80001266 <xQueueIsQueueFullFromISR+0xe>
    80001260:	30047073          	csrci	mstatus,8
    80001264:	a001                	j	80001264 <xQueueIsQueueFullFromISR+0xc>
    80001266:	67a2                	ld	a5,8(sp)
    80001268:	7bb8                	ld	a4,112(a5)
    8000126a:	67a2                	ld	a5,8(sp)
    8000126c:	7fbc                	ld	a5,120(a5)
    8000126e:	00f71563          	bne	a4,a5,80001278 <xQueueIsQueueFullFromISR+0x20>
    80001272:	4785                	li	a5,1
    80001274:	ec3e                	sd	a5,24(sp)
    80001276:	a011                	j	8000127a <xQueueIsQueueFullFromISR+0x22>
    80001278:	ec02                	sd	zero,24(sp)
    8000127a:	67e2                	ld	a5,24(sp)
    8000127c:	853e                	mv	a0,a5
    8000127e:	6105                	addi	sp,sp,32
    80001280:	8082                	ret

0000000080001282 <vQueueAddToRegistry>:
    80001282:	1101                	addi	sp,sp,-32
    80001284:	e42a                	sd	a0,8(sp)
    80001286:	e02e                	sd	a1,0(sp)
    80001288:	ec02                	sd	zero,24(sp)
    8000128a:	a081                	j	800012ca <vQueueAddToRegistry+0x48>
    8000128c:	0001f717          	auipc	a4,0x1f
    80001290:	26c70713          	addi	a4,a4,620 # 800204f8 <xQueueRegistry>
    80001294:	67e2                	ld	a5,24(sp)
    80001296:	0792                	slli	a5,a5,0x4
    80001298:	97ba                	add	a5,a5,a4
    8000129a:	639c                	ld	a5,0(a5)
    8000129c:	e785                	bnez	a5,800012c4 <vQueueAddToRegistry+0x42>
    8000129e:	0001f717          	auipc	a4,0x1f
    800012a2:	25a70713          	addi	a4,a4,602 # 800204f8 <xQueueRegistry>
    800012a6:	67e2                	ld	a5,24(sp)
    800012a8:	0792                	slli	a5,a5,0x4
    800012aa:	97ba                	add	a5,a5,a4
    800012ac:	6702                	ld	a4,0(sp)
    800012ae:	e398                	sd	a4,0(a5)
    800012b0:	0001f717          	auipc	a4,0x1f
    800012b4:	24870713          	addi	a4,a4,584 # 800204f8 <xQueueRegistry>
    800012b8:	67e2                	ld	a5,24(sp)
    800012ba:	0792                	slli	a5,a5,0x4
    800012bc:	97ba                	add	a5,a5,a4
    800012be:	6722                	ld	a4,8(sp)
    800012c0:	e798                	sd	a4,8(a5)
    800012c2:	a809                	j	800012d4 <vQueueAddToRegistry+0x52>
    800012c4:	67e2                	ld	a5,24(sp)
    800012c6:	0785                	addi	a5,a5,1
    800012c8:	ec3e                	sd	a5,24(sp)
    800012ca:	6762                	ld	a4,24(sp)
    800012cc:	479d                	li	a5,7
    800012ce:	fae7ffe3          	bgeu	a5,a4,8000128c <vQueueAddToRegistry+0xa>
    800012d2:	0001                	nop
    800012d4:	0001                	nop
    800012d6:	6105                	addi	sp,sp,32
    800012d8:	8082                	ret

00000000800012da <vQueueUnregisterQueue>:
    800012da:	1101                	addi	sp,sp,-32
    800012dc:	e42a                	sd	a0,8(sp)
    800012de:	ec02                	sd	zero,24(sp)
    800012e0:	a80d                	j	80001312 <vQueueUnregisterQueue+0x38>
    800012e2:	0001f717          	auipc	a4,0x1f
    800012e6:	21670713          	addi	a4,a4,534 # 800204f8 <xQueueRegistry>
    800012ea:	67e2                	ld	a5,24(sp)
    800012ec:	0792                	slli	a5,a5,0x4
    800012ee:	97ba                	add	a5,a5,a4
    800012f0:	679c                	ld	a5,8(a5)
    800012f2:	6722                	ld	a4,8(sp)
    800012f4:	00f71c63          	bne	a4,a5,8000130c <vQueueUnregisterQueue+0x32>
    800012f8:	0001f717          	auipc	a4,0x1f
    800012fc:	20070713          	addi	a4,a4,512 # 800204f8 <xQueueRegistry>
    80001300:	67e2                	ld	a5,24(sp)
    80001302:	0792                	slli	a5,a5,0x4
    80001304:	97ba                	add	a5,a5,a4
    80001306:	0007b023          	sd	zero,0(a5)
    8000130a:	a809                	j	8000131c <vQueueUnregisterQueue+0x42>
    8000130c:	67e2                	ld	a5,24(sp)
    8000130e:	0785                	addi	a5,a5,1
    80001310:	ec3e                	sd	a5,24(sp)
    80001312:	6762                	ld	a4,24(sp)
    80001314:	479d                	li	a5,7
    80001316:	fce7f6e3          	bgeu	a5,a4,800012e2 <vQueueUnregisterQueue+0x8>
    8000131a:	0001                	nop
    8000131c:	0001                	nop
    8000131e:	6105                	addi	sp,sp,32
    80001320:	8082                	ret

0000000080001322 <vQueueWaitForMessageRestricted>:
    80001322:	7139                	addi	sp,sp,-64
    80001324:	fc06                	sd	ra,56(sp)
    80001326:	ec2a                	sd	a0,24(sp)
    80001328:	87ae                	mv	a5,a1
    8000132a:	e432                	sd	a2,8(sp)
    8000132c:	ca3e                	sw	a5,20(sp)
    8000132e:	67e2                	ld	a5,24(sp)
    80001330:	f43e                	sd	a5,40(sp)
    80001332:	301010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001336:	77a2                	ld	a5,40(sp)
    80001338:	67d8                	ld	a4,136(a5)
    8000133a:	57fd                	li	a5,-1
    8000133c:	00f71563          	bne	a4,a5,80001346 <vQueueWaitForMessageRestricted+0x24>
    80001340:	77a2                	ld	a5,40(sp)
    80001342:	0807b423          	sd	zero,136(a5)
    80001346:	77a2                	ld	a5,40(sp)
    80001348:	6bd8                	ld	a4,144(a5)
    8000134a:	57fd                	li	a5,-1
    8000134c:	00f71563          	bne	a4,a5,80001356 <vQueueWaitForMessageRestricted+0x34>
    80001350:	77a2                	ld	a5,40(sp)
    80001352:	0807b823          	sd	zero,144(a5)
    80001356:	30b010ef          	jal	ra,80002e60 <vTaskExitCritical>
    8000135a:	77a2                	ld	a5,40(sp)
    8000135c:	7bbc                	ld	a5,112(a5)
    8000135e:	eb91                	bnez	a5,80001372 <vQueueWaitForMessageRestricted+0x50>
    80001360:	77a2                	ld	a5,40(sp)
    80001362:	04878793          	addi	a5,a5,72
    80001366:	4752                	lw	a4,20(sp)
    80001368:	6622                	ld	a2,8(sp)
    8000136a:	85ba                	mv	a1,a4
    8000136c:	853e                	mv	a0,a5
    8000136e:	098010ef          	jal	ra,80002406 <vTaskPlaceOnEventListRestricted>
    80001372:	7522                	ld	a0,40(sp)
    80001374:	dddff0ef          	jal	ra,80001150 <prvUnlockQueue>
    80001378:	0001                	nop
    8000137a:	70e2                	ld	ra,56(sp)
    8000137c:	6121                	addi	sp,sp,64
    8000137e:	8082                	ret

0000000080001380 <xTaskGenericCreate>:
    80001380:	7159                	addi	sp,sp,-112
    80001382:	f486                	sd	ra,104(sp)
    80001384:	fc2a                	sd	a0,56(sp)
    80001386:	f82e                	sd	a1,48(sp)
    80001388:	f036                	sd	a3,32(sp)
    8000138a:	ec3a                	sd	a4,24(sp)
    8000138c:	e83e                	sd	a5,16(sp)
    8000138e:	e442                	sd	a6,8(sp)
    80001390:	e046                	sd	a7,0(sp)
    80001392:	87b2                	mv	a5,a2
    80001394:	02f11723          	sh	a5,46(sp)
    80001398:	77e2                	ld	a5,56(sp)
    8000139a:	e781                	bnez	a5,800013a2 <xTaskGenericCreate+0x22>
    8000139c:	30047073          	csrci	mstatus,8
    800013a0:	a001                	j	800013a0 <xTaskGenericCreate+0x20>
    800013a2:	6762                	ld	a4,24(sp)
    800013a4:	4791                	li	a5,4
    800013a6:	00e7f563          	bgeu	a5,a4,800013b0 <xTaskGenericCreate+0x30>
    800013aa:	30047073          	csrci	mstatus,8
    800013ae:	a001                	j	800013ae <xTaskGenericCreate+0x2e>
    800013b0:	02e15783          	lhu	a5,46(sp)
    800013b4:	65a2                	ld	a1,8(sp)
    800013b6:	853e                	mv	a0,a5
    800013b8:	616010ef          	jal	ra,800029ce <prvAllocateTCBAndStack>
    800013bc:	e8aa                	sd	a0,80(sp)
    800013be:	67c6                	ld	a5,80(sp)
    800013c0:	12078c63          	beqz	a5,800014f8 <xTaskGenericCreate+0x178>
    800013c4:	67c6                	ld	a5,80(sp)
    800013c6:	73b8                	ld	a4,96(a5)
    800013c8:	02e15783          	lhu	a5,46(sp)
    800013cc:	078e                	slli	a5,a5,0x3
    800013ce:	17e1                	addi	a5,a5,-8
    800013d0:	97ba                	add	a5,a5,a4
    800013d2:	e4be                	sd	a5,72(sp)
    800013d4:	67a6                	ld	a5,72(sp)
    800013d6:	9be1                	andi	a5,a5,-8
    800013d8:	e4be                	sd	a5,72(sp)
    800013da:	67a6                	ld	a5,72(sp)
    800013dc:	8b9d                	andi	a5,a5,7
    800013de:	c781                	beqz	a5,800013e6 <xTaskGenericCreate+0x66>
    800013e0:	30047073          	csrci	mstatus,8
    800013e4:	a001                	j	800013e4 <xTaskGenericCreate+0x64>
    800013e6:	02e15783          	lhu	a5,46(sp)
    800013ea:	873e                	mv	a4,a5
    800013ec:	6682                	ld	a3,0(sp)
    800013ee:	6662                	ld	a2,24(sp)
    800013f0:	75c2                	ld	a1,48(sp)
    800013f2:	6546                	ld	a0,80(sp)
    800013f4:	362010ef          	jal	ra,80002756 <prvInitialiseTCBVariables>
    800013f8:	7602                	ld	a2,32(sp)
    800013fa:	75e2                	ld	a1,56(sp)
    800013fc:	6526                	ld	a0,72(sp)
    800013fe:	950ff0ef          	jal	ra,8000054e <pxPortInitialiseStack>
    80001402:	872a                	mv	a4,a0
    80001404:	67c6                	ld	a5,80(sp)
    80001406:	e398                	sd	a4,0(a5)
    80001408:	67c2                	ld	a5,16(sp)
    8000140a:	c781                	beqz	a5,80001412 <xTaskGenericCreate+0x92>
    8000140c:	67c2                	ld	a5,16(sp)
    8000140e:	6746                	ld	a4,80(sp)
    80001410:	e398                	sd	a4,0(a5)
    80001412:	221010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001416:	0001f797          	auipc	a5,0x1f
    8000141a:	30a78793          	addi	a5,a5,778 # 80020720 <uxCurrentNumberOfTasks>
    8000141e:	639c                	ld	a5,0(a5)
    80001420:	00178713          	addi	a4,a5,1
    80001424:	0001f797          	auipc	a5,0x1f
    80001428:	2fc78793          	addi	a5,a5,764 # 80020720 <uxCurrentNumberOfTasks>
    8000142c:	e398                	sd	a4,0(a5)
    8000142e:	0001f797          	auipc	a5,0x1f
    80001432:	f1278793          	addi	a5,a5,-238 # 80020340 <pxCurrentTCB>
    80001436:	639c                	ld	a5,0(a5)
    80001438:	e395                	bnez	a5,8000145c <xTaskGenericCreate+0xdc>
    8000143a:	0001f797          	auipc	a5,0x1f
    8000143e:	f0678793          	addi	a5,a5,-250 # 80020340 <pxCurrentTCB>
    80001442:	6746                	ld	a4,80(sp)
    80001444:	e398                	sd	a4,0(a5)
    80001446:	0001f797          	auipc	a5,0x1f
    8000144a:	2da78793          	addi	a5,a5,730 # 80020720 <uxCurrentNumberOfTasks>
    8000144e:	6398                	ld	a4,0(a5)
    80001450:	4785                	li	a5,1
    80001452:	02f71a63          	bne	a4,a5,80001486 <xTaskGenericCreate+0x106>
    80001456:	3ba010ef          	jal	ra,80002810 <prvInitialiseTaskLists>
    8000145a:	a035                	j	80001486 <xTaskGenericCreate+0x106>
    8000145c:	0001f797          	auipc	a5,0x1f
    80001460:	2dc78793          	addi	a5,a5,732 # 80020738 <xSchedulerRunning>
    80001464:	639c                	ld	a5,0(a5)
    80001466:	e385                	bnez	a5,80001486 <xTaskGenericCreate+0x106>
    80001468:	0001f797          	auipc	a5,0x1f
    8000146c:	ed878793          	addi	a5,a5,-296 # 80020340 <pxCurrentTCB>
    80001470:	639c                	ld	a5,0(a5)
    80001472:	6fbc                	ld	a5,88(a5)
    80001474:	6762                	ld	a4,24(sp)
    80001476:	00f76863          	bltu	a4,a5,80001486 <xTaskGenericCreate+0x106>
    8000147a:	0001f797          	auipc	a5,0x1f
    8000147e:	ec678793          	addi	a5,a5,-314 # 80020340 <pxCurrentTCB>
    80001482:	6746                	ld	a4,80(sp)
    80001484:	e398                	sd	a4,0(a5)
    80001486:	0001f797          	auipc	a5,0x1f
    8000148a:	2d278793          	addi	a5,a5,722 # 80020758 <uxTaskNumber>
    8000148e:	639c                	ld	a5,0(a5)
    80001490:	00178713          	addi	a4,a5,1
    80001494:	0001f797          	auipc	a5,0x1f
    80001498:	2c478793          	addi	a5,a5,708 # 80020758 <uxTaskNumber>
    8000149c:	e398                	sd	a4,0(a5)
    8000149e:	0001f797          	auipc	a5,0x1f
    800014a2:	2ba78793          	addi	a5,a5,698 # 80020758 <uxTaskNumber>
    800014a6:	6398                	ld	a4,0(a5)
    800014a8:	67c6                	ld	a5,80(sp)
    800014aa:	e3d8                	sd	a4,128(a5)
    800014ac:	67c6                	ld	a5,80(sp)
    800014ae:	6fb8                	ld	a4,88(a5)
    800014b0:	0001f797          	auipc	a5,0x1f
    800014b4:	28078793          	addi	a5,a5,640 # 80020730 <uxTopReadyPriority>
    800014b8:	639c                	ld	a5,0(a5)
    800014ba:	00e7f963          	bgeu	a5,a4,800014cc <xTaskGenericCreate+0x14c>
    800014be:	67c6                	ld	a5,80(sp)
    800014c0:	6fb8                	ld	a4,88(a5)
    800014c2:	0001f797          	auipc	a5,0x1f
    800014c6:	26e78793          	addi	a5,a5,622 # 80020730 <uxTopReadyPriority>
    800014ca:	e398                	sd	a4,0(a5)
    800014cc:	67c6                	ld	a5,80(sp)
    800014ce:	6fb8                	ld	a4,88(a5)
    800014d0:	87ba                	mv	a5,a4
    800014d2:	078a                	slli	a5,a5,0x2
    800014d4:	97ba                	add	a5,a5,a4
    800014d6:	078e                	slli	a5,a5,0x3
    800014d8:	0001f717          	auipc	a4,0x1f
    800014dc:	0a070713          	addi	a4,a4,160 # 80020578 <pxReadyTasksLists>
    800014e0:	973e                	add	a4,a4,a5
    800014e2:	67c6                	ld	a5,80(sp)
    800014e4:	07a1                	addi	a5,a5,8
    800014e6:	85be                	mv	a1,a5
    800014e8:	853a                	mv	a0,a4
    800014ea:	910ff0ef          	jal	ra,800005fa <vListInsertEnd>
    800014ee:	4785                	li	a5,1
    800014f0:	ecbe                	sd	a5,88(sp)
    800014f2:	16f010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800014f6:	a019                	j	800014fc <xTaskGenericCreate+0x17c>
    800014f8:	57fd                	li	a5,-1
    800014fa:	ecbe                	sd	a5,88(sp)
    800014fc:	6766                	ld	a4,88(sp)
    800014fe:	4785                	li	a5,1
    80001500:	02f71363          	bne	a4,a5,80001526 <xTaskGenericCreate+0x1a6>
    80001504:	0001f797          	auipc	a5,0x1f
    80001508:	23478793          	addi	a5,a5,564 # 80020738 <xSchedulerRunning>
    8000150c:	639c                	ld	a5,0(a5)
    8000150e:	cf81                	beqz	a5,80001526 <xTaskGenericCreate+0x1a6>
    80001510:	0001f797          	auipc	a5,0x1f
    80001514:	e3078793          	addi	a5,a5,-464 # 80020340 <pxCurrentTCB>
    80001518:	639c                	ld	a5,0(a5)
    8000151a:	6fbc                	ld	a5,88(a5)
    8000151c:	6762                	ld	a4,24(sp)
    8000151e:	00e7f463          	bgeu	a5,a4,80001526 <xTaskGenericCreate+0x1a6>
    80001522:	eebfe0ef          	jal	ra,8000040c <vPortYield>
    80001526:	67e6                	ld	a5,88(sp)
    80001528:	853e                	mv	a0,a5
    8000152a:	70a6                	ld	ra,104(sp)
    8000152c:	6165                	addi	sp,sp,112
    8000152e:	8082                	ret

0000000080001530 <vTaskDelete>:
    80001530:	7179                	addi	sp,sp,-48
    80001532:	f406                	sd	ra,40(sp)
    80001534:	e42a                	sd	a0,8(sp)
    80001536:	0fd010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    8000153a:	67a2                	ld	a5,8(sp)
    8000153c:	e799                	bnez	a5,8000154a <vTaskDelete+0x1a>
    8000153e:	0001f797          	auipc	a5,0x1f
    80001542:	e0278793          	addi	a5,a5,-510 # 80020340 <pxCurrentTCB>
    80001546:	639c                	ld	a5,0(a5)
    80001548:	a011                	j	8000154c <vTaskDelete+0x1c>
    8000154a:	67a2                	ld	a5,8(sp)
    8000154c:	ec3e                	sd	a5,24(sp)
    8000154e:	67e2                	ld	a5,24(sp)
    80001550:	07a1                	addi	a5,a5,8
    80001552:	853e                	mv	a0,a5
    80001554:	956ff0ef          	jal	ra,800006aa <uxListRemove>
    80001558:	67e2                	ld	a5,24(sp)
    8000155a:	6bbc                	ld	a5,80(a5)
    8000155c:	c799                	beqz	a5,8000156a <vTaskDelete+0x3a>
    8000155e:	67e2                	ld	a5,24(sp)
    80001560:	03078793          	addi	a5,a5,48
    80001564:	853e                	mv	a0,a5
    80001566:	944ff0ef          	jal	ra,800006aa <uxListRemove>
    8000156a:	67e2                	ld	a5,24(sp)
    8000156c:	07a1                	addi	a5,a5,8
    8000156e:	85be                	mv	a1,a5
    80001570:	0001f517          	auipc	a0,0x1f
    80001574:	15850513          	addi	a0,a0,344 # 800206c8 <xTasksWaitingTermination>
    80001578:	882ff0ef          	jal	ra,800005fa <vListInsertEnd>
    8000157c:	0001f797          	auipc	a5,0x1f
    80001580:	17478793          	addi	a5,a5,372 # 800206f0 <uxTasksDeleted>
    80001584:	639c                	ld	a5,0(a5)
    80001586:	00178713          	addi	a4,a5,1
    8000158a:	0001f797          	auipc	a5,0x1f
    8000158e:	16678793          	addi	a5,a5,358 # 800206f0 <uxTasksDeleted>
    80001592:	e398                	sd	a4,0(a5)
    80001594:	0001f797          	auipc	a5,0x1f
    80001598:	1c478793          	addi	a5,a5,452 # 80020758 <uxTaskNumber>
    8000159c:	639c                	ld	a5,0(a5)
    8000159e:	00178713          	addi	a4,a5,1
    800015a2:	0001f797          	auipc	a5,0x1f
    800015a6:	1b678793          	addi	a5,a5,438 # 80020758 <uxTaskNumber>
    800015aa:	e398                	sd	a4,0(a5)
    800015ac:	0b5010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800015b0:	0001f797          	auipc	a5,0x1f
    800015b4:	18878793          	addi	a5,a5,392 # 80020738 <xSchedulerRunning>
    800015b8:	639c                	ld	a5,0(a5)
    800015ba:	cb9d                	beqz	a5,800015f0 <vTaskDelete+0xc0>
    800015bc:	0001f797          	auipc	a5,0x1f
    800015c0:	d8478793          	addi	a5,a5,-636 # 80020340 <pxCurrentTCB>
    800015c4:	639c                	ld	a5,0(a5)
    800015c6:	6762                	ld	a4,24(sp)
    800015c8:	00f71e63          	bne	a4,a5,800015e4 <vTaskDelete+0xb4>
    800015cc:	0001f797          	auipc	a5,0x1f
    800015d0:	19c78793          	addi	a5,a5,412 # 80020768 <uxSchedulerSuspended>
    800015d4:	639c                	ld	a5,0(a5)
    800015d6:	c781                	beqz	a5,800015de <vTaskDelete+0xae>
    800015d8:	30047073          	csrci	mstatus,8
    800015dc:	a001                	j	800015dc <vTaskDelete+0xac>
    800015de:	e2ffe0ef          	jal	ra,8000040c <vPortYield>
    800015e2:	a039                	j	800015f0 <vTaskDelete+0xc0>
    800015e4:	04f010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    800015e8:	610010ef          	jal	ra,80002bf8 <prvResetNextTaskUnblockTime>
    800015ec:	075010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800015f0:	0001                	nop
    800015f2:	70a2                	ld	ra,40(sp)
    800015f4:	6145                	addi	sp,sp,48
    800015f6:	8082                	ret

00000000800015f8 <vTaskDelayUntil>:
    800015f8:	7139                	addi	sp,sp,-64
    800015fa:	fc06                	sd	ra,56(sp)
    800015fc:	e42a                	sd	a0,8(sp)
    800015fe:	87ae                	mv	a5,a1
    80001600:	c23e                	sw	a5,4(sp)
    80001602:	f402                	sd	zero,40(sp)
    80001604:	67a2                	ld	a5,8(sp)
    80001606:	e781                	bnez	a5,8000160e <vTaskDelayUntil+0x16>
    80001608:	30047073          	csrci	mstatus,8
    8000160c:	a001                	j	8000160c <vTaskDelayUntil+0x14>
    8000160e:	4792                	lw	a5,4(sp)
    80001610:	2781                	sext.w	a5,a5
    80001612:	e781                	bnez	a5,8000161a <vTaskDelayUntil+0x22>
    80001614:	30047073          	csrci	mstatus,8
    80001618:	a001                	j	80001618 <vTaskDelayUntil+0x20>
    8000161a:	0001f797          	auipc	a5,0x1f
    8000161e:	14e78793          	addi	a5,a5,334 # 80020768 <uxSchedulerSuspended>
    80001622:	639c                	ld	a5,0(a5)
    80001624:	c781                	beqz	a5,8000162c <vTaskDelayUntil+0x34>
    80001626:	30047073          	csrci	mstatus,8
    8000162a:	a001                	j	8000162a <vTaskDelayUntil+0x32>
    8000162c:	696000ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80001630:	0001f797          	auipc	a5,0x1f
    80001634:	0f878793          	addi	a5,a5,248 # 80020728 <xTickCount>
    80001638:	439c                	lw	a5,0(a5)
    8000163a:	d23e                	sw	a5,36(sp)
    8000163c:	67a2                	ld	a5,8(sp)
    8000163e:	439c                	lw	a5,0(a5)
    80001640:	4712                	lw	a4,4(sp)
    80001642:	9fb9                	addw	a5,a5,a4
    80001644:	d03e                	sw	a5,32(sp)
    80001646:	67a2                	ld	a5,8(sp)
    80001648:	4398                	lw	a4,0(a5)
    8000164a:	5792                	lw	a5,36(sp)
    8000164c:	2781                	sext.w	a5,a5
    8000164e:	02e7f263          	bgeu	a5,a4,80001672 <vTaskDelayUntil+0x7a>
    80001652:	67a2                	ld	a5,8(sp)
    80001654:	4398                	lw	a4,0(a5)
    80001656:	5782                	lw	a5,32(sp)
    80001658:	2781                	sext.w	a5,a5
    8000165a:	02e7fb63          	bgeu	a5,a4,80001690 <vTaskDelayUntil+0x98>
    8000165e:	5782                	lw	a5,32(sp)
    80001660:	873e                	mv	a4,a5
    80001662:	5792                	lw	a5,36(sp)
    80001664:	2701                	sext.w	a4,a4
    80001666:	2781                	sext.w	a5,a5
    80001668:	02e7f463          	bgeu	a5,a4,80001690 <vTaskDelayUntil+0x98>
    8000166c:	4785                	li	a5,1
    8000166e:	f43e                	sd	a5,40(sp)
    80001670:	a005                	j	80001690 <vTaskDelayUntil+0x98>
    80001672:	67a2                	ld	a5,8(sp)
    80001674:	4398                	lw	a4,0(a5)
    80001676:	5782                	lw	a5,32(sp)
    80001678:	2781                	sext.w	a5,a5
    8000167a:	00e7e963          	bltu	a5,a4,8000168c <vTaskDelayUntil+0x94>
    8000167e:	5782                	lw	a5,32(sp)
    80001680:	873e                	mv	a4,a5
    80001682:	5792                	lw	a5,36(sp)
    80001684:	2701                	sext.w	a4,a4
    80001686:	2781                	sext.w	a5,a5
    80001688:	00e7f463          	bgeu	a5,a4,80001690 <vTaskDelayUntil+0x98>
    8000168c:	4785                	li	a5,1
    8000168e:	f43e                	sd	a5,40(sp)
    80001690:	67a2                	ld	a5,8(sp)
    80001692:	5702                	lw	a4,32(sp)
    80001694:	c398                	sw	a4,0(a5)
    80001696:	77a2                	ld	a5,40(sp)
    80001698:	cf91                	beqz	a5,800016b4 <vTaskDelayUntil+0xbc>
    8000169a:	0001f797          	auipc	a5,0x1f
    8000169e:	ca678793          	addi	a5,a5,-858 # 80020340 <pxCurrentTCB>
    800016a2:	639c                	ld	a5,0(a5)
    800016a4:	07a1                	addi	a5,a5,8
    800016a6:	853e                	mv	a0,a5
    800016a8:	802ff0ef          	jal	ra,800006aa <uxListRemove>
    800016ac:	5782                	lw	a5,32(sp)
    800016ae:	853e                	mv	a0,a5
    800016b0:	28a010ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    800016b4:	62a000ef          	jal	ra,80001cde <xTaskResumeAll>
    800016b8:	ec2a                	sd	a0,24(sp)
    800016ba:	67e2                	ld	a5,24(sp)
    800016bc:	e399                	bnez	a5,800016c2 <vTaskDelayUntil+0xca>
    800016be:	d4ffe0ef          	jal	ra,8000040c <vPortYield>
    800016c2:	0001                	nop
    800016c4:	70e2                	ld	ra,56(sp)
    800016c6:	6121                	addi	sp,sp,64
    800016c8:	8082                	ret

00000000800016ca <vTaskDelay>:
    800016ca:	7179                	addi	sp,sp,-48
    800016cc:	f406                	sd	ra,40(sp)
    800016ce:	87aa                	mv	a5,a0
    800016d0:	c63e                	sw	a5,12(sp)
    800016d2:	ec02                	sd	zero,24(sp)
    800016d4:	47b2                	lw	a5,12(sp)
    800016d6:	2781                	sext.w	a5,a5
    800016d8:	c7a9                	beqz	a5,80001722 <vTaskDelay+0x58>
    800016da:	0001f797          	auipc	a5,0x1f
    800016de:	08e78793          	addi	a5,a5,142 # 80020768 <uxSchedulerSuspended>
    800016e2:	639c                	ld	a5,0(a5)
    800016e4:	c781                	beqz	a5,800016ec <vTaskDelay+0x22>
    800016e6:	30047073          	csrci	mstatus,8
    800016ea:	a001                	j	800016ea <vTaskDelay+0x20>
    800016ec:	5d6000ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    800016f0:	0001f797          	auipc	a5,0x1f
    800016f4:	03878793          	addi	a5,a5,56 # 80020728 <xTickCount>
    800016f8:	439c                	lw	a5,0(a5)
    800016fa:	2781                	sext.w	a5,a5
    800016fc:	4732                	lw	a4,12(sp)
    800016fe:	9fb9                	addw	a5,a5,a4
    80001700:	ca3e                	sw	a5,20(sp)
    80001702:	0001f797          	auipc	a5,0x1f
    80001706:	c3e78793          	addi	a5,a5,-962 # 80020340 <pxCurrentTCB>
    8000170a:	639c                	ld	a5,0(a5)
    8000170c:	07a1                	addi	a5,a5,8
    8000170e:	853e                	mv	a0,a5
    80001710:	f9bfe0ef          	jal	ra,800006aa <uxListRemove>
    80001714:	47d2                	lw	a5,20(sp)
    80001716:	853e                	mv	a0,a5
    80001718:	222010ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    8000171c:	5c2000ef          	jal	ra,80001cde <xTaskResumeAll>
    80001720:	ec2a                	sd	a0,24(sp)
    80001722:	67e2                	ld	a5,24(sp)
    80001724:	e399                	bnez	a5,8000172a <vTaskDelay+0x60>
    80001726:	ce7fe0ef          	jal	ra,8000040c <vPortYield>
    8000172a:	0001                	nop
    8000172c:	70a2                	ld	ra,40(sp)
    8000172e:	6145                	addi	sp,sp,48
    80001730:	8082                	ret

0000000080001732 <eTaskGetState>:
    80001732:	7139                	addi	sp,sp,-64
    80001734:	fc06                	sd	ra,56(sp)
    80001736:	e42a                	sd	a0,8(sp)
    80001738:	67a2                	ld	a5,8(sp)
    8000173a:	f03e                	sd	a5,32(sp)
    8000173c:	7782                	ld	a5,32(sp)
    8000173e:	e781                	bnez	a5,80001746 <eTaskGetState+0x14>
    80001740:	30047073          	csrci	mstatus,8
    80001744:	a001                	j	80001744 <eTaskGetState+0x12>
    80001746:	0001f797          	auipc	a5,0x1f
    8000174a:	bfa78793          	addi	a5,a5,-1030 # 80020340 <pxCurrentTCB>
    8000174e:	639c                	ld	a5,0(a5)
    80001750:	7702                	ld	a4,32(sp)
    80001752:	00f71463          	bne	a4,a5,8000175a <eTaskGetState+0x28>
    80001756:	d602                	sw	zero,44(sp)
    80001758:	a0bd                	j	800017c6 <eTaskGetState+0x94>
    8000175a:	6d8010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    8000175e:	7782                	ld	a5,32(sp)
    80001760:	779c                	ld	a5,40(a5)
    80001762:	ec3e                	sd	a5,24(sp)
    80001764:	6fc010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001768:	0001f797          	auipc	a5,0x1f
    8000176c:	f2878793          	addi	a5,a5,-216 # 80020690 <pxDelayedTaskList>
    80001770:	639c                	ld	a5,0(a5)
    80001772:	6762                	ld	a4,24(sp)
    80001774:	00f70a63          	beq	a4,a5,80001788 <eTaskGetState+0x56>
    80001778:	0001f797          	auipc	a5,0x1f
    8000177c:	f2078793          	addi	a5,a5,-224 # 80020698 <pxOverflowDelayedTaskList>
    80001780:	639c                	ld	a5,0(a5)
    80001782:	6762                	ld	a4,24(sp)
    80001784:	00f71563          	bne	a4,a5,8000178e <eTaskGetState+0x5c>
    80001788:	4789                	li	a5,2
    8000178a:	d63e                	sw	a5,44(sp)
    8000178c:	a82d                	j	800017c6 <eTaskGetState+0x94>
    8000178e:	6762                	ld	a4,24(sp)
    80001790:	0001f797          	auipc	a5,0x1f
    80001794:	f6878793          	addi	a5,a5,-152 # 800206f8 <xSuspendedTaskList>
    80001798:	00f71b63          	bne	a4,a5,800017ae <eTaskGetState+0x7c>
    8000179c:	7782                	ld	a5,32(sp)
    8000179e:	6bbc                	ld	a5,80(a5)
    800017a0:	e781                	bnez	a5,800017a8 <eTaskGetState+0x76>
    800017a2:	478d                	li	a5,3
    800017a4:	d63e                	sw	a5,44(sp)
    800017a6:	a005                	j	800017c6 <eTaskGetState+0x94>
    800017a8:	4789                	li	a5,2
    800017aa:	d63e                	sw	a5,44(sp)
    800017ac:	a829                	j	800017c6 <eTaskGetState+0x94>
    800017ae:	6762                	ld	a4,24(sp)
    800017b0:	0001f797          	auipc	a5,0x1f
    800017b4:	f1878793          	addi	a5,a5,-232 # 800206c8 <xTasksWaitingTermination>
    800017b8:	00f71563          	bne	a4,a5,800017c2 <eTaskGetState+0x90>
    800017bc:	4791                	li	a5,4
    800017be:	d63e                	sw	a5,44(sp)
    800017c0:	a019                	j	800017c6 <eTaskGetState+0x94>
    800017c2:	4785                	li	a5,1
    800017c4:	d63e                	sw	a5,44(sp)
    800017c6:	57b2                	lw	a5,44(sp)
    800017c8:	853e                	mv	a0,a5
    800017ca:	70e2                	ld	ra,56(sp)
    800017cc:	6121                	addi	sp,sp,64
    800017ce:	8082                	ret

00000000800017d0 <uxTaskPriorityGet>:
    800017d0:	7179                	addi	sp,sp,-48
    800017d2:	f406                	sd	ra,40(sp)
    800017d4:	e42a                	sd	a0,8(sp)
    800017d6:	65c010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    800017da:	67a2                	ld	a5,8(sp)
    800017dc:	e799                	bnez	a5,800017ea <uxTaskPriorityGet+0x1a>
    800017de:	0001f797          	auipc	a5,0x1f
    800017e2:	b6278793          	addi	a5,a5,-1182 # 80020340 <pxCurrentTCB>
    800017e6:	639c                	ld	a5,0(a5)
    800017e8:	a011                	j	800017ec <uxTaskPriorityGet+0x1c>
    800017ea:	67a2                	ld	a5,8(sp)
    800017ec:	ec3e                	sd	a5,24(sp)
    800017ee:	67e2                	ld	a5,24(sp)
    800017f0:	6fbc                	ld	a5,88(a5)
    800017f2:	e83e                	sd	a5,16(sp)
    800017f4:	66c010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800017f8:	67c2                	ld	a5,16(sp)
    800017fa:	853e                	mv	a0,a5
    800017fc:	70a2                	ld	ra,40(sp)
    800017fe:	6145                	addi	sp,sp,48
    80001800:	8082                	ret

0000000080001802 <uxTaskPriorityGetFromISR>:
    80001802:	7139                	addi	sp,sp,-64
    80001804:	fc06                	sd	ra,56(sp)
    80001806:	e42a                	sd	a0,8(sp)
    80001808:	d33fe0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    8000180c:	87aa                	mv	a5,a0
    8000180e:	f43e                	sd	a5,40(sp)
    80001810:	67a2                	ld	a5,8(sp)
    80001812:	e799                	bnez	a5,80001820 <uxTaskPriorityGetFromISR+0x1e>
    80001814:	0001f797          	auipc	a5,0x1f
    80001818:	b2c78793          	addi	a5,a5,-1236 # 80020340 <pxCurrentTCB>
    8000181c:	639c                	ld	a5,0(a5)
    8000181e:	a011                	j	80001822 <uxTaskPriorityGetFromISR+0x20>
    80001820:	67a2                	ld	a5,8(sp)
    80001822:	f03e                	sd	a5,32(sp)
    80001824:	7782                	ld	a5,32(sp)
    80001826:	6fbc                	ld	a5,88(a5)
    80001828:	ec3e                	sd	a5,24(sp)
    8000182a:	77a2                	ld	a5,40(sp)
    8000182c:	2781                	sext.w	a5,a5
    8000182e:	853e                	mv	a0,a5
    80001830:	cf9fe0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80001834:	67e2                	ld	a5,24(sp)
    80001836:	853e                	mv	a0,a5
    80001838:	70e2                	ld	ra,56(sp)
    8000183a:	6121                	addi	sp,sp,64
    8000183c:	8082                	ret

000000008000183e <vTaskPrioritySet>:
    8000183e:	7139                	addi	sp,sp,-64
    80001840:	fc06                	sd	ra,56(sp)
    80001842:	e42a                	sd	a0,8(sp)
    80001844:	e02e                	sd	a1,0(sp)
    80001846:	f402                	sd	zero,40(sp)
    80001848:	6702                	ld	a4,0(sp)
    8000184a:	4791                	li	a5,4
    8000184c:	00e7f563          	bgeu	a5,a4,80001856 <vTaskPrioritySet+0x18>
    80001850:	30047073          	csrci	mstatus,8
    80001854:	a001                	j	80001854 <vTaskPrioritySet+0x16>
    80001856:	6702                	ld	a4,0(sp)
    80001858:	4791                	li	a5,4
    8000185a:	00e7f463          	bgeu	a5,a4,80001862 <vTaskPrioritySet+0x24>
    8000185e:	4791                	li	a5,4
    80001860:	e03e                	sd	a5,0(sp)
    80001862:	5d0010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001866:	67a2                	ld	a5,8(sp)
    80001868:	e799                	bnez	a5,80001876 <vTaskPrioritySet+0x38>
    8000186a:	0001f797          	auipc	a5,0x1f
    8000186e:	ad678793          	addi	a5,a5,-1322 # 80020340 <pxCurrentTCB>
    80001872:	639c                	ld	a5,0(a5)
    80001874:	a011                	j	80001878 <vTaskPrioritySet+0x3a>
    80001876:	67a2                	ld	a5,8(sp)
    80001878:	f03e                	sd	a5,32(sp)
    8000187a:	7782                	ld	a5,32(sp)
    8000187c:	6bdc                	ld	a5,144(a5)
    8000187e:	ec3e                	sd	a5,24(sp)
    80001880:	6762                	ld	a4,24(sp)
    80001882:	6782                	ld	a5,0(sp)
    80001884:	0ef70f63          	beq	a4,a5,80001982 <vTaskPrioritySet+0x144>
    80001888:	6702                	ld	a4,0(sp)
    8000188a:	67e2                	ld	a5,24(sp)
    8000188c:	02e7f663          	bgeu	a5,a4,800018b8 <vTaskPrioritySet+0x7a>
    80001890:	0001f797          	auipc	a5,0x1f
    80001894:	ab078793          	addi	a5,a5,-1360 # 80020340 <pxCurrentTCB>
    80001898:	639c                	ld	a5,0(a5)
    8000189a:	7702                	ld	a4,32(sp)
    8000189c:	02f70863          	beq	a4,a5,800018cc <vTaskPrioritySet+0x8e>
    800018a0:	0001f797          	auipc	a5,0x1f
    800018a4:	aa078793          	addi	a5,a5,-1376 # 80020340 <pxCurrentTCB>
    800018a8:	639c                	ld	a5,0(a5)
    800018aa:	6fbc                	ld	a5,88(a5)
    800018ac:	6702                	ld	a4,0(sp)
    800018ae:	00f76f63          	bltu	a4,a5,800018cc <vTaskPrioritySet+0x8e>
    800018b2:	4785                	li	a5,1
    800018b4:	f43e                	sd	a5,40(sp)
    800018b6:	a819                	j	800018cc <vTaskPrioritySet+0x8e>
    800018b8:	0001f797          	auipc	a5,0x1f
    800018bc:	a8878793          	addi	a5,a5,-1400 # 80020340 <pxCurrentTCB>
    800018c0:	639c                	ld	a5,0(a5)
    800018c2:	7702                	ld	a4,32(sp)
    800018c4:	00f71463          	bne	a4,a5,800018cc <vTaskPrioritySet+0x8e>
    800018c8:	4785                	li	a5,1
    800018ca:	f43e                	sd	a5,40(sp)
    800018cc:	7782                	ld	a5,32(sp)
    800018ce:	6fbc                	ld	a5,88(a5)
    800018d0:	e83e                	sd	a5,16(sp)
    800018d2:	7782                	ld	a5,32(sp)
    800018d4:	6bd8                	ld	a4,144(a5)
    800018d6:	7782                	ld	a5,32(sp)
    800018d8:	6fbc                	ld	a5,88(a5)
    800018da:	00f71563          	bne	a4,a5,800018e4 <vTaskPrioritySet+0xa6>
    800018de:	7782                	ld	a5,32(sp)
    800018e0:	6702                	ld	a4,0(sp)
    800018e2:	efb8                	sd	a4,88(a5)
    800018e4:	7782                	ld	a5,32(sp)
    800018e6:	6702                	ld	a4,0(sp)
    800018e8:	ebd8                	sd	a4,144(a5)
    800018ea:	7782                	ld	a5,32(sp)
    800018ec:	5b9c                	lw	a5,48(a5)
    800018ee:	2781                	sext.w	a5,a5
    800018f0:	0007cb63          	bltz	a5,80001906 <vTaskPrioritySet+0xc8>
    800018f4:	6782                	ld	a5,0(sp)
    800018f6:	2781                	sext.w	a5,a5
    800018f8:	4715                	li	a4,5
    800018fa:	40f707bb          	subw	a5,a4,a5
    800018fe:	0007871b          	sext.w	a4,a5
    80001902:	7782                	ld	a5,32(sp)
    80001904:	db98                	sw	a4,48(a5)
    80001906:	7782                	ld	a5,32(sp)
    80001908:	7794                	ld	a3,40(a5)
    8000190a:	6742                	ld	a4,16(sp)
    8000190c:	87ba                	mv	a5,a4
    8000190e:	078a                	slli	a5,a5,0x2
    80001910:	97ba                	add	a5,a5,a4
    80001912:	078e                	slli	a5,a5,0x3
    80001914:	0001f717          	auipc	a4,0x1f
    80001918:	c6470713          	addi	a4,a4,-924 # 80020578 <pxReadyTasksLists>
    8000191c:	97ba                	add	a5,a5,a4
    8000191e:	00f69463          	bne	a3,a5,80001926 <vTaskPrioritySet+0xe8>
    80001922:	4785                	li	a5,1
    80001924:	a011                	j	80001928 <vTaskPrioritySet+0xea>
    80001926:	4781                	li	a5,0
    80001928:	c7b9                	beqz	a5,80001976 <vTaskPrioritySet+0x138>
    8000192a:	7782                	ld	a5,32(sp)
    8000192c:	07a1                	addi	a5,a5,8
    8000192e:	853e                	mv	a0,a5
    80001930:	d7bfe0ef          	jal	ra,800006aa <uxListRemove>
    80001934:	7782                	ld	a5,32(sp)
    80001936:	6fb8                	ld	a4,88(a5)
    80001938:	0001f797          	auipc	a5,0x1f
    8000193c:	df878793          	addi	a5,a5,-520 # 80020730 <uxTopReadyPriority>
    80001940:	639c                	ld	a5,0(a5)
    80001942:	00e7f963          	bgeu	a5,a4,80001954 <vTaskPrioritySet+0x116>
    80001946:	7782                	ld	a5,32(sp)
    80001948:	6fb8                	ld	a4,88(a5)
    8000194a:	0001f797          	auipc	a5,0x1f
    8000194e:	de678793          	addi	a5,a5,-538 # 80020730 <uxTopReadyPriority>
    80001952:	e398                	sd	a4,0(a5)
    80001954:	7782                	ld	a5,32(sp)
    80001956:	6fb8                	ld	a4,88(a5)
    80001958:	87ba                	mv	a5,a4
    8000195a:	078a                	slli	a5,a5,0x2
    8000195c:	97ba                	add	a5,a5,a4
    8000195e:	078e                	slli	a5,a5,0x3
    80001960:	0001f717          	auipc	a4,0x1f
    80001964:	c1870713          	addi	a4,a4,-1000 # 80020578 <pxReadyTasksLists>
    80001968:	973e                	add	a4,a4,a5
    8000196a:	7782                	ld	a5,32(sp)
    8000196c:	07a1                	addi	a5,a5,8
    8000196e:	85be                	mv	a1,a5
    80001970:	853a                	mv	a0,a4
    80001972:	c89fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80001976:	7722                	ld	a4,40(sp)
    80001978:	4785                	li	a5,1
    8000197a:	00f71463          	bne	a4,a5,80001982 <vTaskPrioritySet+0x144>
    8000197e:	a8ffe0ef          	jal	ra,8000040c <vPortYield>
    80001982:	4de010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001986:	0001                	nop
    80001988:	70e2                	ld	ra,56(sp)
    8000198a:	6121                	addi	sp,sp,64
    8000198c:	8082                	ret

000000008000198e <vTaskSuspend>:
    8000198e:	7179                	addi	sp,sp,-48
    80001990:	f406                	sd	ra,40(sp)
    80001992:	e42a                	sd	a0,8(sp)
    80001994:	49e010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001998:	67a2                	ld	a5,8(sp)
    8000199a:	e799                	bnez	a5,800019a8 <vTaskSuspend+0x1a>
    8000199c:	0001f797          	auipc	a5,0x1f
    800019a0:	9a478793          	addi	a5,a5,-1628 # 80020340 <pxCurrentTCB>
    800019a4:	639c                	ld	a5,0(a5)
    800019a6:	a011                	j	800019aa <vTaskSuspend+0x1c>
    800019a8:	67a2                	ld	a5,8(sp)
    800019aa:	ec3e                	sd	a5,24(sp)
    800019ac:	67e2                	ld	a5,24(sp)
    800019ae:	07a1                	addi	a5,a5,8
    800019b0:	853e                	mv	a0,a5
    800019b2:	cf9fe0ef          	jal	ra,800006aa <uxListRemove>
    800019b6:	67e2                	ld	a5,24(sp)
    800019b8:	6bbc                	ld	a5,80(a5)
    800019ba:	c799                	beqz	a5,800019c8 <vTaskSuspend+0x3a>
    800019bc:	67e2                	ld	a5,24(sp)
    800019be:	03078793          	addi	a5,a5,48
    800019c2:	853e                	mv	a0,a5
    800019c4:	ce7fe0ef          	jal	ra,800006aa <uxListRemove>
    800019c8:	67e2                	ld	a5,24(sp)
    800019ca:	07a1                	addi	a5,a5,8
    800019cc:	85be                	mv	a1,a5
    800019ce:	0001f517          	auipc	a0,0x1f
    800019d2:	d2a50513          	addi	a0,a0,-726 # 800206f8 <xSuspendedTaskList>
    800019d6:	c25fe0ef          	jal	ra,800005fa <vListInsertEnd>
    800019da:	486010ef          	jal	ra,80002e60 <vTaskExitCritical>
    800019de:	0001f797          	auipc	a5,0x1f
    800019e2:	96278793          	addi	a5,a5,-1694 # 80020340 <pxCurrentTCB>
    800019e6:	639c                	ld	a5,0(a5)
    800019e8:	6762                	ld	a4,24(sp)
    800019ea:	04f71a63          	bne	a4,a5,80001a3e <vTaskSuspend+0xb0>
    800019ee:	0001f797          	auipc	a5,0x1f
    800019f2:	d4a78793          	addi	a5,a5,-694 # 80020738 <xSchedulerRunning>
    800019f6:	639c                	ld	a5,0(a5)
    800019f8:	cf89                	beqz	a5,80001a12 <vTaskSuspend+0x84>
    800019fa:	0001f797          	auipc	a5,0x1f
    800019fe:	d6e78793          	addi	a5,a5,-658 # 80020768 <uxSchedulerSuspended>
    80001a02:	639c                	ld	a5,0(a5)
    80001a04:	c781                	beqz	a5,80001a0c <vTaskSuspend+0x7e>
    80001a06:	30047073          	csrci	mstatus,8
    80001a0a:	a001                	j	80001a0a <vTaskSuspend+0x7c>
    80001a0c:	a01fe0ef          	jal	ra,8000040c <vPortYield>
    80001a10:	a099                	j	80001a56 <vTaskSuspend+0xc8>
    80001a12:	0001f797          	auipc	a5,0x1f
    80001a16:	ce678793          	addi	a5,a5,-794 # 800206f8 <xSuspendedTaskList>
    80001a1a:	6398                	ld	a4,0(a5)
    80001a1c:	0001f797          	auipc	a5,0x1f
    80001a20:	d0478793          	addi	a5,a5,-764 # 80020720 <uxCurrentNumberOfTasks>
    80001a24:	639c                	ld	a5,0(a5)
    80001a26:	00f71963          	bne	a4,a5,80001a38 <vTaskSuspend+0xaa>
    80001a2a:	0001f797          	auipc	a5,0x1f
    80001a2e:	91678793          	addi	a5,a5,-1770 # 80020340 <pxCurrentTCB>
    80001a32:	0007b023          	sd	zero,0(a5)
    80001a36:	a005                	j	80001a56 <vTaskSuspend+0xc8>
    80001a38:	758000ef          	jal	ra,80002190 <vTaskSwitchContext>
    80001a3c:	a829                	j	80001a56 <vTaskSuspend+0xc8>
    80001a3e:	0001f797          	auipc	a5,0x1f
    80001a42:	cfa78793          	addi	a5,a5,-774 # 80020738 <xSchedulerRunning>
    80001a46:	639c                	ld	a5,0(a5)
    80001a48:	c799                	beqz	a5,80001a56 <vTaskSuspend+0xc8>
    80001a4a:	3e8010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001a4e:	1aa010ef          	jal	ra,80002bf8 <prvResetNextTaskUnblockTime>
    80001a52:	40e010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001a56:	0001                	nop
    80001a58:	70a2                	ld	ra,40(sp)
    80001a5a:	6145                	addi	sp,sp,48
    80001a5c:	8082                	ret

0000000080001a5e <prvTaskIsTaskSuspended>:
    80001a5e:	1101                	addi	sp,sp,-32
    80001a60:	e42a                	sd	a0,8(sp)
    80001a62:	ec02                	sd	zero,24(sp)
    80001a64:	67a2                	ld	a5,8(sp)
    80001a66:	e83e                	sd	a5,16(sp)
    80001a68:	67a2                	ld	a5,8(sp)
    80001a6a:	e781                	bnez	a5,80001a72 <prvTaskIsTaskSuspended+0x14>
    80001a6c:	30047073          	csrci	mstatus,8
    80001a70:	a001                	j	80001a70 <prvTaskIsTaskSuspended+0x12>
    80001a72:	67c2                	ld	a5,16(sp)
    80001a74:	7798                	ld	a4,40(a5)
    80001a76:	0001f797          	auipc	a5,0x1f
    80001a7a:	c8278793          	addi	a5,a5,-894 # 800206f8 <xSuspendedTaskList>
    80001a7e:	00f71463          	bne	a4,a5,80001a86 <prvTaskIsTaskSuspended+0x28>
    80001a82:	4785                	li	a5,1
    80001a84:	a011                	j	80001a88 <prvTaskIsTaskSuspended+0x2a>
    80001a86:	4781                	li	a5,0
    80001a88:	c395                	beqz	a5,80001aac <prvTaskIsTaskSuspended+0x4e>
    80001a8a:	67c2                	ld	a5,16(sp)
    80001a8c:	6bb8                	ld	a4,80(a5)
    80001a8e:	0001f797          	auipc	a5,0x1f
    80001a92:	c1278793          	addi	a5,a5,-1006 # 800206a0 <xPendingReadyList>
    80001a96:	00f70b63          	beq	a4,a5,80001aac <prvTaskIsTaskSuspended+0x4e>
    80001a9a:	67c2                	ld	a5,16(sp)
    80001a9c:	6bbc                	ld	a5,80(a5)
    80001a9e:	e399                	bnez	a5,80001aa4 <prvTaskIsTaskSuspended+0x46>
    80001aa0:	4785                	li	a5,1
    80001aa2:	a011                	j	80001aa6 <prvTaskIsTaskSuspended+0x48>
    80001aa4:	4781                	li	a5,0
    80001aa6:	c399                	beqz	a5,80001aac <prvTaskIsTaskSuspended+0x4e>
    80001aa8:	4785                	li	a5,1
    80001aaa:	ec3e                	sd	a5,24(sp)
    80001aac:	67e2                	ld	a5,24(sp)
    80001aae:	853e                	mv	a0,a5
    80001ab0:	6105                	addi	sp,sp,32
    80001ab2:	8082                	ret

0000000080001ab4 <vTaskResume>:
    80001ab4:	7179                	addi	sp,sp,-48
    80001ab6:	f406                	sd	ra,40(sp)
    80001ab8:	e42a                	sd	a0,8(sp)
    80001aba:	67a2                	ld	a5,8(sp)
    80001abc:	ec3e                	sd	a5,24(sp)
    80001abe:	67a2                	ld	a5,8(sp)
    80001ac0:	e781                	bnez	a5,80001ac8 <vTaskResume+0x14>
    80001ac2:	30047073          	csrci	mstatus,8
    80001ac6:	a001                	j	80001ac6 <vTaskResume+0x12>
    80001ac8:	67e2                	ld	a5,24(sp)
    80001aca:	c7d1                	beqz	a5,80001b56 <vTaskResume+0xa2>
    80001acc:	0001f797          	auipc	a5,0x1f
    80001ad0:	87478793          	addi	a5,a5,-1932 # 80020340 <pxCurrentTCB>
    80001ad4:	639c                	ld	a5,0(a5)
    80001ad6:	6762                	ld	a4,24(sp)
    80001ad8:	06f70f63          	beq	a4,a5,80001b56 <vTaskResume+0xa2>
    80001adc:	356010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001ae0:	6562                	ld	a0,24(sp)
    80001ae2:	f7dff0ef          	jal	ra,80001a5e <prvTaskIsTaskSuspended>
    80001ae6:	872a                	mv	a4,a0
    80001ae8:	4785                	li	a5,1
    80001aea:	06f71463          	bne	a4,a5,80001b52 <vTaskResume+0x9e>
    80001aee:	67e2                	ld	a5,24(sp)
    80001af0:	07a1                	addi	a5,a5,8
    80001af2:	853e                	mv	a0,a5
    80001af4:	bb7fe0ef          	jal	ra,800006aa <uxListRemove>
    80001af8:	67e2                	ld	a5,24(sp)
    80001afa:	6fb8                	ld	a4,88(a5)
    80001afc:	0001f797          	auipc	a5,0x1f
    80001b00:	c3478793          	addi	a5,a5,-972 # 80020730 <uxTopReadyPriority>
    80001b04:	639c                	ld	a5,0(a5)
    80001b06:	00e7f963          	bgeu	a5,a4,80001b18 <vTaskResume+0x64>
    80001b0a:	67e2                	ld	a5,24(sp)
    80001b0c:	6fb8                	ld	a4,88(a5)
    80001b0e:	0001f797          	auipc	a5,0x1f
    80001b12:	c2278793          	addi	a5,a5,-990 # 80020730 <uxTopReadyPriority>
    80001b16:	e398                	sd	a4,0(a5)
    80001b18:	67e2                	ld	a5,24(sp)
    80001b1a:	6fb8                	ld	a4,88(a5)
    80001b1c:	87ba                	mv	a5,a4
    80001b1e:	078a                	slli	a5,a5,0x2
    80001b20:	97ba                	add	a5,a5,a4
    80001b22:	078e                	slli	a5,a5,0x3
    80001b24:	0001f717          	auipc	a4,0x1f
    80001b28:	a5470713          	addi	a4,a4,-1452 # 80020578 <pxReadyTasksLists>
    80001b2c:	973e                	add	a4,a4,a5
    80001b2e:	67e2                	ld	a5,24(sp)
    80001b30:	07a1                	addi	a5,a5,8
    80001b32:	85be                	mv	a1,a5
    80001b34:	853a                	mv	a0,a4
    80001b36:	ac5fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80001b3a:	67e2                	ld	a5,24(sp)
    80001b3c:	6fb8                	ld	a4,88(a5)
    80001b3e:	0001f797          	auipc	a5,0x1f
    80001b42:	80278793          	addi	a5,a5,-2046 # 80020340 <pxCurrentTCB>
    80001b46:	639c                	ld	a5,0(a5)
    80001b48:	6fbc                	ld	a5,88(a5)
    80001b4a:	00f76463          	bltu	a4,a5,80001b52 <vTaskResume+0x9e>
    80001b4e:	8bffe0ef          	jal	ra,8000040c <vPortYield>
    80001b52:	30e010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001b56:	0001                	nop
    80001b58:	70a2                	ld	ra,40(sp)
    80001b5a:	6145                	addi	sp,sp,48
    80001b5c:	8082                	ret

0000000080001b5e <xTaskResumeFromISR>:
    80001b5e:	7139                	addi	sp,sp,-64
    80001b60:	fc06                	sd	ra,56(sp)
    80001b62:	e42a                	sd	a0,8(sp)
    80001b64:	f402                	sd	zero,40(sp)
    80001b66:	67a2                	ld	a5,8(sp)
    80001b68:	f03e                	sd	a5,32(sp)
    80001b6a:	67a2                	ld	a5,8(sp)
    80001b6c:	e781                	bnez	a5,80001b74 <xTaskResumeFromISR+0x16>
    80001b6e:	30047073          	csrci	mstatus,8
    80001b72:	a001                	j	80001b72 <xTaskResumeFromISR+0x14>
    80001b74:	9c7fe0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80001b78:	87aa                	mv	a5,a0
    80001b7a:	ec3e                	sd	a5,24(sp)
    80001b7c:	7502                	ld	a0,32(sp)
    80001b7e:	ee1ff0ef          	jal	ra,80001a5e <prvTaskIsTaskSuspended>
    80001b82:	872a                	mv	a4,a0
    80001b84:	4785                	li	a5,1
    80001b86:	08f71563          	bne	a4,a5,80001c10 <xTaskResumeFromISR+0xb2>
    80001b8a:	0001f797          	auipc	a5,0x1f
    80001b8e:	bde78793          	addi	a5,a5,-1058 # 80020768 <uxSchedulerSuspended>
    80001b92:	639c                	ld	a5,0(a5)
    80001b94:	e7a5                	bnez	a5,80001bfc <xTaskResumeFromISR+0x9e>
    80001b96:	7782                	ld	a5,32(sp)
    80001b98:	6fb8                	ld	a4,88(a5)
    80001b9a:	0001e797          	auipc	a5,0x1e
    80001b9e:	7a678793          	addi	a5,a5,1958 # 80020340 <pxCurrentTCB>
    80001ba2:	639c                	ld	a5,0(a5)
    80001ba4:	6fbc                	ld	a5,88(a5)
    80001ba6:	00f76463          	bltu	a4,a5,80001bae <xTaskResumeFromISR+0x50>
    80001baa:	4785                	li	a5,1
    80001bac:	f43e                	sd	a5,40(sp)
    80001bae:	7782                	ld	a5,32(sp)
    80001bb0:	07a1                	addi	a5,a5,8
    80001bb2:	853e                	mv	a0,a5
    80001bb4:	af7fe0ef          	jal	ra,800006aa <uxListRemove>
    80001bb8:	7782                	ld	a5,32(sp)
    80001bba:	6fb8                	ld	a4,88(a5)
    80001bbc:	0001f797          	auipc	a5,0x1f
    80001bc0:	b7478793          	addi	a5,a5,-1164 # 80020730 <uxTopReadyPriority>
    80001bc4:	639c                	ld	a5,0(a5)
    80001bc6:	00e7f963          	bgeu	a5,a4,80001bd8 <xTaskResumeFromISR+0x7a>
    80001bca:	7782                	ld	a5,32(sp)
    80001bcc:	6fb8                	ld	a4,88(a5)
    80001bce:	0001f797          	auipc	a5,0x1f
    80001bd2:	b6278793          	addi	a5,a5,-1182 # 80020730 <uxTopReadyPriority>
    80001bd6:	e398                	sd	a4,0(a5)
    80001bd8:	7782                	ld	a5,32(sp)
    80001bda:	6fb8                	ld	a4,88(a5)
    80001bdc:	87ba                	mv	a5,a4
    80001bde:	078a                	slli	a5,a5,0x2
    80001be0:	97ba                	add	a5,a5,a4
    80001be2:	078e                	slli	a5,a5,0x3
    80001be4:	0001f717          	auipc	a4,0x1f
    80001be8:	99470713          	addi	a4,a4,-1644 # 80020578 <pxReadyTasksLists>
    80001bec:	973e                	add	a4,a4,a5
    80001bee:	7782                	ld	a5,32(sp)
    80001bf0:	07a1                	addi	a5,a5,8
    80001bf2:	85be                	mv	a1,a5
    80001bf4:	853a                	mv	a0,a4
    80001bf6:	a05fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80001bfa:	a819                	j	80001c10 <xTaskResumeFromISR+0xb2>
    80001bfc:	7782                	ld	a5,32(sp)
    80001bfe:	03078793          	addi	a5,a5,48
    80001c02:	85be                	mv	a1,a5
    80001c04:	0001f517          	auipc	a0,0x1f
    80001c08:	a9c50513          	addi	a0,a0,-1380 # 800206a0 <xPendingReadyList>
    80001c0c:	9effe0ef          	jal	ra,800005fa <vListInsertEnd>
    80001c10:	67e2                	ld	a5,24(sp)
    80001c12:	2781                	sext.w	a5,a5
    80001c14:	853e                	mv	a0,a5
    80001c16:	913fe0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80001c1a:	77a2                	ld	a5,40(sp)
    80001c1c:	853e                	mv	a0,a5
    80001c1e:	70e2                	ld	ra,56(sp)
    80001c20:	6121                	addi	sp,sp,64
    80001c22:	8082                	ret

0000000080001c24 <vTaskStartScheduler>:
    80001c24:	1101                	addi	sp,sp,-32
    80001c26:	ec06                	sd	ra,24(sp)
    80001c28:	4881                	li	a7,0
    80001c2a:	4801                	li	a6,0
    80001c2c:	4781                	li	a5,0
    80001c2e:	4701                	li	a4,0
    80001c30:	4681                	li	a3,0
    80001c32:	40000613          	li	a2,1024
    80001c36:	0001e597          	auipc	a1,0x1e
    80001c3a:	3ca58593          	addi	a1,a1,970 # 80020000 <__rodata_start>
    80001c3e:	00001517          	auipc	a0,0x1
    80001c42:	af850513          	addi	a0,a0,-1288 # 80002736 <prvIdleTask>
    80001c46:	f3aff0ef          	jal	ra,80001380 <xTaskGenericCreate>
    80001c4a:	e42a                	sd	a0,8(sp)
    80001c4c:	6722                	ld	a4,8(sp)
    80001c4e:	4785                	li	a5,1
    80001c50:	00f71563          	bne	a4,a5,80001c5a <vTaskStartScheduler+0x36>
    80001c54:	10f010ef          	jal	ra,80003562 <xTimerCreateTimerTask>
    80001c58:	e42a                	sd	a0,8(sp)
    80001c5a:	6722                	ld	a4,8(sp)
    80001c5c:	4785                	li	a5,1
    80001c5e:	02f71963          	bne	a4,a5,80001c90 <vTaskStartScheduler+0x6c>
    80001c62:	30047073          	csrci	mstatus,8
    80001c66:	0001f797          	auipc	a5,0x1f
    80001c6a:	afa78793          	addi	a5,a5,-1286 # 80020760 <xNextTaskUnblockTime>
    80001c6e:	577d                	li	a4,-1
    80001c70:	c398                	sw	a4,0(a5)
    80001c72:	0001f797          	auipc	a5,0x1f
    80001c76:	ac678793          	addi	a5,a5,-1338 # 80020738 <xSchedulerRunning>
    80001c7a:	4705                	li	a4,1
    80001c7c:	e398                	sd	a4,0(a5)
    80001c7e:	0001f797          	auipc	a5,0x1f
    80001c82:	aaa78793          	addi	a5,a5,-1366 # 80020728 <xTickCount>
    80001c86:	0007a023          	sw	zero,0(a5)
    80001c8a:	e1afe0ef          	jal	ra,800002a4 <xPortStartScheduler>
    80001c8e:	a031                	j	80001c9a <vTaskStartScheduler+0x76>
    80001c90:	67a2                	ld	a5,8(sp)
    80001c92:	e781                	bnez	a5,80001c9a <vTaskStartScheduler+0x76>
    80001c94:	30047073          	csrci	mstatus,8
    80001c98:	a001                	j	80001c98 <vTaskStartScheduler+0x74>
    80001c9a:	0001                	nop
    80001c9c:	60e2                	ld	ra,24(sp)
    80001c9e:	6105                	addi	sp,sp,32
    80001ca0:	8082                	ret

0000000080001ca2 <vTaskEndScheduler>:
    80001ca2:	1141                	addi	sp,sp,-16
    80001ca4:	e406                	sd	ra,8(sp)
    80001ca6:	30047073          	csrci	mstatus,8
    80001caa:	0001f797          	auipc	a5,0x1f
    80001cae:	a8e78793          	addi	a5,a5,-1394 # 80020738 <xSchedulerRunning>
    80001cb2:	0007b023          	sd	zero,0(a5)
    80001cb6:	ed0fe0ef          	jal	ra,80000386 <vPortEndScheduler>
    80001cba:	0001                	nop
    80001cbc:	60a2                	ld	ra,8(sp)
    80001cbe:	0141                	addi	sp,sp,16
    80001cc0:	8082                	ret

0000000080001cc2 <vTaskSuspendAll>:
    80001cc2:	0001f797          	auipc	a5,0x1f
    80001cc6:	aa678793          	addi	a5,a5,-1370 # 80020768 <uxSchedulerSuspended>
    80001cca:	639c                	ld	a5,0(a5)
    80001ccc:	00178713          	addi	a4,a5,1
    80001cd0:	0001f797          	auipc	a5,0x1f
    80001cd4:	a9878793          	addi	a5,a5,-1384 # 80020768 <uxSchedulerSuspended>
    80001cd8:	e398                	sd	a4,0(a5)
    80001cda:	0001                	nop
    80001cdc:	8082                	ret

0000000080001cde <xTaskResumeAll>:
    80001cde:	1101                	addi	sp,sp,-32
    80001ce0:	ec06                	sd	ra,24(sp)
    80001ce2:	e402                	sd	zero,8(sp)
    80001ce4:	0001f797          	auipc	a5,0x1f
    80001ce8:	a8478793          	addi	a5,a5,-1404 # 80020768 <uxSchedulerSuspended>
    80001cec:	639c                	ld	a5,0(a5)
    80001cee:	e781                	bnez	a5,80001cf6 <xTaskResumeAll+0x18>
    80001cf0:	30047073          	csrci	mstatus,8
    80001cf4:	a001                	j	80001cf4 <xTaskResumeAll+0x16>
    80001cf6:	13c010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001cfa:	0001f797          	auipc	a5,0x1f
    80001cfe:	a6e78793          	addi	a5,a5,-1426 # 80020768 <uxSchedulerSuspended>
    80001d02:	639c                	ld	a5,0(a5)
    80001d04:	fff78713          	addi	a4,a5,-1
    80001d08:	0001f797          	auipc	a5,0x1f
    80001d0c:	a6078793          	addi	a5,a5,-1440 # 80020768 <uxSchedulerSuspended>
    80001d10:	e398                	sd	a4,0(a5)
    80001d12:	0001f797          	auipc	a5,0x1f
    80001d16:	a5678793          	addi	a5,a5,-1450 # 80020768 <uxSchedulerSuspended>
    80001d1a:	639c                	ld	a5,0(a5)
    80001d1c:	10079263          	bnez	a5,80001e20 <xTaskResumeAll+0x142>
    80001d20:	0001f797          	auipc	a5,0x1f
    80001d24:	a0078793          	addi	a5,a5,-1536 # 80020720 <uxCurrentNumberOfTasks>
    80001d28:	639c                	ld	a5,0(a5)
    80001d2a:	0e078b63          	beqz	a5,80001e20 <xTaskResumeAll+0x142>
    80001d2e:	a061                	j	80001db6 <xTaskResumeAll+0xd8>
    80001d30:	0001f797          	auipc	a5,0x1f
    80001d34:	97078793          	addi	a5,a5,-1680 # 800206a0 <xPendingReadyList>
    80001d38:	6f9c                	ld	a5,24(a5)
    80001d3a:	6f9c                	ld	a5,24(a5)
    80001d3c:	e03e                	sd	a5,0(sp)
    80001d3e:	6782                	ld	a5,0(sp)
    80001d40:	03078793          	addi	a5,a5,48
    80001d44:	853e                	mv	a0,a5
    80001d46:	965fe0ef          	jal	ra,800006aa <uxListRemove>
    80001d4a:	6782                	ld	a5,0(sp)
    80001d4c:	07a1                	addi	a5,a5,8
    80001d4e:	853e                	mv	a0,a5
    80001d50:	95bfe0ef          	jal	ra,800006aa <uxListRemove>
    80001d54:	6782                	ld	a5,0(sp)
    80001d56:	6fb8                	ld	a4,88(a5)
    80001d58:	0001f797          	auipc	a5,0x1f
    80001d5c:	9d878793          	addi	a5,a5,-1576 # 80020730 <uxTopReadyPriority>
    80001d60:	639c                	ld	a5,0(a5)
    80001d62:	00e7f963          	bgeu	a5,a4,80001d74 <xTaskResumeAll+0x96>
    80001d66:	6782                	ld	a5,0(sp)
    80001d68:	6fb8                	ld	a4,88(a5)
    80001d6a:	0001f797          	auipc	a5,0x1f
    80001d6e:	9c678793          	addi	a5,a5,-1594 # 80020730 <uxTopReadyPriority>
    80001d72:	e398                	sd	a4,0(a5)
    80001d74:	6782                	ld	a5,0(sp)
    80001d76:	6fb8                	ld	a4,88(a5)
    80001d78:	87ba                	mv	a5,a4
    80001d7a:	078a                	slli	a5,a5,0x2
    80001d7c:	97ba                	add	a5,a5,a4
    80001d7e:	078e                	slli	a5,a5,0x3
    80001d80:	0001e717          	auipc	a4,0x1e
    80001d84:	7f870713          	addi	a4,a4,2040 # 80020578 <pxReadyTasksLists>
    80001d88:	973e                	add	a4,a4,a5
    80001d8a:	6782                	ld	a5,0(sp)
    80001d8c:	07a1                	addi	a5,a5,8
    80001d8e:	85be                	mv	a1,a5
    80001d90:	853a                	mv	a0,a4
    80001d92:	869fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80001d96:	6782                	ld	a5,0(sp)
    80001d98:	6fb8                	ld	a4,88(a5)
    80001d9a:	0001e797          	auipc	a5,0x1e
    80001d9e:	5a678793          	addi	a5,a5,1446 # 80020340 <pxCurrentTCB>
    80001da2:	639c                	ld	a5,0(a5)
    80001da4:	6fbc                	ld	a5,88(a5)
    80001da6:	00f76863          	bltu	a4,a5,80001db6 <xTaskResumeAll+0xd8>
    80001daa:	0001f797          	auipc	a5,0x1f
    80001dae:	99e78793          	addi	a5,a5,-1634 # 80020748 <xYieldPending>
    80001db2:	4705                	li	a4,1
    80001db4:	e398                	sd	a4,0(a5)
    80001db6:	0001f797          	auipc	a5,0x1f
    80001dba:	8ea78793          	addi	a5,a5,-1814 # 800206a0 <xPendingReadyList>
    80001dbe:	639c                	ld	a5,0(a5)
    80001dc0:	fba5                	bnez	a5,80001d30 <xTaskResumeAll+0x52>
    80001dc2:	0001f797          	auipc	a5,0x1f
    80001dc6:	97e78793          	addi	a5,a5,-1666 # 80020740 <uxPendedTicks>
    80001dca:	639c                	ld	a5,0(a5)
    80001dcc:	cf95                	beqz	a5,80001e08 <xTaskResumeAll+0x12a>
    80001dce:	a03d                	j	80001dfc <xTaskResumeAll+0x11e>
    80001dd0:	1e0000ef          	jal	ra,80001fb0 <xTaskIncrementTick>
    80001dd4:	87aa                	mv	a5,a0
    80001dd6:	c799                	beqz	a5,80001de4 <xTaskResumeAll+0x106>
    80001dd8:	0001f797          	auipc	a5,0x1f
    80001ddc:	97078793          	addi	a5,a5,-1680 # 80020748 <xYieldPending>
    80001de0:	4705                	li	a4,1
    80001de2:	e398                	sd	a4,0(a5)
    80001de4:	0001f797          	auipc	a5,0x1f
    80001de8:	95c78793          	addi	a5,a5,-1700 # 80020740 <uxPendedTicks>
    80001dec:	639c                	ld	a5,0(a5)
    80001dee:	fff78713          	addi	a4,a5,-1
    80001df2:	0001f797          	auipc	a5,0x1f
    80001df6:	94e78793          	addi	a5,a5,-1714 # 80020740 <uxPendedTicks>
    80001dfa:	e398                	sd	a4,0(a5)
    80001dfc:	0001f797          	auipc	a5,0x1f
    80001e00:	94478793          	addi	a5,a5,-1724 # 80020740 <uxPendedTicks>
    80001e04:	639c                	ld	a5,0(a5)
    80001e06:	f7e9                	bnez	a5,80001dd0 <xTaskResumeAll+0xf2>
    80001e08:	0001f797          	auipc	a5,0x1f
    80001e0c:	94078793          	addi	a5,a5,-1728 # 80020748 <xYieldPending>
    80001e10:	6398                	ld	a4,0(a5)
    80001e12:	4785                	li	a5,1
    80001e14:	00f71663          	bne	a4,a5,80001e20 <xTaskResumeAll+0x142>
    80001e18:	4785                	li	a5,1
    80001e1a:	e43e                	sd	a5,8(sp)
    80001e1c:	df0fe0ef          	jal	ra,8000040c <vPortYield>
    80001e20:	040010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001e24:	67a2                	ld	a5,8(sp)
    80001e26:	853e                	mv	a0,a5
    80001e28:	60e2                	ld	ra,24(sp)
    80001e2a:	6105                	addi	sp,sp,32
    80001e2c:	8082                	ret

0000000080001e2e <xTaskGetTickCount>:
    80001e2e:	1101                	addi	sp,sp,-32
    80001e30:	ec06                	sd	ra,24(sp)
    80001e32:	000010ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80001e36:	0001f797          	auipc	a5,0x1f
    80001e3a:	8f278793          	addi	a5,a5,-1806 # 80020728 <xTickCount>
    80001e3e:	439c                	lw	a5,0(a5)
    80001e40:	c63e                	sw	a5,12(sp)
    80001e42:	01e010ef          	jal	ra,80002e60 <vTaskExitCritical>
    80001e46:	47b2                	lw	a5,12(sp)
    80001e48:	853e                	mv	a0,a5
    80001e4a:	60e2                	ld	ra,24(sp)
    80001e4c:	6105                	addi	sp,sp,32
    80001e4e:	8082                	ret

0000000080001e50 <xTaskGetTickCountFromISR>:
    80001e50:	1101                	addi	sp,sp,-32
    80001e52:	ec06                	sd	ra,24(sp)
    80001e54:	ee6fe0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80001e58:	87aa                	mv	a5,a0
    80001e5a:	e43e                	sd	a5,8(sp)
    80001e5c:	0001f797          	auipc	a5,0x1f
    80001e60:	8cc78793          	addi	a5,a5,-1844 # 80020728 <xTickCount>
    80001e64:	439c                	lw	a5,0(a5)
    80001e66:	c23e                	sw	a5,4(sp)
    80001e68:	67a2                	ld	a5,8(sp)
    80001e6a:	2781                	sext.w	a5,a5
    80001e6c:	853e                	mv	a0,a5
    80001e6e:	ebafe0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80001e72:	4792                	lw	a5,4(sp)
    80001e74:	853e                	mv	a0,a5
    80001e76:	60e2                	ld	ra,24(sp)
    80001e78:	6105                	addi	sp,sp,32
    80001e7a:	8082                	ret

0000000080001e7c <uxTaskGetNumberOfTasks>:
    80001e7c:	0001f797          	auipc	a5,0x1f
    80001e80:	8a478793          	addi	a5,a5,-1884 # 80020720 <uxCurrentNumberOfTasks>
    80001e84:	639c                	ld	a5,0(a5)
    80001e86:	853e                	mv	a0,a5
    80001e88:	8082                	ret

0000000080001e8a <uxTaskGetSystemState>:
    80001e8a:	7139                	addi	sp,sp,-64
    80001e8c:	fc06                	sd	ra,56(sp)
    80001e8e:	ec2a                	sd	a0,24(sp)
    80001e90:	e82e                	sd	a1,16(sp)
    80001e92:	e432                	sd	a2,8(sp)
    80001e94:	f402                	sd	zero,40(sp)
    80001e96:	4795                	li	a5,5
    80001e98:	f03e                	sd	a5,32(sp)
    80001e9a:	e29ff0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80001e9e:	0001f797          	auipc	a5,0x1f
    80001ea2:	88278793          	addi	a5,a5,-1918 # 80020720 <uxCurrentNumberOfTasks>
    80001ea6:	639c                	ld	a5,0(a5)
    80001ea8:	6742                	ld	a4,16(sp)
    80001eaa:	0ef76c63          	bltu	a4,a5,80001fa2 <uxTaskGetSystemState+0x118>
    80001eae:	7782                	ld	a5,32(sp)
    80001eb0:	17fd                	addi	a5,a5,-1
    80001eb2:	f03e                	sd	a5,32(sp)
    80001eb4:	7722                	ld	a4,40(sp)
    80001eb6:	87ba                	mv	a5,a4
    80001eb8:	078e                	slli	a5,a5,0x3
    80001eba:	8f99                	sub	a5,a5,a4
    80001ebc:	078e                	slli	a5,a5,0x3
    80001ebe:	873e                	mv	a4,a5
    80001ec0:	67e2                	ld	a5,24(sp)
    80001ec2:	00e786b3          	add	a3,a5,a4
    80001ec6:	7702                	ld	a4,32(sp)
    80001ec8:	87ba                	mv	a5,a4
    80001eca:	078a                	slli	a5,a5,0x2
    80001ecc:	97ba                	add	a5,a5,a4
    80001ece:	078e                	slli	a5,a5,0x3
    80001ed0:	0001e717          	auipc	a4,0x1e
    80001ed4:	6a870713          	addi	a4,a4,1704 # 80020578 <pxReadyTasksLists>
    80001ed8:	97ba                	add	a5,a5,a4
    80001eda:	4605                	li	a2,1
    80001edc:	85be                	mv	a1,a5
    80001ede:	8536                	mv	a0,a3
    80001ee0:	35b000ef          	jal	ra,80002a3a <prvListTaskWithinSingleList>
    80001ee4:	872a                	mv	a4,a0
    80001ee6:	77a2                	ld	a5,40(sp)
    80001ee8:	97ba                	add	a5,a5,a4
    80001eea:	f43e                	sd	a5,40(sp)
    80001eec:	7782                	ld	a5,32(sp)
    80001eee:	f3e1                	bnez	a5,80001eae <uxTaskGetSystemState+0x24>
    80001ef0:	7722                	ld	a4,40(sp)
    80001ef2:	87ba                	mv	a5,a4
    80001ef4:	078e                	slli	a5,a5,0x3
    80001ef6:	8f99                	sub	a5,a5,a4
    80001ef8:	078e                	slli	a5,a5,0x3
    80001efa:	873e                	mv	a4,a5
    80001efc:	67e2                	ld	a5,24(sp)
    80001efe:	973e                	add	a4,a4,a5
    80001f00:	0001e797          	auipc	a5,0x1e
    80001f04:	79078793          	addi	a5,a5,1936 # 80020690 <pxDelayedTaskList>
    80001f08:	639c                	ld	a5,0(a5)
    80001f0a:	4609                	li	a2,2
    80001f0c:	85be                	mv	a1,a5
    80001f0e:	853a                	mv	a0,a4
    80001f10:	32b000ef          	jal	ra,80002a3a <prvListTaskWithinSingleList>
    80001f14:	872a                	mv	a4,a0
    80001f16:	77a2                	ld	a5,40(sp)
    80001f18:	97ba                	add	a5,a5,a4
    80001f1a:	f43e                	sd	a5,40(sp)
    80001f1c:	7722                	ld	a4,40(sp)
    80001f1e:	87ba                	mv	a5,a4
    80001f20:	078e                	slli	a5,a5,0x3
    80001f22:	8f99                	sub	a5,a5,a4
    80001f24:	078e                	slli	a5,a5,0x3
    80001f26:	873e                	mv	a4,a5
    80001f28:	67e2                	ld	a5,24(sp)
    80001f2a:	973e                	add	a4,a4,a5
    80001f2c:	0001e797          	auipc	a5,0x1e
    80001f30:	76c78793          	addi	a5,a5,1900 # 80020698 <pxOverflowDelayedTaskList>
    80001f34:	639c                	ld	a5,0(a5)
    80001f36:	4609                	li	a2,2
    80001f38:	85be                	mv	a1,a5
    80001f3a:	853a                	mv	a0,a4
    80001f3c:	2ff000ef          	jal	ra,80002a3a <prvListTaskWithinSingleList>
    80001f40:	872a                	mv	a4,a0
    80001f42:	77a2                	ld	a5,40(sp)
    80001f44:	97ba                	add	a5,a5,a4
    80001f46:	f43e                	sd	a5,40(sp)
    80001f48:	7722                	ld	a4,40(sp)
    80001f4a:	87ba                	mv	a5,a4
    80001f4c:	078e                	slli	a5,a5,0x3
    80001f4e:	8f99                	sub	a5,a5,a4
    80001f50:	078e                	slli	a5,a5,0x3
    80001f52:	873e                	mv	a4,a5
    80001f54:	67e2                	ld	a5,24(sp)
    80001f56:	97ba                	add	a5,a5,a4
    80001f58:	4611                	li	a2,4
    80001f5a:	0001e597          	auipc	a1,0x1e
    80001f5e:	76e58593          	addi	a1,a1,1902 # 800206c8 <xTasksWaitingTermination>
    80001f62:	853e                	mv	a0,a5
    80001f64:	2d7000ef          	jal	ra,80002a3a <prvListTaskWithinSingleList>
    80001f68:	872a                	mv	a4,a0
    80001f6a:	77a2                	ld	a5,40(sp)
    80001f6c:	97ba                	add	a5,a5,a4
    80001f6e:	f43e                	sd	a5,40(sp)
    80001f70:	7722                	ld	a4,40(sp)
    80001f72:	87ba                	mv	a5,a4
    80001f74:	078e                	slli	a5,a5,0x3
    80001f76:	8f99                	sub	a5,a5,a4
    80001f78:	078e                	slli	a5,a5,0x3
    80001f7a:	873e                	mv	a4,a5
    80001f7c:	67e2                	ld	a5,24(sp)
    80001f7e:	97ba                	add	a5,a5,a4
    80001f80:	460d                	li	a2,3
    80001f82:	0001e597          	auipc	a1,0x1e
    80001f86:	77658593          	addi	a1,a1,1910 # 800206f8 <xSuspendedTaskList>
    80001f8a:	853e                	mv	a0,a5
    80001f8c:	2af000ef          	jal	ra,80002a3a <prvListTaskWithinSingleList>
    80001f90:	872a                	mv	a4,a0
    80001f92:	77a2                	ld	a5,40(sp)
    80001f94:	97ba                	add	a5,a5,a4
    80001f96:	f43e                	sd	a5,40(sp)
    80001f98:	67a2                	ld	a5,8(sp)
    80001f9a:	c781                	beqz	a5,80001fa2 <uxTaskGetSystemState+0x118>
    80001f9c:	67a2                	ld	a5,8(sp)
    80001f9e:	0007a023          	sw	zero,0(a5)
    80001fa2:	d3dff0ef          	jal	ra,80001cde <xTaskResumeAll>
    80001fa6:	77a2                	ld	a5,40(sp)
    80001fa8:	853e                	mv	a0,a5
    80001faa:	70e2                	ld	ra,56(sp)
    80001fac:	6121                	addi	sp,sp,64
    80001fae:	8082                	ret

0000000080001fb0 <xTaskIncrementTick>:
    80001fb0:	7139                	addi	sp,sp,-64
    80001fb2:	fc06                	sd	ra,56(sp)
    80001fb4:	f402                	sd	zero,40(sp)
    80001fb6:	0001e797          	auipc	a5,0x1e
    80001fba:	7b278793          	addi	a5,a5,1970 # 80020768 <uxSchedulerSuspended>
    80001fbe:	639c                	ld	a5,0(a5)
    80001fc0:	18079f63          	bnez	a5,8000215e <xTaskIncrementTick+0x1ae>
    80001fc4:	0001e797          	auipc	a5,0x1e
    80001fc8:	76478793          	addi	a5,a5,1892 # 80020728 <xTickCount>
    80001fcc:	439c                	lw	a5,0(a5)
    80001fce:	2781                	sext.w	a5,a5
    80001fd0:	2785                	addiw	a5,a5,1
    80001fd2:	0007871b          	sext.w	a4,a5
    80001fd6:	0001e797          	auipc	a5,0x1e
    80001fda:	75278793          	addi	a5,a5,1874 # 80020728 <xTickCount>
    80001fde:	c398                	sw	a4,0(a5)
    80001fe0:	0001e797          	auipc	a5,0x1e
    80001fe4:	74878793          	addi	a5,a5,1864 # 80020728 <xTickCount>
    80001fe8:	439c                	lw	a5,0(a5)
    80001fea:	d23e                	sw	a5,36(sp)
    80001fec:	5792                	lw	a5,36(sp)
    80001fee:	2781                	sext.w	a5,a5
    80001ff0:	efb9                	bnez	a5,8000204e <xTaskIncrementTick+0x9e>
    80001ff2:	0001e797          	auipc	a5,0x1e
    80001ff6:	69e78793          	addi	a5,a5,1694 # 80020690 <pxDelayedTaskList>
    80001ffa:	639c                	ld	a5,0(a5)
    80001ffc:	639c                	ld	a5,0(a5)
    80001ffe:	c781                	beqz	a5,80002006 <xTaskIncrementTick+0x56>
    80002000:	30047073          	csrci	mstatus,8
    80002004:	a001                	j	80002004 <xTaskIncrementTick+0x54>
    80002006:	0001e797          	auipc	a5,0x1e
    8000200a:	68a78793          	addi	a5,a5,1674 # 80020690 <pxDelayedTaskList>
    8000200e:	639c                	ld	a5,0(a5)
    80002010:	ec3e                	sd	a5,24(sp)
    80002012:	0001e797          	auipc	a5,0x1e
    80002016:	68678793          	addi	a5,a5,1670 # 80020698 <pxOverflowDelayedTaskList>
    8000201a:	6398                	ld	a4,0(a5)
    8000201c:	0001e797          	auipc	a5,0x1e
    80002020:	67478793          	addi	a5,a5,1652 # 80020690 <pxDelayedTaskList>
    80002024:	e398                	sd	a4,0(a5)
    80002026:	0001e797          	auipc	a5,0x1e
    8000202a:	67278793          	addi	a5,a5,1650 # 80020698 <pxOverflowDelayedTaskList>
    8000202e:	6762                	ld	a4,24(sp)
    80002030:	e398                	sd	a4,0(a5)
    80002032:	0001e797          	auipc	a5,0x1e
    80002036:	71e78793          	addi	a5,a5,1822 # 80020750 <xNumOfOverflows>
    8000203a:	639c                	ld	a5,0(a5)
    8000203c:	00178713          	addi	a4,a5,1
    80002040:	0001e797          	auipc	a5,0x1e
    80002044:	71078793          	addi	a5,a5,1808 # 80020750 <xNumOfOverflows>
    80002048:	e398                	sd	a4,0(a5)
    8000204a:	3af000ef          	jal	ra,80002bf8 <prvResetNextTaskUnblockTime>
    8000204e:	0001e797          	auipc	a5,0x1e
    80002052:	71278793          	addi	a5,a5,1810 # 80020760 <xNextTaskUnblockTime>
    80002056:	439c                	lw	a5,0(a5)
    80002058:	0007871b          	sext.w	a4,a5
    8000205c:	5792                	lw	a5,36(sp)
    8000205e:	2781                	sext.w	a5,a5
    80002060:	0ce7e963          	bltu	a5,a4,80002132 <xTaskIncrementTick+0x182>
    80002064:	0001e797          	auipc	a5,0x1e
    80002068:	62c78793          	addi	a5,a5,1580 # 80020690 <pxDelayedTaskList>
    8000206c:	639c                	ld	a5,0(a5)
    8000206e:	639c                	ld	a5,0(a5)
    80002070:	e399                	bnez	a5,80002076 <xTaskIncrementTick+0xc6>
    80002072:	4785                	li	a5,1
    80002074:	a011                	j	80002078 <xTaskIncrementTick+0xc8>
    80002076:	4781                	li	a5,0
    80002078:	cb81                	beqz	a5,80002088 <xTaskIncrementTick+0xd8>
    8000207a:	0001e797          	auipc	a5,0x1e
    8000207e:	6e678793          	addi	a5,a5,1766 # 80020760 <xNextTaskUnblockTime>
    80002082:	577d                	li	a4,-1
    80002084:	c398                	sw	a4,0(a5)
    80002086:	a075                	j	80002132 <xTaskIncrementTick+0x182>
    80002088:	0001e797          	auipc	a5,0x1e
    8000208c:	60878793          	addi	a5,a5,1544 # 80020690 <pxDelayedTaskList>
    80002090:	639c                	ld	a5,0(a5)
    80002092:	6f9c                	ld	a5,24(a5)
    80002094:	6f9c                	ld	a5,24(a5)
    80002096:	e83e                	sd	a5,16(sp)
    80002098:	67c2                	ld	a5,16(sp)
    8000209a:	479c                	lw	a5,8(a5)
    8000209c:	c63e                	sw	a5,12(sp)
    8000209e:	5792                	lw	a5,36(sp)
    800020a0:	873e                	mv	a4,a5
    800020a2:	47b2                	lw	a5,12(sp)
    800020a4:	2701                	sext.w	a4,a4
    800020a6:	2781                	sext.w	a5,a5
    800020a8:	00f77963          	bgeu	a4,a5,800020ba <xTaskIncrementTick+0x10a>
    800020ac:	0001e797          	auipc	a5,0x1e
    800020b0:	6b478793          	addi	a5,a5,1716 # 80020760 <xNextTaskUnblockTime>
    800020b4:	4732                	lw	a4,12(sp)
    800020b6:	c398                	sw	a4,0(a5)
    800020b8:	a8ad                	j	80002132 <xTaskIncrementTick+0x182>
    800020ba:	67c2                	ld	a5,16(sp)
    800020bc:	07a1                	addi	a5,a5,8
    800020be:	853e                	mv	a0,a5
    800020c0:	deafe0ef          	jal	ra,800006aa <uxListRemove>
    800020c4:	67c2                	ld	a5,16(sp)
    800020c6:	6bbc                	ld	a5,80(a5)
    800020c8:	c799                	beqz	a5,800020d6 <xTaskIncrementTick+0x126>
    800020ca:	67c2                	ld	a5,16(sp)
    800020cc:	03078793          	addi	a5,a5,48
    800020d0:	853e                	mv	a0,a5
    800020d2:	dd8fe0ef          	jal	ra,800006aa <uxListRemove>
    800020d6:	67c2                	ld	a5,16(sp)
    800020d8:	6fb8                	ld	a4,88(a5)
    800020da:	0001e797          	auipc	a5,0x1e
    800020de:	65678793          	addi	a5,a5,1622 # 80020730 <uxTopReadyPriority>
    800020e2:	639c                	ld	a5,0(a5)
    800020e4:	00e7f963          	bgeu	a5,a4,800020f6 <xTaskIncrementTick+0x146>
    800020e8:	67c2                	ld	a5,16(sp)
    800020ea:	6fb8                	ld	a4,88(a5)
    800020ec:	0001e797          	auipc	a5,0x1e
    800020f0:	64478793          	addi	a5,a5,1604 # 80020730 <uxTopReadyPriority>
    800020f4:	e398                	sd	a4,0(a5)
    800020f6:	67c2                	ld	a5,16(sp)
    800020f8:	6fb8                	ld	a4,88(a5)
    800020fa:	87ba                	mv	a5,a4
    800020fc:	078a                	slli	a5,a5,0x2
    800020fe:	97ba                	add	a5,a5,a4
    80002100:	078e                	slli	a5,a5,0x3
    80002102:	0001e717          	auipc	a4,0x1e
    80002106:	47670713          	addi	a4,a4,1142 # 80020578 <pxReadyTasksLists>
    8000210a:	973e                	add	a4,a4,a5
    8000210c:	67c2                	ld	a5,16(sp)
    8000210e:	07a1                	addi	a5,a5,8
    80002110:	85be                	mv	a1,a5
    80002112:	853a                	mv	a0,a4
    80002114:	ce6fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80002118:	67c2                	ld	a5,16(sp)
    8000211a:	6fb8                	ld	a4,88(a5)
    8000211c:	0001e797          	auipc	a5,0x1e
    80002120:	22478793          	addi	a5,a5,548 # 80020340 <pxCurrentTCB>
    80002124:	639c                	ld	a5,0(a5)
    80002126:	6fbc                	ld	a5,88(a5)
    80002128:	f2f76ee3          	bltu	a4,a5,80002064 <xTaskIncrementTick+0xb4>
    8000212c:	4785                	li	a5,1
    8000212e:	f43e                	sd	a5,40(sp)
    80002130:	bf15                	j	80002064 <xTaskIncrementTick+0xb4>
    80002132:	0001e797          	auipc	a5,0x1e
    80002136:	20e78793          	addi	a5,a5,526 # 80020340 <pxCurrentTCB>
    8000213a:	639c                	ld	a5,0(a5)
    8000213c:	6fb8                	ld	a4,88(a5)
    8000213e:	0001e697          	auipc	a3,0x1e
    80002142:	43a68693          	addi	a3,a3,1082 # 80020578 <pxReadyTasksLists>
    80002146:	87ba                	mv	a5,a4
    80002148:	078a                	slli	a5,a5,0x2
    8000214a:	97ba                	add	a5,a5,a4
    8000214c:	078e                	slli	a5,a5,0x3
    8000214e:	97b6                	add	a5,a5,a3
    80002150:	6398                	ld	a4,0(a5)
    80002152:	4785                	li	a5,1
    80002154:	02e7f163          	bgeu	a5,a4,80002176 <xTaskIncrementTick+0x1c6>
    80002158:	4785                	li	a5,1
    8000215a:	f43e                	sd	a5,40(sp)
    8000215c:	a829                	j	80002176 <xTaskIncrementTick+0x1c6>
    8000215e:	0001e797          	auipc	a5,0x1e
    80002162:	5e278793          	addi	a5,a5,1506 # 80020740 <uxPendedTicks>
    80002166:	639c                	ld	a5,0(a5)
    80002168:	00178713          	addi	a4,a5,1
    8000216c:	0001e797          	auipc	a5,0x1e
    80002170:	5d478793          	addi	a5,a5,1492 # 80020740 <uxPendedTicks>
    80002174:	e398                	sd	a4,0(a5)
    80002176:	0001e797          	auipc	a5,0x1e
    8000217a:	5d278793          	addi	a5,a5,1490 # 80020748 <xYieldPending>
    8000217e:	639c                	ld	a5,0(a5)
    80002180:	c399                	beqz	a5,80002186 <xTaskIncrementTick+0x1d6>
    80002182:	4785                	li	a5,1
    80002184:	f43e                	sd	a5,40(sp)
    80002186:	77a2                	ld	a5,40(sp)
    80002188:	853e                	mv	a0,a5
    8000218a:	70e2                	ld	ra,56(sp)
    8000218c:	6121                	addi	sp,sp,64
    8000218e:	8082                	ret

0000000080002190 <vTaskSwitchContext>:
    80002190:	7179                	addi	sp,sp,-48
    80002192:	f406                	sd	ra,40(sp)
    80002194:	0001e797          	auipc	a5,0x1e
    80002198:	5d478793          	addi	a5,a5,1492 # 80020768 <uxSchedulerSuspended>
    8000219c:	639c                	ld	a5,0(a5)
    8000219e:	cb81                	beqz	a5,800021ae <vTaskSwitchContext+0x1e>
    800021a0:	0001e797          	auipc	a5,0x1e
    800021a4:	5a878793          	addi	a5,a5,1448 # 80020748 <xYieldPending>
    800021a8:	4705                	li	a4,1
    800021aa:	e398                	sd	a4,0(a5)
    800021ac:	aa19                	j	800022c2 <vTaskSwitchContext+0x132>
    800021ae:	0001e797          	auipc	a5,0x1e
    800021b2:	59a78793          	addi	a5,a5,1434 # 80020748 <xYieldPending>
    800021b6:	0007b023          	sd	zero,0(a5)
    800021ba:	0001e797          	auipc	a5,0x1e
    800021be:	18678793          	addi	a5,a5,390 # 80020340 <pxCurrentTCB>
    800021c2:	639c                	ld	a5,0(a5)
    800021c4:	73bc                	ld	a5,96(a5)
    800021c6:	ec3e                	sd	a5,24(sp)
    800021c8:	a5a5a7b7          	lui	a5,0xa5a5a
    800021cc:	5a578793          	addi	a5,a5,1445 # ffffffffa5a5a5a5 <__stack+0xffffffff25a1ebf5>
    800021d0:	ca3e                	sw	a5,20(sp)
    800021d2:	67e2                	ld	a5,24(sp)
    800021d4:	4398                	lw	a4,0(a5)
    800021d6:	47d2                	lw	a5,20(sp)
    800021d8:	2781                	sext.w	a5,a5
    800021da:	02e79763          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021de:	67e2                	ld	a5,24(sp)
    800021e0:	0791                	addi	a5,a5,4
    800021e2:	4398                	lw	a4,0(a5)
    800021e4:	47d2                	lw	a5,20(sp)
    800021e6:	2781                	sext.w	a5,a5
    800021e8:	02e79063          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021ec:	67e2                	ld	a5,24(sp)
    800021ee:	07a1                	addi	a5,a5,8
    800021f0:	4398                	lw	a4,0(a5)
    800021f2:	47d2                	lw	a5,20(sp)
    800021f4:	2781                	sext.w	a5,a5
    800021f6:	00e79963          	bne	a5,a4,80002208 <vTaskSwitchContext+0x78>
    800021fa:	67e2                	ld	a5,24(sp)
    800021fc:	07b1                	addi	a5,a5,12
    800021fe:	4398                	lw	a4,0(a5)
    80002200:	47d2                	lw	a5,20(sp)
    80002202:	2781                	sext.w	a5,a5
    80002204:	04e78863          	beq	a5,a4,80002254 <vTaskSwitchContext+0xc4>
    80002208:	0001e797          	auipc	a5,0x1e
    8000220c:	13878793          	addi	a5,a5,312 # 80020340 <pxCurrentTCB>
    80002210:	6398                	ld	a4,0(a5)
    80002212:	0001e797          	auipc	a5,0x1e
    80002216:	12e78793          	addi	a5,a5,302 # 80020340 <pxCurrentTCB>
    8000221a:	639c                	ld	a5,0(a5)
    8000221c:	06878793          	addi	a5,a5,104
    80002220:	85be                	mv	a1,a5
    80002222:	853a                	mv	a0,a4
    80002224:	493020ef          	jal	ra,80004eb6 <vApplicationStackOverflowHook>
    80002228:	a035                	j	80002254 <vTaskSwitchContext+0xc4>
    8000222a:	0001e797          	auipc	a5,0x1e
    8000222e:	50678793          	addi	a5,a5,1286 # 80020730 <uxTopReadyPriority>
    80002232:	639c                	ld	a5,0(a5)
    80002234:	e781                	bnez	a5,8000223c <vTaskSwitchContext+0xac>
    80002236:	30047073          	csrci	mstatus,8
    8000223a:	a001                	j	8000223a <vTaskSwitchContext+0xaa>
    8000223c:	0001e797          	auipc	a5,0x1e
    80002240:	4f478793          	addi	a5,a5,1268 # 80020730 <uxTopReadyPriority>
    80002244:	639c                	ld	a5,0(a5)
    80002246:	fff78713          	addi	a4,a5,-1
    8000224a:	0001e797          	auipc	a5,0x1e
    8000224e:	4e678793          	addi	a5,a5,1254 # 80020730 <uxTopReadyPriority>
    80002252:	e398                	sd	a4,0(a5)
    80002254:	0001e797          	auipc	a5,0x1e
    80002258:	4dc78793          	addi	a5,a5,1244 # 80020730 <uxTopReadyPriority>
    8000225c:	6398                	ld	a4,0(a5)
    8000225e:	0001e697          	auipc	a3,0x1e
    80002262:	31a68693          	addi	a3,a3,794 # 80020578 <pxReadyTasksLists>
    80002266:	87ba                	mv	a5,a4
    80002268:	078a                	slli	a5,a5,0x2
    8000226a:	97ba                	add	a5,a5,a4
    8000226c:	078e                	slli	a5,a5,0x3
    8000226e:	97b6                	add	a5,a5,a3
    80002270:	639c                	ld	a5,0(a5)
    80002272:	dfc5                	beqz	a5,8000222a <vTaskSwitchContext+0x9a>
    80002274:	0001e797          	auipc	a5,0x1e
    80002278:	4bc78793          	addi	a5,a5,1212 # 80020730 <uxTopReadyPriority>
    8000227c:	6398                	ld	a4,0(a5)
    8000227e:	87ba                	mv	a5,a4
    80002280:	078a                	slli	a5,a5,0x2
    80002282:	97ba                	add	a5,a5,a4
    80002284:	078e                	slli	a5,a5,0x3
    80002286:	0001e717          	auipc	a4,0x1e
    8000228a:	2f270713          	addi	a4,a4,754 # 80020578 <pxReadyTasksLists>
    8000228e:	97ba                	add	a5,a5,a4
    80002290:	e43e                	sd	a5,8(sp)
    80002292:	67a2                	ld	a5,8(sp)
    80002294:	679c                	ld	a5,8(a5)
    80002296:	6798                	ld	a4,8(a5)
    80002298:	67a2                	ld	a5,8(sp)
    8000229a:	e798                	sd	a4,8(a5)
    8000229c:	67a2                	ld	a5,8(sp)
    8000229e:	6798                	ld	a4,8(a5)
    800022a0:	67a2                	ld	a5,8(sp)
    800022a2:	07c1                	addi	a5,a5,16
    800022a4:	00f71763          	bne	a4,a5,800022b2 <vTaskSwitchContext+0x122>
    800022a8:	67a2                	ld	a5,8(sp)
    800022aa:	679c                	ld	a5,8(a5)
    800022ac:	6798                	ld	a4,8(a5)
    800022ae:	67a2                	ld	a5,8(sp)
    800022b0:	e798                	sd	a4,8(a5)
    800022b2:	67a2                	ld	a5,8(sp)
    800022b4:	679c                	ld	a5,8(a5)
    800022b6:	6f98                	ld	a4,24(a5)
    800022b8:	0001e797          	auipc	a5,0x1e
    800022bc:	08878793          	addi	a5,a5,136 # 80020340 <pxCurrentTCB>
    800022c0:	e398                	sd	a4,0(a5)
    800022c2:	0001                	nop
    800022c4:	70a2                	ld	ra,40(sp)
    800022c6:	6145                	addi	sp,sp,48
    800022c8:	8082                	ret

00000000800022ca <vTaskPlaceOnEventList>:
    800022ca:	7179                	addi	sp,sp,-48
    800022cc:	f406                	sd	ra,40(sp)
    800022ce:	e42a                	sd	a0,8(sp)
    800022d0:	87ae                	mv	a5,a1
    800022d2:	c23e                	sw	a5,4(sp)
    800022d4:	67a2                	ld	a5,8(sp)
    800022d6:	e781                	bnez	a5,800022de <vTaskPlaceOnEventList+0x14>
    800022d8:	30047073          	csrci	mstatus,8
    800022dc:	a001                	j	800022dc <vTaskPlaceOnEventList+0x12>
    800022de:	0001e797          	auipc	a5,0x1e
    800022e2:	06278793          	addi	a5,a5,98 # 80020340 <pxCurrentTCB>
    800022e6:	639c                	ld	a5,0(a5)
    800022e8:	03078793          	addi	a5,a5,48
    800022ec:	85be                	mv	a1,a5
    800022ee:	6522                	ld	a0,8(sp)
    800022f0:	b4afe0ef          	jal	ra,8000063a <vListInsert>
    800022f4:	0001e797          	auipc	a5,0x1e
    800022f8:	04c78793          	addi	a5,a5,76 # 80020340 <pxCurrentTCB>
    800022fc:	639c                	ld	a5,0(a5)
    800022fe:	07a1                	addi	a5,a5,8
    80002300:	853e                	mv	a0,a5
    80002302:	ba8fe0ef          	jal	ra,800006aa <uxListRemove>
    80002306:	4792                	lw	a5,4(sp)
    80002308:	0007871b          	sext.w	a4,a5
    8000230c:	57fd                	li	a5,-1
    8000230e:	02f71063          	bne	a4,a5,8000232e <vTaskPlaceOnEventList+0x64>
    80002312:	0001e797          	auipc	a5,0x1e
    80002316:	02e78793          	addi	a5,a5,46 # 80020340 <pxCurrentTCB>
    8000231a:	639c                	ld	a5,0(a5)
    8000231c:	07a1                	addi	a5,a5,8
    8000231e:	85be                	mv	a1,a5
    80002320:	0001e517          	auipc	a0,0x1e
    80002324:	3d850513          	addi	a0,a0,984 # 800206f8 <xSuspendedTaskList>
    80002328:	ad2fe0ef          	jal	ra,800005fa <vListInsertEnd>
    8000232c:	a831                	j	80002348 <vTaskPlaceOnEventList+0x7e>
    8000232e:	0001e797          	auipc	a5,0x1e
    80002332:	3fa78793          	addi	a5,a5,1018 # 80020728 <xTickCount>
    80002336:	439c                	lw	a5,0(a5)
    80002338:	2781                	sext.w	a5,a5
    8000233a:	4712                	lw	a4,4(sp)
    8000233c:	9fb9                	addw	a5,a5,a4
    8000233e:	ce3e                	sw	a5,28(sp)
    80002340:	47f2                	lw	a5,28(sp)
    80002342:	853e                	mv	a0,a5
    80002344:	5f6000ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    80002348:	0001                	nop
    8000234a:	70a2                	ld	ra,40(sp)
    8000234c:	6145                	addi	sp,sp,48
    8000234e:	8082                	ret

0000000080002350 <vTaskPlaceOnUnorderedEventList>:
    80002350:	7179                	addi	sp,sp,-48
    80002352:	f406                	sd	ra,40(sp)
    80002354:	e42a                	sd	a0,8(sp)
    80002356:	87ae                	mv	a5,a1
    80002358:	8732                	mv	a4,a2
    8000235a:	c23e                	sw	a5,4(sp)
    8000235c:	87ba                	mv	a5,a4
    8000235e:	c03e                	sw	a5,0(sp)
    80002360:	67a2                	ld	a5,8(sp)
    80002362:	e781                	bnez	a5,8000236a <vTaskPlaceOnUnorderedEventList+0x1a>
    80002364:	30047073          	csrci	mstatus,8
    80002368:	a001                	j	80002368 <vTaskPlaceOnUnorderedEventList+0x18>
    8000236a:	0001e797          	auipc	a5,0x1e
    8000236e:	3fe78793          	addi	a5,a5,1022 # 80020768 <uxSchedulerSuspended>
    80002372:	639c                	ld	a5,0(a5)
    80002374:	e781                	bnez	a5,8000237c <vTaskPlaceOnUnorderedEventList+0x2c>
    80002376:	30047073          	csrci	mstatus,8
    8000237a:	a001                	j	8000237a <vTaskPlaceOnUnorderedEventList+0x2a>
    8000237c:	0001e797          	auipc	a5,0x1e
    80002380:	fc478793          	addi	a5,a5,-60 # 80020340 <pxCurrentTCB>
    80002384:	639c                	ld	a5,0(a5)
    80002386:	4712                	lw	a4,4(sp)
    80002388:	86ba                	mv	a3,a4
    8000238a:	80000737          	lui	a4,0x80000
    8000238e:	8f55                	or	a4,a4,a3
    80002390:	2701                	sext.w	a4,a4
    80002392:	db98                	sw	a4,48(a5)
    80002394:	0001e797          	auipc	a5,0x1e
    80002398:	fac78793          	addi	a5,a5,-84 # 80020340 <pxCurrentTCB>
    8000239c:	639c                	ld	a5,0(a5)
    8000239e:	03078793          	addi	a5,a5,48
    800023a2:	85be                	mv	a1,a5
    800023a4:	6522                	ld	a0,8(sp)
    800023a6:	a54fe0ef          	jal	ra,800005fa <vListInsertEnd>
    800023aa:	0001e797          	auipc	a5,0x1e
    800023ae:	f9678793          	addi	a5,a5,-106 # 80020340 <pxCurrentTCB>
    800023b2:	639c                	ld	a5,0(a5)
    800023b4:	07a1                	addi	a5,a5,8
    800023b6:	853e                	mv	a0,a5
    800023b8:	af2fe0ef          	jal	ra,800006aa <uxListRemove>
    800023bc:	4782                	lw	a5,0(sp)
    800023be:	0007871b          	sext.w	a4,a5
    800023c2:	57fd                	li	a5,-1
    800023c4:	02f71063          	bne	a4,a5,800023e4 <vTaskPlaceOnUnorderedEventList+0x94>
    800023c8:	0001e797          	auipc	a5,0x1e
    800023cc:	f7878793          	addi	a5,a5,-136 # 80020340 <pxCurrentTCB>
    800023d0:	639c                	ld	a5,0(a5)
    800023d2:	07a1                	addi	a5,a5,8
    800023d4:	85be                	mv	a1,a5
    800023d6:	0001e517          	auipc	a0,0x1e
    800023da:	32250513          	addi	a0,a0,802 # 800206f8 <xSuspendedTaskList>
    800023de:	a1cfe0ef          	jal	ra,800005fa <vListInsertEnd>
    800023e2:	a831                	j	800023fe <vTaskPlaceOnUnorderedEventList+0xae>
    800023e4:	0001e797          	auipc	a5,0x1e
    800023e8:	34478793          	addi	a5,a5,836 # 80020728 <xTickCount>
    800023ec:	439c                	lw	a5,0(a5)
    800023ee:	2781                	sext.w	a5,a5
    800023f0:	4702                	lw	a4,0(sp)
    800023f2:	9fb9                	addw	a5,a5,a4
    800023f4:	ce3e                	sw	a5,28(sp)
    800023f6:	47f2                	lw	a5,28(sp)
    800023f8:	853e                	mv	a0,a5
    800023fa:	540000ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    800023fe:	0001                	nop
    80002400:	70a2                	ld	ra,40(sp)
    80002402:	6145                	addi	sp,sp,48
    80002404:	8082                	ret

0000000080002406 <vTaskPlaceOnEventListRestricted>:
    80002406:	7139                	addi	sp,sp,-64
    80002408:	fc06                	sd	ra,56(sp)
    8000240a:	ec2a                	sd	a0,24(sp)
    8000240c:	87ae                	mv	a5,a1
    8000240e:	e432                	sd	a2,8(sp)
    80002410:	ca3e                	sw	a5,20(sp)
    80002412:	67e2                	ld	a5,24(sp)
    80002414:	e781                	bnez	a5,8000241c <vTaskPlaceOnEventListRestricted+0x16>
    80002416:	30047073          	csrci	mstatus,8
    8000241a:	a001                	j	8000241a <vTaskPlaceOnEventListRestricted+0x14>
    8000241c:	0001e797          	auipc	a5,0x1e
    80002420:	f2478793          	addi	a5,a5,-220 # 80020340 <pxCurrentTCB>
    80002424:	639c                	ld	a5,0(a5)
    80002426:	03078793          	addi	a5,a5,48
    8000242a:	85be                	mv	a1,a5
    8000242c:	6562                	ld	a0,24(sp)
    8000242e:	9ccfe0ef          	jal	ra,800005fa <vListInsertEnd>
    80002432:	0001e797          	auipc	a5,0x1e
    80002436:	f0e78793          	addi	a5,a5,-242 # 80020340 <pxCurrentTCB>
    8000243a:	639c                	ld	a5,0(a5)
    8000243c:	07a1                	addi	a5,a5,8
    8000243e:	853e                	mv	a0,a5
    80002440:	a6afe0ef          	jal	ra,800006aa <uxListRemove>
    80002444:	6722                	ld	a4,8(sp)
    80002446:	4785                	li	a5,1
    80002448:	02f71063          	bne	a4,a5,80002468 <vTaskPlaceOnEventListRestricted+0x62>
    8000244c:	0001e797          	auipc	a5,0x1e
    80002450:	ef478793          	addi	a5,a5,-268 # 80020340 <pxCurrentTCB>
    80002454:	639c                	ld	a5,0(a5)
    80002456:	07a1                	addi	a5,a5,8
    80002458:	85be                	mv	a1,a5
    8000245a:	0001e517          	auipc	a0,0x1e
    8000245e:	29e50513          	addi	a0,a0,670 # 800206f8 <xSuspendedTaskList>
    80002462:	998fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80002466:	a831                	j	80002482 <vTaskPlaceOnEventListRestricted+0x7c>
    80002468:	0001e797          	auipc	a5,0x1e
    8000246c:	2c078793          	addi	a5,a5,704 # 80020728 <xTickCount>
    80002470:	439c                	lw	a5,0(a5)
    80002472:	2781                	sext.w	a5,a5
    80002474:	4752                	lw	a4,20(sp)
    80002476:	9fb9                	addw	a5,a5,a4
    80002478:	d63e                	sw	a5,44(sp)
    8000247a:	57b2                	lw	a5,44(sp)
    8000247c:	853e                	mv	a0,a5
    8000247e:	4bc000ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    80002482:	0001                	nop
    80002484:	70e2                	ld	ra,56(sp)
    80002486:	6121                	addi	sp,sp,64
    80002488:	8082                	ret

000000008000248a <xTaskRemoveFromEventList>:
    8000248a:	7179                	addi	sp,sp,-48
    8000248c:	f406                	sd	ra,40(sp)
    8000248e:	e42a                	sd	a0,8(sp)
    80002490:	67a2                	ld	a5,8(sp)
    80002492:	6f9c                	ld	a5,24(a5)
    80002494:	6f9c                	ld	a5,24(a5)
    80002496:	e83e                	sd	a5,16(sp)
    80002498:	67c2                	ld	a5,16(sp)
    8000249a:	e781                	bnez	a5,800024a2 <xTaskRemoveFromEventList+0x18>
    8000249c:	30047073          	csrci	mstatus,8
    800024a0:	a001                	j	800024a0 <xTaskRemoveFromEventList+0x16>
    800024a2:	67c2                	ld	a5,16(sp)
    800024a4:	03078793          	addi	a5,a5,48
    800024a8:	853e                	mv	a0,a5
    800024aa:	a00fe0ef          	jal	ra,800006aa <uxListRemove>
    800024ae:	0001e797          	auipc	a5,0x1e
    800024b2:	2ba78793          	addi	a5,a5,698 # 80020768 <uxSchedulerSuspended>
    800024b6:	639c                	ld	a5,0(a5)
    800024b8:	eba1                	bnez	a5,80002508 <xTaskRemoveFromEventList+0x7e>
    800024ba:	67c2                	ld	a5,16(sp)
    800024bc:	07a1                	addi	a5,a5,8
    800024be:	853e                	mv	a0,a5
    800024c0:	9eafe0ef          	jal	ra,800006aa <uxListRemove>
    800024c4:	67c2                	ld	a5,16(sp)
    800024c6:	6fb8                	ld	a4,88(a5)
    800024c8:	0001e797          	auipc	a5,0x1e
    800024cc:	26878793          	addi	a5,a5,616 # 80020730 <uxTopReadyPriority>
    800024d0:	639c                	ld	a5,0(a5)
    800024d2:	00e7f963          	bgeu	a5,a4,800024e4 <xTaskRemoveFromEventList+0x5a>
    800024d6:	67c2                	ld	a5,16(sp)
    800024d8:	6fb8                	ld	a4,88(a5)
    800024da:	0001e797          	auipc	a5,0x1e
    800024de:	25678793          	addi	a5,a5,598 # 80020730 <uxTopReadyPriority>
    800024e2:	e398                	sd	a4,0(a5)
    800024e4:	67c2                	ld	a5,16(sp)
    800024e6:	6fb8                	ld	a4,88(a5)
    800024e8:	87ba                	mv	a5,a4
    800024ea:	078a                	slli	a5,a5,0x2
    800024ec:	97ba                	add	a5,a5,a4
    800024ee:	078e                	slli	a5,a5,0x3
    800024f0:	0001e717          	auipc	a4,0x1e
    800024f4:	08870713          	addi	a4,a4,136 # 80020578 <pxReadyTasksLists>
    800024f8:	973e                	add	a4,a4,a5
    800024fa:	67c2                	ld	a5,16(sp)
    800024fc:	07a1                	addi	a5,a5,8
    800024fe:	85be                	mv	a1,a5
    80002500:	853a                	mv	a0,a4
    80002502:	8f8fe0ef          	jal	ra,800005fa <vListInsertEnd>
    80002506:	a819                	j	8000251c <xTaskRemoveFromEventList+0x92>
    80002508:	67c2                	ld	a5,16(sp)
    8000250a:	03078793          	addi	a5,a5,48
    8000250e:	85be                	mv	a1,a5
    80002510:	0001e517          	auipc	a0,0x1e
    80002514:	19050513          	addi	a0,a0,400 # 800206a0 <xPendingReadyList>
    80002518:	8e2fe0ef          	jal	ra,800005fa <vListInsertEnd>
    8000251c:	67c2                	ld	a5,16(sp)
    8000251e:	6fb8                	ld	a4,88(a5)
    80002520:	0001e797          	auipc	a5,0x1e
    80002524:	e2078793          	addi	a5,a5,-480 # 80020340 <pxCurrentTCB>
    80002528:	639c                	ld	a5,0(a5)
    8000252a:	6fbc                	ld	a5,88(a5)
    8000252c:	00e7fb63          	bgeu	a5,a4,80002542 <xTaskRemoveFromEventList+0xb8>
    80002530:	4785                	li	a5,1
    80002532:	ec3e                	sd	a5,24(sp)
    80002534:	0001e797          	auipc	a5,0x1e
    80002538:	21478793          	addi	a5,a5,532 # 80020748 <xYieldPending>
    8000253c:	4705                	li	a4,1
    8000253e:	e398                	sd	a4,0(a5)
    80002540:	a011                	j	80002544 <xTaskRemoveFromEventList+0xba>
    80002542:	ec02                	sd	zero,24(sp)
    80002544:	67e2                	ld	a5,24(sp)
    80002546:	853e                	mv	a0,a5
    80002548:	70a2                	ld	ra,40(sp)
    8000254a:	6145                	addi	sp,sp,48
    8000254c:	8082                	ret

000000008000254e <xTaskRemoveFromUnorderedEventList>:
    8000254e:	7179                	addi	sp,sp,-48
    80002550:	f406                	sd	ra,40(sp)
    80002552:	e42a                	sd	a0,8(sp)
    80002554:	87ae                	mv	a5,a1
    80002556:	c23e                	sw	a5,4(sp)
    80002558:	0001e797          	auipc	a5,0x1e
    8000255c:	21078793          	addi	a5,a5,528 # 80020768 <uxSchedulerSuspended>
    80002560:	639c                	ld	a5,0(a5)
    80002562:	e781                	bnez	a5,8000256a <xTaskRemoveFromUnorderedEventList+0x1c>
    80002564:	30047073          	csrci	mstatus,8
    80002568:	a001                	j	80002568 <xTaskRemoveFromUnorderedEventList+0x1a>
    8000256a:	4792                	lw	a5,4(sp)
    8000256c:	873e                	mv	a4,a5
    8000256e:	800007b7          	lui	a5,0x80000
    80002572:	8fd9                	or	a5,a5,a4
    80002574:	0007871b          	sext.w	a4,a5
    80002578:	67a2                	ld	a5,8(sp)
    8000257a:	c398                	sw	a4,0(a5)
    8000257c:	67a2                	ld	a5,8(sp)
    8000257e:	6f9c                	ld	a5,24(a5)
    80002580:	e83e                	sd	a5,16(sp)
    80002582:	67c2                	ld	a5,16(sp)
    80002584:	e781                	bnez	a5,8000258c <xTaskRemoveFromUnorderedEventList+0x3e>
    80002586:	30047073          	csrci	mstatus,8
    8000258a:	a001                	j	8000258a <xTaskRemoveFromUnorderedEventList+0x3c>
    8000258c:	6522                	ld	a0,8(sp)
    8000258e:	91cfe0ef          	jal	ra,800006aa <uxListRemove>
    80002592:	67c2                	ld	a5,16(sp)
    80002594:	07a1                	addi	a5,a5,8
    80002596:	853e                	mv	a0,a5
    80002598:	912fe0ef          	jal	ra,800006aa <uxListRemove>
    8000259c:	67c2                	ld	a5,16(sp)
    8000259e:	6fb8                	ld	a4,88(a5)
    800025a0:	0001e797          	auipc	a5,0x1e
    800025a4:	19078793          	addi	a5,a5,400 # 80020730 <uxTopReadyPriority>
    800025a8:	639c                	ld	a5,0(a5)
    800025aa:	00e7f963          	bgeu	a5,a4,800025bc <xTaskRemoveFromUnorderedEventList+0x6e>
    800025ae:	67c2                	ld	a5,16(sp)
    800025b0:	6fb8                	ld	a4,88(a5)
    800025b2:	0001e797          	auipc	a5,0x1e
    800025b6:	17e78793          	addi	a5,a5,382 # 80020730 <uxTopReadyPriority>
    800025ba:	e398                	sd	a4,0(a5)
    800025bc:	67c2                	ld	a5,16(sp)
    800025be:	6fb8                	ld	a4,88(a5)
    800025c0:	87ba                	mv	a5,a4
    800025c2:	078a                	slli	a5,a5,0x2
    800025c4:	97ba                	add	a5,a5,a4
    800025c6:	078e                	slli	a5,a5,0x3
    800025c8:	0001e717          	auipc	a4,0x1e
    800025cc:	fb070713          	addi	a4,a4,-80 # 80020578 <pxReadyTasksLists>
    800025d0:	973e                	add	a4,a4,a5
    800025d2:	67c2                	ld	a5,16(sp)
    800025d4:	07a1                	addi	a5,a5,8
    800025d6:	85be                	mv	a1,a5
    800025d8:	853a                	mv	a0,a4
    800025da:	820fe0ef          	jal	ra,800005fa <vListInsertEnd>
    800025de:	67c2                	ld	a5,16(sp)
    800025e0:	6fb8                	ld	a4,88(a5)
    800025e2:	0001e797          	auipc	a5,0x1e
    800025e6:	d5e78793          	addi	a5,a5,-674 # 80020340 <pxCurrentTCB>
    800025ea:	639c                	ld	a5,0(a5)
    800025ec:	6fbc                	ld	a5,88(a5)
    800025ee:	00e7fb63          	bgeu	a5,a4,80002604 <xTaskRemoveFromUnorderedEventList+0xb6>
    800025f2:	4785                	li	a5,1
    800025f4:	ec3e                	sd	a5,24(sp)
    800025f6:	0001e797          	auipc	a5,0x1e
    800025fa:	15278793          	addi	a5,a5,338 # 80020748 <xYieldPending>
    800025fe:	4705                	li	a4,1
    80002600:	e398                	sd	a4,0(a5)
    80002602:	a011                	j	80002606 <xTaskRemoveFromUnorderedEventList+0xb8>
    80002604:	ec02                	sd	zero,24(sp)
    80002606:	67e2                	ld	a5,24(sp)
    80002608:	853e                	mv	a0,a5
    8000260a:	70a2                	ld	ra,40(sp)
    8000260c:	6145                	addi	sp,sp,48
    8000260e:	8082                	ret

0000000080002610 <vTaskSetTimeOutState>:
    80002610:	1141                	addi	sp,sp,-16
    80002612:	e42a                	sd	a0,8(sp)
    80002614:	67a2                	ld	a5,8(sp)
    80002616:	e781                	bnez	a5,8000261e <vTaskSetTimeOutState+0xe>
    80002618:	30047073          	csrci	mstatus,8
    8000261c:	a001                	j	8000261c <vTaskSetTimeOutState+0xc>
    8000261e:	0001e797          	auipc	a5,0x1e
    80002622:	13278793          	addi	a5,a5,306 # 80020750 <xNumOfOverflows>
    80002626:	6398                	ld	a4,0(a5)
    80002628:	67a2                	ld	a5,8(sp)
    8000262a:	e398                	sd	a4,0(a5)
    8000262c:	0001e797          	auipc	a5,0x1e
    80002630:	0fc78793          	addi	a5,a5,252 # 80020728 <xTickCount>
    80002634:	439c                	lw	a5,0(a5)
    80002636:	0007871b          	sext.w	a4,a5
    8000263a:	67a2                	ld	a5,8(sp)
    8000263c:	c798                	sw	a4,8(a5)
    8000263e:	0001                	nop
    80002640:	0141                	addi	sp,sp,16
    80002642:	8082                	ret

0000000080002644 <xTaskCheckForTimeOut>:
    80002644:	7179                	addi	sp,sp,-48
    80002646:	f406                	sd	ra,40(sp)
    80002648:	e42a                	sd	a0,8(sp)
    8000264a:	e02e                	sd	a1,0(sp)
    8000264c:	67a2                	ld	a5,8(sp)
    8000264e:	e781                	bnez	a5,80002656 <xTaskCheckForTimeOut+0x12>
    80002650:	30047073          	csrci	mstatus,8
    80002654:	a001                	j	80002654 <xTaskCheckForTimeOut+0x10>
    80002656:	6782                	ld	a5,0(sp)
    80002658:	e781                	bnez	a5,80002660 <xTaskCheckForTimeOut+0x1c>
    8000265a:	30047073          	csrci	mstatus,8
    8000265e:	a001                	j	8000265e <xTaskCheckForTimeOut+0x1a>
    80002660:	7d2000ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80002664:	0001e797          	auipc	a5,0x1e
    80002668:	0c478793          	addi	a5,a5,196 # 80020728 <xTickCount>
    8000266c:	439c                	lw	a5,0(a5)
    8000266e:	ca3e                	sw	a5,20(sp)
    80002670:	6782                	ld	a5,0(sp)
    80002672:	439c                	lw	a5,0(a5)
    80002674:	873e                	mv	a4,a5
    80002676:	57fd                	li	a5,-1
    80002678:	00f71463          	bne	a4,a5,80002680 <xTaskCheckForTimeOut+0x3c>
    8000267c:	ec02                	sd	zero,24(sp)
    8000267e:	a08d                	j	800026e0 <xTaskCheckForTimeOut+0x9c>
    80002680:	67a2                	ld	a5,8(sp)
    80002682:	6398                	ld	a4,0(a5)
    80002684:	0001e797          	auipc	a5,0x1e
    80002688:	0cc78793          	addi	a5,a5,204 # 80020750 <xNumOfOverflows>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	00f70b63          	beq	a4,a5,800026a4 <xTaskCheckForTimeOut+0x60>
    80002692:	67a2                	ld	a5,8(sp)
    80002694:	4798                	lw	a4,8(a5)
    80002696:	47d2                	lw	a5,20(sp)
    80002698:	2781                	sext.w	a5,a5
    8000269a:	00e7e563          	bltu	a5,a4,800026a4 <xTaskCheckForTimeOut+0x60>
    8000269e:	4785                	li	a5,1
    800026a0:	ec3e                	sd	a5,24(sp)
    800026a2:	a83d                	j	800026e0 <xTaskCheckForTimeOut+0x9c>
    800026a4:	67a2                	ld	a5,8(sp)
    800026a6:	479c                	lw	a5,8(a5)
    800026a8:	4752                	lw	a4,20(sp)
    800026aa:	40f707bb          	subw	a5,a4,a5
    800026ae:	0007871b          	sext.w	a4,a5
    800026b2:	6782                	ld	a5,0(sp)
    800026b4:	439c                	lw	a5,0(a5)
    800026b6:	02f77363          	bgeu	a4,a5,800026dc <xTaskCheckForTimeOut+0x98>
    800026ba:	6782                	ld	a5,0(sp)
    800026bc:	4398                	lw	a4,0(a5)
    800026be:	67a2                	ld	a5,8(sp)
    800026c0:	479c                	lw	a5,8(a5)
    800026c2:	46d2                	lw	a3,20(sp)
    800026c4:	9f95                	subw	a5,a5,a3
    800026c6:	2781                	sext.w	a5,a5
    800026c8:	9fb9                	addw	a5,a5,a4
    800026ca:	0007871b          	sext.w	a4,a5
    800026ce:	6782                	ld	a5,0(sp)
    800026d0:	c398                	sw	a4,0(a5)
    800026d2:	6522                	ld	a0,8(sp)
    800026d4:	f3dff0ef          	jal	ra,80002610 <vTaskSetTimeOutState>
    800026d8:	ec02                	sd	zero,24(sp)
    800026da:	a019                	j	800026e0 <xTaskCheckForTimeOut+0x9c>
    800026dc:	4785                	li	a5,1
    800026de:	ec3e                	sd	a5,24(sp)
    800026e0:	780000ef          	jal	ra,80002e60 <vTaskExitCritical>
    800026e4:	67e2                	ld	a5,24(sp)
    800026e6:	853e                	mv	a0,a5
    800026e8:	70a2                	ld	ra,40(sp)
    800026ea:	6145                	addi	sp,sp,48
    800026ec:	8082                	ret

00000000800026ee <vTaskMissedYield>:
    800026ee:	0001e797          	auipc	a5,0x1e
    800026f2:	05a78793          	addi	a5,a5,90 # 80020748 <xYieldPending>
    800026f6:	4705                	li	a4,1
    800026f8:	e398                	sd	a4,0(a5)
    800026fa:	0001                	nop
    800026fc:	8082                	ret

00000000800026fe <uxTaskGetTaskNumber>:
    800026fe:	1101                	addi	sp,sp,-32
    80002700:	e42a                	sd	a0,8(sp)
    80002702:	67a2                	ld	a5,8(sp)
    80002704:	c799                	beqz	a5,80002712 <uxTaskGetTaskNumber+0x14>
    80002706:	67a2                	ld	a5,8(sp)
    80002708:	e83e                	sd	a5,16(sp)
    8000270a:	67c2                	ld	a5,16(sp)
    8000270c:	67dc                	ld	a5,136(a5)
    8000270e:	ec3e                	sd	a5,24(sp)
    80002710:	a011                	j	80002714 <uxTaskGetTaskNumber+0x16>
    80002712:	ec02                	sd	zero,24(sp)
    80002714:	67e2                	ld	a5,24(sp)
    80002716:	853e                	mv	a0,a5
    80002718:	6105                	addi	sp,sp,32
    8000271a:	8082                	ret

000000008000271c <vTaskSetTaskNumber>:
    8000271c:	1101                	addi	sp,sp,-32
    8000271e:	e42a                	sd	a0,8(sp)
    80002720:	e02e                	sd	a1,0(sp)
    80002722:	67a2                	ld	a5,8(sp)
    80002724:	c791                	beqz	a5,80002730 <vTaskSetTaskNumber+0x14>
    80002726:	67a2                	ld	a5,8(sp)
    80002728:	ec3e                	sd	a5,24(sp)
    8000272a:	67e2                	ld	a5,24(sp)
    8000272c:	6702                	ld	a4,0(sp)
    8000272e:	e7d8                	sd	a4,136(a5)
    80002730:	0001                	nop
    80002732:	6105                	addi	sp,sp,32
    80002734:	8082                	ret

0000000080002736 <prvIdleTask>:
    80002736:	1101                	addi	sp,sp,-32
    80002738:	ec06                	sd	ra,24(sp)
    8000273a:	e42a                	sd	a0,8(sp)
    8000273c:	16c000ef          	jal	ra,800028a8 <prvCheckTasksWaitingTermination>
    80002740:	0001e797          	auipc	a5,0x1e
    80002744:	e3878793          	addi	a5,a5,-456 # 80020578 <pxReadyTasksLists>
    80002748:	6398                	ld	a4,0(a5)
    8000274a:	4785                	li	a5,1
    8000274c:	fee7f8e3          	bgeu	a5,a4,8000273c <prvIdleTask+0x6>
    80002750:	cbdfd0ef          	jal	ra,8000040c <vPortYield>
    80002754:	b7e5                	j	8000273c <prvIdleTask+0x6>

0000000080002756 <prvInitialiseTCBVariables>:
    80002756:	715d                	addi	sp,sp,-80
    80002758:	e486                	sd	ra,72(sp)
    8000275a:	f42a                	sd	a0,40(sp)
    8000275c:	f02e                	sd	a1,32(sp)
    8000275e:	ec32                	sd	a2,24(sp)
    80002760:	e836                	sd	a3,16(sp)
    80002762:	87ba                	mv	a5,a4
    80002764:	00f11723          	sh	a5,14(sp)
    80002768:	fc02                	sd	zero,56(sp)
    8000276a:	a025                	j	80002792 <prvInitialiseTCBVariables+0x3c>
    8000276c:	7702                	ld	a4,32(sp)
    8000276e:	77e2                	ld	a5,56(sp)
    80002770:	97ba                	add	a5,a5,a4
    80002772:	0007c703          	lbu	a4,0(a5)
    80002776:	76a2                	ld	a3,40(sp)
    80002778:	77e2                	ld	a5,56(sp)
    8000277a:	97b6                	add	a5,a5,a3
    8000277c:	06e78423          	sb	a4,104(a5)
    80002780:	7702                	ld	a4,32(sp)
    80002782:	77e2                	ld	a5,56(sp)
    80002784:	97ba                	add	a5,a5,a4
    80002786:	0007c783          	lbu	a5,0(a5)
    8000278a:	cb89                	beqz	a5,8000279c <prvInitialiseTCBVariables+0x46>
    8000278c:	77e2                	ld	a5,56(sp)
    8000278e:	0785                	addi	a5,a5,1
    80002790:	fc3e                	sd	a5,56(sp)
    80002792:	7762                	ld	a4,56(sp)
    80002794:	47bd                	li	a5,15
    80002796:	fce7fbe3          	bgeu	a5,a4,8000276c <prvInitialiseTCBVariables+0x16>
    8000279a:	a011                	j	8000279e <prvInitialiseTCBVariables+0x48>
    8000279c:	0001                	nop
    8000279e:	77a2                	ld	a5,40(sp)
    800027a0:	06078ba3          	sb	zero,119(a5)
    800027a4:	6762                	ld	a4,24(sp)
    800027a6:	4791                	li	a5,4
    800027a8:	00e7f463          	bgeu	a5,a4,800027b0 <prvInitialiseTCBVariables+0x5a>
    800027ac:	4791                	li	a5,4
    800027ae:	ec3e                	sd	a5,24(sp)
    800027b0:	77a2                	ld	a5,40(sp)
    800027b2:	6762                	ld	a4,24(sp)
    800027b4:	efb8                	sd	a4,88(a5)
    800027b6:	77a2                	ld	a5,40(sp)
    800027b8:	6762                	ld	a4,24(sp)
    800027ba:	ebd8                	sd	a4,144(a5)
    800027bc:	77a2                	ld	a5,40(sp)
    800027be:	0807bc23          	sd	zero,152(a5)
    800027c2:	77a2                	ld	a5,40(sp)
    800027c4:	07a1                	addi	a5,a5,8
    800027c6:	853e                	mv	a0,a5
    800027c8:	e23fd0ef          	jal	ra,800005ea <vListInitialiseItem>
    800027cc:	77a2                	ld	a5,40(sp)
    800027ce:	03078793          	addi	a5,a5,48
    800027d2:	853e                	mv	a0,a5
    800027d4:	e17fd0ef          	jal	ra,800005ea <vListInitialiseItem>
    800027d8:	77a2                	ld	a5,40(sp)
    800027da:	7722                	ld	a4,40(sp)
    800027dc:	f398                	sd	a4,32(a5)
    800027de:	67e2                	ld	a5,24(sp)
    800027e0:	2781                	sext.w	a5,a5
    800027e2:	4715                	li	a4,5
    800027e4:	40f707bb          	subw	a5,a4,a5
    800027e8:	0007871b          	sext.w	a4,a5
    800027ec:	77a2                	ld	a5,40(sp)
    800027ee:	db98                	sw	a4,48(a5)
    800027f0:	77a2                	ld	a5,40(sp)
    800027f2:	7722                	ld	a4,40(sp)
    800027f4:	e7b8                	sd	a4,72(a5)
    800027f6:	77a2                	ld	a5,40(sp)
    800027f8:	0607bc23          	sd	zero,120(a5)
    800027fc:	77a2                	ld	a5,40(sp)
    800027fe:	0a07a023          	sw	zero,160(a5)
    80002802:	77a2                	ld	a5,40(sp)
    80002804:	0a07a223          	sw	zero,164(a5)
    80002808:	0001                	nop
    8000280a:	60a6                	ld	ra,72(sp)
    8000280c:	6161                	addi	sp,sp,80
    8000280e:	8082                	ret

0000000080002810 <prvInitialiseTaskLists>:
    80002810:	1101                	addi	sp,sp,-32
    80002812:	ec06                	sd	ra,24(sp)
    80002814:	e402                	sd	zero,8(sp)
    80002816:	a00d                	j	80002838 <prvInitialiseTaskLists+0x28>
    80002818:	6722                	ld	a4,8(sp)
    8000281a:	87ba                	mv	a5,a4
    8000281c:	078a                	slli	a5,a5,0x2
    8000281e:	97ba                	add	a5,a5,a4
    80002820:	078e                	slli	a5,a5,0x3
    80002822:	0001e717          	auipc	a4,0x1e
    80002826:	d5670713          	addi	a4,a4,-682 # 80020578 <pxReadyTasksLists>
    8000282a:	97ba                	add	a5,a5,a4
    8000282c:	853e                	mv	a0,a5
    8000282e:	d89fd0ef          	jal	ra,800005b6 <vListInitialise>
    80002832:	67a2                	ld	a5,8(sp)
    80002834:	0785                	addi	a5,a5,1
    80002836:	e43e                	sd	a5,8(sp)
    80002838:	6722                	ld	a4,8(sp)
    8000283a:	4791                	li	a5,4
    8000283c:	fce7fee3          	bgeu	a5,a4,80002818 <prvInitialiseTaskLists+0x8>
    80002840:	0001e517          	auipc	a0,0x1e
    80002844:	e0050513          	addi	a0,a0,-512 # 80020640 <xDelayedTaskList1>
    80002848:	d6ffd0ef          	jal	ra,800005b6 <vListInitialise>
    8000284c:	0001e517          	auipc	a0,0x1e
    80002850:	e1c50513          	addi	a0,a0,-484 # 80020668 <xDelayedTaskList2>
    80002854:	d63fd0ef          	jal	ra,800005b6 <vListInitialise>
    80002858:	0001e517          	auipc	a0,0x1e
    8000285c:	e4850513          	addi	a0,a0,-440 # 800206a0 <xPendingReadyList>
    80002860:	d57fd0ef          	jal	ra,800005b6 <vListInitialise>
    80002864:	0001e517          	auipc	a0,0x1e
    80002868:	e6450513          	addi	a0,a0,-412 # 800206c8 <xTasksWaitingTermination>
    8000286c:	d4bfd0ef          	jal	ra,800005b6 <vListInitialise>
    80002870:	0001e517          	auipc	a0,0x1e
    80002874:	e8850513          	addi	a0,a0,-376 # 800206f8 <xSuspendedTaskList>
    80002878:	d3ffd0ef          	jal	ra,800005b6 <vListInitialise>
    8000287c:	0001e797          	auipc	a5,0x1e
    80002880:	e1478793          	addi	a5,a5,-492 # 80020690 <pxDelayedTaskList>
    80002884:	0001e717          	auipc	a4,0x1e
    80002888:	dbc70713          	addi	a4,a4,-580 # 80020640 <xDelayedTaskList1>
    8000288c:	e398                	sd	a4,0(a5)
    8000288e:	0001e797          	auipc	a5,0x1e
    80002892:	e0a78793          	addi	a5,a5,-502 # 80020698 <pxOverflowDelayedTaskList>
    80002896:	0001e717          	auipc	a4,0x1e
    8000289a:	dd270713          	addi	a4,a4,-558 # 80020668 <xDelayedTaskList2>
    8000289e:	e398                	sd	a4,0(a5)
    800028a0:	0001                	nop
    800028a2:	60e2                	ld	ra,24(sp)
    800028a4:	6105                	addi	sp,sp,32
    800028a6:	8082                	ret

00000000800028a8 <prvCheckTasksWaitingTermination>:
    800028a8:	1101                	addi	sp,sp,-32
    800028aa:	ec06                	sd	ra,24(sp)
    800028ac:	a8a5                	j	80002924 <prvCheckTasksWaitingTermination+0x7c>
    800028ae:	c14ff0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    800028b2:	0001e797          	auipc	a5,0x1e
    800028b6:	e1678793          	addi	a5,a5,-490 # 800206c8 <xTasksWaitingTermination>
    800028ba:	639c                	ld	a5,0(a5)
    800028bc:	0017b793          	seqz	a5,a5
    800028c0:	0ff7f793          	zext.b	a5,a5
    800028c4:	e43e                	sd	a5,8(sp)
    800028c6:	c18ff0ef          	jal	ra,80001cde <xTaskResumeAll>
    800028ca:	67a2                	ld	a5,8(sp)
    800028cc:	efa1                	bnez	a5,80002924 <prvCheckTasksWaitingTermination+0x7c>
    800028ce:	564000ef          	jal	ra,80002e32 <vTaskEnterCritical>
    800028d2:	0001e797          	auipc	a5,0x1e
    800028d6:	df678793          	addi	a5,a5,-522 # 800206c8 <xTasksWaitingTermination>
    800028da:	6f9c                	ld	a5,24(a5)
    800028dc:	6f9c                	ld	a5,24(a5)
    800028de:	e03e                	sd	a5,0(sp)
    800028e0:	6782                	ld	a5,0(sp)
    800028e2:	07a1                	addi	a5,a5,8
    800028e4:	853e                	mv	a0,a5
    800028e6:	dc5fd0ef          	jal	ra,800006aa <uxListRemove>
    800028ea:	0001e797          	auipc	a5,0x1e
    800028ee:	e3678793          	addi	a5,a5,-458 # 80020720 <uxCurrentNumberOfTasks>
    800028f2:	639c                	ld	a5,0(a5)
    800028f4:	fff78713          	addi	a4,a5,-1
    800028f8:	0001e797          	auipc	a5,0x1e
    800028fc:	e2878793          	addi	a5,a5,-472 # 80020720 <uxCurrentNumberOfTasks>
    80002900:	e398                	sd	a4,0(a5)
    80002902:	0001e797          	auipc	a5,0x1e
    80002906:	dee78793          	addi	a5,a5,-530 # 800206f0 <uxTasksDeleted>
    8000290a:	639c                	ld	a5,0(a5)
    8000290c:	fff78713          	addi	a4,a5,-1
    80002910:	0001e797          	auipc	a5,0x1e
    80002914:	de078793          	addi	a5,a5,-544 # 800206f0 <uxTasksDeleted>
    80002918:	e398                	sd	a4,0(a5)
    8000291a:	546000ef          	jal	ra,80002e60 <vTaskExitCritical>
    8000291e:	6502                	ld	a0,0(sp)
    80002920:	2ba000ef          	jal	ra,80002bda <prvDeleteTCB>
    80002924:	0001e797          	auipc	a5,0x1e
    80002928:	dcc78793          	addi	a5,a5,-564 # 800206f0 <uxTasksDeleted>
    8000292c:	639c                	ld	a5,0(a5)
    8000292e:	f3c1                	bnez	a5,800028ae <prvCheckTasksWaitingTermination+0x6>
    80002930:	0001                	nop
    80002932:	0001                	nop
    80002934:	60e2                	ld	ra,24(sp)
    80002936:	6105                	addi	sp,sp,32
    80002938:	8082                	ret

000000008000293a <prvAddCurrentTaskToDelayedList>:
    8000293a:	1101                	addi	sp,sp,-32
    8000293c:	ec06                	sd	ra,24(sp)
    8000293e:	87aa                	mv	a5,a0
    80002940:	c63e                	sw	a5,12(sp)
    80002942:	0001e797          	auipc	a5,0x1e
    80002946:	9fe78793          	addi	a5,a5,-1538 # 80020340 <pxCurrentTCB>
    8000294a:	639c                	ld	a5,0(a5)
    8000294c:	4732                	lw	a4,12(sp)
    8000294e:	c798                	sw	a4,8(a5)
    80002950:	0001e797          	auipc	a5,0x1e
    80002954:	dd878793          	addi	a5,a5,-552 # 80020728 <xTickCount>
    80002958:	439c                	lw	a5,0(a5)
    8000295a:	0007871b          	sext.w	a4,a5
    8000295e:	47b2                	lw	a5,12(sp)
    80002960:	2781                	sext.w	a5,a5
    80002962:	02e7f263          	bgeu	a5,a4,80002986 <prvAddCurrentTaskToDelayedList+0x4c>
    80002966:	0001e797          	auipc	a5,0x1e
    8000296a:	d3278793          	addi	a5,a5,-718 # 80020698 <pxOverflowDelayedTaskList>
    8000296e:	6398                	ld	a4,0(a5)
    80002970:	0001e797          	auipc	a5,0x1e
    80002974:	9d078793          	addi	a5,a5,-1584 # 80020340 <pxCurrentTCB>
    80002978:	639c                	ld	a5,0(a5)
    8000297a:	07a1                	addi	a5,a5,8
    8000297c:	85be                	mv	a1,a5
    8000297e:	853a                	mv	a0,a4
    80002980:	cbbfd0ef          	jal	ra,8000063a <vListInsert>
    80002984:	a089                	j	800029c6 <prvAddCurrentTaskToDelayedList+0x8c>
    80002986:	0001e797          	auipc	a5,0x1e
    8000298a:	d0a78793          	addi	a5,a5,-758 # 80020690 <pxDelayedTaskList>
    8000298e:	6398                	ld	a4,0(a5)
    80002990:	0001e797          	auipc	a5,0x1e
    80002994:	9b078793          	addi	a5,a5,-1616 # 80020340 <pxCurrentTCB>
    80002998:	639c                	ld	a5,0(a5)
    8000299a:	07a1                	addi	a5,a5,8
    8000299c:	85be                	mv	a1,a5
    8000299e:	853a                	mv	a0,a4
    800029a0:	c9bfd0ef          	jal	ra,8000063a <vListInsert>
    800029a4:	0001e797          	auipc	a5,0x1e
    800029a8:	dbc78793          	addi	a5,a5,-580 # 80020760 <xNextTaskUnblockTime>
    800029ac:	439c                	lw	a5,0(a5)
    800029ae:	0007871b          	sext.w	a4,a5
    800029b2:	47b2                	lw	a5,12(sp)
    800029b4:	2781                	sext.w	a5,a5
    800029b6:	00e7f863          	bgeu	a5,a4,800029c6 <prvAddCurrentTaskToDelayedList+0x8c>
    800029ba:	0001e797          	auipc	a5,0x1e
    800029be:	da678793          	addi	a5,a5,-602 # 80020760 <xNextTaskUnblockTime>
    800029c2:	4732                	lw	a4,12(sp)
    800029c4:	c398                	sw	a4,0(a5)
    800029c6:	0001                	nop
    800029c8:	60e2                	ld	ra,24(sp)
    800029ca:	6105                	addi	sp,sp,32
    800029cc:	8082                	ret

00000000800029ce <prvAllocateTCBAndStack>:
    800029ce:	7179                	addi	sp,sp,-48
    800029d0:	f406                	sd	ra,40(sp)
    800029d2:	87aa                	mv	a5,a0
    800029d4:	e02e                	sd	a1,0(sp)
    800029d6:	00f11723          	sh	a5,14(sp)
    800029da:	6782                	ld	a5,0(sp)
    800029dc:	eb89                	bnez	a5,800029ee <prvAllocateTCBAndStack+0x20>
    800029de:	00e15783          	lhu	a5,14(sp)
    800029e2:	078e                	slli	a5,a5,0x3
    800029e4:	853e                	mv	a0,a5
    800029e6:	7de010ef          	jal	ra,800041c4 <pvPortMalloc>
    800029ea:	87aa                	mv	a5,a0
    800029ec:	a011                	j	800029f0 <prvAllocateTCBAndStack+0x22>
    800029ee:	6782                	ld	a5,0(sp)
    800029f0:	e83e                	sd	a5,16(sp)
    800029f2:	67c2                	ld	a5,16(sp)
    800029f4:	c385                	beqz	a5,80002a14 <prvAllocateTCBAndStack+0x46>
    800029f6:	0a800513          	li	a0,168
    800029fa:	7ca010ef          	jal	ra,800041c4 <pvPortMalloc>
    800029fe:	ec2a                	sd	a0,24(sp)
    80002a00:	67e2                	ld	a5,24(sp)
    80002a02:	c789                	beqz	a5,80002a0c <prvAllocateTCBAndStack+0x3e>
    80002a04:	67e2                	ld	a5,24(sp)
    80002a06:	6742                	ld	a4,16(sp)
    80002a08:	f3b8                	sd	a4,96(a5)
    80002a0a:	a031                	j	80002a16 <prvAllocateTCBAndStack+0x48>
    80002a0c:	6542                	ld	a0,16(sp)
    80002a0e:	0ef010ef          	jal	ra,800042fc <vPortFree>
    80002a12:	a011                	j	80002a16 <prvAllocateTCBAndStack+0x48>
    80002a14:	ec02                	sd	zero,24(sp)
    80002a16:	67e2                	ld	a5,24(sp)
    80002a18:	cf81                	beqz	a5,80002a30 <prvAllocateTCBAndStack+0x62>
    80002a1a:	67e2                	ld	a5,24(sp)
    80002a1c:	73b8                	ld	a4,96(a5)
    80002a1e:	00e15783          	lhu	a5,14(sp)
    80002a22:	078e                	slli	a5,a5,0x3
    80002a24:	863e                	mv	a2,a5
    80002a26:	0a500593          	li	a1,165
    80002a2a:	853a                	mv	a0,a4
    80002a2c:	227010ef          	jal	ra,80004452 <memset>
    80002a30:	67e2                	ld	a5,24(sp)
    80002a32:	853e                	mv	a0,a5
    80002a34:	70a2                	ld	ra,40(sp)
    80002a36:	6145                	addi	sp,sp,48
    80002a38:	8082                	ret

0000000080002a3a <prvListTaskWithinSingleList>:
    80002a3a:	711d                	addi	sp,sp,-96
    80002a3c:	ec86                	sd	ra,88(sp)
    80002a3e:	e8a2                	sd	s0,80(sp)
    80002a40:	ec2a                	sd	a0,24(sp)
    80002a42:	e82e                	sd	a1,16(sp)
    80002a44:	87b2                	mv	a5,a2
    80002a46:	c63e                	sw	a5,12(sp)
    80002a48:	e482                	sd	zero,72(sp)
    80002a4a:	67c2                	ld	a5,16(sp)
    80002a4c:	639c                	ld	a5,0(a5)
    80002a4e:	14078463          	beqz	a5,80002b96 <prvListTaskWithinSingleList+0x15c>
    80002a52:	67c2                	ld	a5,16(sp)
    80002a54:	e0be                	sd	a5,64(sp)
    80002a56:	6786                	ld	a5,64(sp)
    80002a58:	679c                	ld	a5,8(a5)
    80002a5a:	6798                	ld	a4,8(a5)
    80002a5c:	6786                	ld	a5,64(sp)
    80002a5e:	e798                	sd	a4,8(a5)
    80002a60:	6786                	ld	a5,64(sp)
    80002a62:	6798                	ld	a4,8(a5)
    80002a64:	6786                	ld	a5,64(sp)
    80002a66:	07c1                	addi	a5,a5,16
    80002a68:	00f71763          	bne	a4,a5,80002a76 <prvListTaskWithinSingleList+0x3c>
    80002a6c:	6786                	ld	a5,64(sp)
    80002a6e:	679c                	ld	a5,8(a5)
    80002a70:	6798                	ld	a4,8(a5)
    80002a72:	6786                	ld	a5,64(sp)
    80002a74:	e798                	sd	a4,8(a5)
    80002a76:	6786                	ld	a5,64(sp)
    80002a78:	679c                	ld	a5,8(a5)
    80002a7a:	6f9c                	ld	a5,24(a5)
    80002a7c:	fc3e                	sd	a5,56(sp)
    80002a7e:	67c2                	ld	a5,16(sp)
    80002a80:	f83e                	sd	a5,48(sp)
    80002a82:	77c2                	ld	a5,48(sp)
    80002a84:	679c                	ld	a5,8(a5)
    80002a86:	6798                	ld	a4,8(a5)
    80002a88:	77c2                	ld	a5,48(sp)
    80002a8a:	e798                	sd	a4,8(a5)
    80002a8c:	77c2                	ld	a5,48(sp)
    80002a8e:	6798                	ld	a4,8(a5)
    80002a90:	77c2                	ld	a5,48(sp)
    80002a92:	07c1                	addi	a5,a5,16
    80002a94:	00f71763          	bne	a4,a5,80002aa2 <prvListTaskWithinSingleList+0x68>
    80002a98:	77c2                	ld	a5,48(sp)
    80002a9a:	679c                	ld	a5,8(a5)
    80002a9c:	6798                	ld	a4,8(a5)
    80002a9e:	77c2                	ld	a5,48(sp)
    80002aa0:	e798                	sd	a4,8(a5)
    80002aa2:	77c2                	ld	a5,48(sp)
    80002aa4:	679c                	ld	a5,8(a5)
    80002aa6:	6f9c                	ld	a5,24(a5)
    80002aa8:	f43e                	sd	a5,40(sp)
    80002aaa:	6726                	ld	a4,72(sp)
    80002aac:	87ba                	mv	a5,a4
    80002aae:	078e                	slli	a5,a5,0x3
    80002ab0:	8f99                	sub	a5,a5,a4
    80002ab2:	078e                	slli	a5,a5,0x3
    80002ab4:	873e                	mv	a4,a5
    80002ab6:	67e2                	ld	a5,24(sp)
    80002ab8:	97ba                	add	a5,a5,a4
    80002aba:	7722                	ld	a4,40(sp)
    80002abc:	e398                	sd	a4,0(a5)
    80002abe:	6726                	ld	a4,72(sp)
    80002ac0:	87ba                	mv	a5,a4
    80002ac2:	078e                	slli	a5,a5,0x3
    80002ac4:	8f99                	sub	a5,a5,a4
    80002ac6:	078e                	slli	a5,a5,0x3
    80002ac8:	873e                	mv	a4,a5
    80002aca:	67e2                	ld	a5,24(sp)
    80002acc:	97ba                	add	a5,a5,a4
    80002ace:	7722                	ld	a4,40(sp)
    80002ad0:	06870713          	addi	a4,a4,104
    80002ad4:	e798                	sd	a4,8(a5)
    80002ad6:	6726                	ld	a4,72(sp)
    80002ad8:	87ba                	mv	a5,a4
    80002ada:	078e                	slli	a5,a5,0x3
    80002adc:	8f99                	sub	a5,a5,a4
    80002ade:	078e                	slli	a5,a5,0x3
    80002ae0:	873e                	mv	a4,a5
    80002ae2:	67e2                	ld	a5,24(sp)
    80002ae4:	97ba                	add	a5,a5,a4
    80002ae6:	7722                	ld	a4,40(sp)
    80002ae8:	6358                	ld	a4,128(a4)
    80002aea:	eb98                	sd	a4,16(a5)
    80002aec:	6726                	ld	a4,72(sp)
    80002aee:	87ba                	mv	a5,a4
    80002af0:	078e                	slli	a5,a5,0x3
    80002af2:	8f99                	sub	a5,a5,a4
    80002af4:	078e                	slli	a5,a5,0x3
    80002af6:	873e                	mv	a4,a5
    80002af8:	67e2                	ld	a5,24(sp)
    80002afa:	97ba                	add	a5,a5,a4
    80002afc:	4732                	lw	a4,12(sp)
    80002afe:	cf98                	sw	a4,24(a5)
    80002b00:	6726                	ld	a4,72(sp)
    80002b02:	87ba                	mv	a5,a4
    80002b04:	078e                	slli	a5,a5,0x3
    80002b06:	8f99                	sub	a5,a5,a4
    80002b08:	078e                	slli	a5,a5,0x3
    80002b0a:	873e                	mv	a4,a5
    80002b0c:	67e2                	ld	a5,24(sp)
    80002b0e:	97ba                	add	a5,a5,a4
    80002b10:	7722                	ld	a4,40(sp)
    80002b12:	6f38                	ld	a4,88(a4)
    80002b14:	f398                	sd	a4,32(a5)
    80002b16:	47b2                	lw	a5,12(sp)
    80002b18:	0007871b          	sext.w	a4,a5
    80002b1c:	478d                	li	a5,3
    80002b1e:	00f71f63          	bne	a4,a5,80002b3c <prvListTaskWithinSingleList+0x102>
    80002b22:	77a2                	ld	a5,40(sp)
    80002b24:	6bbc                	ld	a5,80(a5)
    80002b26:	cb99                	beqz	a5,80002b3c <prvListTaskWithinSingleList+0x102>
    80002b28:	6726                	ld	a4,72(sp)
    80002b2a:	87ba                	mv	a5,a4
    80002b2c:	078e                	slli	a5,a5,0x3
    80002b2e:	8f99                	sub	a5,a5,a4
    80002b30:	078e                	slli	a5,a5,0x3
    80002b32:	873e                	mv	a4,a5
    80002b34:	67e2                	ld	a5,24(sp)
    80002b36:	97ba                	add	a5,a5,a4
    80002b38:	4709                	li	a4,2
    80002b3a:	cf98                	sw	a4,24(a5)
    80002b3c:	6726                	ld	a4,72(sp)
    80002b3e:	87ba                	mv	a5,a4
    80002b40:	078e                	slli	a5,a5,0x3
    80002b42:	8f99                	sub	a5,a5,a4
    80002b44:	078e                	slli	a5,a5,0x3
    80002b46:	873e                	mv	a4,a5
    80002b48:	67e2                	ld	a5,24(sp)
    80002b4a:	97ba                	add	a5,a5,a4
    80002b4c:	7722                	ld	a4,40(sp)
    80002b4e:	6b58                	ld	a4,144(a4)
    80002b50:	f798                	sd	a4,40(a5)
    80002b52:	6726                	ld	a4,72(sp)
    80002b54:	87ba                	mv	a5,a4
    80002b56:	078e                	slli	a5,a5,0x3
    80002b58:	8f99                	sub	a5,a5,a4
    80002b5a:	078e                	slli	a5,a5,0x3
    80002b5c:	873e                	mv	a4,a5
    80002b5e:	67e2                	ld	a5,24(sp)
    80002b60:	97ba                	add	a5,a5,a4
    80002b62:	0207a823          	sw	zero,48(a5)
    80002b66:	77a2                	ld	a5,40(sp)
    80002b68:	73b4                	ld	a3,96(a5)
    80002b6a:	6726                	ld	a4,72(sp)
    80002b6c:	87ba                	mv	a5,a4
    80002b6e:	078e                	slli	a5,a5,0x3
    80002b70:	8f99                	sub	a5,a5,a4
    80002b72:	078e                	slli	a5,a5,0x3
    80002b74:	873e                	mv	a4,a5
    80002b76:	67e2                	ld	a5,24(sp)
    80002b78:	00e78433          	add	s0,a5,a4
    80002b7c:	8536                	mv	a0,a3
    80002b7e:	024000ef          	jal	ra,80002ba2 <prvTaskCheckFreeStackSpace>
    80002b82:	87aa                	mv	a5,a0
    80002b84:	02f41a23          	sh	a5,52(s0)
    80002b88:	67a6                	ld	a5,72(sp)
    80002b8a:	0785                	addi	a5,a5,1
    80002b8c:	e4be                	sd	a5,72(sp)
    80002b8e:	7722                	ld	a4,40(sp)
    80002b90:	77e2                	ld	a5,56(sp)
    80002b92:	eef716e3          	bne	a4,a5,80002a7e <prvListTaskWithinSingleList+0x44>
    80002b96:	67a6                	ld	a5,72(sp)
    80002b98:	853e                	mv	a0,a5
    80002b9a:	60e6                	ld	ra,88(sp)
    80002b9c:	6446                	ld	s0,80(sp)
    80002b9e:	6125                	addi	sp,sp,96
    80002ba0:	8082                	ret

0000000080002ba2 <prvTaskCheckFreeStackSpace>:
    80002ba2:	1101                	addi	sp,sp,-32
    80002ba4:	e42a                	sd	a0,8(sp)
    80002ba6:	ce02                	sw	zero,28(sp)
    80002ba8:	a039                	j	80002bb6 <prvTaskCheckFreeStackSpace+0x14>
    80002baa:	67a2                	ld	a5,8(sp)
    80002bac:	0785                	addi	a5,a5,1
    80002bae:	e43e                	sd	a5,8(sp)
    80002bb0:	47f2                	lw	a5,28(sp)
    80002bb2:	2785                	addiw	a5,a5,1
    80002bb4:	ce3e                	sw	a5,28(sp)
    80002bb6:	67a2                	ld	a5,8(sp)
    80002bb8:	0007c783          	lbu	a5,0(a5)
    80002bbc:	873e                	mv	a4,a5
    80002bbe:	0a500793          	li	a5,165
    80002bc2:	fef704e3          	beq	a4,a5,80002baa <prvTaskCheckFreeStackSpace+0x8>
    80002bc6:	47f2                	lw	a5,28(sp)
    80002bc8:	0037d79b          	srliw	a5,a5,0x3
    80002bcc:	ce3e                	sw	a5,28(sp)
    80002bce:	47f2                	lw	a5,28(sp)
    80002bd0:	17c2                	slli	a5,a5,0x30
    80002bd2:	93c1                	srli	a5,a5,0x30
    80002bd4:	853e                	mv	a0,a5
    80002bd6:	6105                	addi	sp,sp,32
    80002bd8:	8082                	ret

0000000080002bda <prvDeleteTCB>:
    80002bda:	1101                	addi	sp,sp,-32
    80002bdc:	ec06                	sd	ra,24(sp)
    80002bde:	e42a                	sd	a0,8(sp)
    80002be0:	67a2                	ld	a5,8(sp)
    80002be2:	73bc                	ld	a5,96(a5)
    80002be4:	853e                	mv	a0,a5
    80002be6:	716010ef          	jal	ra,800042fc <vPortFree>
    80002bea:	6522                	ld	a0,8(sp)
    80002bec:	710010ef          	jal	ra,800042fc <vPortFree>
    80002bf0:	0001                	nop
    80002bf2:	60e2                	ld	ra,24(sp)
    80002bf4:	6105                	addi	sp,sp,32
    80002bf6:	8082                	ret

0000000080002bf8 <prvResetNextTaskUnblockTime>:
    80002bf8:	1141                	addi	sp,sp,-16
    80002bfa:	0001e797          	auipc	a5,0x1e
    80002bfe:	a9678793          	addi	a5,a5,-1386 # 80020690 <pxDelayedTaskList>
    80002c02:	639c                	ld	a5,0(a5)
    80002c04:	639c                	ld	a5,0(a5)
    80002c06:	e399                	bnez	a5,80002c0c <prvResetNextTaskUnblockTime+0x14>
    80002c08:	4785                	li	a5,1
    80002c0a:	a011                	j	80002c0e <prvResetNextTaskUnblockTime+0x16>
    80002c0c:	4781                	li	a5,0
    80002c0e:	cb81                	beqz	a5,80002c1e <prvResetNextTaskUnblockTime+0x26>
    80002c10:	0001e797          	auipc	a5,0x1e
    80002c14:	b5078793          	addi	a5,a5,-1200 # 80020760 <xNextTaskUnblockTime>
    80002c18:	577d                	li	a4,-1
    80002c1a:	c398                	sw	a4,0(a5)
    80002c1c:	a005                	j	80002c3c <prvResetNextTaskUnblockTime+0x44>
    80002c1e:	0001e797          	auipc	a5,0x1e
    80002c22:	a7278793          	addi	a5,a5,-1422 # 80020690 <pxDelayedTaskList>
    80002c26:	639c                	ld	a5,0(a5)
    80002c28:	6f9c                	ld	a5,24(a5)
    80002c2a:	6f9c                	ld	a5,24(a5)
    80002c2c:	e43e                	sd	a5,8(sp)
    80002c2e:	67a2                	ld	a5,8(sp)
    80002c30:	4798                	lw	a4,8(a5)
    80002c32:	0001e797          	auipc	a5,0x1e
    80002c36:	b2e78793          	addi	a5,a5,-1234 # 80020760 <xNextTaskUnblockTime>
    80002c3a:	c398                	sw	a4,0(a5)
    80002c3c:	0001                	nop
    80002c3e:	0141                	addi	sp,sp,16
    80002c40:	8082                	ret

0000000080002c42 <xTaskGetCurrentTaskHandle>:
    80002c42:	1141                	addi	sp,sp,-16
    80002c44:	0001d797          	auipc	a5,0x1d
    80002c48:	6fc78793          	addi	a5,a5,1788 # 80020340 <pxCurrentTCB>
    80002c4c:	639c                	ld	a5,0(a5)
    80002c4e:	e43e                	sd	a5,8(sp)
    80002c50:	67a2                	ld	a5,8(sp)
    80002c52:	853e                	mv	a0,a5
    80002c54:	0141                	addi	sp,sp,16
    80002c56:	8082                	ret

0000000080002c58 <xTaskGetSchedulerState>:
    80002c58:	1141                	addi	sp,sp,-16
    80002c5a:	0001e797          	auipc	a5,0x1e
    80002c5e:	ade78793          	addi	a5,a5,-1314 # 80020738 <xSchedulerRunning>
    80002c62:	639c                	ld	a5,0(a5)
    80002c64:	e781                	bnez	a5,80002c6c <xTaskGetSchedulerState+0x14>
    80002c66:	4785                	li	a5,1
    80002c68:	e43e                	sd	a5,8(sp)
    80002c6a:	a819                	j	80002c80 <xTaskGetSchedulerState+0x28>
    80002c6c:	0001e797          	auipc	a5,0x1e
    80002c70:	afc78793          	addi	a5,a5,-1284 # 80020768 <uxSchedulerSuspended>
    80002c74:	639c                	ld	a5,0(a5)
    80002c76:	e781                	bnez	a5,80002c7e <xTaskGetSchedulerState+0x26>
    80002c78:	4789                	li	a5,2
    80002c7a:	e43e                	sd	a5,8(sp)
    80002c7c:	a011                	j	80002c80 <xTaskGetSchedulerState+0x28>
    80002c7e:	e402                	sd	zero,8(sp)
    80002c80:	67a2                	ld	a5,8(sp)
    80002c82:	853e                	mv	a0,a5
    80002c84:	0141                	addi	sp,sp,16
    80002c86:	8082                	ret

0000000080002c88 <vTaskPriorityInherit>:
    80002c88:	7179                	addi	sp,sp,-48
    80002c8a:	f406                	sd	ra,40(sp)
    80002c8c:	e42a                	sd	a0,8(sp)
    80002c8e:	67a2                	ld	a5,8(sp)
    80002c90:	ec3e                	sd	a5,24(sp)
    80002c92:	67a2                	ld	a5,8(sp)
    80002c94:	cbe1                	beqz	a5,80002d64 <vTaskPriorityInherit+0xdc>
    80002c96:	67e2                	ld	a5,24(sp)
    80002c98:	6fb8                	ld	a4,88(a5)
    80002c9a:	0001d797          	auipc	a5,0x1d
    80002c9e:	6a678793          	addi	a5,a5,1702 # 80020340 <pxCurrentTCB>
    80002ca2:	639c                	ld	a5,0(a5)
    80002ca4:	6fbc                	ld	a5,88(a5)
    80002ca6:	0af77f63          	bgeu	a4,a5,80002d64 <vTaskPriorityInherit+0xdc>
    80002caa:	67e2                	ld	a5,24(sp)
    80002cac:	5b9c                	lw	a5,48(a5)
    80002cae:	2781                	sext.w	a5,a5
    80002cb0:	0207c063          	bltz	a5,80002cd0 <vTaskPriorityInherit+0x48>
    80002cb4:	0001d797          	auipc	a5,0x1d
    80002cb8:	68c78793          	addi	a5,a5,1676 # 80020340 <pxCurrentTCB>
    80002cbc:	639c                	ld	a5,0(a5)
    80002cbe:	6fbc                	ld	a5,88(a5)
    80002cc0:	2781                	sext.w	a5,a5
    80002cc2:	4715                	li	a4,5
    80002cc4:	40f707bb          	subw	a5,a4,a5
    80002cc8:	0007871b          	sext.w	a4,a5
    80002ccc:	67e2                	ld	a5,24(sp)
    80002cce:	db98                	sw	a4,48(a5)
    80002cd0:	67e2                	ld	a5,24(sp)
    80002cd2:	7794                	ld	a3,40(a5)
    80002cd4:	67e2                	ld	a5,24(sp)
    80002cd6:	6fb8                	ld	a4,88(a5)
    80002cd8:	87ba                	mv	a5,a4
    80002cda:	078a                	slli	a5,a5,0x2
    80002cdc:	97ba                	add	a5,a5,a4
    80002cde:	078e                	slli	a5,a5,0x3
    80002ce0:	0001e717          	auipc	a4,0x1e
    80002ce4:	89870713          	addi	a4,a4,-1896 # 80020578 <pxReadyTasksLists>
    80002ce8:	97ba                	add	a5,a5,a4
    80002cea:	00f69463          	bne	a3,a5,80002cf2 <vTaskPriorityInherit+0x6a>
    80002cee:	4785                	li	a5,1
    80002cf0:	a011                	j	80002cf4 <vTaskPriorityInherit+0x6c>
    80002cf2:	4781                	li	a5,0
    80002cf4:	c3a5                	beqz	a5,80002d54 <vTaskPriorityInherit+0xcc>
    80002cf6:	67e2                	ld	a5,24(sp)
    80002cf8:	07a1                	addi	a5,a5,8
    80002cfa:	853e                	mv	a0,a5
    80002cfc:	9affd0ef          	jal	ra,800006aa <uxListRemove>
    80002d00:	0001d797          	auipc	a5,0x1d
    80002d04:	64078793          	addi	a5,a5,1600 # 80020340 <pxCurrentTCB>
    80002d08:	639c                	ld	a5,0(a5)
    80002d0a:	6fb8                	ld	a4,88(a5)
    80002d0c:	67e2                	ld	a5,24(sp)
    80002d0e:	efb8                	sd	a4,88(a5)
    80002d10:	67e2                	ld	a5,24(sp)
    80002d12:	6fb8                	ld	a4,88(a5)
    80002d14:	0001e797          	auipc	a5,0x1e
    80002d18:	a1c78793          	addi	a5,a5,-1508 # 80020730 <uxTopReadyPriority>
    80002d1c:	639c                	ld	a5,0(a5)
    80002d1e:	00e7f963          	bgeu	a5,a4,80002d30 <vTaskPriorityInherit+0xa8>
    80002d22:	67e2                	ld	a5,24(sp)
    80002d24:	6fb8                	ld	a4,88(a5)
    80002d26:	0001e797          	auipc	a5,0x1e
    80002d2a:	a0a78793          	addi	a5,a5,-1526 # 80020730 <uxTopReadyPriority>
    80002d2e:	e398                	sd	a4,0(a5)
    80002d30:	67e2                	ld	a5,24(sp)
    80002d32:	6fb8                	ld	a4,88(a5)
    80002d34:	87ba                	mv	a5,a4
    80002d36:	078a                	slli	a5,a5,0x2
    80002d38:	97ba                	add	a5,a5,a4
    80002d3a:	078e                	slli	a5,a5,0x3
    80002d3c:	0001e717          	auipc	a4,0x1e
    80002d40:	83c70713          	addi	a4,a4,-1988 # 80020578 <pxReadyTasksLists>
    80002d44:	973e                	add	a4,a4,a5
    80002d46:	67e2                	ld	a5,24(sp)
    80002d48:	07a1                	addi	a5,a5,8
    80002d4a:	85be                	mv	a1,a5
    80002d4c:	853a                	mv	a0,a4
    80002d4e:	8adfd0ef          	jal	ra,800005fa <vListInsertEnd>
    80002d52:	a809                	j	80002d64 <vTaskPriorityInherit+0xdc>
    80002d54:	0001d797          	auipc	a5,0x1d
    80002d58:	5ec78793          	addi	a5,a5,1516 # 80020340 <pxCurrentTCB>
    80002d5c:	639c                	ld	a5,0(a5)
    80002d5e:	6fb8                	ld	a4,88(a5)
    80002d60:	67e2                	ld	a5,24(sp)
    80002d62:	efb8                	sd	a4,88(a5)
    80002d64:	0001                	nop
    80002d66:	70a2                	ld	ra,40(sp)
    80002d68:	6145                	addi	sp,sp,48
    80002d6a:	8082                	ret

0000000080002d6c <xTaskPriorityDisinherit>:
    80002d6c:	7179                	addi	sp,sp,-48
    80002d6e:	f406                	sd	ra,40(sp)
    80002d70:	e42a                	sd	a0,8(sp)
    80002d72:	67a2                	ld	a5,8(sp)
    80002d74:	e83e                	sd	a5,16(sp)
    80002d76:	ec02                	sd	zero,24(sp)
    80002d78:	67a2                	ld	a5,8(sp)
    80002d7a:	c7dd                	beqz	a5,80002e28 <xTaskPriorityDisinherit+0xbc>
    80002d7c:	0001d797          	auipc	a5,0x1d
    80002d80:	5c478793          	addi	a5,a5,1476 # 80020340 <pxCurrentTCB>
    80002d84:	639c                	ld	a5,0(a5)
    80002d86:	6742                	ld	a4,16(sp)
    80002d88:	00f70563          	beq	a4,a5,80002d92 <xTaskPriorityDisinherit+0x26>
    80002d8c:	30047073          	csrci	mstatus,8
    80002d90:	a001                	j	80002d90 <xTaskPriorityDisinherit+0x24>
    80002d92:	67c2                	ld	a5,16(sp)
    80002d94:	6fdc                	ld	a5,152(a5)
    80002d96:	e781                	bnez	a5,80002d9e <xTaskPriorityDisinherit+0x32>
    80002d98:	30047073          	csrci	mstatus,8
    80002d9c:	a001                	j	80002d9c <xTaskPriorityDisinherit+0x30>
    80002d9e:	67c2                	ld	a5,16(sp)
    80002da0:	6fdc                	ld	a5,152(a5)
    80002da2:	fff78713          	addi	a4,a5,-1
    80002da6:	67c2                	ld	a5,16(sp)
    80002da8:	efd8                	sd	a4,152(a5)
    80002daa:	67c2                	ld	a5,16(sp)
    80002dac:	6fb8                	ld	a4,88(a5)
    80002dae:	67c2                	ld	a5,16(sp)
    80002db0:	6bdc                	ld	a5,144(a5)
    80002db2:	06f70b63          	beq	a4,a5,80002e28 <xTaskPriorityDisinherit+0xbc>
    80002db6:	67c2                	ld	a5,16(sp)
    80002db8:	6fdc                	ld	a5,152(a5)
    80002dba:	e7bd                	bnez	a5,80002e28 <xTaskPriorityDisinherit+0xbc>
    80002dbc:	67c2                	ld	a5,16(sp)
    80002dbe:	07a1                	addi	a5,a5,8
    80002dc0:	853e                	mv	a0,a5
    80002dc2:	8e9fd0ef          	jal	ra,800006aa <uxListRemove>
    80002dc6:	67c2                	ld	a5,16(sp)
    80002dc8:	6bd8                	ld	a4,144(a5)
    80002dca:	67c2                	ld	a5,16(sp)
    80002dcc:	efb8                	sd	a4,88(a5)
    80002dce:	67c2                	ld	a5,16(sp)
    80002dd0:	6fbc                	ld	a5,88(a5)
    80002dd2:	2781                	sext.w	a5,a5
    80002dd4:	4715                	li	a4,5
    80002dd6:	40f707bb          	subw	a5,a4,a5
    80002dda:	0007871b          	sext.w	a4,a5
    80002dde:	67c2                	ld	a5,16(sp)
    80002de0:	db98                	sw	a4,48(a5)
    80002de2:	67c2                	ld	a5,16(sp)
    80002de4:	6fb8                	ld	a4,88(a5)
    80002de6:	0001e797          	auipc	a5,0x1e
    80002dea:	94a78793          	addi	a5,a5,-1718 # 80020730 <uxTopReadyPriority>
    80002dee:	639c                	ld	a5,0(a5)
    80002df0:	00e7f963          	bgeu	a5,a4,80002e02 <xTaskPriorityDisinherit+0x96>
    80002df4:	67c2                	ld	a5,16(sp)
    80002df6:	6fb8                	ld	a4,88(a5)
    80002df8:	0001e797          	auipc	a5,0x1e
    80002dfc:	93878793          	addi	a5,a5,-1736 # 80020730 <uxTopReadyPriority>
    80002e00:	e398                	sd	a4,0(a5)
    80002e02:	67c2                	ld	a5,16(sp)
    80002e04:	6fb8                	ld	a4,88(a5)
    80002e06:	87ba                	mv	a5,a4
    80002e08:	078a                	slli	a5,a5,0x2
    80002e0a:	97ba                	add	a5,a5,a4
    80002e0c:	078e                	slli	a5,a5,0x3
    80002e0e:	0001d717          	auipc	a4,0x1d
    80002e12:	76a70713          	addi	a4,a4,1898 # 80020578 <pxReadyTasksLists>
    80002e16:	973e                	add	a4,a4,a5
    80002e18:	67c2                	ld	a5,16(sp)
    80002e1a:	07a1                	addi	a5,a5,8
    80002e1c:	85be                	mv	a1,a5
    80002e1e:	853a                	mv	a0,a4
    80002e20:	fdafd0ef          	jal	ra,800005fa <vListInsertEnd>
    80002e24:	4785                	li	a5,1
    80002e26:	ec3e                	sd	a5,24(sp)
    80002e28:	67e2                	ld	a5,24(sp)
    80002e2a:	853e                	mv	a0,a5
    80002e2c:	70a2                	ld	ra,40(sp)
    80002e2e:	6145                	addi	sp,sp,48
    80002e30:	8082                	ret

0000000080002e32 <vTaskEnterCritical>:
    80002e32:	30047073          	csrci	mstatus,8
    80002e36:	0001e797          	auipc	a5,0x1e
    80002e3a:	90278793          	addi	a5,a5,-1790 # 80020738 <xSchedulerRunning>
    80002e3e:	639c                	ld	a5,0(a5)
    80002e40:	cf91                	beqz	a5,80002e5c <vTaskEnterCritical+0x2a>
    80002e42:	0001d797          	auipc	a5,0x1d
    80002e46:	4fe78793          	addi	a5,a5,1278 # 80020340 <pxCurrentTCB>
    80002e4a:	639c                	ld	a5,0(a5)
    80002e4c:	7fb8                	ld	a4,120(a5)
    80002e4e:	0705                	addi	a4,a4,1
    80002e50:	ffb8                	sd	a4,120(a5)
    80002e52:	0001d797          	auipc	a5,0x1d
    80002e56:	4ee78793          	addi	a5,a5,1262 # 80020340 <pxCurrentTCB>
    80002e5a:	639c                	ld	a5,0(a5)
    80002e5c:	0001                	nop
    80002e5e:	8082                	ret

0000000080002e60 <vTaskExitCritical>:
    80002e60:	0001e797          	auipc	a5,0x1e
    80002e64:	8d878793          	addi	a5,a5,-1832 # 80020738 <xSchedulerRunning>
    80002e68:	639c                	ld	a5,0(a5)
    80002e6a:	cb8d                	beqz	a5,80002e9c <vTaskExitCritical+0x3c>
    80002e6c:	0001d797          	auipc	a5,0x1d
    80002e70:	4d478793          	addi	a5,a5,1236 # 80020340 <pxCurrentTCB>
    80002e74:	639c                	ld	a5,0(a5)
    80002e76:	7fbc                	ld	a5,120(a5)
    80002e78:	c395                	beqz	a5,80002e9c <vTaskExitCritical+0x3c>
    80002e7a:	0001d797          	auipc	a5,0x1d
    80002e7e:	4c678793          	addi	a5,a5,1222 # 80020340 <pxCurrentTCB>
    80002e82:	639c                	ld	a5,0(a5)
    80002e84:	7fb8                	ld	a4,120(a5)
    80002e86:	177d                	addi	a4,a4,-1
    80002e88:	ffb8                	sd	a4,120(a5)
    80002e8a:	0001d797          	auipc	a5,0x1d
    80002e8e:	4b678793          	addi	a5,a5,1206 # 80020340 <pxCurrentTCB>
    80002e92:	639c                	ld	a5,0(a5)
    80002e94:	7fbc                	ld	a5,120(a5)
    80002e96:	e399                	bnez	a5,80002e9c <vTaskExitCritical+0x3c>
    80002e98:	30046073          	csrsi	mstatus,8
    80002e9c:	0001                	nop
    80002e9e:	8082                	ret

0000000080002ea0 <uxTaskResetEventItemValue>:
    80002ea0:	1141                	addi	sp,sp,-16
    80002ea2:	0001d797          	auipc	a5,0x1d
    80002ea6:	49e78793          	addi	a5,a5,1182 # 80020340 <pxCurrentTCB>
    80002eaa:	639c                	ld	a5,0(a5)
    80002eac:	5b9c                	lw	a5,48(a5)
    80002eae:	c63e                	sw	a5,12(sp)
    80002eb0:	0001d797          	auipc	a5,0x1d
    80002eb4:	49078793          	addi	a5,a5,1168 # 80020340 <pxCurrentTCB>
    80002eb8:	639c                	ld	a5,0(a5)
    80002eba:	6fbc                	ld	a5,88(a5)
    80002ebc:	0007871b          	sext.w	a4,a5
    80002ec0:	0001d797          	auipc	a5,0x1d
    80002ec4:	48078793          	addi	a5,a5,1152 # 80020340 <pxCurrentTCB>
    80002ec8:	639c                	ld	a5,0(a5)
    80002eca:	4695                	li	a3,5
    80002ecc:	40e6873b          	subw	a4,a3,a4
    80002ed0:	2701                	sext.w	a4,a4
    80002ed2:	db98                	sw	a4,48(a5)
    80002ed4:	47b2                	lw	a5,12(sp)
    80002ed6:	853e                	mv	a0,a5
    80002ed8:	0141                	addi	sp,sp,16
    80002eda:	8082                	ret

0000000080002edc <pvTaskIncrementMutexHeldCount>:
    80002edc:	0001d797          	auipc	a5,0x1d
    80002ee0:	46478793          	addi	a5,a5,1124 # 80020340 <pxCurrentTCB>
    80002ee4:	639c                	ld	a5,0(a5)
    80002ee6:	cb89                	beqz	a5,80002ef8 <pvTaskIncrementMutexHeldCount+0x1c>
    80002ee8:	0001d797          	auipc	a5,0x1d
    80002eec:	45878793          	addi	a5,a5,1112 # 80020340 <pxCurrentTCB>
    80002ef0:	639c                	ld	a5,0(a5)
    80002ef2:	6fd8                	ld	a4,152(a5)
    80002ef4:	0705                	addi	a4,a4,1
    80002ef6:	efd8                	sd	a4,152(a5)
    80002ef8:	0001d797          	auipc	a5,0x1d
    80002efc:	44878793          	addi	a5,a5,1096 # 80020340 <pxCurrentTCB>
    80002f00:	639c                	ld	a5,0(a5)
    80002f02:	853e                	mv	a0,a5
    80002f04:	8082                	ret

0000000080002f06 <ulTaskNotifyTake>:
    80002f06:	7179                	addi	sp,sp,-48
    80002f08:	f406                	sd	ra,40(sp)
    80002f0a:	e42a                	sd	a0,8(sp)
    80002f0c:	87ae                	mv	a5,a1
    80002f0e:	c23e                	sw	a5,4(sp)
    80002f10:	f23ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80002f14:	0001d797          	auipc	a5,0x1d
    80002f18:	42c78793          	addi	a5,a5,1068 # 80020340 <pxCurrentTCB>
    80002f1c:	639c                	ld	a5,0(a5)
    80002f1e:	0a07a783          	lw	a5,160(a5)
    80002f22:	2781                	sext.w	a5,a5
    80002f24:	eba5                	bnez	a5,80002f94 <ulTaskNotifyTake+0x8e>
    80002f26:	0001d797          	auipc	a5,0x1d
    80002f2a:	41a78793          	addi	a5,a5,1050 # 80020340 <pxCurrentTCB>
    80002f2e:	639c                	ld	a5,0(a5)
    80002f30:	4705                	li	a4,1
    80002f32:	0ae7a223          	sw	a4,164(a5)
    80002f36:	4792                	lw	a5,4(sp)
    80002f38:	2781                	sext.w	a5,a5
    80002f3a:	cfa9                	beqz	a5,80002f94 <ulTaskNotifyTake+0x8e>
    80002f3c:	0001d797          	auipc	a5,0x1d
    80002f40:	40478793          	addi	a5,a5,1028 # 80020340 <pxCurrentTCB>
    80002f44:	639c                	ld	a5,0(a5)
    80002f46:	07a1                	addi	a5,a5,8
    80002f48:	853e                	mv	a0,a5
    80002f4a:	f60fd0ef          	jal	ra,800006aa <uxListRemove>
    80002f4e:	4792                	lw	a5,4(sp)
    80002f50:	0007871b          	sext.w	a4,a5
    80002f54:	57fd                	li	a5,-1
    80002f56:	02f71063          	bne	a4,a5,80002f76 <ulTaskNotifyTake+0x70>
    80002f5a:	0001d797          	auipc	a5,0x1d
    80002f5e:	3e678793          	addi	a5,a5,998 # 80020340 <pxCurrentTCB>
    80002f62:	639c                	ld	a5,0(a5)
    80002f64:	07a1                	addi	a5,a5,8
    80002f66:	85be                	mv	a1,a5
    80002f68:	0001d517          	auipc	a0,0x1d
    80002f6c:	79050513          	addi	a0,a0,1936 # 800206f8 <xSuspendedTaskList>
    80002f70:	e8afd0ef          	jal	ra,800005fa <vListInsertEnd>
    80002f74:	a831                	j	80002f90 <ulTaskNotifyTake+0x8a>
    80002f76:	0001d797          	auipc	a5,0x1d
    80002f7a:	7b278793          	addi	a5,a5,1970 # 80020728 <xTickCount>
    80002f7e:	439c                	lw	a5,0(a5)
    80002f80:	2781                	sext.w	a5,a5
    80002f82:	4712                	lw	a4,4(sp)
    80002f84:	9fb9                	addw	a5,a5,a4
    80002f86:	ce3e                	sw	a5,28(sp)
    80002f88:	47f2                	lw	a5,28(sp)
    80002f8a:	853e                	mv	a0,a5
    80002f8c:	9afff0ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    80002f90:	c7cfd0ef          	jal	ra,8000040c <vPortYield>
    80002f94:	ecdff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80002f98:	e9bff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80002f9c:	0001d797          	auipc	a5,0x1d
    80002fa0:	3a478793          	addi	a5,a5,932 # 80020340 <pxCurrentTCB>
    80002fa4:	639c                	ld	a5,0(a5)
    80002fa6:	0a07a783          	lw	a5,160(a5)
    80002faa:	cc3e                	sw	a5,24(sp)
    80002fac:	47e2                	lw	a5,24(sp)
    80002fae:	2781                	sext.w	a5,a5
    80002fb0:	c79d                	beqz	a5,80002fde <ulTaskNotifyTake+0xd8>
    80002fb2:	67a2                	ld	a5,8(sp)
    80002fb4:	cb89                	beqz	a5,80002fc6 <ulTaskNotifyTake+0xc0>
    80002fb6:	0001d797          	auipc	a5,0x1d
    80002fba:	38a78793          	addi	a5,a5,906 # 80020340 <pxCurrentTCB>
    80002fbe:	639c                	ld	a5,0(a5)
    80002fc0:	0a07a023          	sw	zero,160(a5)
    80002fc4:	a829                	j	80002fde <ulTaskNotifyTake+0xd8>
    80002fc6:	0001d797          	auipc	a5,0x1d
    80002fca:	37a78793          	addi	a5,a5,890 # 80020340 <pxCurrentTCB>
    80002fce:	639c                	ld	a5,0(a5)
    80002fd0:	0a07a703          	lw	a4,160(a5)
    80002fd4:	2701                	sext.w	a4,a4
    80002fd6:	377d                	addiw	a4,a4,-1
    80002fd8:	2701                	sext.w	a4,a4
    80002fda:	0ae7a023          	sw	a4,160(a5)
    80002fde:	0001d797          	auipc	a5,0x1d
    80002fe2:	36278793          	addi	a5,a5,866 # 80020340 <pxCurrentTCB>
    80002fe6:	639c                	ld	a5,0(a5)
    80002fe8:	0a07a223          	sw	zero,164(a5)
    80002fec:	e75ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80002ff0:	47e2                	lw	a5,24(sp)
    80002ff2:	853e                	mv	a0,a5
    80002ff4:	70a2                	ld	ra,40(sp)
    80002ff6:	6145                	addi	sp,sp,48
    80002ff8:	8082                	ret

0000000080002ffa <xTaskNotifyWait>:
    80002ffa:	7139                	addi	sp,sp,-64
    80002ffc:	fc06                	sd	ra,56(sp)
    80002ffe:	87aa                	mv	a5,a0
    80003000:	e832                	sd	a2,16(sp)
    80003002:	8736                	mv	a4,a3
    80003004:	ce3e                	sw	a5,28(sp)
    80003006:	87ae                	mv	a5,a1
    80003008:	cc3e                	sw	a5,24(sp)
    8000300a:	87ba                	mv	a5,a4
    8000300c:	c63e                	sw	a5,12(sp)
    8000300e:	e25ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003012:	0001d797          	auipc	a5,0x1d
    80003016:	32e78793          	addi	a5,a5,814 # 80020340 <pxCurrentTCB>
    8000301a:	639c                	ld	a5,0(a5)
    8000301c:	0a47a783          	lw	a5,164(a5)
    80003020:	2781                	sext.w	a5,a5
    80003022:	873e                	mv	a4,a5
    80003024:	4789                	li	a5,2
    80003026:	08f70a63          	beq	a4,a5,800030ba <xTaskNotifyWait+0xc0>
    8000302a:	0001d797          	auipc	a5,0x1d
    8000302e:	31678793          	addi	a5,a5,790 # 80020340 <pxCurrentTCB>
    80003032:	639c                	ld	a5,0(a5)
    80003034:	0a07a703          	lw	a4,160(a5)
    80003038:	0007069b          	sext.w	a3,a4
    8000303c:	4772                	lw	a4,28(sp)
    8000303e:	fff74713          	not	a4,a4
    80003042:	2701                	sext.w	a4,a4
    80003044:	8f75                	and	a4,a4,a3
    80003046:	2701                	sext.w	a4,a4
    80003048:	0ae7a023          	sw	a4,160(a5)
    8000304c:	0001d797          	auipc	a5,0x1d
    80003050:	2f478793          	addi	a5,a5,756 # 80020340 <pxCurrentTCB>
    80003054:	639c                	ld	a5,0(a5)
    80003056:	4705                	li	a4,1
    80003058:	0ae7a223          	sw	a4,164(a5)
    8000305c:	47b2                	lw	a5,12(sp)
    8000305e:	2781                	sext.w	a5,a5
    80003060:	cfa9                	beqz	a5,800030ba <xTaskNotifyWait+0xc0>
    80003062:	0001d797          	auipc	a5,0x1d
    80003066:	2de78793          	addi	a5,a5,734 # 80020340 <pxCurrentTCB>
    8000306a:	639c                	ld	a5,0(a5)
    8000306c:	07a1                	addi	a5,a5,8
    8000306e:	853e                	mv	a0,a5
    80003070:	e3afd0ef          	jal	ra,800006aa <uxListRemove>
    80003074:	47b2                	lw	a5,12(sp)
    80003076:	0007871b          	sext.w	a4,a5
    8000307a:	57fd                	li	a5,-1
    8000307c:	02f71063          	bne	a4,a5,8000309c <xTaskNotifyWait+0xa2>
    80003080:	0001d797          	auipc	a5,0x1d
    80003084:	2c078793          	addi	a5,a5,704 # 80020340 <pxCurrentTCB>
    80003088:	639c                	ld	a5,0(a5)
    8000308a:	07a1                	addi	a5,a5,8
    8000308c:	85be                	mv	a1,a5
    8000308e:	0001d517          	auipc	a0,0x1d
    80003092:	66a50513          	addi	a0,a0,1642 # 800206f8 <xSuspendedTaskList>
    80003096:	d64fd0ef          	jal	ra,800005fa <vListInsertEnd>
    8000309a:	a831                	j	800030b6 <xTaskNotifyWait+0xbc>
    8000309c:	0001d797          	auipc	a5,0x1d
    800030a0:	68c78793          	addi	a5,a5,1676 # 80020728 <xTickCount>
    800030a4:	439c                	lw	a5,0(a5)
    800030a6:	2781                	sext.w	a5,a5
    800030a8:	4732                	lw	a4,12(sp)
    800030aa:	9fb9                	addw	a5,a5,a4
    800030ac:	d23e                	sw	a5,36(sp)
    800030ae:	5792                	lw	a5,36(sp)
    800030b0:	853e                	mv	a0,a5
    800030b2:	889ff0ef          	jal	ra,8000293a <prvAddCurrentTaskToDelayedList>
    800030b6:	b56fd0ef          	jal	ra,8000040c <vPortYield>
    800030ba:	da7ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    800030be:	d75ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    800030c2:	67c2                	ld	a5,16(sp)
    800030c4:	cf81                	beqz	a5,800030dc <xTaskNotifyWait+0xe2>
    800030c6:	0001d797          	auipc	a5,0x1d
    800030ca:	27a78793          	addi	a5,a5,634 # 80020340 <pxCurrentTCB>
    800030ce:	639c                	ld	a5,0(a5)
    800030d0:	0a07a783          	lw	a5,160(a5)
    800030d4:	0007871b          	sext.w	a4,a5
    800030d8:	67c2                	ld	a5,16(sp)
    800030da:	c398                	sw	a4,0(a5)
    800030dc:	0001d797          	auipc	a5,0x1d
    800030e0:	26478793          	addi	a5,a5,612 # 80020340 <pxCurrentTCB>
    800030e4:	639c                	ld	a5,0(a5)
    800030e6:	0a47a783          	lw	a5,164(a5)
    800030ea:	2781                	sext.w	a5,a5
    800030ec:	873e                	mv	a4,a5
    800030ee:	4785                	li	a5,1
    800030f0:	00f71463          	bne	a4,a5,800030f8 <xTaskNotifyWait+0xfe>
    800030f4:	f402                	sd	zero,40(sp)
    800030f6:	a025                	j	8000311e <xTaskNotifyWait+0x124>
    800030f8:	0001d797          	auipc	a5,0x1d
    800030fc:	24878793          	addi	a5,a5,584 # 80020340 <pxCurrentTCB>
    80003100:	639c                	ld	a5,0(a5)
    80003102:	0a07a703          	lw	a4,160(a5)
    80003106:	0007069b          	sext.w	a3,a4
    8000310a:	4762                	lw	a4,24(sp)
    8000310c:	fff74713          	not	a4,a4
    80003110:	2701                	sext.w	a4,a4
    80003112:	8f75                	and	a4,a4,a3
    80003114:	2701                	sext.w	a4,a4
    80003116:	0ae7a023          	sw	a4,160(a5)
    8000311a:	4785                	li	a5,1
    8000311c:	f43e                	sd	a5,40(sp)
    8000311e:	0001d797          	auipc	a5,0x1d
    80003122:	22278793          	addi	a5,a5,546 # 80020340 <pxCurrentTCB>
    80003126:	639c                	ld	a5,0(a5)
    80003128:	0a07a223          	sw	zero,164(a5)
    8000312c:	d35ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003130:	77a2                	ld	a5,40(sp)
    80003132:	853e                	mv	a0,a5
    80003134:	70e2                	ld	ra,56(sp)
    80003136:	6121                	addi	sp,sp,64
    80003138:	8082                	ret

000000008000313a <xTaskGenericNotify>:
    8000313a:	715d                	addi	sp,sp,-80
    8000313c:	e486                	sd	ra,72(sp)
    8000313e:	ec2a                	sd	a0,24(sp)
    80003140:	87ae                	mv	a5,a1
    80003142:	8732                	mv	a4,a2
    80003144:	e436                	sd	a3,8(sp)
    80003146:	ca3e                	sw	a5,20(sp)
    80003148:	87ba                	mv	a5,a4
    8000314a:	c83e                	sw	a5,16(sp)
    8000314c:	4785                	li	a5,1
    8000314e:	fc3e                	sd	a5,56(sp)
    80003150:	67e2                	ld	a5,24(sp)
    80003152:	e781                	bnez	a5,8000315a <xTaskGenericNotify+0x20>
    80003154:	30047073          	csrci	mstatus,8
    80003158:	a001                	j	80003158 <xTaskGenericNotify+0x1e>
    8000315a:	67e2                	ld	a5,24(sp)
    8000315c:	f83e                	sd	a5,48(sp)
    8000315e:	cd5ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003162:	67a2                	ld	a5,8(sp)
    80003164:	cb81                	beqz	a5,80003174 <xTaskGenericNotify+0x3a>
    80003166:	77c2                	ld	a5,48(sp)
    80003168:	0a07a783          	lw	a5,160(a5)
    8000316c:	0007871b          	sext.w	a4,a5
    80003170:	67a2                	ld	a5,8(sp)
    80003172:	c398                	sw	a4,0(a5)
    80003174:	77c2                	ld	a5,48(sp)
    80003176:	0a47a783          	lw	a5,164(a5)
    8000317a:	d63e                	sw	a5,44(sp)
    8000317c:	77c2                	ld	a5,48(sp)
    8000317e:	4709                	li	a4,2
    80003180:	0ae7a223          	sw	a4,164(a5)
    80003184:	47c2                	lw	a5,16(sp)
    80003186:	0007871b          	sext.w	a4,a5
    8000318a:	4791                	li	a5,4
    8000318c:	06e7ee63          	bltu	a5,a4,80003208 <xTaskGenericNotify+0xce>
    80003190:	01016783          	lwu	a5,16(sp)
    80003194:	00279713          	slli	a4,a5,0x2
    80003198:	0001d797          	auipc	a5,0x1d
    8000319c:	e7078793          	addi	a5,a5,-400 # 80020008 <__rodata_start+0x8>
    800031a0:	97ba                	add	a5,a5,a4
    800031a2:	439c                	lw	a5,0(a5)
    800031a4:	0007871b          	sext.w	a4,a5
    800031a8:	0001d797          	auipc	a5,0x1d
    800031ac:	e6078793          	addi	a5,a5,-416 # 80020008 <__rodata_start+0x8>
    800031b0:	97ba                	add	a5,a5,a4
    800031b2:	8782                	jr	a5
    800031b4:	77c2                	ld	a5,48(sp)
    800031b6:	0a07a783          	lw	a5,160(a5)
    800031ba:	2781                	sext.w	a5,a5
    800031bc:	4752                	lw	a4,20(sp)
    800031be:	8fd9                	or	a5,a5,a4
    800031c0:	0007871b          	sext.w	a4,a5
    800031c4:	77c2                	ld	a5,48(sp)
    800031c6:	0ae7a023          	sw	a4,160(a5)
    800031ca:	a83d                	j	80003208 <xTaskGenericNotify+0xce>
    800031cc:	77c2                	ld	a5,48(sp)
    800031ce:	0a07a783          	lw	a5,160(a5)
    800031d2:	2781                	sext.w	a5,a5
    800031d4:	2785                	addiw	a5,a5,1
    800031d6:	0007871b          	sext.w	a4,a5
    800031da:	77c2                	ld	a5,48(sp)
    800031dc:	0ae7a023          	sw	a4,160(a5)
    800031e0:	a025                	j	80003208 <xTaskGenericNotify+0xce>
    800031e2:	77c2                	ld	a5,48(sp)
    800031e4:	4752                	lw	a4,20(sp)
    800031e6:	0ae7a023          	sw	a4,160(a5)
    800031ea:	a839                	j	80003208 <xTaskGenericNotify+0xce>
    800031ec:	57b2                	lw	a5,44(sp)
    800031ee:	0007871b          	sext.w	a4,a5
    800031f2:	4789                	li	a5,2
    800031f4:	00f70763          	beq	a4,a5,80003202 <xTaskGenericNotify+0xc8>
    800031f8:	77c2                	ld	a5,48(sp)
    800031fa:	4752                	lw	a4,20(sp)
    800031fc:	0ae7a023          	sw	a4,160(a5)
    80003200:	a021                	j	80003208 <xTaskGenericNotify+0xce>
    80003202:	fc02                	sd	zero,56(sp)
    80003204:	a011                	j	80003208 <xTaskGenericNotify+0xce>
    80003206:	0001                	nop
    80003208:	57b2                	lw	a5,44(sp)
    8000320a:	0007871b          	sext.w	a4,a5
    8000320e:	4785                	li	a5,1
    80003210:	06f71a63          	bne	a4,a5,80003284 <xTaskGenericNotify+0x14a>
    80003214:	77c2                	ld	a5,48(sp)
    80003216:	07a1                	addi	a5,a5,8
    80003218:	853e                	mv	a0,a5
    8000321a:	c90fd0ef          	jal	ra,800006aa <uxListRemove>
    8000321e:	77c2                	ld	a5,48(sp)
    80003220:	6fb8                	ld	a4,88(a5)
    80003222:	0001d797          	auipc	a5,0x1d
    80003226:	50e78793          	addi	a5,a5,1294 # 80020730 <uxTopReadyPriority>
    8000322a:	639c                	ld	a5,0(a5)
    8000322c:	00e7f963          	bgeu	a5,a4,8000323e <xTaskGenericNotify+0x104>
    80003230:	77c2                	ld	a5,48(sp)
    80003232:	6fb8                	ld	a4,88(a5)
    80003234:	0001d797          	auipc	a5,0x1d
    80003238:	4fc78793          	addi	a5,a5,1276 # 80020730 <uxTopReadyPriority>
    8000323c:	e398                	sd	a4,0(a5)
    8000323e:	77c2                	ld	a5,48(sp)
    80003240:	6fb8                	ld	a4,88(a5)
    80003242:	87ba                	mv	a5,a4
    80003244:	078a                	slli	a5,a5,0x2
    80003246:	97ba                	add	a5,a5,a4
    80003248:	078e                	slli	a5,a5,0x3
    8000324a:	0001d717          	auipc	a4,0x1d
    8000324e:	32e70713          	addi	a4,a4,814 # 80020578 <pxReadyTasksLists>
    80003252:	973e                	add	a4,a4,a5
    80003254:	77c2                	ld	a5,48(sp)
    80003256:	07a1                	addi	a5,a5,8
    80003258:	85be                	mv	a1,a5
    8000325a:	853a                	mv	a0,a4
    8000325c:	b9efd0ef          	jal	ra,800005fa <vListInsertEnd>
    80003260:	77c2                	ld	a5,48(sp)
    80003262:	6bbc                	ld	a5,80(a5)
    80003264:	c781                	beqz	a5,8000326c <xTaskGenericNotify+0x132>
    80003266:	30047073          	csrci	mstatus,8
    8000326a:	a001                	j	8000326a <xTaskGenericNotify+0x130>
    8000326c:	77c2                	ld	a5,48(sp)
    8000326e:	6fb8                	ld	a4,88(a5)
    80003270:	0001d797          	auipc	a5,0x1d
    80003274:	0d078793          	addi	a5,a5,208 # 80020340 <pxCurrentTCB>
    80003278:	639c                	ld	a5,0(a5)
    8000327a:	6fbc                	ld	a5,88(a5)
    8000327c:	00e7f463          	bgeu	a5,a4,80003284 <xTaskGenericNotify+0x14a>
    80003280:	98cfd0ef          	jal	ra,8000040c <vPortYield>
    80003284:	bddff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003288:	77e2                	ld	a5,56(sp)
    8000328a:	853e                	mv	a0,a5
    8000328c:	60a6                	ld	ra,72(sp)
    8000328e:	6161                	addi	sp,sp,80
    80003290:	8082                	ret

0000000080003292 <xTaskGenericNotifyFromISR>:
    80003292:	715d                	addi	sp,sp,-80
    80003294:	e486                	sd	ra,72(sp)
    80003296:	ec2a                	sd	a0,24(sp)
    80003298:	87ae                	mv	a5,a1
    8000329a:	e436                	sd	a3,8(sp)
    8000329c:	e03a                	sd	a4,0(sp)
    8000329e:	ca3e                	sw	a5,20(sp)
    800032a0:	87b2                	mv	a5,a2
    800032a2:	c83e                	sw	a5,16(sp)
    800032a4:	4785                	li	a5,1
    800032a6:	fc3e                	sd	a5,56(sp)
    800032a8:	67e2                	ld	a5,24(sp)
    800032aa:	e781                	bnez	a5,800032b2 <xTaskGenericNotifyFromISR+0x20>
    800032ac:	30047073          	csrci	mstatus,8
    800032b0:	a001                	j	800032b0 <xTaskGenericNotifyFromISR+0x1e>
    800032b2:	67e2                	ld	a5,24(sp)
    800032b4:	f83e                	sd	a5,48(sp)
    800032b6:	a84fd0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    800032ba:	87aa                	mv	a5,a0
    800032bc:	f43e                	sd	a5,40(sp)
    800032be:	67a2                	ld	a5,8(sp)
    800032c0:	cb81                	beqz	a5,800032d0 <xTaskGenericNotifyFromISR+0x3e>
    800032c2:	77c2                	ld	a5,48(sp)
    800032c4:	0a07a783          	lw	a5,160(a5)
    800032c8:	0007871b          	sext.w	a4,a5
    800032cc:	67a2                	ld	a5,8(sp)
    800032ce:	c398                	sw	a4,0(a5)
    800032d0:	77c2                	ld	a5,48(sp)
    800032d2:	0a47a783          	lw	a5,164(a5)
    800032d6:	d23e                	sw	a5,36(sp)
    800032d8:	77c2                	ld	a5,48(sp)
    800032da:	4709                	li	a4,2
    800032dc:	0ae7a223          	sw	a4,164(a5)
    800032e0:	47c2                	lw	a5,16(sp)
    800032e2:	0007871b          	sext.w	a4,a5
    800032e6:	4791                	li	a5,4
    800032e8:	06e7ee63          	bltu	a5,a4,80003364 <xTaskGenericNotifyFromISR+0xd2>
    800032ec:	01016783          	lwu	a5,16(sp)
    800032f0:	00279713          	slli	a4,a5,0x2
    800032f4:	0001d797          	auipc	a5,0x1d
    800032f8:	d2878793          	addi	a5,a5,-728 # 8002001c <__rodata_start+0x1c>
    800032fc:	97ba                	add	a5,a5,a4
    800032fe:	439c                	lw	a5,0(a5)
    80003300:	0007871b          	sext.w	a4,a5
    80003304:	0001d797          	auipc	a5,0x1d
    80003308:	d1878793          	addi	a5,a5,-744 # 8002001c <__rodata_start+0x1c>
    8000330c:	97ba                	add	a5,a5,a4
    8000330e:	8782                	jr	a5
    80003310:	77c2                	ld	a5,48(sp)
    80003312:	0a07a783          	lw	a5,160(a5)
    80003316:	2781                	sext.w	a5,a5
    80003318:	4752                	lw	a4,20(sp)
    8000331a:	8fd9                	or	a5,a5,a4
    8000331c:	0007871b          	sext.w	a4,a5
    80003320:	77c2                	ld	a5,48(sp)
    80003322:	0ae7a023          	sw	a4,160(a5)
    80003326:	a83d                	j	80003364 <xTaskGenericNotifyFromISR+0xd2>
    80003328:	77c2                	ld	a5,48(sp)
    8000332a:	0a07a783          	lw	a5,160(a5)
    8000332e:	2781                	sext.w	a5,a5
    80003330:	2785                	addiw	a5,a5,1
    80003332:	0007871b          	sext.w	a4,a5
    80003336:	77c2                	ld	a5,48(sp)
    80003338:	0ae7a023          	sw	a4,160(a5)
    8000333c:	a025                	j	80003364 <xTaskGenericNotifyFromISR+0xd2>
    8000333e:	77c2                	ld	a5,48(sp)
    80003340:	4752                	lw	a4,20(sp)
    80003342:	0ae7a023          	sw	a4,160(a5)
    80003346:	a839                	j	80003364 <xTaskGenericNotifyFromISR+0xd2>
    80003348:	5792                	lw	a5,36(sp)
    8000334a:	0007871b          	sext.w	a4,a5
    8000334e:	4789                	li	a5,2
    80003350:	00f70763          	beq	a4,a5,8000335e <xTaskGenericNotifyFromISR+0xcc>
    80003354:	77c2                	ld	a5,48(sp)
    80003356:	4752                	lw	a4,20(sp)
    80003358:	0ae7a023          	sw	a4,160(a5)
    8000335c:	a021                	j	80003364 <xTaskGenericNotifyFromISR+0xd2>
    8000335e:	fc02                	sd	zero,56(sp)
    80003360:	a011                	j	80003364 <xTaskGenericNotifyFromISR+0xd2>
    80003362:	0001                	nop
    80003364:	5792                	lw	a5,36(sp)
    80003366:	0007871b          	sext.w	a4,a5
    8000336a:	4785                	li	a5,1
    8000336c:	08f71e63          	bne	a4,a5,80003408 <xTaskGenericNotifyFromISR+0x176>
    80003370:	77c2                	ld	a5,48(sp)
    80003372:	6bbc                	ld	a5,80(a5)
    80003374:	c781                	beqz	a5,8000337c <xTaskGenericNotifyFromISR+0xea>
    80003376:	30047073          	csrci	mstatus,8
    8000337a:	a001                	j	8000337a <xTaskGenericNotifyFromISR+0xe8>
    8000337c:	0001d797          	auipc	a5,0x1d
    80003380:	3ec78793          	addi	a5,a5,1004 # 80020768 <uxSchedulerSuspended>
    80003384:	639c                	ld	a5,0(a5)
    80003386:	eba1                	bnez	a5,800033d6 <xTaskGenericNotifyFromISR+0x144>
    80003388:	77c2                	ld	a5,48(sp)
    8000338a:	07a1                	addi	a5,a5,8
    8000338c:	853e                	mv	a0,a5
    8000338e:	b1cfd0ef          	jal	ra,800006aa <uxListRemove>
    80003392:	77c2                	ld	a5,48(sp)
    80003394:	6fb8                	ld	a4,88(a5)
    80003396:	0001d797          	auipc	a5,0x1d
    8000339a:	39a78793          	addi	a5,a5,922 # 80020730 <uxTopReadyPriority>
    8000339e:	639c                	ld	a5,0(a5)
    800033a0:	00e7f963          	bgeu	a5,a4,800033b2 <xTaskGenericNotifyFromISR+0x120>
    800033a4:	77c2                	ld	a5,48(sp)
    800033a6:	6fb8                	ld	a4,88(a5)
    800033a8:	0001d797          	auipc	a5,0x1d
    800033ac:	38878793          	addi	a5,a5,904 # 80020730 <uxTopReadyPriority>
    800033b0:	e398                	sd	a4,0(a5)
    800033b2:	77c2                	ld	a5,48(sp)
    800033b4:	6fb8                	ld	a4,88(a5)
    800033b6:	87ba                	mv	a5,a4
    800033b8:	078a                	slli	a5,a5,0x2
    800033ba:	97ba                	add	a5,a5,a4
    800033bc:	078e                	slli	a5,a5,0x3
    800033be:	0001d717          	auipc	a4,0x1d
    800033c2:	1ba70713          	addi	a4,a4,442 # 80020578 <pxReadyTasksLists>
    800033c6:	973e                	add	a4,a4,a5
    800033c8:	77c2                	ld	a5,48(sp)
    800033ca:	07a1                	addi	a5,a5,8
    800033cc:	85be                	mv	a1,a5
    800033ce:	853a                	mv	a0,a4
    800033d0:	a2afd0ef          	jal	ra,800005fa <vListInsertEnd>
    800033d4:	a819                	j	800033ea <xTaskGenericNotifyFromISR+0x158>
    800033d6:	77c2                	ld	a5,48(sp)
    800033d8:	03078793          	addi	a5,a5,48
    800033dc:	85be                	mv	a1,a5
    800033de:	0001d517          	auipc	a0,0x1d
    800033e2:	2c250513          	addi	a0,a0,706 # 800206a0 <xPendingReadyList>
    800033e6:	a14fd0ef          	jal	ra,800005fa <vListInsertEnd>
    800033ea:	77c2                	ld	a5,48(sp)
    800033ec:	6fb8                	ld	a4,88(a5)
    800033ee:	0001d797          	auipc	a5,0x1d
    800033f2:	f5278793          	addi	a5,a5,-174 # 80020340 <pxCurrentTCB>
    800033f6:	639c                	ld	a5,0(a5)
    800033f8:	6fbc                	ld	a5,88(a5)
    800033fa:	00e7f763          	bgeu	a5,a4,80003408 <xTaskGenericNotifyFromISR+0x176>
    800033fe:	6782                	ld	a5,0(sp)
    80003400:	c781                	beqz	a5,80003408 <xTaskGenericNotifyFromISR+0x176>
    80003402:	6782                	ld	a5,0(sp)
    80003404:	4705                	li	a4,1
    80003406:	e398                	sd	a4,0(a5)
    80003408:	77a2                	ld	a5,40(sp)
    8000340a:	2781                	sext.w	a5,a5
    8000340c:	853e                	mv	a0,a5
    8000340e:	91afd0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80003412:	77e2                	ld	a5,56(sp)
    80003414:	853e                	mv	a0,a5
    80003416:	60a6                	ld	ra,72(sp)
    80003418:	6161                	addi	sp,sp,80
    8000341a:	8082                	ret

000000008000341c <vTaskNotifyGiveFromISR>:
    8000341c:	7139                	addi	sp,sp,-64
    8000341e:	fc06                	sd	ra,56(sp)
    80003420:	e42a                	sd	a0,8(sp)
    80003422:	e02e                	sd	a1,0(sp)
    80003424:	67a2                	ld	a5,8(sp)
    80003426:	e781                	bnez	a5,8000342e <vTaskNotifyGiveFromISR+0x12>
    80003428:	30047073          	csrci	mstatus,8
    8000342c:	a001                	j	8000342c <vTaskNotifyGiveFromISR+0x10>
    8000342e:	67a2                	ld	a5,8(sp)
    80003430:	f43e                	sd	a5,40(sp)
    80003432:	908fd0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80003436:	87aa                	mv	a5,a0
    80003438:	f03e                	sd	a5,32(sp)
    8000343a:	77a2                	ld	a5,40(sp)
    8000343c:	0a47a783          	lw	a5,164(a5)
    80003440:	ce3e                	sw	a5,28(sp)
    80003442:	77a2                	ld	a5,40(sp)
    80003444:	4709                	li	a4,2
    80003446:	0ae7a223          	sw	a4,164(a5)
    8000344a:	77a2                	ld	a5,40(sp)
    8000344c:	0a07a783          	lw	a5,160(a5)
    80003450:	2781                	sext.w	a5,a5
    80003452:	2785                	addiw	a5,a5,1
    80003454:	0007871b          	sext.w	a4,a5
    80003458:	77a2                	ld	a5,40(sp)
    8000345a:	0ae7a023          	sw	a4,160(a5)
    8000345e:	47f2                	lw	a5,28(sp)
    80003460:	0007871b          	sext.w	a4,a5
    80003464:	4785                	li	a5,1
    80003466:	08f71e63          	bne	a4,a5,80003502 <vTaskNotifyGiveFromISR+0xe6>
    8000346a:	77a2                	ld	a5,40(sp)
    8000346c:	6bbc                	ld	a5,80(a5)
    8000346e:	c781                	beqz	a5,80003476 <vTaskNotifyGiveFromISR+0x5a>
    80003470:	30047073          	csrci	mstatus,8
    80003474:	a001                	j	80003474 <vTaskNotifyGiveFromISR+0x58>
    80003476:	0001d797          	auipc	a5,0x1d
    8000347a:	2f278793          	addi	a5,a5,754 # 80020768 <uxSchedulerSuspended>
    8000347e:	639c                	ld	a5,0(a5)
    80003480:	eba1                	bnez	a5,800034d0 <vTaskNotifyGiveFromISR+0xb4>
    80003482:	77a2                	ld	a5,40(sp)
    80003484:	07a1                	addi	a5,a5,8
    80003486:	853e                	mv	a0,a5
    80003488:	a22fd0ef          	jal	ra,800006aa <uxListRemove>
    8000348c:	77a2                	ld	a5,40(sp)
    8000348e:	6fb8                	ld	a4,88(a5)
    80003490:	0001d797          	auipc	a5,0x1d
    80003494:	2a078793          	addi	a5,a5,672 # 80020730 <uxTopReadyPriority>
    80003498:	639c                	ld	a5,0(a5)
    8000349a:	00e7f963          	bgeu	a5,a4,800034ac <vTaskNotifyGiveFromISR+0x90>
    8000349e:	77a2                	ld	a5,40(sp)
    800034a0:	6fb8                	ld	a4,88(a5)
    800034a2:	0001d797          	auipc	a5,0x1d
    800034a6:	28e78793          	addi	a5,a5,654 # 80020730 <uxTopReadyPriority>
    800034aa:	e398                	sd	a4,0(a5)
    800034ac:	77a2                	ld	a5,40(sp)
    800034ae:	6fb8                	ld	a4,88(a5)
    800034b0:	87ba                	mv	a5,a4
    800034b2:	078a                	slli	a5,a5,0x2
    800034b4:	97ba                	add	a5,a5,a4
    800034b6:	078e                	slli	a5,a5,0x3
    800034b8:	0001d717          	auipc	a4,0x1d
    800034bc:	0c070713          	addi	a4,a4,192 # 80020578 <pxReadyTasksLists>
    800034c0:	973e                	add	a4,a4,a5
    800034c2:	77a2                	ld	a5,40(sp)
    800034c4:	07a1                	addi	a5,a5,8
    800034c6:	85be                	mv	a1,a5
    800034c8:	853a                	mv	a0,a4
    800034ca:	930fd0ef          	jal	ra,800005fa <vListInsertEnd>
    800034ce:	a819                	j	800034e4 <vTaskNotifyGiveFromISR+0xc8>
    800034d0:	77a2                	ld	a5,40(sp)
    800034d2:	03078793          	addi	a5,a5,48
    800034d6:	85be                	mv	a1,a5
    800034d8:	0001d517          	auipc	a0,0x1d
    800034dc:	1c850513          	addi	a0,a0,456 # 800206a0 <xPendingReadyList>
    800034e0:	91afd0ef          	jal	ra,800005fa <vListInsertEnd>
    800034e4:	77a2                	ld	a5,40(sp)
    800034e6:	6fb8                	ld	a4,88(a5)
    800034e8:	0001d797          	auipc	a5,0x1d
    800034ec:	e5878793          	addi	a5,a5,-424 # 80020340 <pxCurrentTCB>
    800034f0:	639c                	ld	a5,0(a5)
    800034f2:	6fbc                	ld	a5,88(a5)
    800034f4:	00e7f763          	bgeu	a5,a4,80003502 <vTaskNotifyGiveFromISR+0xe6>
    800034f8:	6782                	ld	a5,0(sp)
    800034fa:	c781                	beqz	a5,80003502 <vTaskNotifyGiveFromISR+0xe6>
    800034fc:	6782                	ld	a5,0(sp)
    800034fe:	4705                	li	a4,1
    80003500:	e398                	sd	a4,0(a5)
    80003502:	7782                	ld	a5,32(sp)
    80003504:	2781                	sext.w	a5,a5
    80003506:	853e                	mv	a0,a5
    80003508:	820fd0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    8000350c:	0001                	nop
    8000350e:	70e2                	ld	ra,56(sp)
    80003510:	6121                	addi	sp,sp,64
    80003512:	8082                	ret

0000000080003514 <xTaskNotifyStateClear>:
    80003514:	7179                	addi	sp,sp,-48
    80003516:	f406                	sd	ra,40(sp)
    80003518:	e42a                	sd	a0,8(sp)
    8000351a:	67a2                	ld	a5,8(sp)
    8000351c:	e83e                	sd	a5,16(sp)
    8000351e:	67c2                	ld	a5,16(sp)
    80003520:	e799                	bnez	a5,8000352e <xTaskNotifyStateClear+0x1a>
    80003522:	0001d797          	auipc	a5,0x1d
    80003526:	e1e78793          	addi	a5,a5,-482 # 80020340 <pxCurrentTCB>
    8000352a:	639c                	ld	a5,0(a5)
    8000352c:	a011                	j	80003530 <xTaskNotifyStateClear+0x1c>
    8000352e:	67c2                	ld	a5,16(sp)
    80003530:	e83e                	sd	a5,16(sp)
    80003532:	901ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003536:	67c2                	ld	a5,16(sp)
    80003538:	0a47a783          	lw	a5,164(a5)
    8000353c:	2781                	sext.w	a5,a5
    8000353e:	873e                	mv	a4,a5
    80003540:	4789                	li	a5,2
    80003542:	00f71863          	bne	a4,a5,80003552 <xTaskNotifyStateClear+0x3e>
    80003546:	67c2                	ld	a5,16(sp)
    80003548:	0a07a223          	sw	zero,164(a5)
    8000354c:	4785                	li	a5,1
    8000354e:	ec3e                	sd	a5,24(sp)
    80003550:	a011                	j	80003554 <xTaskNotifyStateClear+0x40>
    80003552:	ec02                	sd	zero,24(sp)
    80003554:	90dff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003558:	67e2                	ld	a5,24(sp)
    8000355a:	853e                	mv	a0,a5
    8000355c:	70a2                	ld	ra,40(sp)
    8000355e:	6145                	addi	sp,sp,48
    80003560:	8082                	ret

0000000080003562 <xTimerCreateTimerTask>:
    80003562:	1101                	addi	sp,sp,-32
    80003564:	ec06                	sd	ra,24(sp)
    80003566:	e402                	sd	zero,8(sp)
    80003568:	5be000ef          	jal	ra,80003b26 <prvCheckForValidListAndQueue>
    8000356c:	0001d797          	auipc	a5,0x1d
    80003570:	26478793          	addi	a5,a5,612 # 800207d0 <xTimerQueue>
    80003574:	639c                	ld	a5,0(a5)
    80003576:	c39d                	beqz	a5,8000359c <xTimerCreateTimerTask+0x3a>
    80003578:	4881                	li	a7,0
    8000357a:	4801                	li	a6,0
    8000357c:	4781                	li	a5,0
    8000357e:	4709                	li	a4,2
    80003580:	4681                	li	a3,0
    80003582:	40000613          	li	a2,1024
    80003586:	0001d597          	auipc	a1,0x1d
    8000358a:	aaa58593          	addi	a1,a1,-1366 # 80020030 <__rodata_start+0x30>
    8000358e:	00000517          	auipc	a0,0x0
    80003592:	1cc50513          	addi	a0,a0,460 # 8000375a <prvTimerTask>
    80003596:	debfd0ef          	jal	ra,80001380 <xTaskGenericCreate>
    8000359a:	e42a                	sd	a0,8(sp)
    8000359c:	67a2                	ld	a5,8(sp)
    8000359e:	e781                	bnez	a5,800035a6 <xTimerCreateTimerTask+0x44>
    800035a0:	30047073          	csrci	mstatus,8
    800035a4:	a001                	j	800035a4 <xTimerCreateTimerTask+0x42>
    800035a6:	67a2                	ld	a5,8(sp)
    800035a8:	853e                	mv	a0,a5
    800035aa:	60e2                	ld	ra,24(sp)
    800035ac:	6105                	addi	sp,sp,32
    800035ae:	8082                	ret

00000000800035b0 <xTimerCreate>:
    800035b0:	715d                	addi	sp,sp,-80
    800035b2:	e486                	sd	ra,72(sp)
    800035b4:	f42a                	sd	a0,40(sp)
    800035b6:	87ae                	mv	a5,a1
    800035b8:	ec32                	sd	a2,24(sp)
    800035ba:	e836                	sd	a3,16(sp)
    800035bc:	e43a                	sd	a4,8(sp)
    800035be:	d23e                	sw	a5,36(sp)
    800035c0:	5792                	lw	a5,36(sp)
    800035c2:	2781                	sext.w	a5,a5
    800035c4:	e399                	bnez	a5,800035ca <xTimerCreate+0x1a>
    800035c6:	fc02                	sd	zero,56(sp)
    800035c8:	a835                	j	80003604 <xTimerCreate+0x54>
    800035ca:	05800513          	li	a0,88
    800035ce:	3f7000ef          	jal	ra,800041c4 <pvPortMalloc>
    800035d2:	fc2a                	sd	a0,56(sp)
    800035d4:	77e2                	ld	a5,56(sp)
    800035d6:	c79d                	beqz	a5,80003604 <xTimerCreate+0x54>
    800035d8:	54e000ef          	jal	ra,80003b26 <prvCheckForValidListAndQueue>
    800035dc:	77e2                	ld	a5,56(sp)
    800035de:	7722                	ld	a4,40(sp)
    800035e0:	e398                	sd	a4,0(a5)
    800035e2:	77e2                	ld	a5,56(sp)
    800035e4:	5712                	lw	a4,36(sp)
    800035e6:	db98                	sw	a4,48(a5)
    800035e8:	77e2                	ld	a5,56(sp)
    800035ea:	6762                	ld	a4,24(sp)
    800035ec:	ff98                	sd	a4,56(a5)
    800035ee:	77e2                	ld	a5,56(sp)
    800035f0:	6742                	ld	a4,16(sp)
    800035f2:	e3b8                	sd	a4,64(a5)
    800035f4:	77e2                	ld	a5,56(sp)
    800035f6:	6722                	ld	a4,8(sp)
    800035f8:	e7b8                	sd	a4,72(a5)
    800035fa:	77e2                	ld	a5,56(sp)
    800035fc:	07a1                	addi	a5,a5,8
    800035fe:	853e                	mv	a0,a5
    80003600:	febfc0ef          	jal	ra,800005ea <vListInitialiseItem>
    80003604:	5792                	lw	a5,36(sp)
    80003606:	2781                	sext.w	a5,a5
    80003608:	e781                	bnez	a5,80003610 <xTimerCreate+0x60>
    8000360a:	30047073          	csrci	mstatus,8
    8000360e:	a001                	j	8000360e <xTimerCreate+0x5e>
    80003610:	77e2                	ld	a5,56(sp)
    80003612:	853e                	mv	a0,a5
    80003614:	60a6                	ld	ra,72(sp)
    80003616:	6161                	addi	sp,sp,80
    80003618:	8082                	ret

000000008000361a <xTimerGenericCommand>:
    8000361a:	715d                	addi	sp,sp,-80
    8000361c:	e486                	sd	ra,72(sp)
    8000361e:	ec2a                	sd	a0,24(sp)
    80003620:	e82e                	sd	a1,16(sp)
    80003622:	87b2                	mv	a5,a2
    80003624:	e036                	sd	a3,0(sp)
    80003626:	c63e                	sw	a5,12(sp)
    80003628:	87ba                	mv	a5,a4
    8000362a:	c43e                	sw	a5,8(sp)
    8000362c:	fc02                	sd	zero,56(sp)
    8000362e:	67e2                	ld	a5,24(sp)
    80003630:	e781                	bnez	a5,80003638 <xTimerGenericCommand+0x1e>
    80003632:	30047073          	csrci	mstatus,8
    80003636:	a001                	j	80003636 <xTimerGenericCommand+0x1c>
    80003638:	0001d797          	auipc	a5,0x1d
    8000363c:	19878793          	addi	a5,a5,408 # 800207d0 <xTimerQueue>
    80003640:	639c                	ld	a5,0(a5)
    80003642:	cbb5                	beqz	a5,800036b6 <xTimerGenericCommand+0x9c>
    80003644:	67c2                	ld	a5,16(sp)
    80003646:	f03e                	sd	a5,32(sp)
    80003648:	47b2                	lw	a5,12(sp)
    8000364a:	d43e                	sw	a5,40(sp)
    8000364c:	67e2                	ld	a5,24(sp)
    8000364e:	f83e                	sd	a5,48(sp)
    80003650:	6742                	ld	a4,16(sp)
    80003652:	4795                	li	a5,5
    80003654:	04e7c463          	blt	a5,a4,8000369c <xTimerGenericCommand+0x82>
    80003658:	e00ff0ef          	jal	ra,80002c58 <xTaskGetSchedulerState>
    8000365c:	872a                	mv	a4,a0
    8000365e:	4789                	li	a5,2
    80003660:	02f71063          	bne	a4,a5,80003680 <xTimerGenericCommand+0x66>
    80003664:	0001d797          	auipc	a5,0x1d
    80003668:	16c78793          	addi	a5,a5,364 # 800207d0 <xTimerQueue>
    8000366c:	639c                	ld	a5,0(a5)
    8000366e:	4622                	lw	a2,8(sp)
    80003670:	1018                	addi	a4,sp,32
    80003672:	4681                	li	a3,0
    80003674:	85ba                	mv	a1,a4
    80003676:	853e                	mv	a0,a5
    80003678:	b48fd0ef          	jal	ra,800009c0 <xQueueGenericSend>
    8000367c:	fc2a                	sd	a0,56(sp)
    8000367e:	a825                	j	800036b6 <xTimerGenericCommand+0x9c>
    80003680:	0001d797          	auipc	a5,0x1d
    80003684:	15078793          	addi	a5,a5,336 # 800207d0 <xTimerQueue>
    80003688:	639c                	ld	a5,0(a5)
    8000368a:	1018                	addi	a4,sp,32
    8000368c:	4681                	li	a3,0
    8000368e:	4601                	li	a2,0
    80003690:	85ba                	mv	a1,a4
    80003692:	853e                	mv	a0,a5
    80003694:	b2cfd0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80003698:	fc2a                	sd	a0,56(sp)
    8000369a:	a831                	j	800036b6 <xTimerGenericCommand+0x9c>
    8000369c:	0001d797          	auipc	a5,0x1d
    800036a0:	13478793          	addi	a5,a5,308 # 800207d0 <xTimerQueue>
    800036a4:	639c                	ld	a5,0(a5)
    800036a6:	1018                	addi	a4,sp,32
    800036a8:	4681                	li	a3,0
    800036aa:	6602                	ld	a2,0(sp)
    800036ac:	85ba                	mv	a1,a4
    800036ae:	853e                	mv	a0,a5
    800036b0:	c80fd0ef          	jal	ra,80000b30 <xQueueGenericSendFromISR>
    800036b4:	fc2a                	sd	a0,56(sp)
    800036b6:	77e2                	ld	a5,56(sp)
    800036b8:	853e                	mv	a0,a5
    800036ba:	60a6                	ld	ra,72(sp)
    800036bc:	6161                	addi	sp,sp,80
    800036be:	8082                	ret

00000000800036c0 <pcTimerGetTimerName>:
    800036c0:	1101                	addi	sp,sp,-32
    800036c2:	e42a                	sd	a0,8(sp)
    800036c4:	67a2                	ld	a5,8(sp)
    800036c6:	ec3e                	sd	a5,24(sp)
    800036c8:	67a2                	ld	a5,8(sp)
    800036ca:	e781                	bnez	a5,800036d2 <pcTimerGetTimerName+0x12>
    800036cc:	30047073          	csrci	mstatus,8
    800036d0:	a001                	j	800036d0 <pcTimerGetTimerName+0x10>
    800036d2:	67e2                	ld	a5,24(sp)
    800036d4:	639c                	ld	a5,0(a5)
    800036d6:	853e                	mv	a0,a5
    800036d8:	6105                	addi	sp,sp,32
    800036da:	8082                	ret

00000000800036dc <prvProcessExpiredTimer>:
    800036dc:	7179                	addi	sp,sp,-48
    800036de:	f406                	sd	ra,40(sp)
    800036e0:	87aa                	mv	a5,a0
    800036e2:	872e                	mv	a4,a1
    800036e4:	c63e                	sw	a5,12(sp)
    800036e6:	87ba                	mv	a5,a4
    800036e8:	c43e                	sw	a5,8(sp)
    800036ea:	0001d797          	auipc	a5,0x1d
    800036ee:	0d678793          	addi	a5,a5,214 # 800207c0 <pxCurrentTimerList>
    800036f2:	639c                	ld	a5,0(a5)
    800036f4:	6f9c                	ld	a5,24(a5)
    800036f6:	6f9c                	ld	a5,24(a5)
    800036f8:	ec3e                	sd	a5,24(sp)
    800036fa:	67e2                	ld	a5,24(sp)
    800036fc:	07a1                	addi	a5,a5,8
    800036fe:	853e                	mv	a0,a5
    80003700:	fabfc0ef          	jal	ra,800006aa <uxListRemove>
    80003704:	67e2                	ld	a5,24(sp)
    80003706:	7f98                	ld	a4,56(a5)
    80003708:	4785                	li	a5,1
    8000370a:	04f71063          	bne	a4,a5,8000374a <prvProcessExpiredTimer+0x6e>
    8000370e:	67e2                	ld	a5,24(sp)
    80003710:	5b9c                	lw	a5,48(a5)
    80003712:	4732                	lw	a4,12(sp)
    80003714:	9fb9                	addw	a5,a5,a4
    80003716:	2781                	sext.w	a5,a5
    80003718:	46b2                	lw	a3,12(sp)
    8000371a:	4722                	lw	a4,8(sp)
    8000371c:	863a                	mv	a2,a4
    8000371e:	85be                	mv	a1,a5
    80003720:	6562                	ld	a0,24(sp)
    80003722:	17a000ef          	jal	ra,8000389c <prvInsertTimerInActiveList>
    80003726:	872a                	mv	a4,a0
    80003728:	4785                	li	a5,1
    8000372a:	02f71063          	bne	a4,a5,8000374a <prvProcessExpiredTimer+0x6e>
    8000372e:	47b2                	lw	a5,12(sp)
    80003730:	4701                	li	a4,0
    80003732:	4681                	li	a3,0
    80003734:	863e                	mv	a2,a5
    80003736:	4581                	li	a1,0
    80003738:	6562                	ld	a0,24(sp)
    8000373a:	ee1ff0ef          	jal	ra,8000361a <xTimerGenericCommand>
    8000373e:	e82a                	sd	a0,16(sp)
    80003740:	67c2                	ld	a5,16(sp)
    80003742:	e781                	bnez	a5,8000374a <prvProcessExpiredTimer+0x6e>
    80003744:	30047073          	csrci	mstatus,8
    80003748:	a001                	j	80003748 <prvProcessExpiredTimer+0x6c>
    8000374a:	67e2                	ld	a5,24(sp)
    8000374c:	67bc                	ld	a5,72(a5)
    8000374e:	6562                	ld	a0,24(sp)
    80003750:	9782                	jalr	a5
    80003752:	0001                	nop
    80003754:	70a2                	ld	ra,40(sp)
    80003756:	6145                	addi	sp,sp,48
    80003758:	8082                	ret

000000008000375a <prvTimerTask>:
    8000375a:	7179                	addi	sp,sp,-48
    8000375c:	f406                	sd	ra,40(sp)
    8000375e:	e42a                	sd	a0,8(sp)
    80003760:	081c                	addi	a5,sp,16
    80003762:	853e                	mv	a0,a5
    80003764:	0b0000ef          	jal	ra,80003814 <prvGetNextExpireTime>
    80003768:	87aa                	mv	a5,a0
    8000376a:	ce3e                	sw	a5,28(sp)
    8000376c:	6742                	ld	a4,16(sp)
    8000376e:	47f2                	lw	a5,28(sp)
    80003770:	85ba                	mv	a1,a4
    80003772:	853e                	mv	a0,a5
    80003774:	00a000ef          	jal	ra,8000377e <prvProcessTimerOrBlockTask>
    80003778:	1ca000ef          	jal	ra,80003942 <prvProcessReceivedCommands>
    8000377c:	b7d5                	j	80003760 <prvTimerTask+0x6>

000000008000377e <prvProcessTimerOrBlockTask>:
    8000377e:	7179                	addi	sp,sp,-48
    80003780:	f406                	sd	ra,40(sp)
    80003782:	87aa                	mv	a5,a0
    80003784:	e02e                	sd	a1,0(sp)
    80003786:	c63e                	sw	a5,12(sp)
    80003788:	d3afe0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    8000378c:	081c                	addi	a5,sp,16
    8000378e:	853e                	mv	a0,a5
    80003790:	0c4000ef          	jal	ra,80003854 <prvSampleTimeNow>
    80003794:	87aa                	mv	a5,a0
    80003796:	ce3e                	sw	a5,28(sp)
    80003798:	67c2                	ld	a5,16(sp)
    8000379a:	e7bd                	bnez	a5,80003808 <prvProcessTimerOrBlockTask+0x8a>
    8000379c:	6782                	ld	a5,0(sp)
    8000379e:	e38d                	bnez	a5,800037c0 <prvProcessTimerOrBlockTask+0x42>
    800037a0:	47b2                	lw	a5,12(sp)
    800037a2:	873e                	mv	a4,a5
    800037a4:	47f2                	lw	a5,28(sp)
    800037a6:	2701                	sext.w	a4,a4
    800037a8:	2781                	sext.w	a5,a5
    800037aa:	00e7eb63          	bltu	a5,a4,800037c0 <prvProcessTimerOrBlockTask+0x42>
    800037ae:	d30fe0ef          	jal	ra,80001cde <xTaskResumeAll>
    800037b2:	4772                	lw	a4,28(sp)
    800037b4:	47b2                	lw	a5,12(sp)
    800037b6:	85ba                	mv	a1,a4
    800037b8:	853e                	mv	a0,a5
    800037ba:	f23ff0ef          	jal	ra,800036dc <prvProcessExpiredTimer>
    800037be:	a0b9                	j	8000380c <prvProcessTimerOrBlockTask+0x8e>
    800037c0:	6782                	ld	a5,0(sp)
    800037c2:	cf81                	beqz	a5,800037da <prvProcessTimerOrBlockTask+0x5c>
    800037c4:	0001d797          	auipc	a5,0x1d
    800037c8:	00478793          	addi	a5,a5,4 # 800207c8 <pxOverflowTimerList>
    800037cc:	639c                	ld	a5,0(a5)
    800037ce:	639c                	ld	a5,0(a5)
    800037d0:	0017b793          	seqz	a5,a5
    800037d4:	0ff7f793          	zext.b	a5,a5
    800037d8:	e03e                	sd	a5,0(sp)
    800037da:	0001d797          	auipc	a5,0x1d
    800037de:	ff678793          	addi	a5,a5,-10 # 800207d0 <xTimerQueue>
    800037e2:	639c                	ld	a5,0(a5)
    800037e4:	4732                	lw	a4,12(sp)
    800037e6:	86ba                	mv	a3,a4
    800037e8:	4772                	lw	a4,28(sp)
    800037ea:	40e6873b          	subw	a4,a3,a4
    800037ee:	2701                	sext.w	a4,a4
    800037f0:	6602                	ld	a2,0(sp)
    800037f2:	85ba                	mv	a1,a4
    800037f4:	853e                	mv	a0,a5
    800037f6:	b2dfd0ef          	jal	ra,80001322 <vQueueWaitForMessageRestricted>
    800037fa:	ce4fe0ef          	jal	ra,80001cde <xTaskResumeAll>
    800037fe:	87aa                	mv	a5,a0
    80003800:	e791                	bnez	a5,8000380c <prvProcessTimerOrBlockTask+0x8e>
    80003802:	c0bfc0ef          	jal	ra,8000040c <vPortYield>
    80003806:	a019                	j	8000380c <prvProcessTimerOrBlockTask+0x8e>
    80003808:	cd6fe0ef          	jal	ra,80001cde <xTaskResumeAll>
    8000380c:	0001                	nop
    8000380e:	70a2                	ld	ra,40(sp)
    80003810:	6145                	addi	sp,sp,48
    80003812:	8082                	ret

0000000080003814 <prvGetNextExpireTime>:
    80003814:	1101                	addi	sp,sp,-32
    80003816:	e42a                	sd	a0,8(sp)
    80003818:	0001d797          	auipc	a5,0x1d
    8000381c:	fa878793          	addi	a5,a5,-88 # 800207c0 <pxCurrentTimerList>
    80003820:	639c                	ld	a5,0(a5)
    80003822:	639c                	ld	a5,0(a5)
    80003824:	0017b793          	seqz	a5,a5
    80003828:	0ff7f793          	zext.b	a5,a5
    8000382c:	873e                	mv	a4,a5
    8000382e:	67a2                	ld	a5,8(sp)
    80003830:	e398                	sd	a4,0(a5)
    80003832:	67a2                	ld	a5,8(sp)
    80003834:	639c                	ld	a5,0(a5)
    80003836:	eb91                	bnez	a5,8000384a <prvGetNextExpireTime+0x36>
    80003838:	0001d797          	auipc	a5,0x1d
    8000383c:	f8878793          	addi	a5,a5,-120 # 800207c0 <pxCurrentTimerList>
    80003840:	639c                	ld	a5,0(a5)
    80003842:	6f9c                	ld	a5,24(a5)
    80003844:	439c                	lw	a5,0(a5)
    80003846:	ce3e                	sw	a5,28(sp)
    80003848:	a011                	j	8000384c <prvGetNextExpireTime+0x38>
    8000384a:	ce02                	sw	zero,28(sp)
    8000384c:	47f2                	lw	a5,28(sp)
    8000384e:	853e                	mv	a0,a5
    80003850:	6105                	addi	sp,sp,32
    80003852:	8082                	ret

0000000080003854 <prvSampleTimeNow>:
    80003854:	7179                	addi	sp,sp,-48
    80003856:	f406                	sd	ra,40(sp)
    80003858:	e42a                	sd	a0,8(sp)
    8000385a:	dd4fe0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    8000385e:	87aa                	mv	a5,a0
    80003860:	ce3e                	sw	a5,28(sp)
    80003862:	0001d797          	auipc	a5,0x1d
    80003866:	f7678793          	addi	a5,a5,-138 # 800207d8 <xLastTime.0>
    8000386a:	4398                	lw	a4,0(a5)
    8000386c:	47f2                	lw	a5,28(sp)
    8000386e:	2781                	sext.w	a5,a5
    80003870:	00e7f863          	bgeu	a5,a4,80003880 <prvSampleTimeNow+0x2c>
    80003874:	1d6000ef          	jal	ra,80003a4a <prvSwitchTimerLists>
    80003878:	67a2                	ld	a5,8(sp)
    8000387a:	4705                	li	a4,1
    8000387c:	e398                	sd	a4,0(a5)
    8000387e:	a021                	j	80003886 <prvSampleTimeNow+0x32>
    80003880:	67a2                	ld	a5,8(sp)
    80003882:	0007b023          	sd	zero,0(a5)
    80003886:	0001d797          	auipc	a5,0x1d
    8000388a:	f5278793          	addi	a5,a5,-174 # 800207d8 <xLastTime.0>
    8000388e:	4772                	lw	a4,28(sp)
    80003890:	c398                	sw	a4,0(a5)
    80003892:	47f2                	lw	a5,28(sp)
    80003894:	853e                	mv	a0,a5
    80003896:	70a2                	ld	ra,40(sp)
    80003898:	6145                	addi	sp,sp,48
    8000389a:	8082                	ret

000000008000389c <prvInsertTimerInActiveList>:
    8000389c:	7139                	addi	sp,sp,-64
    8000389e:	fc06                	sd	ra,56(sp)
    800038a0:	ec2a                	sd	a0,24(sp)
    800038a2:	87ae                	mv	a5,a1
    800038a4:	8736                	mv	a4,a3
    800038a6:	ca3e                	sw	a5,20(sp)
    800038a8:	87b2                	mv	a5,a2
    800038aa:	c83e                	sw	a5,16(sp)
    800038ac:	87ba                	mv	a5,a4
    800038ae:	c63e                	sw	a5,12(sp)
    800038b0:	f402                	sd	zero,40(sp)
    800038b2:	67e2                	ld	a5,24(sp)
    800038b4:	4752                	lw	a4,20(sp)
    800038b6:	c798                	sw	a4,8(a5)
    800038b8:	67e2                	ld	a5,24(sp)
    800038ba:	6762                	ld	a4,24(sp)
    800038bc:	f398                	sd	a4,32(a5)
    800038be:	47d2                	lw	a5,20(sp)
    800038c0:	873e                	mv	a4,a5
    800038c2:	47c2                	lw	a5,16(sp)
    800038c4:	2701                	sext.w	a4,a4
    800038c6:	2781                	sext.w	a5,a5
    800038c8:	02e7ec63          	bltu	a5,a4,80003900 <prvInsertTimerInActiveList+0x64>
    800038cc:	47c2                	lw	a5,16(sp)
    800038ce:	873e                	mv	a4,a5
    800038d0:	47b2                	lw	a5,12(sp)
    800038d2:	40f707bb          	subw	a5,a4,a5
    800038d6:	0007871b          	sext.w	a4,a5
    800038da:	67e2                	ld	a5,24(sp)
    800038dc:	5b9c                	lw	a5,48(a5)
    800038de:	00f76563          	bltu	a4,a5,800038e8 <prvInsertTimerInActiveList+0x4c>
    800038e2:	4785                	li	a5,1
    800038e4:	f43e                	sd	a5,40(sp)
    800038e6:	a889                	j	80003938 <prvInsertTimerInActiveList+0x9c>
    800038e8:	0001d797          	auipc	a5,0x1d
    800038ec:	ee078793          	addi	a5,a5,-288 # 800207c8 <pxOverflowTimerList>
    800038f0:	6398                	ld	a4,0(a5)
    800038f2:	67e2                	ld	a5,24(sp)
    800038f4:	07a1                	addi	a5,a5,8
    800038f6:	85be                	mv	a1,a5
    800038f8:	853a                	mv	a0,a4
    800038fa:	d41fc0ef          	jal	ra,8000063a <vListInsert>
    800038fe:	a82d                	j	80003938 <prvInsertTimerInActiveList+0x9c>
    80003900:	47c2                	lw	a5,16(sp)
    80003902:	873e                	mv	a4,a5
    80003904:	47b2                	lw	a5,12(sp)
    80003906:	2701                	sext.w	a4,a4
    80003908:	2781                	sext.w	a5,a5
    8000390a:	00f77c63          	bgeu	a4,a5,80003922 <prvInsertTimerInActiveList+0x86>
    8000390e:	47d2                	lw	a5,20(sp)
    80003910:	873e                	mv	a4,a5
    80003912:	47b2                	lw	a5,12(sp)
    80003914:	2701                	sext.w	a4,a4
    80003916:	2781                	sext.w	a5,a5
    80003918:	00f76563          	bltu	a4,a5,80003922 <prvInsertTimerInActiveList+0x86>
    8000391c:	4785                	li	a5,1
    8000391e:	f43e                	sd	a5,40(sp)
    80003920:	a821                	j	80003938 <prvInsertTimerInActiveList+0x9c>
    80003922:	0001d797          	auipc	a5,0x1d
    80003926:	e9e78793          	addi	a5,a5,-354 # 800207c0 <pxCurrentTimerList>
    8000392a:	6398                	ld	a4,0(a5)
    8000392c:	67e2                	ld	a5,24(sp)
    8000392e:	07a1                	addi	a5,a5,8
    80003930:	85be                	mv	a1,a5
    80003932:	853a                	mv	a0,a4
    80003934:	d07fc0ef          	jal	ra,8000063a <vListInsert>
    80003938:	77a2                	ld	a5,40(sp)
    8000393a:	853e                	mv	a0,a5
    8000393c:	70e2                	ld	ra,56(sp)
    8000393e:	6121                	addi	sp,sp,64
    80003940:	8082                	ret

0000000080003942 <prvProcessReceivedCommands>:
    80003942:	715d                	addi	sp,sp,-80
    80003944:	e486                	sd	ra,72(sp)
    80003946:	a8f1                	j	80003a22 <prvProcessReceivedCommands+0xe0>
    80003948:	67c2                	ld	a5,16(sp)
    8000394a:	0c07cc63          	bltz	a5,80003a22 <prvProcessReceivedCommands+0xe0>
    8000394e:	7782                	ld	a5,32(sp)
    80003950:	fc3e                	sd	a5,56(sp)
    80003952:	77e2                	ld	a5,56(sp)
    80003954:	779c                	ld	a5,40(a5)
    80003956:	c791                	beqz	a5,80003962 <prvProcessReceivedCommands+0x20>
    80003958:	77e2                	ld	a5,56(sp)
    8000395a:	07a1                	addi	a5,a5,8
    8000395c:	853e                	mv	a0,a5
    8000395e:	d4dfc0ef          	jal	ra,800006aa <uxListRemove>
    80003962:	003c                	addi	a5,sp,8
    80003964:	853e                	mv	a0,a5
    80003966:	eefff0ef          	jal	ra,80003854 <prvSampleTimeNow>
    8000396a:	87aa                	mv	a5,a0
    8000396c:	da3e                	sw	a5,52(sp)
    8000396e:	67c2                	ld	a5,16(sp)
    80003970:	4725                	li	a4,9
    80003972:	0af76763          	bltu	a4,a5,80003a20 <prvProcessReceivedCommands+0xde>
    80003976:	00279713          	slli	a4,a5,0x2
    8000397a:	0001c797          	auipc	a5,0x1c
    8000397e:	6be78793          	addi	a5,a5,1726 # 80020038 <__rodata_start+0x38>
    80003982:	97ba                	add	a5,a5,a4
    80003984:	439c                	lw	a5,0(a5)
    80003986:	0007871b          	sext.w	a4,a5
    8000398a:	0001c797          	auipc	a5,0x1c
    8000398e:	6ae78793          	addi	a5,a5,1710 # 80020038 <__rodata_start+0x38>
    80003992:	97ba                	add	a5,a5,a4
    80003994:	8782                	jr	a5
    80003996:	4762                	lw	a4,24(sp)
    80003998:	77e2                	ld	a5,56(sp)
    8000399a:	5b9c                	lw	a5,48(a5)
    8000399c:	9fb9                	addw	a5,a5,a4
    8000399e:	2781                	sext.w	a5,a5
    800039a0:	46e2                	lw	a3,24(sp)
    800039a2:	5752                	lw	a4,52(sp)
    800039a4:	863a                	mv	a2,a4
    800039a6:	85be                	mv	a1,a5
    800039a8:	7562                	ld	a0,56(sp)
    800039aa:	ef3ff0ef          	jal	ra,8000389c <prvInsertTimerInActiveList>
    800039ae:	872a                	mv	a4,a0
    800039b0:	4785                	li	a5,1
    800039b2:	06f71863          	bne	a4,a5,80003a22 <prvProcessReceivedCommands+0xe0>
    800039b6:	77e2                	ld	a5,56(sp)
    800039b8:	67bc                	ld	a5,72(a5)
    800039ba:	7562                	ld	a0,56(sp)
    800039bc:	9782                	jalr	a5
    800039be:	77e2                	ld	a5,56(sp)
    800039c0:	7f98                	ld	a4,56(a5)
    800039c2:	4785                	li	a5,1
    800039c4:	04f71f63          	bne	a4,a5,80003a22 <prvProcessReceivedCommands+0xe0>
    800039c8:	4762                	lw	a4,24(sp)
    800039ca:	77e2                	ld	a5,56(sp)
    800039cc:	5b9c                	lw	a5,48(a5)
    800039ce:	9fb9                	addw	a5,a5,a4
    800039d0:	2781                	sext.w	a5,a5
    800039d2:	4701                	li	a4,0
    800039d4:	4681                	li	a3,0
    800039d6:	863e                	mv	a2,a5
    800039d8:	4581                	li	a1,0
    800039da:	7562                	ld	a0,56(sp)
    800039dc:	c3fff0ef          	jal	ra,8000361a <xTimerGenericCommand>
    800039e0:	f42a                	sd	a0,40(sp)
    800039e2:	77a2                	ld	a5,40(sp)
    800039e4:	ef9d                	bnez	a5,80003a22 <prvProcessReceivedCommands+0xe0>
    800039e6:	30047073          	csrci	mstatus,8
    800039ea:	a001                	j	800039ea <prvProcessReceivedCommands+0xa8>
    800039ec:	4762                	lw	a4,24(sp)
    800039ee:	77e2                	ld	a5,56(sp)
    800039f0:	db98                	sw	a4,48(a5)
    800039f2:	77e2                	ld	a5,56(sp)
    800039f4:	5b9c                	lw	a5,48(a5)
    800039f6:	e781                	bnez	a5,800039fe <prvProcessReceivedCommands+0xbc>
    800039f8:	30047073          	csrci	mstatus,8
    800039fc:	a001                	j	800039fc <prvProcessReceivedCommands+0xba>
    800039fe:	77e2                	ld	a5,56(sp)
    80003a00:	5b9c                	lw	a5,48(a5)
    80003a02:	5752                	lw	a4,52(sp)
    80003a04:	9fb9                	addw	a5,a5,a4
    80003a06:	2781                	sext.w	a5,a5
    80003a08:	56d2                	lw	a3,52(sp)
    80003a0a:	5752                	lw	a4,52(sp)
    80003a0c:	863a                	mv	a2,a4
    80003a0e:	85be                	mv	a1,a5
    80003a10:	7562                	ld	a0,56(sp)
    80003a12:	e8bff0ef          	jal	ra,8000389c <prvInsertTimerInActiveList>
    80003a16:	a031                	j	80003a22 <prvProcessReceivedCommands+0xe0>
    80003a18:	7562                	ld	a0,56(sp)
    80003a1a:	0e3000ef          	jal	ra,800042fc <vPortFree>
    80003a1e:	a011                	j	80003a22 <prvProcessReceivedCommands+0xe0>
    80003a20:	0001                	nop
    80003a22:	0001d797          	auipc	a5,0x1d
    80003a26:	dae78793          	addi	a5,a5,-594 # 800207d0 <xTimerQueue>
    80003a2a:	639c                	ld	a5,0(a5)
    80003a2c:	0818                	addi	a4,sp,16
    80003a2e:	4681                	li	a3,0
    80003a30:	4601                	li	a2,0
    80003a32:	85ba                	mv	a1,a4
    80003a34:	853e                	mv	a0,a5
    80003a36:	a76fd0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80003a3a:	87aa                	mv	a5,a0
    80003a3c:	f00796e3          	bnez	a5,80003948 <prvProcessReceivedCommands+0x6>
    80003a40:	0001                	nop
    80003a42:	0001                	nop
    80003a44:	60a6                	ld	ra,72(sp)
    80003a46:	6161                	addi	sp,sp,80
    80003a48:	8082                	ret

0000000080003a4a <prvSwitchTimerLists>:
    80003a4a:	7139                	addi	sp,sp,-64
    80003a4c:	fc06                	sd	ra,56(sp)
    80003a4e:	a859                	j	80003ae4 <prvSwitchTimerLists+0x9a>
    80003a50:	0001d797          	auipc	a5,0x1d
    80003a54:	d7078793          	addi	a5,a5,-656 # 800207c0 <pxCurrentTimerList>
    80003a58:	639c                	ld	a5,0(a5)
    80003a5a:	6f9c                	ld	a5,24(a5)
    80003a5c:	439c                	lw	a5,0(a5)
    80003a5e:	d23e                	sw	a5,36(sp)
    80003a60:	0001d797          	auipc	a5,0x1d
    80003a64:	d6078793          	addi	a5,a5,-672 # 800207c0 <pxCurrentTimerList>
    80003a68:	639c                	ld	a5,0(a5)
    80003a6a:	6f9c                	ld	a5,24(a5)
    80003a6c:	6f9c                	ld	a5,24(a5)
    80003a6e:	ec3e                	sd	a5,24(sp)
    80003a70:	67e2                	ld	a5,24(sp)
    80003a72:	07a1                	addi	a5,a5,8
    80003a74:	853e                	mv	a0,a5
    80003a76:	c35fc0ef          	jal	ra,800006aa <uxListRemove>
    80003a7a:	67e2                	ld	a5,24(sp)
    80003a7c:	67bc                	ld	a5,72(a5)
    80003a7e:	6562                	ld	a0,24(sp)
    80003a80:	9782                	jalr	a5
    80003a82:	67e2                	ld	a5,24(sp)
    80003a84:	7f98                	ld	a4,56(a5)
    80003a86:	4785                	li	a5,1
    80003a88:	04f71e63          	bne	a4,a5,80003ae4 <prvSwitchTimerLists+0x9a>
    80003a8c:	67e2                	ld	a5,24(sp)
    80003a8e:	5b9c                	lw	a5,48(a5)
    80003a90:	5712                	lw	a4,36(sp)
    80003a92:	9fb9                	addw	a5,a5,a4
    80003a94:	ca3e                	sw	a5,20(sp)
    80003a96:	47d2                	lw	a5,20(sp)
    80003a98:	873e                	mv	a4,a5
    80003a9a:	5792                	lw	a5,36(sp)
    80003a9c:	2701                	sext.w	a4,a4
    80003a9e:	2781                	sext.w	a5,a5
    80003aa0:	02e7f463          	bgeu	a5,a4,80003ac8 <prvSwitchTimerLists+0x7e>
    80003aa4:	67e2                	ld	a5,24(sp)
    80003aa6:	4752                	lw	a4,20(sp)
    80003aa8:	c798                	sw	a4,8(a5)
    80003aaa:	67e2                	ld	a5,24(sp)
    80003aac:	6762                	ld	a4,24(sp)
    80003aae:	f398                	sd	a4,32(a5)
    80003ab0:	0001d797          	auipc	a5,0x1d
    80003ab4:	d1078793          	addi	a5,a5,-752 # 800207c0 <pxCurrentTimerList>
    80003ab8:	6398                	ld	a4,0(a5)
    80003aba:	67e2                	ld	a5,24(sp)
    80003abc:	07a1                	addi	a5,a5,8
    80003abe:	85be                	mv	a1,a5
    80003ac0:	853a                	mv	a0,a4
    80003ac2:	b79fc0ef          	jal	ra,8000063a <vListInsert>
    80003ac6:	a839                	j	80003ae4 <prvSwitchTimerLists+0x9a>
    80003ac8:	5792                	lw	a5,36(sp)
    80003aca:	4701                	li	a4,0
    80003acc:	4681                	li	a3,0
    80003ace:	863e                	mv	a2,a5
    80003ad0:	4581                	li	a1,0
    80003ad2:	6562                	ld	a0,24(sp)
    80003ad4:	b47ff0ef          	jal	ra,8000361a <xTimerGenericCommand>
    80003ad8:	e42a                	sd	a0,8(sp)
    80003ada:	67a2                	ld	a5,8(sp)
    80003adc:	e781                	bnez	a5,80003ae4 <prvSwitchTimerLists+0x9a>
    80003ade:	30047073          	csrci	mstatus,8
    80003ae2:	a001                	j	80003ae2 <prvSwitchTimerLists+0x98>
    80003ae4:	0001d797          	auipc	a5,0x1d
    80003ae8:	cdc78793          	addi	a5,a5,-804 # 800207c0 <pxCurrentTimerList>
    80003aec:	639c                	ld	a5,0(a5)
    80003aee:	639c                	ld	a5,0(a5)
    80003af0:	f3a5                	bnez	a5,80003a50 <prvSwitchTimerLists+0x6>
    80003af2:	0001d797          	auipc	a5,0x1d
    80003af6:	cce78793          	addi	a5,a5,-818 # 800207c0 <pxCurrentTimerList>
    80003afa:	639c                	ld	a5,0(a5)
    80003afc:	f43e                	sd	a5,40(sp)
    80003afe:	0001d797          	auipc	a5,0x1d
    80003b02:	cca78793          	addi	a5,a5,-822 # 800207c8 <pxOverflowTimerList>
    80003b06:	6398                	ld	a4,0(a5)
    80003b08:	0001d797          	auipc	a5,0x1d
    80003b0c:	cb878793          	addi	a5,a5,-840 # 800207c0 <pxCurrentTimerList>
    80003b10:	e398                	sd	a4,0(a5)
    80003b12:	0001d797          	auipc	a5,0x1d
    80003b16:	cb678793          	addi	a5,a5,-842 # 800207c8 <pxOverflowTimerList>
    80003b1a:	7722                	ld	a4,40(sp)
    80003b1c:	e398                	sd	a4,0(a5)
    80003b1e:	0001                	nop
    80003b20:	70e2                	ld	ra,56(sp)
    80003b22:	6121                	addi	sp,sp,64
    80003b24:	8082                	ret

0000000080003b26 <prvCheckForValidListAndQueue>:
    80003b26:	1141                	addi	sp,sp,-16
    80003b28:	e406                	sd	ra,8(sp)
    80003b2a:	b08ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003b2e:	0001d797          	auipc	a5,0x1d
    80003b32:	ca278793          	addi	a5,a5,-862 # 800207d0 <xTimerQueue>
    80003b36:	639c                	ld	a5,0(a5)
    80003b38:	e7c9                	bnez	a5,80003bc2 <prvCheckForValidListAndQueue+0x9c>
    80003b3a:	0001d517          	auipc	a0,0x1d
    80003b3e:	c3650513          	addi	a0,a0,-970 # 80020770 <xActiveTimerList1>
    80003b42:	a75fc0ef          	jal	ra,800005b6 <vListInitialise>
    80003b46:	0001d517          	auipc	a0,0x1d
    80003b4a:	c5250513          	addi	a0,a0,-942 # 80020798 <xActiveTimerList2>
    80003b4e:	a69fc0ef          	jal	ra,800005b6 <vListInitialise>
    80003b52:	0001d797          	auipc	a5,0x1d
    80003b56:	c6e78793          	addi	a5,a5,-914 # 800207c0 <pxCurrentTimerList>
    80003b5a:	0001d717          	auipc	a4,0x1d
    80003b5e:	c1670713          	addi	a4,a4,-1002 # 80020770 <xActiveTimerList1>
    80003b62:	e398                	sd	a4,0(a5)
    80003b64:	0001d797          	auipc	a5,0x1d
    80003b68:	c6478793          	addi	a5,a5,-924 # 800207c8 <pxOverflowTimerList>
    80003b6c:	0001d717          	auipc	a4,0x1d
    80003b70:	c2c70713          	addi	a4,a4,-980 # 80020798 <xActiveTimerList2>
    80003b74:	e398                	sd	a4,0(a5)
    80003b76:	4601                	li	a2,0
    80003b78:	45e1                	li	a1,24
    80003b7a:	4509                	li	a0,2
    80003b7c:	c29fc0ef          	jal	ra,800007a4 <xQueueGenericCreate>
    80003b80:	872a                	mv	a4,a0
    80003b82:	0001d797          	auipc	a5,0x1d
    80003b86:	c4e78793          	addi	a5,a5,-946 # 800207d0 <xTimerQueue>
    80003b8a:	e398                	sd	a4,0(a5)
    80003b8c:	0001d797          	auipc	a5,0x1d
    80003b90:	c4478793          	addi	a5,a5,-956 # 800207d0 <xTimerQueue>
    80003b94:	639c                	ld	a5,0(a5)
    80003b96:	e781                	bnez	a5,80003b9e <prvCheckForValidListAndQueue+0x78>
    80003b98:	30047073          	csrci	mstatus,8
    80003b9c:	a001                	j	80003b9c <prvCheckForValidListAndQueue+0x76>
    80003b9e:	0001d797          	auipc	a5,0x1d
    80003ba2:	c3278793          	addi	a5,a5,-974 # 800207d0 <xTimerQueue>
    80003ba6:	639c                	ld	a5,0(a5)
    80003ba8:	cf89                	beqz	a5,80003bc2 <prvCheckForValidListAndQueue+0x9c>
    80003baa:	0001d797          	auipc	a5,0x1d
    80003bae:	c2678793          	addi	a5,a5,-986 # 800207d0 <xTimerQueue>
    80003bb2:	639c                	ld	a5,0(a5)
    80003bb4:	0001c597          	auipc	a1,0x1c
    80003bb8:	4ac58593          	addi	a1,a1,1196 # 80020060 <__rodata_start+0x60>
    80003bbc:	853e                	mv	a0,a5
    80003bbe:	ec4fd0ef          	jal	ra,80001282 <vQueueAddToRegistry>
    80003bc2:	a9eff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003bc6:	0001                	nop
    80003bc8:	60a2                	ld	ra,8(sp)
    80003bca:	0141                	addi	sp,sp,16
    80003bcc:	8082                	ret

0000000080003bce <xTimerIsTimerActive>:
    80003bce:	7179                	addi	sp,sp,-48
    80003bd0:	f406                	sd	ra,40(sp)
    80003bd2:	e42a                	sd	a0,8(sp)
    80003bd4:	67a2                	ld	a5,8(sp)
    80003bd6:	ec3e                	sd	a5,24(sp)
    80003bd8:	67a2                	ld	a5,8(sp)
    80003bda:	e781                	bnez	a5,80003be2 <xTimerIsTimerActive+0x14>
    80003bdc:	30047073          	csrci	mstatus,8
    80003be0:	a001                	j	80003be0 <xTimerIsTimerActive+0x12>
    80003be2:	a50ff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003be6:	67e2                	ld	a5,24(sp)
    80003be8:	779c                	ld	a5,40(a5)
    80003bea:	00f037b3          	snez	a5,a5
    80003bee:	0ff7f793          	zext.b	a5,a5
    80003bf2:	e83e                	sd	a5,16(sp)
    80003bf4:	a6cff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003bf8:	67c2                	ld	a5,16(sp)
    80003bfa:	853e                	mv	a0,a5
    80003bfc:	70a2                	ld	ra,40(sp)
    80003bfe:	6145                	addi	sp,sp,48
    80003c00:	8082                	ret

0000000080003c02 <pvTimerGetTimerID>:
    80003c02:	7179                	addi	sp,sp,-48
    80003c04:	f406                	sd	ra,40(sp)
    80003c06:	e42a                	sd	a0,8(sp)
    80003c08:	67a2                	ld	a5,8(sp)
    80003c0a:	ec3e                	sd	a5,24(sp)
    80003c0c:	67a2                	ld	a5,8(sp)
    80003c0e:	e781                	bnez	a5,80003c16 <pvTimerGetTimerID+0x14>
    80003c10:	30047073          	csrci	mstatus,8
    80003c14:	a001                	j	80003c14 <pvTimerGetTimerID+0x12>
    80003c16:	a1cff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003c1a:	67e2                	ld	a5,24(sp)
    80003c1c:	63bc                	ld	a5,64(a5)
    80003c1e:	e83e                	sd	a5,16(sp)
    80003c20:	a40ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003c24:	67c2                	ld	a5,16(sp)
    80003c26:	853e                	mv	a0,a5
    80003c28:	70a2                	ld	ra,40(sp)
    80003c2a:	6145                	addi	sp,sp,48
    80003c2c:	8082                	ret

0000000080003c2e <vTimerSetTimerID>:
    80003c2e:	7179                	addi	sp,sp,-48
    80003c30:	f406                	sd	ra,40(sp)
    80003c32:	e42a                	sd	a0,8(sp)
    80003c34:	e02e                	sd	a1,0(sp)
    80003c36:	67a2                	ld	a5,8(sp)
    80003c38:	ec3e                	sd	a5,24(sp)
    80003c3a:	67a2                	ld	a5,8(sp)
    80003c3c:	e781                	bnez	a5,80003c44 <vTimerSetTimerID+0x16>
    80003c3e:	30047073          	csrci	mstatus,8
    80003c42:	a001                	j	80003c42 <vTimerSetTimerID+0x14>
    80003c44:	9eeff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003c48:	67e2                	ld	a5,24(sp)
    80003c4a:	6702                	ld	a4,0(sp)
    80003c4c:	e3b8                	sd	a4,64(a5)
    80003c4e:	a12ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003c52:	0001                	nop
    80003c54:	70a2                	ld	ra,40(sp)
    80003c56:	6145                	addi	sp,sp,48
    80003c58:	8082                	ret

0000000080003c5a <xEventGroupCreate>:
    80003c5a:	1101                	addi	sp,sp,-32
    80003c5c:	ec06                	sd	ra,24(sp)
    80003c5e:	03800513          	li	a0,56
    80003c62:	562000ef          	jal	ra,800041c4 <pvPortMalloc>
    80003c66:	e42a                	sd	a0,8(sp)
    80003c68:	67a2                	ld	a5,8(sp)
    80003c6a:	cb89                	beqz	a5,80003c7c <xEventGroupCreate+0x22>
    80003c6c:	67a2                	ld	a5,8(sp)
    80003c6e:	0007a023          	sw	zero,0(a5)
    80003c72:	67a2                	ld	a5,8(sp)
    80003c74:	07a1                	addi	a5,a5,8
    80003c76:	853e                	mv	a0,a5
    80003c78:	93ffc0ef          	jal	ra,800005b6 <vListInitialise>
    80003c7c:	67a2                	ld	a5,8(sp)
    80003c7e:	853e                	mv	a0,a5
    80003c80:	60e2                	ld	ra,24(sp)
    80003c82:	6105                	addi	sp,sp,32
    80003c84:	8082                	ret

0000000080003c86 <xEventGroupSync>:
    80003c86:	711d                	addi	sp,sp,-96
    80003c88:	ec86                	sd	ra,88(sp)
    80003c8a:	ec2a                	sd	a0,24(sp)
    80003c8c:	87ae                	mv	a5,a1
    80003c8e:	8736                	mv	a4,a3
    80003c90:	ca3e                	sw	a5,20(sp)
    80003c92:	87b2                	mv	a5,a2
    80003c94:	c83e                	sw	a5,16(sp)
    80003c96:	87ba                	mv	a5,a4
    80003c98:	c63e                	sw	a5,12(sp)
    80003c9a:	67e2                	ld	a5,24(sp)
    80003c9c:	e0be                	sd	a5,64(sp)
    80003c9e:	fc02                	sd	zero,56(sp)
    80003ca0:	01016703          	lwu	a4,16(sp)
    80003ca4:	0ff00793          	li	a5,255
    80003ca8:	07e2                	slli	a5,a5,0x18
    80003caa:	8ff9                	and	a5,a5,a4
    80003cac:	c781                	beqz	a5,80003cb4 <xEventGroupSync+0x2e>
    80003cae:	30047073          	csrci	mstatus,8
    80003cb2:	a001                	j	80003cb2 <xEventGroupSync+0x2c>
    80003cb4:	47c2                	lw	a5,16(sp)
    80003cb6:	2781                	sext.w	a5,a5
    80003cb8:	e781                	bnez	a5,80003cc0 <xEventGroupSync+0x3a>
    80003cba:	30047073          	csrci	mstatus,8
    80003cbe:	a001                	j	80003cbe <xEventGroupSync+0x38>
    80003cc0:	f99fe0ef          	jal	ra,80002c58 <xTaskGetSchedulerState>
    80003cc4:	87aa                	mv	a5,a0
    80003cc6:	e781                	bnez	a5,80003cce <xEventGroupSync+0x48>
    80003cc8:	47b2                	lw	a5,12(sp)
    80003cca:	2781                	sext.w	a5,a5
    80003ccc:	e399                	bnez	a5,80003cd2 <xEventGroupSync+0x4c>
    80003cce:	4785                	li	a5,1
    80003cd0:	a011                	j	80003cd4 <xEventGroupSync+0x4e>
    80003cd2:	4781                	li	a5,0
    80003cd4:	e781                	bnez	a5,80003cdc <xEventGroupSync+0x56>
    80003cd6:	30047073          	csrci	mstatus,8
    80003cda:	a001                	j	80003cda <xEventGroupSync+0x54>
    80003cdc:	fe7fd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80003ce0:	6786                	ld	a5,64(sp)
    80003ce2:	439c                	lw	a5,0(a5)
    80003ce4:	da3e                	sw	a5,52(sp)
    80003ce6:	47d2                	lw	a5,20(sp)
    80003ce8:	85be                	mv	a1,a5
    80003cea:	6562                	ld	a0,24(sp)
    80003cec:	2d6000ef          	jal	ra,80003fc2 <xEventGroupSetBits>
    80003cf0:	57d2                	lw	a5,52(sp)
    80003cf2:	873e                	mv	a4,a5
    80003cf4:	47d2                	lw	a5,20(sp)
    80003cf6:	8fd9                	or	a5,a5,a4
    80003cf8:	2781                	sext.w	a5,a5
    80003cfa:	4742                	lw	a4,16(sp)
    80003cfc:	8ff9                	and	a5,a5,a4
    80003cfe:	0007871b          	sext.w	a4,a5
    80003d02:	47c2                	lw	a5,16(sp)
    80003d04:	2781                	sext.w	a5,a5
    80003d06:	02e79463          	bne	a5,a4,80003d2e <xEventGroupSync+0xa8>
    80003d0a:	57d2                	lw	a5,52(sp)
    80003d0c:	873e                	mv	a4,a5
    80003d0e:	47d2                	lw	a5,20(sp)
    80003d10:	8fd9                	or	a5,a5,a4
    80003d12:	c6be                	sw	a5,76(sp)
    80003d14:	6786                	ld	a5,64(sp)
    80003d16:	4398                	lw	a4,0(a5)
    80003d18:	47c2                	lw	a5,16(sp)
    80003d1a:	fff7c793          	not	a5,a5
    80003d1e:	2781                	sext.w	a5,a5
    80003d20:	8ff9                	and	a5,a5,a4
    80003d22:	0007871b          	sext.w	a4,a5
    80003d26:	6786                	ld	a5,64(sp)
    80003d28:	c398                	sw	a4,0(a5)
    80003d2a:	c602                	sw	zero,12(sp)
    80003d2c:	a805                	j	80003d5c <xEventGroupSync+0xd6>
    80003d2e:	47b2                	lw	a5,12(sp)
    80003d30:	2781                	sext.w	a5,a5
    80003d32:	c395                	beqz	a5,80003d56 <xEventGroupSync+0xd0>
    80003d34:	6786                	ld	a5,64(sp)
    80003d36:	00878713          	addi	a4,a5,8
    80003d3a:	47c2                	lw	a5,16(sp)
    80003d3c:	86be                	mv	a3,a5
    80003d3e:	050007b7          	lui	a5,0x5000
    80003d42:	8fd5                	or	a5,a5,a3
    80003d44:	2781                	sext.w	a5,a5
    80003d46:	46b2                	lw	a3,12(sp)
    80003d48:	8636                	mv	a2,a3
    80003d4a:	85be                	mv	a1,a5
    80003d4c:	853a                	mv	a0,a4
    80003d4e:	e02fe0ef          	jal	ra,80002350 <vTaskPlaceOnUnorderedEventList>
    80003d52:	c682                	sw	zero,76(sp)
    80003d54:	a021                	j	80003d5c <xEventGroupSync+0xd6>
    80003d56:	6786                	ld	a5,64(sp)
    80003d58:	439c                	lw	a5,0(a5)
    80003d5a:	c6be                	sw	a5,76(sp)
    80003d5c:	f83fd0ef          	jal	ra,80001cde <xTaskResumeAll>
    80003d60:	f42a                	sd	a0,40(sp)
    80003d62:	47b2                	lw	a5,12(sp)
    80003d64:	2781                	sext.w	a5,a5
    80003d66:	c7a5                	beqz	a5,80003dce <xEventGroupSync+0x148>
    80003d68:	77a2                	ld	a5,40(sp)
    80003d6a:	e399                	bnez	a5,80003d70 <xEventGroupSync+0xea>
    80003d6c:	ea0fc0ef          	jal	ra,8000040c <vPortYield>
    80003d70:	930ff0ef          	jal	ra,80002ea0 <uxTaskResetEventItemValue>
    80003d74:	87aa                	mv	a5,a0
    80003d76:	c6be                	sw	a5,76(sp)
    80003d78:	04c16703          	lwu	a4,76(sp)
    80003d7c:	020007b7          	lui	a5,0x2000
    80003d80:	8ff9                	and	a5,a5,a4
    80003d82:	ef9d                	bnez	a5,80003dc0 <xEventGroupSync+0x13a>
    80003d84:	8aeff0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003d88:	6786                	ld	a5,64(sp)
    80003d8a:	439c                	lw	a5,0(a5)
    80003d8c:	c6be                	sw	a5,76(sp)
    80003d8e:	47b6                	lw	a5,76(sp)
    80003d90:	873e                	mv	a4,a5
    80003d92:	47c2                	lw	a5,16(sp)
    80003d94:	8ff9                	and	a5,a5,a4
    80003d96:	0007871b          	sext.w	a4,a5
    80003d9a:	47c2                	lw	a5,16(sp)
    80003d9c:	2781                	sext.w	a5,a5
    80003d9e:	00e79d63          	bne	a5,a4,80003db8 <xEventGroupSync+0x132>
    80003da2:	6786                	ld	a5,64(sp)
    80003da4:	4398                	lw	a4,0(a5)
    80003da6:	47c2                	lw	a5,16(sp)
    80003da8:	fff7c793          	not	a5,a5
    80003dac:	2781                	sext.w	a5,a5
    80003dae:	8ff9                	and	a5,a5,a4
    80003db0:	0007871b          	sext.w	a4,a5
    80003db4:	6786                	ld	a5,64(sp)
    80003db6:	c398                	sw	a4,0(a5)
    80003db8:	8a8ff0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003dbc:	4785                	li	a5,1
    80003dbe:	fc3e                	sd	a5,56(sp)
    80003dc0:	47b6                	lw	a5,76(sp)
    80003dc2:	873e                	mv	a4,a5
    80003dc4:	010007b7          	lui	a5,0x1000
    80003dc8:	17fd                	addi	a5,a5,-1
    80003dca:	8ff9                	and	a5,a5,a4
    80003dcc:	c6be                	sw	a5,76(sp)
    80003dce:	47b6                	lw	a5,76(sp)
    80003dd0:	853e                	mv	a0,a5
    80003dd2:	60e6                	ld	ra,88(sp)
    80003dd4:	6125                	addi	sp,sp,96
    80003dd6:	8082                	ret

0000000080003dd8 <xEventGroupWaitBits>:
    80003dd8:	711d                	addi	sp,sp,-96
    80003dda:	ec86                	sd	ra,88(sp)
    80003ddc:	ec2a                	sd	a0,24(sp)
    80003dde:	87ae                	mv	a5,a1
    80003de0:	e432                	sd	a2,8(sp)
    80003de2:	e036                	sd	a3,0(sp)
    80003de4:	ca3e                	sw	a5,20(sp)
    80003de6:	87ba                	mv	a5,a4
    80003de8:	c83e                	sw	a5,16(sp)
    80003dea:	67e2                	ld	a5,24(sp)
    80003dec:	e0be                	sd	a5,64(sp)
    80003dee:	c482                	sw	zero,72(sp)
    80003df0:	fc02                	sd	zero,56(sp)
    80003df2:	67e2                	ld	a5,24(sp)
    80003df4:	e781                	bnez	a5,80003dfc <xEventGroupWaitBits+0x24>
    80003df6:	30047073          	csrci	mstatus,8
    80003dfa:	a001                	j	80003dfa <xEventGroupWaitBits+0x22>
    80003dfc:	01416703          	lwu	a4,20(sp)
    80003e00:	0ff00793          	li	a5,255
    80003e04:	07e2                	slli	a5,a5,0x18
    80003e06:	8ff9                	and	a5,a5,a4
    80003e08:	c781                	beqz	a5,80003e10 <xEventGroupWaitBits+0x38>
    80003e0a:	30047073          	csrci	mstatus,8
    80003e0e:	a001                	j	80003e0e <xEventGroupWaitBits+0x36>
    80003e10:	47d2                	lw	a5,20(sp)
    80003e12:	2781                	sext.w	a5,a5
    80003e14:	e781                	bnez	a5,80003e1c <xEventGroupWaitBits+0x44>
    80003e16:	30047073          	csrci	mstatus,8
    80003e1a:	a001                	j	80003e1a <xEventGroupWaitBits+0x42>
    80003e1c:	e3dfe0ef          	jal	ra,80002c58 <xTaskGetSchedulerState>
    80003e20:	87aa                	mv	a5,a0
    80003e22:	e781                	bnez	a5,80003e2a <xEventGroupWaitBits+0x52>
    80003e24:	47c2                	lw	a5,16(sp)
    80003e26:	2781                	sext.w	a5,a5
    80003e28:	e399                	bnez	a5,80003e2e <xEventGroupWaitBits+0x56>
    80003e2a:	4785                	li	a5,1
    80003e2c:	a011                	j	80003e30 <xEventGroupWaitBits+0x58>
    80003e2e:	4781                	li	a5,0
    80003e30:	e781                	bnez	a5,80003e38 <xEventGroupWaitBits+0x60>
    80003e32:	30047073          	csrci	mstatus,8
    80003e36:	a001                	j	80003e36 <xEventGroupWaitBits+0x5e>
    80003e38:	e8bfd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80003e3c:	6786                	ld	a5,64(sp)
    80003e3e:	439c                	lw	a5,0(a5)
    80003e40:	da3e                	sw	a5,52(sp)
    80003e42:	4752                	lw	a4,20(sp)
    80003e44:	57d2                	lw	a5,52(sp)
    80003e46:	6602                	ld	a2,0(sp)
    80003e48:	85ba                	mv	a1,a4
    80003e4a:	853e                	mv	a0,a5
    80003e4c:	314000ef          	jal	ra,80004160 <prvTestWaitCondition>
    80003e50:	f42a                	sd	a0,40(sp)
    80003e52:	77a2                	ld	a5,40(sp)
    80003e54:	c395                	beqz	a5,80003e78 <xEventGroupWaitBits+0xa0>
    80003e56:	57d2                	lw	a5,52(sp)
    80003e58:	c6be                	sw	a5,76(sp)
    80003e5a:	c802                	sw	zero,16(sp)
    80003e5c:	67a2                	ld	a5,8(sp)
    80003e5e:	c3ad                	beqz	a5,80003ec0 <xEventGroupWaitBits+0xe8>
    80003e60:	6786                	ld	a5,64(sp)
    80003e62:	4398                	lw	a4,0(a5)
    80003e64:	47d2                	lw	a5,20(sp)
    80003e66:	fff7c793          	not	a5,a5
    80003e6a:	2781                	sext.w	a5,a5
    80003e6c:	8ff9                	and	a5,a5,a4
    80003e6e:	0007871b          	sext.w	a4,a5
    80003e72:	6786                	ld	a5,64(sp)
    80003e74:	c398                	sw	a4,0(a5)
    80003e76:	a0a9                	j	80003ec0 <xEventGroupWaitBits+0xe8>
    80003e78:	47c2                	lw	a5,16(sp)
    80003e7a:	2781                	sext.w	a5,a5
    80003e7c:	e781                	bnez	a5,80003e84 <xEventGroupWaitBits+0xac>
    80003e7e:	57d2                	lw	a5,52(sp)
    80003e80:	c6be                	sw	a5,76(sp)
    80003e82:	a83d                	j	80003ec0 <xEventGroupWaitBits+0xe8>
    80003e84:	67a2                	ld	a5,8(sp)
    80003e86:	c799                	beqz	a5,80003e94 <xEventGroupWaitBits+0xbc>
    80003e88:	47a6                	lw	a5,72(sp)
    80003e8a:	873e                	mv	a4,a5
    80003e8c:	010007b7          	lui	a5,0x1000
    80003e90:	8fd9                	or	a5,a5,a4
    80003e92:	c4be                	sw	a5,72(sp)
    80003e94:	6782                	ld	a5,0(sp)
    80003e96:	c799                	beqz	a5,80003ea4 <xEventGroupWaitBits+0xcc>
    80003e98:	47a6                	lw	a5,72(sp)
    80003e9a:	873e                	mv	a4,a5
    80003e9c:	040007b7          	lui	a5,0x4000
    80003ea0:	8fd9                	or	a5,a5,a4
    80003ea2:	c4be                	sw	a5,72(sp)
    80003ea4:	6786                	ld	a5,64(sp)
    80003ea6:	07a1                	addi	a5,a5,8
    80003ea8:	4752                	lw	a4,20(sp)
    80003eaa:	86ba                	mv	a3,a4
    80003eac:	4726                	lw	a4,72(sp)
    80003eae:	8f55                	or	a4,a4,a3
    80003eb0:	2701                	sext.w	a4,a4
    80003eb2:	46c2                	lw	a3,16(sp)
    80003eb4:	8636                	mv	a2,a3
    80003eb6:	85ba                	mv	a1,a4
    80003eb8:	853e                	mv	a0,a5
    80003eba:	c96fe0ef          	jal	ra,80002350 <vTaskPlaceOnUnorderedEventList>
    80003ebe:	c682                	sw	zero,76(sp)
    80003ec0:	e1ffd0ef          	jal	ra,80001cde <xTaskResumeAll>
    80003ec4:	f02a                	sd	a0,32(sp)
    80003ec6:	47c2                	lw	a5,16(sp)
    80003ec8:	2781                	sext.w	a5,a5
    80003eca:	c7a5                	beqz	a5,80003f32 <xEventGroupWaitBits+0x15a>
    80003ecc:	7782                	ld	a5,32(sp)
    80003ece:	e399                	bnez	a5,80003ed4 <xEventGroupWaitBits+0xfc>
    80003ed0:	d3cfc0ef          	jal	ra,8000040c <vPortYield>
    80003ed4:	fcdfe0ef          	jal	ra,80002ea0 <uxTaskResetEventItemValue>
    80003ed8:	87aa                	mv	a5,a0
    80003eda:	c6be                	sw	a5,76(sp)
    80003edc:	04c16703          	lwu	a4,76(sp)
    80003ee0:	020007b7          	lui	a5,0x2000
    80003ee4:	8ff9                	and	a5,a5,a4
    80003ee6:	ef9d                	bnez	a5,80003f24 <xEventGroupWaitBits+0x14c>
    80003ee8:	f4bfe0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003eec:	6786                	ld	a5,64(sp)
    80003eee:	439c                	lw	a5,0(a5)
    80003ef0:	c6be                	sw	a5,76(sp)
    80003ef2:	4752                	lw	a4,20(sp)
    80003ef4:	47b6                	lw	a5,76(sp)
    80003ef6:	6602                	ld	a2,0(sp)
    80003ef8:	85ba                	mv	a1,a4
    80003efa:	853e                	mv	a0,a5
    80003efc:	264000ef          	jal	ra,80004160 <prvTestWaitCondition>
    80003f00:	87aa                	mv	a5,a0
    80003f02:	cf91                	beqz	a5,80003f1e <xEventGroupWaitBits+0x146>
    80003f04:	67a2                	ld	a5,8(sp)
    80003f06:	cf81                	beqz	a5,80003f1e <xEventGroupWaitBits+0x146>
    80003f08:	6786                	ld	a5,64(sp)
    80003f0a:	4398                	lw	a4,0(a5)
    80003f0c:	47d2                	lw	a5,20(sp)
    80003f0e:	fff7c793          	not	a5,a5
    80003f12:	2781                	sext.w	a5,a5
    80003f14:	8ff9                	and	a5,a5,a4
    80003f16:	0007871b          	sext.w	a4,a5
    80003f1a:	6786                	ld	a5,64(sp)
    80003f1c:	c398                	sw	a4,0(a5)
    80003f1e:	f43fe0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003f22:	fc02                	sd	zero,56(sp)
    80003f24:	47b6                	lw	a5,76(sp)
    80003f26:	873e                	mv	a4,a5
    80003f28:	010007b7          	lui	a5,0x1000
    80003f2c:	17fd                	addi	a5,a5,-1
    80003f2e:	8ff9                	and	a5,a5,a4
    80003f30:	c6be                	sw	a5,76(sp)
    80003f32:	47b6                	lw	a5,76(sp)
    80003f34:	853e                	mv	a0,a5
    80003f36:	60e6                	ld	ra,88(sp)
    80003f38:	6125                	addi	sp,sp,96
    80003f3a:	8082                	ret

0000000080003f3c <xEventGroupClearBits>:
    80003f3c:	7179                	addi	sp,sp,-48
    80003f3e:	f406                	sd	ra,40(sp)
    80003f40:	e42a                	sd	a0,8(sp)
    80003f42:	87ae                	mv	a5,a1
    80003f44:	c23e                	sw	a5,4(sp)
    80003f46:	67a2                	ld	a5,8(sp)
    80003f48:	ec3e                	sd	a5,24(sp)
    80003f4a:	67a2                	ld	a5,8(sp)
    80003f4c:	e781                	bnez	a5,80003f54 <xEventGroupClearBits+0x18>
    80003f4e:	30047073          	csrci	mstatus,8
    80003f52:	a001                	j	80003f52 <xEventGroupClearBits+0x16>
    80003f54:	00416703          	lwu	a4,4(sp)
    80003f58:	0ff00793          	li	a5,255
    80003f5c:	07e2                	slli	a5,a5,0x18
    80003f5e:	8ff9                	and	a5,a5,a4
    80003f60:	c781                	beqz	a5,80003f68 <xEventGroupClearBits+0x2c>
    80003f62:	30047073          	csrci	mstatus,8
    80003f66:	a001                	j	80003f66 <xEventGroupClearBits+0x2a>
    80003f68:	ecbfe0ef          	jal	ra,80002e32 <vTaskEnterCritical>
    80003f6c:	67e2                	ld	a5,24(sp)
    80003f6e:	439c                	lw	a5,0(a5)
    80003f70:	ca3e                	sw	a5,20(sp)
    80003f72:	67e2                	ld	a5,24(sp)
    80003f74:	4398                	lw	a4,0(a5)
    80003f76:	4792                	lw	a5,4(sp)
    80003f78:	fff7c793          	not	a5,a5
    80003f7c:	2781                	sext.w	a5,a5
    80003f7e:	8ff9                	and	a5,a5,a4
    80003f80:	0007871b          	sext.w	a4,a5
    80003f84:	67e2                	ld	a5,24(sp)
    80003f86:	c398                	sw	a4,0(a5)
    80003f88:	ed9fe0ef          	jal	ra,80002e60 <vTaskExitCritical>
    80003f8c:	47d2                	lw	a5,20(sp)
    80003f8e:	853e                	mv	a0,a5
    80003f90:	70a2                	ld	ra,40(sp)
    80003f92:	6145                	addi	sp,sp,48
    80003f94:	8082                	ret

0000000080003f96 <xEventGroupGetBitsFromISR>:
    80003f96:	7139                	addi	sp,sp,-64
    80003f98:	fc06                	sd	ra,56(sp)
    80003f9a:	e42a                	sd	a0,8(sp)
    80003f9c:	67a2                	ld	a5,8(sp)
    80003f9e:	f43e                	sd	a5,40(sp)
    80003fa0:	d9afc0ef          	jal	ra,8000053a <vPortSetInterruptMask>
    80003fa4:	87aa                	mv	a5,a0
    80003fa6:	f03e                	sd	a5,32(sp)
    80003fa8:	77a2                	ld	a5,40(sp)
    80003faa:	439c                	lw	a5,0(a5)
    80003fac:	ce3e                	sw	a5,28(sp)
    80003fae:	7782                	ld	a5,32(sp)
    80003fb0:	2781                	sext.w	a5,a5
    80003fb2:	853e                	mv	a0,a5
    80003fb4:	d74fc0ef          	jal	ra,80000528 <vPortClearInterruptMask>
    80003fb8:	47f2                	lw	a5,28(sp)
    80003fba:	853e                	mv	a0,a5
    80003fbc:	70e2                	ld	ra,56(sp)
    80003fbe:	6121                	addi	sp,sp,64
    80003fc0:	8082                	ret

0000000080003fc2 <xEventGroupSetBits>:
    80003fc2:	711d                	addi	sp,sp,-96
    80003fc4:	ec86                	sd	ra,88(sp)
    80003fc6:	e42a                	sd	a0,8(sp)
    80003fc8:	87ae                	mv	a5,a1
    80003fca:	c23e                	sw	a5,4(sp)
    80003fcc:	c282                	sw	zero,68(sp)
    80003fce:	67a2                	ld	a5,8(sp)
    80003fd0:	f83e                	sd	a5,48(sp)
    80003fd2:	fc02                	sd	zero,56(sp)
    80003fd4:	67a2                	ld	a5,8(sp)
    80003fd6:	e781                	bnez	a5,80003fde <xEventGroupSetBits+0x1c>
    80003fd8:	30047073          	csrci	mstatus,8
    80003fdc:	a001                	j	80003fdc <xEventGroupSetBits+0x1a>
    80003fde:	00416703          	lwu	a4,4(sp)
    80003fe2:	0ff00793          	li	a5,255
    80003fe6:	07e2                	slli	a5,a5,0x18
    80003fe8:	8ff9                	and	a5,a5,a4
    80003fea:	c781                	beqz	a5,80003ff2 <xEventGroupSetBits+0x30>
    80003fec:	30047073          	csrci	mstatus,8
    80003ff0:	a001                	j	80003ff0 <xEventGroupSetBits+0x2e>
    80003ff2:	77c2                	ld	a5,48(sp)
    80003ff4:	07a1                	addi	a5,a5,8
    80003ff6:	f43e                	sd	a5,40(sp)
    80003ff8:	77a2                	ld	a5,40(sp)
    80003ffa:	07c1                	addi	a5,a5,16
    80003ffc:	f03e                	sd	a5,32(sp)
    80003ffe:	cc5fd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    80004002:	77a2                	ld	a5,40(sp)
    80004004:	6f9c                	ld	a5,24(a5)
    80004006:	e4be                	sd	a5,72(sp)
    80004008:	77c2                	ld	a5,48(sp)
    8000400a:	439c                	lw	a5,0(a5)
    8000400c:	4712                	lw	a4,4(sp)
    8000400e:	8fd9                	or	a5,a5,a4
    80004010:	0007871b          	sext.w	a4,a5
    80004014:	77c2                	ld	a5,48(sp)
    80004016:	c398                	sw	a4,0(a5)
    80004018:	a851                	j	800040ac <xEventGroupSetBits+0xea>
    8000401a:	67a6                	ld	a5,72(sp)
    8000401c:	679c                	ld	a5,8(a5)
    8000401e:	ec3e                	sd	a5,24(sp)
    80004020:	67a6                	ld	a5,72(sp)
    80004022:	439c                	lw	a5,0(a5)
    80004024:	ca3e                	sw	a5,20(sp)
    80004026:	fc02                	sd	zero,56(sp)
    80004028:	47d2                	lw	a5,20(sp)
    8000402a:	873e                	mv	a4,a5
    8000402c:	ff0007b7          	lui	a5,0xff000
    80004030:	8ff9                	and	a5,a5,a4
    80004032:	c83e                	sw	a5,16(sp)
    80004034:	47d2                	lw	a5,20(sp)
    80004036:	873e                	mv	a4,a5
    80004038:	010007b7          	lui	a5,0x1000
    8000403c:	17fd                	addi	a5,a5,-1
    8000403e:	8ff9                	and	a5,a5,a4
    80004040:	ca3e                	sw	a5,20(sp)
    80004042:	01016703          	lwu	a4,16(sp)
    80004046:	040007b7          	lui	a5,0x4000
    8000404a:	8ff9                	and	a5,a5,a4
    8000404c:	eb91                	bnez	a5,80004060 <xEventGroupSetBits+0x9e>
    8000404e:	77c2                	ld	a5,48(sp)
    80004050:	439c                	lw	a5,0(a5)
    80004052:	4752                	lw	a4,20(sp)
    80004054:	8ff9                	and	a5,a5,a4
    80004056:	2781                	sext.w	a5,a5
    80004058:	c385                	beqz	a5,80004078 <xEventGroupSetBits+0xb6>
    8000405a:	4785                	li	a5,1
    8000405c:	fc3e                	sd	a5,56(sp)
    8000405e:	a829                	j	80004078 <xEventGroupSetBits+0xb6>
    80004060:	77c2                	ld	a5,48(sp)
    80004062:	439c                	lw	a5,0(a5)
    80004064:	4752                	lw	a4,20(sp)
    80004066:	8ff9                	and	a5,a5,a4
    80004068:	0007871b          	sext.w	a4,a5
    8000406c:	47d2                	lw	a5,20(sp)
    8000406e:	2781                	sext.w	a5,a5
    80004070:	00e79463          	bne	a5,a4,80004078 <xEventGroupSetBits+0xb6>
    80004074:	4785                	li	a5,1
    80004076:	fc3e                	sd	a5,56(sp)
    80004078:	77e2                	ld	a5,56(sp)
    8000407a:	c79d                	beqz	a5,800040a8 <xEventGroupSetBits+0xe6>
    8000407c:	01016703          	lwu	a4,16(sp)
    80004080:	010007b7          	lui	a5,0x1000
    80004084:	8ff9                	and	a5,a5,a4
    80004086:	c791                	beqz	a5,80004092 <xEventGroupSetBits+0xd0>
    80004088:	4796                	lw	a5,68(sp)
    8000408a:	873e                	mv	a4,a5
    8000408c:	47d2                	lw	a5,20(sp)
    8000408e:	8fd9                	or	a5,a5,a4
    80004090:	c2be                	sw	a5,68(sp)
    80004092:	77c2                	ld	a5,48(sp)
    80004094:	439c                	lw	a5,0(a5)
    80004096:	873e                	mv	a4,a5
    80004098:	020007b7          	lui	a5,0x2000
    8000409c:	8fd9                	or	a5,a5,a4
    8000409e:	2781                	sext.w	a5,a5
    800040a0:	85be                	mv	a1,a5
    800040a2:	6526                	ld	a0,72(sp)
    800040a4:	caafe0ef          	jal	ra,8000254e <xTaskRemoveFromUnorderedEventList>
    800040a8:	67e2                	ld	a5,24(sp)
    800040aa:	e4be                	sd	a5,72(sp)
    800040ac:	6726                	ld	a4,72(sp)
    800040ae:	7782                	ld	a5,32(sp)
    800040b0:	f6f715e3          	bne	a4,a5,8000401a <xEventGroupSetBits+0x58>
    800040b4:	77c2                	ld	a5,48(sp)
    800040b6:	4398                	lw	a4,0(a5)
    800040b8:	4796                	lw	a5,68(sp)
    800040ba:	fff7c793          	not	a5,a5
    800040be:	2781                	sext.w	a5,a5
    800040c0:	8ff9                	and	a5,a5,a4
    800040c2:	0007871b          	sext.w	a4,a5
    800040c6:	77c2                	ld	a5,48(sp)
    800040c8:	c398                	sw	a4,0(a5)
    800040ca:	c15fd0ef          	jal	ra,80001cde <xTaskResumeAll>
    800040ce:	77c2                	ld	a5,48(sp)
    800040d0:	439c                	lw	a5,0(a5)
    800040d2:	853e                	mv	a0,a5
    800040d4:	60e6                	ld	ra,88(sp)
    800040d6:	6125                	addi	sp,sp,96
    800040d8:	8082                	ret

00000000800040da <vEventGroupDelete>:
    800040da:	7179                	addi	sp,sp,-48
    800040dc:	f406                	sd	ra,40(sp)
    800040de:	e42a                	sd	a0,8(sp)
    800040e0:	67a2                	ld	a5,8(sp)
    800040e2:	ec3e                	sd	a5,24(sp)
    800040e4:	67e2                	ld	a5,24(sp)
    800040e6:	07a1                	addi	a5,a5,8
    800040e8:	e83e                	sd	a5,16(sp)
    800040ea:	bd9fd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    800040ee:	a00d                	j	80004110 <vEventGroupDelete+0x36>
    800040f0:	67c2                	ld	a5,16(sp)
    800040f2:	6f98                	ld	a4,24(a5)
    800040f4:	67c2                	ld	a5,16(sp)
    800040f6:	07c1                	addi	a5,a5,16
    800040f8:	00f71563          	bne	a4,a5,80004102 <vEventGroupDelete+0x28>
    800040fc:	30047073          	csrci	mstatus,8
    80004100:	a001                	j	80004100 <vEventGroupDelete+0x26>
    80004102:	67c2                	ld	a5,16(sp)
    80004104:	6f9c                	ld	a5,24(a5)
    80004106:	020005b7          	lui	a1,0x2000
    8000410a:	853e                	mv	a0,a5
    8000410c:	c42fe0ef          	jal	ra,8000254e <xTaskRemoveFromUnorderedEventList>
    80004110:	67c2                	ld	a5,16(sp)
    80004112:	639c                	ld	a5,0(a5)
    80004114:	fff1                	bnez	a5,800040f0 <vEventGroupDelete+0x16>
    80004116:	6562                	ld	a0,24(sp)
    80004118:	1e4000ef          	jal	ra,800042fc <vPortFree>
    8000411c:	bc3fd0ef          	jal	ra,80001cde <xTaskResumeAll>
    80004120:	0001                	nop
    80004122:	70a2                	ld	ra,40(sp)
    80004124:	6145                	addi	sp,sp,48
    80004126:	8082                	ret

0000000080004128 <vEventGroupSetBitsCallback>:
    80004128:	1101                	addi	sp,sp,-32
    8000412a:	ec06                	sd	ra,24(sp)
    8000412c:	e42a                	sd	a0,8(sp)
    8000412e:	87ae                	mv	a5,a1
    80004130:	c23e                	sw	a5,4(sp)
    80004132:	4792                	lw	a5,4(sp)
    80004134:	85be                	mv	a1,a5
    80004136:	6522                	ld	a0,8(sp)
    80004138:	e8bff0ef          	jal	ra,80003fc2 <xEventGroupSetBits>
    8000413c:	0001                	nop
    8000413e:	60e2                	ld	ra,24(sp)
    80004140:	6105                	addi	sp,sp,32
    80004142:	8082                	ret

0000000080004144 <vEventGroupClearBitsCallback>:
    80004144:	1101                	addi	sp,sp,-32
    80004146:	ec06                	sd	ra,24(sp)
    80004148:	e42a                	sd	a0,8(sp)
    8000414a:	87ae                	mv	a5,a1
    8000414c:	c23e                	sw	a5,4(sp)
    8000414e:	4792                	lw	a5,4(sp)
    80004150:	85be                	mv	a1,a5
    80004152:	6522                	ld	a0,8(sp)
    80004154:	de9ff0ef          	jal	ra,80003f3c <xEventGroupClearBits>
    80004158:	0001                	nop
    8000415a:	60e2                	ld	ra,24(sp)
    8000415c:	6105                	addi	sp,sp,32
    8000415e:	8082                	ret

0000000080004160 <prvTestWaitCondition>:
    80004160:	1101                	addi	sp,sp,-32
    80004162:	87aa                	mv	a5,a0
    80004164:	872e                	mv	a4,a1
    80004166:	e032                	sd	a2,0(sp)
    80004168:	c63e                	sw	a5,12(sp)
    8000416a:	87ba                	mv	a5,a4
    8000416c:	c43e                	sw	a5,8(sp)
    8000416e:	ec02                	sd	zero,24(sp)
    80004170:	6782                	ld	a5,0(sp)
    80004172:	eb91                	bnez	a5,80004186 <prvTestWaitCondition+0x26>
    80004174:	47b2                	lw	a5,12(sp)
    80004176:	873e                	mv	a4,a5
    80004178:	47a2                	lw	a5,8(sp)
    8000417a:	8ff9                	and	a5,a5,a4
    8000417c:	2781                	sext.w	a5,a5
    8000417e:	c385                	beqz	a5,8000419e <prvTestWaitCondition+0x3e>
    80004180:	4785                	li	a5,1
    80004182:	ec3e                	sd	a5,24(sp)
    80004184:	a829                	j	8000419e <prvTestWaitCondition+0x3e>
    80004186:	47b2                	lw	a5,12(sp)
    80004188:	873e                	mv	a4,a5
    8000418a:	47a2                	lw	a5,8(sp)
    8000418c:	8ff9                	and	a5,a5,a4
    8000418e:	0007871b          	sext.w	a4,a5
    80004192:	47a2                	lw	a5,8(sp)
    80004194:	2781                	sext.w	a5,a5
    80004196:	00e79463          	bne	a5,a4,8000419e <prvTestWaitCondition+0x3e>
    8000419a:	4785                	li	a5,1
    8000419c:	ec3e                	sd	a5,24(sp)
    8000419e:	67e2                	ld	a5,24(sp)
    800041a0:	853e                	mv	a0,a5
    800041a2:	6105                	addi	sp,sp,32
    800041a4:	8082                	ret

00000000800041a6 <uxEventGroupGetNumber>:
    800041a6:	1101                	addi	sp,sp,-32
    800041a8:	e42a                	sd	a0,8(sp)
    800041aa:	67a2                	ld	a5,8(sp)
    800041ac:	e83e                	sd	a5,16(sp)
    800041ae:	67a2                	ld	a5,8(sp)
    800041b0:	e399                	bnez	a5,800041b6 <uxEventGroupGetNumber+0x10>
    800041b2:	ec02                	sd	zero,24(sp)
    800041b4:	a021                	j	800041bc <uxEventGroupGetNumber+0x16>
    800041b6:	67c2                	ld	a5,16(sp)
    800041b8:	7b9c                	ld	a5,48(a5)
    800041ba:	ec3e                	sd	a5,24(sp)
    800041bc:	67e2                	ld	a5,24(sp)
    800041be:	853e                	mv	a0,a5
    800041c0:	6105                	addi	sp,sp,32
    800041c2:	8082                	ret

00000000800041c4 <pvPortMalloc>:
    800041c4:	715d                	addi	sp,sp,-80
    800041c6:	e486                	sd	ra,72(sp)
    800041c8:	e42a                	sd	a0,8(sp)
    800041ca:	f402                	sd	zero,40(sp)
    800041cc:	af7fd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    800041d0:	00035797          	auipc	a5,0x35
    800041d4:	63078793          	addi	a5,a5,1584 # 80039800 <xHeapHasBeenInitialised.0>
    800041d8:	639c                	ld	a5,0(a5)
    800041da:	eb89                	bnez	a5,800041ec <pvPortMalloc+0x28>
    800041dc:	1ac000ef          	jal	ra,80004388 <prvHeapInit>
    800041e0:	00035797          	auipc	a5,0x35
    800041e4:	62078793          	addi	a5,a5,1568 # 80039800 <xHeapHasBeenInitialised.0>
    800041e8:	4705                	li	a4,1
    800041ea:	e398                	sd	a4,0(a5)
    800041ec:	67a2                	ld	a5,8(sp)
    800041ee:	cf89                	beqz	a5,80004208 <pvPortMalloc+0x44>
    800041f0:	47c1                	li	a5,16
    800041f2:	873e                	mv	a4,a5
    800041f4:	67a2                	ld	a5,8(sp)
    800041f6:	97ba                	add	a5,a5,a4
    800041f8:	e43e                	sd	a5,8(sp)
    800041fa:	67a2                	ld	a5,8(sp)
    800041fc:	8b9d                	andi	a5,a5,7
    800041fe:	c789                	beqz	a5,80004208 <pvPortMalloc+0x44>
    80004200:	67a2                	ld	a5,8(sp)
    80004202:	9be1                	andi	a5,a5,-8
    80004204:	07a1                	addi	a5,a5,8
    80004206:	e43e                	sd	a5,8(sp)
    80004208:	67a2                	ld	a5,8(sp)
    8000420a:	cff1                	beqz	a5,800042e6 <pvPortMalloc+0x122>
    8000420c:	6722                	ld	a4,8(sp)
    8000420e:	67e5                	lui	a5,0x19
    80004210:	17dd                	addi	a5,a5,-9
    80004212:	0ce7ea63          	bltu	a5,a4,800042e6 <pvPortMalloc+0x122>
    80004216:	00035797          	auipc	a5,0x35
    8000421a:	5ca78793          	addi	a5,a5,1482 # 800397e0 <xStart>
    8000421e:	f83e                	sd	a5,48(sp)
    80004220:	00035797          	auipc	a5,0x35
    80004224:	5c078793          	addi	a5,a5,1472 # 800397e0 <xStart>
    80004228:	639c                	ld	a5,0(a5)
    8000422a:	fc3e                	sd	a5,56(sp)
    8000422c:	a031                	j	80004238 <pvPortMalloc+0x74>
    8000422e:	77e2                	ld	a5,56(sp)
    80004230:	f83e                	sd	a5,48(sp)
    80004232:	77e2                	ld	a5,56(sp)
    80004234:	639c                	ld	a5,0(a5)
    80004236:	fc3e                	sd	a5,56(sp)
    80004238:	77e2                	ld	a5,56(sp)
    8000423a:	679c                	ld	a5,8(a5)
    8000423c:	6722                	ld	a4,8(sp)
    8000423e:	00e7f563          	bgeu	a5,a4,80004248 <pvPortMalloc+0x84>
    80004242:	77e2                	ld	a5,56(sp)
    80004244:	639c                	ld	a5,0(a5)
    80004246:	f7e5                	bnez	a5,8000422e <pvPortMalloc+0x6a>
    80004248:	7762                	ld	a4,56(sp)
    8000424a:	00035797          	auipc	a5,0x35
    8000424e:	5a678793          	addi	a5,a5,1446 # 800397f0 <xEnd>
    80004252:	08f70a63          	beq	a4,a5,800042e6 <pvPortMalloc+0x122>
    80004256:	77c2                	ld	a5,48(sp)
    80004258:	639c                	ld	a5,0(a5)
    8000425a:	4741                	li	a4,16
    8000425c:	97ba                	add	a5,a5,a4
    8000425e:	f43e                	sd	a5,40(sp)
    80004260:	77e2                	ld	a5,56(sp)
    80004262:	6398                	ld	a4,0(a5)
    80004264:	77c2                	ld	a5,48(sp)
    80004266:	e398                	sd	a4,0(a5)
    80004268:	77e2                	ld	a5,56(sp)
    8000426a:	6798                	ld	a4,8(a5)
    8000426c:	67a2                	ld	a5,8(sp)
    8000426e:	40f707b3          	sub	a5,a4,a5
    80004272:	4741                	li	a4,16
    80004274:	2701                	sext.w	a4,a4
    80004276:	0017171b          	slliw	a4,a4,0x1
    8000427a:	2701                	sext.w	a4,a4
    8000427c:	04f77863          	bgeu	a4,a5,800042cc <pvPortMalloc+0x108>
    80004280:	7762                	ld	a4,56(sp)
    80004282:	67a2                	ld	a5,8(sp)
    80004284:	97ba                	add	a5,a5,a4
    80004286:	ec3e                	sd	a5,24(sp)
    80004288:	77e2                	ld	a5,56(sp)
    8000428a:	6798                	ld	a4,8(a5)
    8000428c:	67a2                	ld	a5,8(sp)
    8000428e:	8f1d                	sub	a4,a4,a5
    80004290:	67e2                	ld	a5,24(sp)
    80004292:	e798                	sd	a4,8(a5)
    80004294:	77e2                	ld	a5,56(sp)
    80004296:	6722                	ld	a4,8(sp)
    80004298:	e798                	sd	a4,8(a5)
    8000429a:	67e2                	ld	a5,24(sp)
    8000429c:	679c                	ld	a5,8(a5)
    8000429e:	e83e                	sd	a5,16(sp)
    800042a0:	00035797          	auipc	a5,0x35
    800042a4:	54078793          	addi	a5,a5,1344 # 800397e0 <xStart>
    800042a8:	f03e                	sd	a5,32(sp)
    800042aa:	a021                	j	800042b2 <pvPortMalloc+0xee>
    800042ac:	7782                	ld	a5,32(sp)
    800042ae:	639c                	ld	a5,0(a5)
    800042b0:	f03e                	sd	a5,32(sp)
    800042b2:	7782                	ld	a5,32(sp)
    800042b4:	639c                	ld	a5,0(a5)
    800042b6:	679c                	ld	a5,8(a5)
    800042b8:	6742                	ld	a4,16(sp)
    800042ba:	fee7e9e3          	bltu	a5,a4,800042ac <pvPortMalloc+0xe8>
    800042be:	7782                	ld	a5,32(sp)
    800042c0:	6398                	ld	a4,0(a5)
    800042c2:	67e2                	ld	a5,24(sp)
    800042c4:	e398                	sd	a4,0(a5)
    800042c6:	7782                	ld	a5,32(sp)
    800042c8:	6762                	ld	a4,24(sp)
    800042ca:	e398                	sd	a4,0(a5)
    800042cc:	0001c797          	auipc	a5,0x1c
    800042d0:	11c78793          	addi	a5,a5,284 # 800203e8 <xFreeBytesRemaining>
    800042d4:	6398                	ld	a4,0(a5)
    800042d6:	77e2                	ld	a5,56(sp)
    800042d8:	679c                	ld	a5,8(a5)
    800042da:	8f1d                	sub	a4,a4,a5
    800042dc:	0001c797          	auipc	a5,0x1c
    800042e0:	10c78793          	addi	a5,a5,268 # 800203e8 <xFreeBytesRemaining>
    800042e4:	e398                	sd	a4,0(a5)
    800042e6:	9f9fd0ef          	jal	ra,80001cde <xTaskResumeAll>
    800042ea:	77a2                	ld	a5,40(sp)
    800042ec:	e399                	bnez	a5,800042f2 <pvPortMalloc+0x12e>
    800042ee:	3bf000ef          	jal	ra,80004eac <vApplicationMallocFailedHook>
    800042f2:	77a2                	ld	a5,40(sp)
    800042f4:	853e                	mv	a0,a5
    800042f6:	60a6                	ld	ra,72(sp)
    800042f8:	6161                	addi	sp,sp,80
    800042fa:	8082                	ret

00000000800042fc <vPortFree>:
    800042fc:	7139                	addi	sp,sp,-64
    800042fe:	fc06                	sd	ra,56(sp)
    80004300:	e42a                	sd	a0,8(sp)
    80004302:	67a2                	ld	a5,8(sp)
    80004304:	f03e                	sd	a5,32(sp)
    80004306:	67a2                	ld	a5,8(sp)
    80004308:	c3bd                	beqz	a5,8000436e <vPortFree+0x72>
    8000430a:	47c1                	li	a5,16
    8000430c:	40f007b3          	neg	a5,a5
    80004310:	7702                	ld	a4,32(sp)
    80004312:	97ba                	add	a5,a5,a4
    80004314:	f03e                	sd	a5,32(sp)
    80004316:	7782                	ld	a5,32(sp)
    80004318:	ec3e                	sd	a5,24(sp)
    8000431a:	9a9fd0ef          	jal	ra,80001cc2 <vTaskSuspendAll>
    8000431e:	67e2                	ld	a5,24(sp)
    80004320:	679c                	ld	a5,8(a5)
    80004322:	e83e                	sd	a5,16(sp)
    80004324:	00035797          	auipc	a5,0x35
    80004328:	4bc78793          	addi	a5,a5,1212 # 800397e0 <xStart>
    8000432c:	f43e                	sd	a5,40(sp)
    8000432e:	a021                	j	80004336 <vPortFree+0x3a>
    80004330:	77a2                	ld	a5,40(sp)
    80004332:	639c                	ld	a5,0(a5)
    80004334:	f43e                	sd	a5,40(sp)
    80004336:	77a2                	ld	a5,40(sp)
    80004338:	639c                	ld	a5,0(a5)
    8000433a:	679c                	ld	a5,8(a5)
    8000433c:	6742                	ld	a4,16(sp)
    8000433e:	fee7e9e3          	bltu	a5,a4,80004330 <vPortFree+0x34>
    80004342:	77a2                	ld	a5,40(sp)
    80004344:	6398                	ld	a4,0(a5)
    80004346:	67e2                	ld	a5,24(sp)
    80004348:	e398                	sd	a4,0(a5)
    8000434a:	77a2                	ld	a5,40(sp)
    8000434c:	6762                	ld	a4,24(sp)
    8000434e:	e398                	sd	a4,0(a5)
    80004350:	67e2                	ld	a5,24(sp)
    80004352:	6798                	ld	a4,8(a5)
    80004354:	0001c797          	auipc	a5,0x1c
    80004358:	09478793          	addi	a5,a5,148 # 800203e8 <xFreeBytesRemaining>
    8000435c:	639c                	ld	a5,0(a5)
    8000435e:	973e                	add	a4,a4,a5
    80004360:	0001c797          	auipc	a5,0x1c
    80004364:	08878793          	addi	a5,a5,136 # 800203e8 <xFreeBytesRemaining>
    80004368:	e398                	sd	a4,0(a5)
    8000436a:	975fd0ef          	jal	ra,80001cde <xTaskResumeAll>
    8000436e:	0001                	nop
    80004370:	70e2                	ld	ra,56(sp)
    80004372:	6121                	addi	sp,sp,64
    80004374:	8082                	ret

0000000080004376 <xPortGetFreeHeapSize>:
    80004376:	0001c797          	auipc	a5,0x1c
    8000437a:	07278793          	addi	a5,a5,114 # 800203e8 <xFreeBytesRemaining>
    8000437e:	639c                	ld	a5,0(a5)
    80004380:	853e                	mv	a0,a5
    80004382:	8082                	ret

0000000080004384 <vPortInitialiseBlocks>:
    80004384:	0001                	nop
    80004386:	8082                	ret

0000000080004388 <prvHeapInit>:
    80004388:	1141                	addi	sp,sp,-16
    8000438a:	0001c797          	auipc	a5,0x1c
    8000438e:	45e78793          	addi	a5,a5,1118 # 800207e8 <ucHeap+0x8>
    80004392:	9be1                	andi	a5,a5,-8
    80004394:	e43e                	sd	a5,8(sp)
    80004396:	00035797          	auipc	a5,0x35
    8000439a:	44a78793          	addi	a5,a5,1098 # 800397e0 <xStart>
    8000439e:	6722                	ld	a4,8(sp)
    800043a0:	e398                	sd	a4,0(a5)
    800043a2:	00035797          	auipc	a5,0x35
    800043a6:	43e78793          	addi	a5,a5,1086 # 800397e0 <xStart>
    800043aa:	0007b423          	sd	zero,8(a5)
    800043ae:	00035797          	auipc	a5,0x35
    800043b2:	44278793          	addi	a5,a5,1090 # 800397f0 <xEnd>
    800043b6:	6765                	lui	a4,0x19
    800043b8:	1761                	addi	a4,a4,-8
    800043ba:	e798                	sd	a4,8(a5)
    800043bc:	00035797          	auipc	a5,0x35
    800043c0:	43478793          	addi	a5,a5,1076 # 800397f0 <xEnd>
    800043c4:	0007b023          	sd	zero,0(a5)
    800043c8:	67a2                	ld	a5,8(sp)
    800043ca:	e03e                	sd	a5,0(sp)
    800043cc:	6782                	ld	a5,0(sp)
    800043ce:	6765                	lui	a4,0x19
    800043d0:	1761                	addi	a4,a4,-8
    800043d2:	e798                	sd	a4,8(a5)
    800043d4:	6782                	ld	a5,0(sp)
    800043d6:	00035717          	auipc	a4,0x35
    800043da:	41a70713          	addi	a4,a4,1050 # 800397f0 <xEnd>
    800043de:	e398                	sd	a4,0(a5)
    800043e0:	0001                	nop
    800043e2:	0141                	addi	sp,sp,16
    800043e4:	8082                	ret

00000000800043e6 <memcpy>:
    800043e6:	7179                	addi	sp,sp,-48
    800043e8:	ec2a                	sd	a0,24(sp)
    800043ea:	e82e                	sd	a1,16(sp)
    800043ec:	e432                	sd	a2,8(sp)
    800043ee:	67c2                	ld	a5,16(sp)
    800043f0:	f43e                	sd	a5,40(sp)
    800043f2:	67e2                	ld	a5,24(sp)
    800043f4:	f03e                	sd	a5,32(sp)
    800043f6:	6762                	ld	a4,24(sp)
    800043f8:	67c2                	ld	a5,16(sp)
    800043fa:	8fd9                	or	a5,a5,a4
    800043fc:	8b9d                	andi	a5,a5,7
    800043fe:	e3a1                	bnez	a5,8000443e <memcpy+0x58>
    80004400:	a819                	j	80004416 <memcpy+0x30>
    80004402:	77a2                	ld	a5,40(sp)
    80004404:	6398                	ld	a4,0(a5)
    80004406:	7782                	ld	a5,32(sp)
    80004408:	e398                	sd	a4,0(a5)
    8000440a:	7782                	ld	a5,32(sp)
    8000440c:	07a1                	addi	a5,a5,8
    8000440e:	f03e                	sd	a5,32(sp)
    80004410:	77a2                	ld	a5,40(sp)
    80004412:	07a1                	addi	a5,a5,8
    80004414:	f43e                	sd	a5,40(sp)
    80004416:	67a2                	ld	a5,8(sp)
    80004418:	17e5                	addi	a5,a5,-7
    8000441a:	6762                	ld	a4,24(sp)
    8000441c:	97ba                	add	a5,a5,a4
    8000441e:	7702                	ld	a4,32(sp)
    80004420:	fef761e3          	bltu	a4,a5,80004402 <memcpy+0x1c>
    80004424:	a829                	j	8000443e <memcpy+0x58>
    80004426:	7722                	ld	a4,40(sp)
    80004428:	00170793          	addi	a5,a4,1
    8000442c:	f43e                	sd	a5,40(sp)
    8000442e:	7782                	ld	a5,32(sp)
    80004430:	00178693          	addi	a3,a5,1
    80004434:	f036                	sd	a3,32(sp)
    80004436:	00074703          	lbu	a4,0(a4)
    8000443a:	00e78023          	sb	a4,0(a5)
    8000443e:	6762                	ld	a4,24(sp)
    80004440:	67a2                	ld	a5,8(sp)
    80004442:	97ba                	add	a5,a5,a4
    80004444:	7702                	ld	a4,32(sp)
    80004446:	fef760e3          	bltu	a4,a5,80004426 <memcpy+0x40>
    8000444a:	67e2                	ld	a5,24(sp)
    8000444c:	853e                	mv	a0,a5
    8000444e:	6145                	addi	sp,sp,48
    80004450:	8082                	ret

0000000080004452 <memset>:
    80004452:	7139                	addi	sp,sp,-64
    80004454:	ec2a                	sd	a0,24(sp)
    80004456:	87ae                	mv	a5,a1
    80004458:	e432                	sd	a2,8(sp)
    8000445a:	ca3e                	sw	a5,20(sp)
    8000445c:	6762                	ld	a4,24(sp)
    8000445e:	67a2                	ld	a5,8(sp)
    80004460:	8fd9                	or	a5,a5,a4
    80004462:	8b9d                	andi	a5,a5,7
    80004464:	e7a1                	bnez	a5,800044ac <memset+0x5a>
    80004466:	47d2                	lw	a5,20(sp)
    80004468:	0ff7f793          	zext.b	a5,a5
    8000446c:	f43e                	sd	a5,40(sp)
    8000446e:	77a2                	ld	a5,40(sp)
    80004470:	07a2                	slli	a5,a5,0x8
    80004472:	7722                	ld	a4,40(sp)
    80004474:	8fd9                	or	a5,a5,a4
    80004476:	f43e                	sd	a5,40(sp)
    80004478:	77a2                	ld	a5,40(sp)
    8000447a:	07c2                	slli	a5,a5,0x10
    8000447c:	7722                	ld	a4,40(sp)
    8000447e:	8fd9                	or	a5,a5,a4
    80004480:	f43e                	sd	a5,40(sp)
    80004482:	77a2                	ld	a5,40(sp)
    80004484:	1782                	slli	a5,a5,0x20
    80004486:	7722                	ld	a4,40(sp)
    80004488:	8fd9                	or	a5,a5,a4
    8000448a:	f43e                	sd	a5,40(sp)
    8000448c:	67e2                	ld	a5,24(sp)
    8000448e:	fc3e                	sd	a5,56(sp)
    80004490:	a039                	j	8000449e <memset+0x4c>
    80004492:	77e2                	ld	a5,56(sp)
    80004494:	00878713          	addi	a4,a5,8
    80004498:	fc3a                	sd	a4,56(sp)
    8000449a:	7722                	ld	a4,40(sp)
    8000449c:	e398                	sd	a4,0(a5)
    8000449e:	6762                	ld	a4,24(sp)
    800044a0:	67a2                	ld	a5,8(sp)
    800044a2:	97ba                	add	a5,a5,a4
    800044a4:	7762                	ld	a4,56(sp)
    800044a6:	fef766e3          	bltu	a4,a5,80004492 <memset+0x40>
    800044aa:	a01d                	j	800044d0 <memset+0x7e>
    800044ac:	67e2                	ld	a5,24(sp)
    800044ae:	f83e                	sd	a5,48(sp)
    800044b0:	a811                	j	800044c4 <memset+0x72>
    800044b2:	77c2                	ld	a5,48(sp)
    800044b4:	00178713          	addi	a4,a5,1
    800044b8:	f83a                	sd	a4,48(sp)
    800044ba:	4752                	lw	a4,20(sp)
    800044bc:	0ff77713          	zext.b	a4,a4
    800044c0:	00e78023          	sb	a4,0(a5)
    800044c4:	6762                	ld	a4,24(sp)
    800044c6:	67a2                	ld	a5,8(sp)
    800044c8:	97ba                	add	a5,a5,a4
    800044ca:	7742                	ld	a4,48(sp)
    800044cc:	fef763e3          	bltu	a4,a5,800044b2 <memset+0x60>
    800044d0:	67e2                	ld	a5,24(sp)
    800044d2:	853e                	mv	a0,a5
    800044d4:	6121                	addi	sp,sp,64
    800044d6:	8082                	ret

00000000800044d8 <strlen>:
    800044d8:	1101                	addi	sp,sp,-32
    800044da:	e42a                	sd	a0,8(sp)
    800044dc:	67a2                	ld	a5,8(sp)
    800044de:	ec3e                	sd	a5,24(sp)
    800044e0:	a021                	j	800044e8 <strlen+0x10>
    800044e2:	67e2                	ld	a5,24(sp)
    800044e4:	0785                	addi	a5,a5,1
    800044e6:	ec3e                	sd	a5,24(sp)
    800044e8:	67e2                	ld	a5,24(sp)
    800044ea:	0007c783          	lbu	a5,0(a5)
    800044ee:	fbf5                	bnez	a5,800044e2 <strlen+0xa>
    800044f0:	6762                	ld	a4,24(sp)
    800044f2:	67a2                	ld	a5,8(sp)
    800044f4:	40f707b3          	sub	a5,a4,a5
    800044f8:	853e                	mv	a0,a5
    800044fa:	6105                	addi	sp,sp,32
    800044fc:	8082                	ret

00000000800044fe <strcmp>:
    800044fe:	1101                	addi	sp,sp,-32
    80004500:	e42a                	sd	a0,8(sp)
    80004502:	e02e                	sd	a1,0(sp)
    80004504:	67a2                	ld	a5,8(sp)
    80004506:	00178713          	addi	a4,a5,1
    8000450a:	e43a                	sd	a4,8(sp)
    8000450c:	0007c783          	lbu	a5,0(a5)
    80004510:	00f10fa3          	sb	a5,31(sp)
    80004514:	6782                	ld	a5,0(sp)
    80004516:	00178713          	addi	a4,a5,1
    8000451a:	e03a                	sd	a4,0(sp)
    8000451c:	0007c783          	lbu	a5,0(a5)
    80004520:	00f10f23          	sb	a5,30(sp)
    80004524:	01f14783          	lbu	a5,31(sp)
    80004528:	0ff7f793          	zext.b	a5,a5
    8000452c:	cf81                	beqz	a5,80004544 <strcmp+0x46>
    8000452e:	01f14783          	lbu	a5,31(sp)
    80004532:	873e                	mv	a4,a5
    80004534:	01e14783          	lbu	a5,30(sp)
    80004538:	0ff77713          	zext.b	a4,a4
    8000453c:	0ff7f793          	zext.b	a5,a5
    80004540:	fcf702e3          	beq	a4,a5,80004504 <strcmp+0x6>
    80004544:	01f14783          	lbu	a5,31(sp)
    80004548:	0007871b          	sext.w	a4,a5
    8000454c:	01e14783          	lbu	a5,30(sp)
    80004550:	2781                	sext.w	a5,a5
    80004552:	40f707bb          	subw	a5,a4,a5
    80004556:	2781                	sext.w	a5,a5
    80004558:	853e                	mv	a0,a5
    8000455a:	6105                	addi	sp,sp,32
    8000455c:	8082                	ret

000000008000455e <strcpy>:
    8000455e:	1101                	addi	sp,sp,-32
    80004560:	e42a                	sd	a0,8(sp)
    80004562:	e02e                	sd	a1,0(sp)
    80004564:	67a2                	ld	a5,8(sp)
    80004566:	ec3e                	sd	a5,24(sp)
    80004568:	0001                	nop
    8000456a:	6702                	ld	a4,0(sp)
    8000456c:	00170793          	addi	a5,a4,1
    80004570:	e03e                	sd	a5,0(sp)
    80004572:	67e2                	ld	a5,24(sp)
    80004574:	00178693          	addi	a3,a5,1
    80004578:	ec36                	sd	a3,24(sp)
    8000457a:	00074703          	lbu	a4,0(a4)
    8000457e:	00e78023          	sb	a4,0(a5)
    80004582:	0007c783          	lbu	a5,0(a5)
    80004586:	f3f5                	bnez	a5,8000456a <strcpy+0xc>
    80004588:	67a2                	ld	a5,8(sp)
    8000458a:	853e                	mv	a0,a5
    8000458c:	6105                	addi	sp,sp,32
    8000458e:	8082                	ret

0000000080004590 <atol>:
    80004590:	1101                	addi	sp,sp,-32
    80004592:	e42a                	sd	a0,8(sp)
    80004594:	ec02                	sd	zero,24(sp)
    80004596:	ca02                	sw	zero,20(sp)
    80004598:	a021                	j	800045a0 <atol+0x10>
    8000459a:	67a2                	ld	a5,8(sp)
    8000459c:	0785                	addi	a5,a5,1
    8000459e:	e43e                	sd	a5,8(sp)
    800045a0:	67a2                	ld	a5,8(sp)
    800045a2:	0007c783          	lbu	a5,0(a5)
    800045a6:	873e                	mv	a4,a5
    800045a8:	02000793          	li	a5,32
    800045ac:	fef707e3          	beq	a4,a5,8000459a <atol+0xa>
    800045b0:	67a2                	ld	a5,8(sp)
    800045b2:	0007c783          	lbu	a5,0(a5)
    800045b6:	873e                	mv	a4,a5
    800045b8:	02d00793          	li	a5,45
    800045bc:	00f70a63          	beq	a4,a5,800045d0 <atol+0x40>
    800045c0:	67a2                	ld	a5,8(sp)
    800045c2:	0007c783          	lbu	a5,0(a5)
    800045c6:	873e                	mv	a4,a5
    800045c8:	02b00793          	li	a5,43
    800045cc:	04f71863          	bne	a4,a5,8000461c <atol+0x8c>
    800045d0:	67a2                	ld	a5,8(sp)
    800045d2:	0007c783          	lbu	a5,0(a5)
    800045d6:	0007871b          	sext.w	a4,a5
    800045da:	02d00793          	li	a5,45
    800045de:	40f707b3          	sub	a5,a4,a5
    800045e2:	0017b793          	seqz	a5,a5
    800045e6:	0ff7f793          	zext.b	a5,a5
    800045ea:	ca3e                	sw	a5,20(sp)
    800045ec:	67a2                	ld	a5,8(sp)
    800045ee:	0785                	addi	a5,a5,1
    800045f0:	e43e                	sd	a5,8(sp)
    800045f2:	a02d                	j	8000461c <atol+0x8c>
    800045f4:	6762                	ld	a4,24(sp)
    800045f6:	87ba                	mv	a5,a4
    800045f8:	078a                	slli	a5,a5,0x2
    800045fa:	97ba                	add	a5,a5,a4
    800045fc:	0786                	slli	a5,a5,0x1
    800045fe:	ec3e                	sd	a5,24(sp)
    80004600:	67a2                	ld	a5,8(sp)
    80004602:	00178713          	addi	a4,a5,1
    80004606:	e43a                	sd	a4,8(sp)
    80004608:	0007c783          	lbu	a5,0(a5)
    8000460c:	2781                	sext.w	a5,a5
    8000460e:	fd07879b          	addiw	a5,a5,-48
    80004612:	2781                	sext.w	a5,a5
    80004614:	873e                	mv	a4,a5
    80004616:	67e2                	ld	a5,24(sp)
    80004618:	97ba                	add	a5,a5,a4
    8000461a:	ec3e                	sd	a5,24(sp)
    8000461c:	67a2                	ld	a5,8(sp)
    8000461e:	0007c783          	lbu	a5,0(a5)
    80004622:	fbe9                	bnez	a5,800045f4 <atol+0x64>
    80004624:	47d2                	lw	a5,20(sp)
    80004626:	2781                	sext.w	a5,a5
    80004628:	c789                	beqz	a5,80004632 <atol+0xa2>
    8000462a:	67e2                	ld	a5,24(sp)
    8000462c:	40f007b3          	neg	a5,a5
    80004630:	a011                	j	80004634 <atol+0xa4>
    80004632:	67e2                	ld	a5,24(sp)
    80004634:	853e                	mv	a0,a5
    80004636:	6105                	addi	sp,sp,32
    80004638:	8082                	ret

000000008000463a <zeroExtend>:
    8000463a:	1101                	addi	sp,sp,-32
    8000463c:	e42a                	sd	a0,8(sp)
    8000463e:	67a2                	ld	a5,8(sp)
    80004640:	ec3e                	sd	a5,24(sp)
    80004642:	67e2                	ld	a5,24(sp)
    80004644:	853e                	mv	a0,a5
    80004646:	6105                	addi	sp,sp,32
    80004648:	8082                	ret

000000008000464a <prvSyscallToHost>:
    8000464a:	7171                	addi	sp,sp,-176
    8000464c:	f506                	sd	ra,168(sp)
    8000464e:	f122                	sd	s0,160(sp)
    80004650:	f42a                	sd	a0,40(sp)
    80004652:	f02e                	sd	a1,32(sp)
    80004654:	ec32                	sd	a2,24(sp)
    80004656:	e836                	sd	a3,16(sp)
    80004658:	111c                	addi	a5,sp,160
    8000465a:	e43e                	sd	a5,8(sp)
    8000465c:	67a2                	ld	a5,8(sp)
    8000465e:	f9078793          	addi	a5,a5,-112
    80004662:	03f78793          	addi	a5,a5,63
    80004666:	8399                	srli	a5,a5,0x6
    80004668:	00679413          	slli	s0,a5,0x6
    8000466c:	7522                	ld	a0,40(sp)
    8000466e:	fcdff0ef          	jal	ra,8000463a <zeroExtend>
    80004672:	87aa                	mv	a5,a0
    80004674:	e01c                	sd	a5,0(s0)
    80004676:	7502                	ld	a0,32(sp)
    80004678:	fc3ff0ef          	jal	ra,8000463a <zeroExtend>
    8000467c:	87aa                	mv	a5,a0
    8000467e:	e41c                	sd	a5,8(s0)
    80004680:	6562                	ld	a0,24(sp)
    80004682:	fb9ff0ef          	jal	ra,8000463a <zeroExtend>
    80004686:	87aa                	mv	a5,a0
    80004688:	e81c                	sd	a5,16(s0)
    8000468a:	6542                	ld	a0,16(sp)
    8000468c:	fafff0ef          	jal	ra,8000463a <zeroExtend>
    80004690:	87aa                	mv	a5,a0
    80004692:	ec1c                	sd	a5,24(s0)
    80004694:	0ff0000f          	fence
    80004698:	87a2                	mv	a5,s0
    8000469a:	853e                	mv	a0,a5
    8000469c:	f9fff0ef          	jal	ra,8000463a <zeroExtend>
    800046a0:	872a                	mv	a4,a0
    800046a2:	0001c797          	auipc	a5,0x1c
    800046a6:	cde78793          	addi	a5,a5,-802 # 80020380 <tohost>
    800046aa:	e398                	sd	a4,0(a5)
    800046ac:	601c                	ld	a5,0(s0)
    800046ae:	853e                	mv	a0,a5
    800046b0:	70aa                	ld	ra,168(sp)
    800046b2:	740a                	ld	s0,160(sp)
    800046b4:	614d                	addi	sp,sp,176
    800046b6:	8082                	ret

00000000800046b8 <prvSyscallExit>:
    800046b8:	7179                	addi	sp,sp,-48
    800046ba:	f406                	sd	ra,40(sp)
    800046bc:	e42a                	sd	a0,8(sp)
    800046be:	6522                	ld	a0,8(sp)
    800046c0:	f7bff0ef          	jal	ra,8000463a <zeroExtend>
    800046c4:	ec2a                	sd	a0,24(sp)
    800046c6:	67e2                	ld	a5,24(sp)
    800046c8:	0786                	slli	a5,a5,0x1
    800046ca:	0017e713          	ori	a4,a5,1
    800046ce:	0001c797          	auipc	a5,0x1c
    800046d2:	cb278793          	addi	a5,a5,-846 # 80020380 <tohost>
    800046d6:	e398                	sd	a4,0(a5)
    800046d8:	a001                	j	800046d8 <prvSyscallExit+0x20>

00000000800046da <printstr>:
    800046da:	1101                	addi	sp,sp,-32
    800046dc:	ec06                	sd	ra,24(sp)
    800046de:	e822                	sd	s0,16(sp)
    800046e0:	e42a                	sd	a0,8(sp)
    800046e2:	6422                	ld	s0,8(sp)
    800046e4:	6522                	ld	a0,8(sp)
    800046e6:	df3ff0ef          	jal	ra,800044d8 <strlen>
    800046ea:	87aa                	mv	a5,a0
    800046ec:	86be                	mv	a3,a5
    800046ee:	8622                	mv	a2,s0
    800046f0:	4585                	li	a1,1
    800046f2:	04000513          	li	a0,64
    800046f6:	00e000ef          	jal	ra,80004704 <syscall>
    800046fa:	0001                	nop
    800046fc:	60e2                	ld	ra,24(sp)
    800046fe:	6442                	ld	s0,16(sp)
    80004700:	6105                	addi	sp,sp,32
    80004702:	8082                	ret

0000000080004704 <syscall>:
    80004704:	1101                	addi	sp,sp,-32
    80004706:	ec2a                	sd	a0,24(sp)
    80004708:	e82e                	sd	a1,16(sp)
    8000470a:	e432                	sd	a2,8(sp)
    8000470c:	e036                	sd	a3,0(sp)
    8000470e:	68e2                	ld	a7,24(sp)
    80004710:	6542                	ld	a0,16(sp)
    80004712:	65a2                	ld	a1,8(sp)
    80004714:	6602                	ld	a2,0(sp)
    80004716:	00000073          	ecall
    8000471a:	87aa                	mv	a5,a0
    8000471c:	853e                	mv	a0,a5
    8000471e:	6105                	addi	sp,sp,32
    80004720:	8082                	ret
    80004722:	1101                	addi	sp,sp,-32
    80004724:	ec06                	sd	ra,24(sp)
    80004726:	87aa                	mv	a5,a0
    80004728:	e02e                	sd	a1,0(sp)
    8000472a:	c63e                	sw	a5,12(sp)
    8000472c:	0001c517          	auipc	a0,0x1c
    80004730:	93c50513          	addi	a0,a0,-1732 # 80020068 <__rodata_start+0x68>
    80004734:	fa7ff0ef          	jal	ra,800046da <printstr>
    80004738:	57fd                	li	a5,-1
    8000473a:	853e                	mv	a0,a5
    8000473c:	60e2                	ld	ra,24(sp)
    8000473e:	6105                	addi	sp,sp,32
    80004740:	8082                	ret

0000000080004742 <vSyscallInit>:
    80004742:	1101                	addi	sp,sp,-32
    80004744:	ec06                	sd	ra,24(sp)
    80004746:	4581                	li	a1,0
    80004748:	4501                	li	a0,0
    8000474a:	640000ef          	jal	ra,80004d8a <main>
    8000474e:	87aa                	mv	a5,a0
    80004750:	c63e                	sw	a5,12(sp)
    80004752:	47b2                	lw	a5,12(sp)
    80004754:	853e                	mv	a0,a5
    80004756:	520000ef          	jal	ra,80004c76 <exit>
    8000475a:	0001                	nop
    8000475c:	60e2                	ld	ra,24(sp)
    8000475e:	6105                	addi	sp,sp,32
    80004760:	8082                	ret

0000000080004762 <ulSyscallTrap>:
    80004762:	7139                	addi	sp,sp,-64
    80004764:	fc06                	sd	ra,56(sp)
    80004766:	ec2a                	sd	a0,24(sp)
    80004768:	e82e                	sd	a1,16(sp)
    8000476a:	e432                	sd	a2,8(sp)
    8000476c:	f402                	sd	zero,40(sp)
    8000476e:	6762                	ld	a4,24(sp)
    80004770:	47ad                	li	a5,11
    80004772:	00f70663          	beq	a4,a5,8000477e <ulSyscallTrap+0x1c>
    80004776:	6562                	ld	a0,24(sp)
    80004778:	f41ff0ef          	jal	ra,800046b8 <prvSyscallExit>
    8000477c:	a0b9                	j	800047ca <ulSyscallTrap+0x68>
    8000477e:	67a2                	ld	a5,8(sp)
    80004780:	08878793          	addi	a5,a5,136
    80004784:	6398                	ld	a4,0(a5)
    80004786:	05d00793          	li	a5,93
    8000478a:	00f71a63          	bne	a4,a5,8000479e <ulSyscallTrap+0x3c>
    8000478e:	67a2                	ld	a5,8(sp)
    80004790:	05078793          	addi	a5,a5,80
    80004794:	639c                	ld	a5,0(a5)
    80004796:	853e                	mv	a0,a5
    80004798:	f21ff0ef          	jal	ra,800046b8 <prvSyscallExit>
    8000479c:	a03d                	j	800047ca <ulSyscallTrap+0x68>
    8000479e:	67a2                	ld	a5,8(sp)
    800047a0:	08878793          	addi	a5,a5,136
    800047a4:	6398                	ld	a4,0(a5)
    800047a6:	67a2                	ld	a5,8(sp)
    800047a8:	05078793          	addi	a5,a5,80
    800047ac:	638c                	ld	a1,0(a5)
    800047ae:	67a2                	ld	a5,8(sp)
    800047b0:	05878793          	addi	a5,a5,88
    800047b4:	6390                	ld	a2,0(a5)
    800047b6:	67a2                	ld	a5,8(sp)
    800047b8:	06078793          	addi	a5,a5,96
    800047bc:	639c                	ld	a5,0(a5)
    800047be:	86be                	mv	a3,a5
    800047c0:	853a                	mv	a0,a4
    800047c2:	e89ff0ef          	jal	ra,8000464a <prvSyscallToHost>
    800047c6:	87aa                	mv	a5,a0
    800047c8:	f43e                	sd	a5,40(sp)
    800047ca:	67a2                	ld	a5,8(sp)
    800047cc:	05078793          	addi	a5,a5,80
    800047d0:	7722                	ld	a4,40(sp)
    800047d2:	e398                	sd	a4,0(a5)
    800047d4:	67c2                	ld	a5,16(sp)
    800047d6:	0791                	addi	a5,a5,4
    800047d8:	853e                	mv	a0,a5
    800047da:	70e2                	ld	ra,56(sp)
    800047dc:	6121                	addi	sp,sp,64
    800047de:	8082                	ret

00000000800047e0 <putchar>:
    800047e0:	1101                	addi	sp,sp,-32
    800047e2:	ec06                	sd	ra,24(sp)
    800047e4:	87aa                	mv	a5,a0
    800047e6:	c63e                	sw	a5,12(sp)
    800047e8:	00035797          	auipc	a5,0x35
    800047ec:	05878793          	addi	a5,a5,88 # 80039840 <buflen.2>
    800047f0:	439c                	lw	a5,0(a5)
    800047f2:	0017871b          	addiw	a4,a5,1
    800047f6:	0007069b          	sext.w	a3,a4
    800047fa:	00035717          	auipc	a4,0x35
    800047fe:	04670713          	addi	a4,a4,70 # 80039840 <buflen.2>
    80004802:	c314                	sw	a3,0(a4)
    80004804:	4732                	lw	a4,12(sp)
    80004806:	0ff77713          	zext.b	a4,a4
    8000480a:	00035697          	auipc	a3,0x35
    8000480e:	07668693          	addi	a3,a3,118 # 80039880 <buf.1>
    80004812:	97b6                	add	a5,a5,a3
    80004814:	00e78023          	sb	a4,0(a5)
    80004818:	47b2                	lw	a5,12(sp)
    8000481a:	0007871b          	sext.w	a4,a5
    8000481e:	47a9                	li	a5,10
    80004820:	00f70c63          	beq	a4,a5,80004838 <putchar+0x58>
    80004824:	00035797          	auipc	a5,0x35
    80004828:	01c78793          	addi	a5,a5,28 # 80039840 <buflen.2>
    8000482c:	439c                	lw	a5,0(a5)
    8000482e:	873e                	mv	a4,a5
    80004830:	04000793          	li	a5,64
    80004834:	02f71863          	bne	a4,a5,80004864 <putchar+0x84>
    80004838:	00035717          	auipc	a4,0x35
    8000483c:	04870713          	addi	a4,a4,72 # 80039880 <buf.1>
    80004840:	00035797          	auipc	a5,0x35
    80004844:	00078793          	mv	a5,a5
    80004848:	439c                	lw	a5,0(a5)
    8000484a:	86be                	mv	a3,a5
    8000484c:	863a                	mv	a2,a4
    8000484e:	4585                	li	a1,1
    80004850:	04000513          	li	a0,64
    80004854:	eb1ff0ef          	jal	ra,80004704 <syscall>
    80004858:	00035797          	auipc	a5,0x35
    8000485c:	fe878793          	addi	a5,a5,-24 # 80039840 <buflen.2>
    80004860:	0007a023          	sw	zero,0(a5)
    80004864:	4781                	li	a5,0
    80004866:	853e                	mv	a0,a5
    80004868:	60e2                	ld	ra,24(sp)
    8000486a:	6105                	addi	sp,sp,32
    8000486c:	8082                	ret

000000008000486e <printnum>:
    8000486e:	714d                	addi	sp,sp,-336
    80004870:	e686                	sd	ra,328(sp)
    80004872:	f42a                	sd	a0,40(sp)
    80004874:	f02e                	sd	a1,32(sp)
    80004876:	ec32                	sd	a2,24(sp)
    80004878:	8636                	mv	a2,a3
    8000487a:	86ba                	mv	a3,a4
    8000487c:	873e                	mv	a4,a5
    8000487e:	87b2                	mv	a5,a2
    80004880:	ca3e                	sw	a5,20(sp)
    80004882:	87b6                	mv	a5,a3
    80004884:	c83e                	sw	a5,16(sp)
    80004886:	87ba                	mv	a5,a4
    80004888:	c63e                	sw	a5,12(sp)
    8000488a:	12012e23          	sw	zero,316(sp)
    8000488e:	01416783          	lwu	a5,20(sp)
    80004892:	6762                	ld	a4,24(sp)
    80004894:	02f776b3          	remu	a3,a4,a5
    80004898:	13c12783          	lw	a5,316(sp)
    8000489c:	0017871b          	addiw	a4,a5,1
    800048a0:	12e12e23          	sw	a4,316(sp)
    800048a4:	0006871b          	sext.w	a4,a3
    800048a8:	078a                	slli	a5,a5,0x2
    800048aa:	14078793          	addi	a5,a5,320
    800048ae:	978a                	add	a5,a5,sp
    800048b0:	eee7ac23          	sw	a4,-264(a5)
    800048b4:	01416783          	lwu	a5,20(sp)
    800048b8:	6762                	ld	a4,24(sp)
    800048ba:	00f76963          	bltu	a4,a5,800048cc <printnum+0x5e>
    800048be:	01416783          	lwu	a5,20(sp)
    800048c2:	6762                	ld	a4,24(sp)
    800048c4:	02f757b3          	divu	a5,a4,a5
    800048c8:	ec3e                	sd	a5,24(sp)
    800048ca:	b7d1                	j	8000488e <printnum+0x20>
    800048cc:	0001                	nop
    800048ce:	a031                	j	800048da <printnum+0x6c>
    800048d0:	47b2                	lw	a5,12(sp)
    800048d2:	7722                	ld	a4,40(sp)
    800048d4:	7582                	ld	a1,32(sp)
    800048d6:	853e                	mv	a0,a5
    800048d8:	9702                	jalr	a4
    800048da:	47c2                	lw	a5,16(sp)
    800048dc:	fff7871b          	addiw	a4,a5,-1
    800048e0:	c83a                	sw	a4,16(sp)
    800048e2:	13c12703          	lw	a4,316(sp)
    800048e6:	2701                	sext.w	a4,a4
    800048e8:	fef744e3          	blt	a4,a5,800048d0 <printnum+0x62>
    800048ec:	a089                	j	8000492e <printnum+0xc0>
    800048ee:	13c12783          	lw	a5,316(sp)
    800048f2:	078a                	slli	a5,a5,0x2
    800048f4:	14078793          	addi	a5,a5,320
    800048f8:	978a                	add	a5,a5,sp
    800048fa:	ef87a703          	lw	a4,-264(a5)
    800048fe:	13c12783          	lw	a5,316(sp)
    80004902:	078a                	slli	a5,a5,0x2
    80004904:	14078793          	addi	a5,a5,320
    80004908:	978a                	add	a5,a5,sp
    8000490a:	ef87a783          	lw	a5,-264(a5)
    8000490e:	86be                	mv	a3,a5
    80004910:	47a5                	li	a5,9
    80004912:	00d7f563          	bgeu	a5,a3,8000491c <printnum+0xae>
    80004916:	05700793          	li	a5,87
    8000491a:	a019                	j	80004920 <printnum+0xb2>
    8000491c:	03000793          	li	a5,48
    80004920:	9fb9                	addw	a5,a5,a4
    80004922:	2781                	sext.w	a5,a5
    80004924:	2781                	sext.w	a5,a5
    80004926:	7722                	ld	a4,40(sp)
    80004928:	7582                	ld	a1,32(sp)
    8000492a:	853e                	mv	a0,a5
    8000492c:	9702                	jalr	a4
    8000492e:	13c12783          	lw	a5,316(sp)
    80004932:	fff7871b          	addiw	a4,a5,-1
    80004936:	12e12e23          	sw	a4,316(sp)
    8000493a:	faf04ae3          	bgtz	a5,800048ee <printnum+0x80>
    8000493e:	0001                	nop
    80004940:	0001                	nop
    80004942:	60b6                	ld	ra,328(sp)
    80004944:	6171                	addi	sp,sp,336
    80004946:	8082                	ret

0000000080004948 <getuint>:
    80004948:	1141                	addi	sp,sp,-16
    8000494a:	e42a                	sd	a0,8(sp)
    8000494c:	87ae                	mv	a5,a1
    8000494e:	c23e                	sw	a5,4(sp)
    80004950:	4792                	lw	a5,4(sp)
    80004952:	0007871b          	sext.w	a4,a5
    80004956:	4785                	li	a5,1
    80004958:	00e7da63          	bge	a5,a4,8000496c <getuint+0x24>
    8000495c:	67a2                	ld	a5,8(sp)
    8000495e:	639c                	ld	a5,0(a5)
    80004960:	00878693          	addi	a3,a5,8
    80004964:	6722                	ld	a4,8(sp)
    80004966:	e314                	sd	a3,0(a4)
    80004968:	639c                	ld	a5,0(a5)
    8000496a:	a02d                	j	80004994 <getuint+0x4c>
    8000496c:	4792                	lw	a5,4(sp)
    8000496e:	2781                	sext.w	a5,a5
    80004970:	cb89                	beqz	a5,80004982 <getuint+0x3a>
    80004972:	67a2                	ld	a5,8(sp)
    80004974:	639c                	ld	a5,0(a5)
    80004976:	00878693          	addi	a3,a5,8
    8000497a:	6722                	ld	a4,8(sp)
    8000497c:	e314                	sd	a3,0(a4)
    8000497e:	639c                	ld	a5,0(a5)
    80004980:	a811                	j	80004994 <getuint+0x4c>
    80004982:	67a2                	ld	a5,8(sp)
    80004984:	639c                	ld	a5,0(a5)
    80004986:	00878693          	addi	a3,a5,8
    8000498a:	6722                	ld	a4,8(sp)
    8000498c:	e314                	sd	a3,0(a4)
    8000498e:	439c                	lw	a5,0(a5)
    80004990:	1782                	slli	a5,a5,0x20
    80004992:	9381                	srli	a5,a5,0x20
    80004994:	853e                	mv	a0,a5
    80004996:	0141                	addi	sp,sp,16
    80004998:	8082                	ret

000000008000499a <getint>:
    8000499a:	1141                	addi	sp,sp,-16
    8000499c:	e42a                	sd	a0,8(sp)
    8000499e:	87ae                	mv	a5,a1
    800049a0:	c23e                	sw	a5,4(sp)
    800049a2:	4792                	lw	a5,4(sp)
    800049a4:	0007871b          	sext.w	a4,a5
    800049a8:	4785                	li	a5,1
    800049aa:	00e7da63          	bge	a5,a4,800049be <getint+0x24>
    800049ae:	67a2                	ld	a5,8(sp)
    800049b0:	639c                	ld	a5,0(a5)
    800049b2:	00878693          	addi	a3,a5,8
    800049b6:	6722                	ld	a4,8(sp)
    800049b8:	e314                	sd	a3,0(a4)
    800049ba:	639c                	ld	a5,0(a5)
    800049bc:	a01d                	j	800049e2 <getint+0x48>
    800049be:	4792                	lw	a5,4(sp)
    800049c0:	2781                	sext.w	a5,a5
    800049c2:	cb89                	beqz	a5,800049d4 <getint+0x3a>
    800049c4:	67a2                	ld	a5,8(sp)
    800049c6:	639c                	ld	a5,0(a5)
    800049c8:	00878693          	addi	a3,a5,8
    800049cc:	6722                	ld	a4,8(sp)
    800049ce:	e314                	sd	a3,0(a4)
    800049d0:	639c                	ld	a5,0(a5)
    800049d2:	a801                	j	800049e2 <getint+0x48>
    800049d4:	67a2                	ld	a5,8(sp)
    800049d6:	639c                	ld	a5,0(a5)
    800049d8:	00878693          	addi	a3,a5,8
    800049dc:	6722                	ld	a4,8(sp)
    800049de:	e314                	sd	a3,0(a4)
    800049e0:	439c                	lw	a5,0(a5)
    800049e2:	853e                	mv	a0,a5
    800049e4:	0141                	addi	sp,sp,16
    800049e6:	8082                	ret

00000000800049e8 <vFormatPrintString>:
    800049e8:	7159                	addi	sp,sp,-112
    800049ea:	f486                	sd	ra,104(sp)
    800049ec:	f0a2                	sd	s0,96(sp)
    800049ee:	eca6                	sd	s1,88(sp)
    800049f0:	ec2a                	sd	a0,24(sp)
    800049f2:	e82e                	sd	a1,16(sp)
    800049f4:	e432                	sd	a2,8(sp)
    800049f6:	e036                	sd	a3,0(sp)
    800049f8:	a811                	j	80004a0c <vFormatPrintString+0x24>
    800049fa:	26040863          	beqz	s0,80004c6a <vFormatPrintString+0x282>
    800049fe:	67a2                	ld	a5,8(sp)
    80004a00:	0785                	addi	a5,a5,1
    80004a02:	e43e                	sd	a5,8(sp)
    80004a04:	67e2                	ld	a5,24(sp)
    80004a06:	65c2                	ld	a1,16(sp)
    80004a08:	8522                	mv	a0,s0
    80004a0a:	9782                	jalr	a5
    80004a0c:	67a2                	ld	a5,8(sp)
    80004a0e:	0007c783          	lbu	a5,0(a5)
    80004a12:	0007841b          	sext.w	s0,a5
    80004a16:	8722                	mv	a4,s0
    80004a18:	02500793          	li	a5,37
    80004a1c:	fcf71fe3          	bne	a4,a5,800049fa <vFormatPrintString+0x12>
    80004a20:	67a2                	ld	a5,8(sp)
    80004a22:	0785                	addi	a5,a5,1
    80004a24:	e43e                	sd	a5,8(sp)
    80004a26:	67a2                	ld	a5,8(sp)
    80004a28:	f43e                	sd	a5,40(sp)
    80004a2a:	02000793          	li	a5,32
    80004a2e:	02f10ba3          	sb	a5,55(sp)
    80004a32:	57fd                	li	a5,-1
    80004a34:	de3e                	sw	a5,60(sp)
    80004a36:	57fd                	li	a5,-1
    80004a38:	dc3e                	sw	a5,56(sp)
    80004a3a:	c082                	sw	zero,64(sp)
    80004a3c:	67a2                	ld	a5,8(sp)
    80004a3e:	00178713          	addi	a4,a5,1
    80004a42:	e43a                	sd	a4,8(sp)
    80004a44:	0007c783          	lbu	a5,0(a5)
    80004a48:	0007841b          	sext.w	s0,a5
    80004a4c:	fdd4069b          	addiw	a3,s0,-35
    80004a50:	0006871b          	sext.w	a4,a3
    80004a54:	05500793          	li	a5,85
    80004a58:	20e7e063          	bltu	a5,a4,80004c58 <vFormatPrintString+0x270>
    80004a5c:	02069793          	slli	a5,a3,0x20
    80004a60:	9381                	srli	a5,a5,0x20
    80004a62:	00279713          	slli	a4,a5,0x2
    80004a66:	0001b797          	auipc	a5,0x1b
    80004a6a:	62a78793          	addi	a5,a5,1578 # 80020090 <__rodata_start+0x90>
    80004a6e:	97ba                	add	a5,a5,a4
    80004a70:	439c                	lw	a5,0(a5)
    80004a72:	0007871b          	sext.w	a4,a5
    80004a76:	0001b797          	auipc	a5,0x1b
    80004a7a:	61a78793          	addi	a5,a5,1562 # 80020090 <__rodata_start+0x90>
    80004a7e:	97ba                	add	a5,a5,a4
    80004a80:	8782                	jr	a5
    80004a82:	02d00793          	li	a5,45
    80004a86:	02f10ba3          	sb	a5,55(sp)
    80004a8a:	bf4d                	j	80004a3c <vFormatPrintString+0x54>
    80004a8c:	03000793          	li	a5,48
    80004a90:	02f10ba3          	sb	a5,55(sp)
    80004a94:	b765                	j	80004a3c <vFormatPrintString+0x54>
    80004a96:	dc02                	sw	zero,56(sp)
    80004a98:	57e2                	lw	a5,56(sp)
    80004a9a:	873e                	mv	a4,a5
    80004a9c:	87ba                	mv	a5,a4
    80004a9e:	0027979b          	slliw	a5,a5,0x2
    80004aa2:	9fb9                	addw	a5,a5,a4
    80004aa4:	0017979b          	slliw	a5,a5,0x1
    80004aa8:	2781                	sext.w	a5,a5
    80004aaa:	9fa1                	addw	a5,a5,s0
    80004aac:	2781                	sext.w	a5,a5
    80004aae:	fd07879b          	addiw	a5,a5,-48
    80004ab2:	dc3e                	sw	a5,56(sp)
    80004ab4:	67a2                	ld	a5,8(sp)
    80004ab6:	0007c783          	lbu	a5,0(a5)
    80004aba:	0007841b          	sext.w	s0,a5
    80004abe:	8722                	mv	a4,s0
    80004ac0:	02f00793          	li	a5,47
    80004ac4:	02e7d863          	bge	a5,a4,80004af4 <vFormatPrintString+0x10c>
    80004ac8:	8722                	mv	a4,s0
    80004aca:	03900793          	li	a5,57
    80004ace:	02e7c363          	blt	a5,a4,80004af4 <vFormatPrintString+0x10c>
    80004ad2:	67a2                	ld	a5,8(sp)
    80004ad4:	0785                	addi	a5,a5,1
    80004ad6:	e43e                	sd	a5,8(sp)
    80004ad8:	b7c1                	j	80004a98 <vFormatPrintString+0xb0>
    80004ada:	6782                	ld	a5,0(sp)
    80004adc:	00878713          	addi	a4,a5,8
    80004ae0:	e03a                	sd	a4,0(sp)
    80004ae2:	439c                	lw	a5,0(a5)
    80004ae4:	dc3e                	sw	a5,56(sp)
    80004ae6:	a801                	j	80004af6 <vFormatPrintString+0x10e>
    80004ae8:	57f2                	lw	a5,60(sp)
    80004aea:	2781                	sext.w	a5,a5
    80004aec:	f407d8e3          	bgez	a5,80004a3c <vFormatPrintString+0x54>
    80004af0:	de02                	sw	zero,60(sp)
    80004af2:	b7a9                	j	80004a3c <vFormatPrintString+0x54>
    80004af4:	0001                	nop
    80004af6:	57f2                	lw	a5,60(sp)
    80004af8:	2781                	sext.w	a5,a5
    80004afa:	f407d1e3          	bgez	a5,80004a3c <vFormatPrintString+0x54>
    80004afe:	57e2                	lw	a5,56(sp)
    80004b00:	de3e                	sw	a5,60(sp)
    80004b02:	57fd                	li	a5,-1
    80004b04:	dc3e                	sw	a5,56(sp)
    80004b06:	bf1d                	j	80004a3c <vFormatPrintString+0x54>
    80004b08:	4786                	lw	a5,64(sp)
    80004b0a:	2785                	addiw	a5,a5,1
    80004b0c:	c0be                	sw	a5,64(sp)
    80004b0e:	b73d                	j	80004a3c <vFormatPrintString+0x54>
    80004b10:	6782                	ld	a5,0(sp)
    80004b12:	00878713          	addi	a4,a5,8
    80004b16:	e03a                	sd	a4,0(sp)
    80004b18:	439c                	lw	a5,0(a5)
    80004b1a:	6762                	ld	a4,24(sp)
    80004b1c:	65c2                	ld	a1,16(sp)
    80004b1e:	853e                	mv	a0,a5
    80004b20:	9702                	jalr	a4
    80004b22:	a299                	j	80004c68 <vFormatPrintString+0x280>
    80004b24:	6782                	ld	a5,0(sp)
    80004b26:	00878713          	addi	a4,a5,8
    80004b2a:	e03a                	sd	a4,0(sp)
    80004b2c:	6384                	ld	s1,0(a5)
    80004b2e:	e489                	bnez	s1,80004b38 <vFormatPrintString+0x150>
    80004b30:	0001b497          	auipc	s1,0x1b
    80004b34:	55848493          	addi	s1,s1,1368 # 80020088 <__rodata_start+0x88>
    80004b38:	57f2                	lw	a5,60(sp)
    80004b3a:	2781                	sext.w	a5,a5
    80004b3c:	04f05e63          	blez	a5,80004b98 <vFormatPrintString+0x1b0>
    80004b40:	03714783          	lbu	a5,55(sp)
    80004b44:	0ff7f713          	zext.b	a4,a5
    80004b48:	02d00793          	li	a5,45
    80004b4c:	04f70663          	beq	a4,a5,80004b98 <vFormatPrintString+0x1b0>
    80004b50:	57e2                	lw	a5,56(sp)
    80004b52:	85be                	mv	a1,a5
    80004b54:	8526                	mv	a0,s1
    80004b56:	1c8010ef          	jal	ra,80005d1e <strnlen>
    80004b5a:	87aa                	mv	a5,a0
    80004b5c:	5772                	lw	a4,60(sp)
    80004b5e:	2781                	sext.w	a5,a5
    80004b60:	40f707bb          	subw	a5,a4,a5
    80004b64:	2781                	sext.w	a5,a5
    80004b66:	de3e                	sw	a5,60(sp)
    80004b68:	a819                	j	80004b7e <vFormatPrintString+0x196>
    80004b6a:	03714783          	lbu	a5,55(sp)
    80004b6e:	2781                	sext.w	a5,a5
    80004b70:	6762                	ld	a4,24(sp)
    80004b72:	65c2                	ld	a1,16(sp)
    80004b74:	853e                	mv	a0,a5
    80004b76:	9702                	jalr	a4
    80004b78:	57f2                	lw	a5,60(sp)
    80004b7a:	37fd                	addiw	a5,a5,-1
    80004b7c:	de3e                	sw	a5,60(sp)
    80004b7e:	57f2                	lw	a5,60(sp)
    80004b80:	2781                	sext.w	a5,a5
    80004b82:	fef044e3          	bgtz	a5,80004b6a <vFormatPrintString+0x182>
    80004b86:	a809                	j	80004b98 <vFormatPrintString+0x1b0>
    80004b88:	67e2                	ld	a5,24(sp)
    80004b8a:	65c2                	ld	a1,16(sp)
    80004b8c:	8522                	mv	a0,s0
    80004b8e:	9782                	jalr	a5
    80004b90:	0485                	addi	s1,s1,1
    80004b92:	57f2                	lw	a5,60(sp)
    80004b94:	37fd                	addiw	a5,a5,-1
    80004b96:	de3e                	sw	a5,60(sp)
    80004b98:	0004c783          	lbu	a5,0(s1)
    80004b9c:	0007841b          	sext.w	s0,a5
    80004ba0:	c40d                	beqz	s0,80004bca <vFormatPrintString+0x1e2>
    80004ba2:	57e2                	lw	a5,56(sp)
    80004ba4:	2781                	sext.w	a5,a5
    80004ba6:	fe07c1e3          	bltz	a5,80004b88 <vFormatPrintString+0x1a0>
    80004baa:	57e2                	lw	a5,56(sp)
    80004bac:	37fd                	addiw	a5,a5,-1
    80004bae:	dc3e                	sw	a5,56(sp)
    80004bb0:	57e2                	lw	a5,56(sp)
    80004bb2:	2781                	sext.w	a5,a5
    80004bb4:	fc07dae3          	bgez	a5,80004b88 <vFormatPrintString+0x1a0>
    80004bb8:	a809                	j	80004bca <vFormatPrintString+0x1e2>
    80004bba:	67e2                	ld	a5,24(sp)
    80004bbc:	65c2                	ld	a1,16(sp)
    80004bbe:	02000513          	li	a0,32
    80004bc2:	9782                	jalr	a5
    80004bc4:	57f2                	lw	a5,60(sp)
    80004bc6:	37fd                	addiw	a5,a5,-1
    80004bc8:	de3e                	sw	a5,60(sp)
    80004bca:	57f2                	lw	a5,60(sp)
    80004bcc:	2781                	sext.w	a5,a5
    80004bce:	fef046e3          	bgtz	a5,80004bba <vFormatPrintString+0x1d2>
    80004bd2:	a859                	j	80004c68 <vFormatPrintString+0x280>
    80004bd4:	4706                	lw	a4,64(sp)
    80004bd6:	878a                	mv	a5,sp
    80004bd8:	85ba                	mv	a1,a4
    80004bda:	853e                	mv	a0,a5
    80004bdc:	dbfff0ef          	jal	ra,8000499a <getint>
    80004be0:	87aa                	mv	a5,a0
    80004be2:	e4be                	sd	a5,72(sp)
    80004be4:	67a6                	ld	a5,72(sp)
    80004be6:	0007db63          	bgez	a5,80004bfc <vFormatPrintString+0x214>
    80004bea:	67e2                	ld	a5,24(sp)
    80004bec:	65c2                	ld	a1,16(sp)
    80004bee:	02d00513          	li	a0,45
    80004bf2:	9782                	jalr	a5
    80004bf4:	67a6                	ld	a5,72(sp)
    80004bf6:	40f007b3          	neg	a5,a5
    80004bfa:	e4be                	sd	a5,72(sp)
    80004bfc:	47a9                	li	a5,10
    80004bfe:	c2be                	sw	a5,68(sp)
    80004c00:	a825                	j	80004c38 <vFormatPrintString+0x250>
    80004c02:	47a9                	li	a5,10
    80004c04:	c2be                	sw	a5,68(sp)
    80004c06:	a015                	j	80004c2a <vFormatPrintString+0x242>
    80004c08:	47a1                	li	a5,8
    80004c0a:	c2be                	sw	a5,68(sp)
    80004c0c:	a839                	j	80004c2a <vFormatPrintString+0x242>
    80004c0e:	4785                	li	a5,1
    80004c10:	c0be                	sw	a5,64(sp)
    80004c12:	67e2                	ld	a5,24(sp)
    80004c14:	65c2                	ld	a1,16(sp)
    80004c16:	03000513          	li	a0,48
    80004c1a:	9782                	jalr	a5
    80004c1c:	67e2                	ld	a5,24(sp)
    80004c1e:	65c2                	ld	a1,16(sp)
    80004c20:	07800513          	li	a0,120
    80004c24:	9782                	jalr	a5
    80004c26:	47c1                	li	a5,16
    80004c28:	c2be                	sw	a5,68(sp)
    80004c2a:	4706                	lw	a4,64(sp)
    80004c2c:	878a                	mv	a5,sp
    80004c2e:	85ba                	mv	a1,a4
    80004c30:	853e                	mv	a0,a5
    80004c32:	d17ff0ef          	jal	ra,80004948 <getuint>
    80004c36:	e4aa                	sd	a0,72(sp)
    80004c38:	4696                	lw	a3,68(sp)
    80004c3a:	03714783          	lbu	a5,55(sp)
    80004c3e:	2781                	sext.w	a5,a5
    80004c40:	5772                	lw	a4,60(sp)
    80004c42:	6626                	ld	a2,72(sp)
    80004c44:	65c2                	ld	a1,16(sp)
    80004c46:	6562                	ld	a0,24(sp)
    80004c48:	c27ff0ef          	jal	ra,8000486e <printnum>
    80004c4c:	a831                	j	80004c68 <vFormatPrintString+0x280>
    80004c4e:	67e2                	ld	a5,24(sp)
    80004c50:	65c2                	ld	a1,16(sp)
    80004c52:	8522                	mv	a0,s0
    80004c54:	9782                	jalr	a5
    80004c56:	a809                	j	80004c68 <vFormatPrintString+0x280>
    80004c58:	67e2                	ld	a5,24(sp)
    80004c5a:	65c2                	ld	a1,16(sp)
    80004c5c:	02500513          	li	a0,37
    80004c60:	9782                	jalr	a5
    80004c62:	77a2                	ld	a5,40(sp)
    80004c64:	e43e                	sd	a5,8(sp)
    80004c66:	0001                	nop
    80004c68:	b355                	j	80004a0c <vFormatPrintString+0x24>
    80004c6a:	0001                	nop
    80004c6c:	70a6                	ld	ra,104(sp)
    80004c6e:	7406                	ld	s0,96(sp)
    80004c70:	64e6                	ld	s1,88(sp)
    80004c72:	6165                	addi	sp,sp,112
    80004c74:	8082                	ret

0000000080004c76 <exit>:
    80004c76:	1101                	addi	sp,sp,-32
    80004c78:	ec06                	sd	ra,24(sp)
    80004c7a:	87aa                	mv	a5,a0
    80004c7c:	c63e                	sw	a5,12(sp)
    80004c7e:	47b2                	lw	a5,12(sp)
    80004c80:	4681                	li	a3,0
    80004c82:	4601                	li	a2,0
    80004c84:	85be                	mv	a1,a5
    80004c86:	05d00513          	li	a0,93
    80004c8a:	a7bff0ef          	jal	ra,80004704 <syscall>
    80004c8e:	a001                	j	80004c8e <exit+0x18>

0000000080004c90 <printf>:
    80004c90:	7159                	addi	sp,sp,-112
    80004c92:	f406                	sd	ra,40(sp)
    80004c94:	e42a                	sd	a0,8(sp)
    80004c96:	fc2e                	sd	a1,56(sp)
    80004c98:	e0b2                	sd	a2,64(sp)
    80004c9a:	e4b6                	sd	a3,72(sp)
    80004c9c:	e8ba                	sd	a4,80(sp)
    80004c9e:	ecbe                	sd	a5,88(sp)
    80004ca0:	f0c2                	sd	a6,96(sp)
    80004ca2:	f4c6                	sd	a7,104(sp)
    80004ca4:	189c                	addi	a5,sp,112
    80004ca6:	e03e                	sd	a5,0(sp)
    80004ca8:	6782                	ld	a5,0(sp)
    80004caa:	fc878793          	addi	a5,a5,-56
    80004cae:	ec3e                	sd	a5,24(sp)
    80004cb0:	67e2                	ld	a5,24(sp)
    80004cb2:	86be                	mv	a3,a5
    80004cb4:	6622                	ld	a2,8(sp)
    80004cb6:	4581                	li	a1,0
    80004cb8:	00000517          	auipc	a0,0x0
    80004cbc:	b2850513          	addi	a0,a0,-1240 # 800047e0 <putchar>
    80004cc0:	d29ff0ef          	jal	ra,800049e8 <vFormatPrintString>
    80004cc4:	4781                	li	a5,0
    80004cc6:	853e                	mv	a0,a5
    80004cc8:	70a2                	ld	ra,40(sp)
    80004cca:	6165                	addi	sp,sp,112
    80004ccc:	8082                	ret

0000000080004cce <sprintf_putch.0>:
    80004cce:	7179                	addi	sp,sp,-48
    80004cd0:	87aa                	mv	a5,a0
    80004cd2:	e82e                	sd	a1,16(sp)
    80004cd4:	ce3e                	sw	a5,28(sp)
    80004cd6:	e41e                	sd	t2,8(sp)
    80004cd8:	67c2                	ld	a5,16(sp)
    80004cda:	f43e                	sd	a5,40(sp)
    80004cdc:	77a2                	ld	a5,40(sp)
    80004cde:	639c                	ld	a5,0(a5)
    80004ce0:	4772                	lw	a4,28(sp)
    80004ce2:	0ff77713          	zext.b	a4,a4
    80004ce6:	00e78023          	sb	a4,0(a5)
    80004cea:	77a2                	ld	a5,40(sp)
    80004cec:	639c                	ld	a5,0(a5)
    80004cee:	00178713          	addi	a4,a5,1
    80004cf2:	77a2                	ld	a5,40(sp)
    80004cf4:	e398                	sd	a4,0(a5)
    80004cf6:	0001                	nop
    80004cf8:	6145                	addi	sp,sp,48
    80004cfa:	8082                	ret

0000000080004cfc <sprintf>:
    80004cfc:	716d                	addi	sp,sp,-272
    80004cfe:	ed86                	sd	ra,216(sp)
    80004d00:	ec2a                	sd	a0,24(sp)
    80004d02:	e82e                	sd	a1,16(sp)
    80004d04:	f1b2                	sd	a2,224(sp)
    80004d06:	f5b6                	sd	a3,232(sp)
    80004d08:	f9ba                	sd	a4,240(sp)
    80004d0a:	fdbe                	sd	a5,248(sp)
    80004d0c:	e242                	sd	a6,256(sp)
    80004d0e:	e646                	sd	a7,264(sp)
    80004d10:	0a1c                	addi	a5,sp,272
    80004d12:	e43e                	sd	a5,8(sp)
    80004d14:	67a2                	ld	a5,8(sp)
    80004d16:	fd3e                	sd	a5,184(sp)
    80004d18:	103c                	addi	a5,sp,40
    80004d1a:	1038                	addi	a4,sp,40
    80004d1c:	39700693          	li	a3,919
    80004d20:	c394                	sw	a3,0(a5)
    80004d22:	0183b6b7          	lui	a3,0x183b
    80004d26:	28368693          	addi	a3,a3,643 # 183b283 <_HEAP_SIZE+0x183a283>
    80004d2a:	c3d4                	sw	a3,4(a5)
    80004d2c:	0103b6b7          	lui	a3,0x103b
    80004d30:	38368693          	addi	a3,a3,899 # 103b383 <_HEAP_SIZE+0x103a383>
    80004d34:	c794                	sw	a3,8(a5)
    80004d36:	000286b7          	lui	a3,0x28
    80004d3a:	06768693          	addi	a3,a3,103 # 28067 <_HEAP_SIZE+0x27067>
    80004d3e:	c7d4                	sw	a3,12(a5)
    80004d40:	eb98                	sd	a4,16(a5)
    80004d42:	00000717          	auipc	a4,0x0
    80004d46:	f8c70713          	addi	a4,a4,-116 # 80004cce <sprintf_putch.0>
    80004d4a:	ef98                	sd	a4,24(a5)
    80004d4c:	0000100f          	fence.i
    80004d50:	67e2                	ld	a5,24(sp)
    80004d52:	e5be                	sd	a5,200(sp)
    80004d54:	0a1c                	addi	a5,sp,272
    80004d56:	e43e                	sd	a5,8(sp)
    80004d58:	67a2                	ld	a5,8(sp)
    80004d5a:	fd078793          	addi	a5,a5,-48
    80004d5e:	e1be                	sd	a5,192(sp)
    80004d60:	670e                	ld	a4,192(sp)
    80004d62:	103c                	addi	a5,sp,40
    80004d64:	853e                	mv	a0,a5
    80004d66:	083c                	addi	a5,sp,24
    80004d68:	86ba                	mv	a3,a4
    80004d6a:	6642                	ld	a2,16(sp)
    80004d6c:	85be                	mv	a1,a5
    80004d6e:	c7bff0ef          	jal	ra,800049e8 <vFormatPrintString>
    80004d72:	67e2                	ld	a5,24(sp)
    80004d74:	00078023          	sb	zero,0(a5)
    80004d78:	6762                	ld	a4,24(sp)
    80004d7a:	67ae                	ld	a5,200(sp)
    80004d7c:	40f707b3          	sub	a5,a4,a5
    80004d80:	2781                	sext.w	a5,a5
    80004d82:	853e                	mv	a0,a5
    80004d84:	60ee                	ld	ra,216(sp)
    80004d86:	6151                	addi	sp,sp,272
    80004d88:	8082                	ret

0000000080004d8a <main>:
    80004d8a:	1101                	addi	sp,sp,-32
    80004d8c:	ec06                	sd	ra,24(sp)
    80004d8e:	e402                	sd	zero,8(sp)
    80004d90:	132000ef          	jal	ra,80004ec2 <vCreateBlockTimeTasks>
    80004d94:	7a4000ef          	jal	ra,80005538 <vStartCountingSemaphoreTasks>
    80004d98:	2ad000ef          	jal	ra,80005844 <vStartRecursiveMutexTasks>
    80004d9c:	00000717          	auipc	a4,0x0
    80004da0:	04870713          	addi	a4,a4,72 # 80004de4 <prvCheckTimerCallback>
    80004da4:	4681                	li	a3,0
    80004da6:	4605                	li	a2,1
    80004da8:	6785                	lui	a5,0x1
    80004daa:	bb878593          	addi	a1,a5,-1096 # bb8 <_HEAP_SIZE-0x448>
    80004dae:	0001b517          	auipc	a0,0x1b
    80004db2:	43a50513          	addi	a0,a0,1082 # 800201e8 <__rodata_start+0x1e8>
    80004db6:	ffafe0ef          	jal	ra,800035b0 <xTimerCreate>
    80004dba:	e42a                	sd	a0,8(sp)
    80004dbc:	67a2                	ld	a5,8(sp)
    80004dbe:	cf81                	beqz	a5,80004dd6 <main+0x4c>
    80004dc0:	86efd0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80004dc4:	87aa                	mv	a5,a0
    80004dc6:	2781                	sext.w	a5,a5
    80004dc8:	4701                	li	a4,0
    80004dca:	4681                	li	a3,0
    80004dcc:	863e                	mv	a2,a5
    80004dce:	4585                	li	a1,1
    80004dd0:	6522                	ld	a0,8(sp)
    80004dd2:	849fe0ef          	jal	ra,8000361a <xTimerGenericCommand>
    80004dd6:	e4ffc0ef          	jal	ra,80001c24 <vTaskStartScheduler>
    80004dda:	4781                	li	a5,0
    80004ddc:	853e                	mv	a0,a5
    80004dde:	60e2                	ld	ra,24(sp)
    80004de0:	6105                	addi	sp,sp,32
    80004de2:	8082                	ret

0000000080004de4 <prvCheckTimerCallback>:
    80004de4:	7179                	addi	sp,sp,-48
    80004de6:	f406                	sd	ra,40(sp)
    80004de8:	e42a                	sd	a0,8(sp)
    80004dea:	ec02                	sd	zero,24(sp)
    80004dec:	6d0000ef          	jal	ra,800054bc <xAreBlockTimeTestTasksStillRunning>
    80004df0:	872a                	mv	a4,a0
    80004df2:	4785                	li	a5,1
    80004df4:	00f70c63          	beq	a4,a5,80004e0c <prvCheckTimerCallback+0x28>
    80004df8:	0001b517          	auipc	a0,0x1b
    80004dfc:	40050513          	addi	a0,a0,1024 # 800201f8 <__rodata_start+0x1f8>
    80004e00:	e91ff0ef          	jal	ra,80004c90 <printf>
    80004e04:	67e2                	ld	a5,24(sp)
    80004e06:	0027e793          	ori	a5,a5,2
    80004e0a:	ec3e                	sd	a5,24(sp)
    80004e0c:	1bd000ef          	jal	ra,800057c8 <xAreCountingSemaphoreTasksStillRunning>
    80004e10:	872a                	mv	a4,a0
    80004e12:	4785                	li	a5,1
    80004e14:	00f70c63          	beq	a4,a5,80004e2c <prvCheckTimerCallback+0x48>
    80004e18:	0001b517          	auipc	a0,0x1b
    80004e1c:	40850513          	addi	a0,a0,1032 # 80020220 <__rodata_start+0x220>
    80004e20:	e71ff0ef          	jal	ra,80004c90 <printf>
    80004e24:	67e2                	ld	a5,24(sp)
    80004e26:	0047e793          	ori	a5,a5,4
    80004e2a:	ec3e                	sd	a5,24(sp)
    80004e2c:	623000ef          	jal	ra,80005c4e <xAreRecursiveMutexTasksStillRunning>
    80004e30:	872a                	mv	a4,a0
    80004e32:	4785                	li	a5,1
    80004e34:	00f70c63          	beq	a4,a5,80004e4c <prvCheckTimerCallback+0x68>
    80004e38:	0001b517          	auipc	a0,0x1b
    80004e3c:	41050513          	addi	a0,a0,1040 # 80020248 <__rodata_start+0x248>
    80004e40:	e51ff0ef          	jal	ra,80004c90 <printf>
    80004e44:	67e2                	ld	a5,24(sp)
    80004e46:	0087e793          	ori	a5,a5,8
    80004e4a:	ec3e                	sd	a5,24(sp)
    80004e4c:	67e2                	ld	a5,24(sp)
    80004e4e:	cf99                	beqz	a5,80004e6c <prvCheckTimerCallback+0x88>
    80004e50:	0005ffb7          	lui	t6,0x5f
    80004e54:	77ff8f9b          	addiw	t6,t6,1919
    80004e58:	0fb6                	slli	t6,t6,0xd
    80004e5a:	eadf8f93          	addi	t6,t6,-339 # 5eead <_HEAP_SIZE+0x5dead>
    80004e5e:	0001b517          	auipc	a0,0x1b
    80004e62:	41250513          	addi	a0,a0,1042 # 80020270 <__rodata_start+0x270>
    80004e66:	e2bff0ef          	jal	ra,80004c90 <printf>
    80004e6a:	a82d                	j	80004ea4 <prvCheckTimerCallback+0xc0>
    80004e6c:	00038fb7          	lui	t6,0x38
    80004e70:	ab7f8f9b          	addiw	t6,t6,-1353
    80004e74:	0fba                	slli	t6,t6,0xe
    80004e76:	eeff8f93          	addi	t6,t6,-273 # 37eef <_HEAP_SIZE+0x36eef>
    80004e7a:	00035797          	auipc	a5,0x35
    80004e7e:	a4678793          	addi	a5,a5,-1466 # 800398c0 <count.0>
    80004e82:	439c                	lw	a5,0(a5)
    80004e84:	0017871b          	addiw	a4,a5,1
    80004e88:	0007069b          	sext.w	a3,a4
    80004e8c:	00035717          	auipc	a4,0x35
    80004e90:	a3470713          	addi	a4,a4,-1484 # 800398c0 <count.0>
    80004e94:	c314                	sw	a3,0(a4)
    80004e96:	85be                	mv	a1,a5
    80004e98:	0001b517          	auipc	a0,0x1b
    80004e9c:	40050513          	addi	a0,a0,1024 # 80020298 <__rodata_start+0x298>
    80004ea0:	df1ff0ef          	jal	ra,80004c90 <printf>
    80004ea4:	0001                	nop
    80004ea6:	70a2                	ld	ra,40(sp)
    80004ea8:	6145                	addi	sp,sp,48
    80004eaa:	8082                	ret

0000000080004eac <vApplicationMallocFailedHook>:
    80004eac:	30047073          	csrci	mstatus,8
    80004eb0:	a001                	j	80004eb0 <vApplicationMallocFailedHook+0x4>

0000000080004eb2 <vApplicationIdleHook>:
    80004eb2:	0001                	nop
    80004eb4:	8082                	ret

0000000080004eb6 <vApplicationStackOverflowHook>:
    80004eb6:	1141                	addi	sp,sp,-16
    80004eb8:	e42a                	sd	a0,8(sp)
    80004eba:	e02e                	sd	a1,0(sp)
    80004ebc:	30047073          	csrci	mstatus,8
    80004ec0:	a001                	j	80004ec0 <vApplicationStackOverflowHook+0xa>

0000000080004ec2 <vCreateBlockTimeTasks>:
    80004ec2:	1141                	addi	sp,sp,-16
    80004ec4:	e406                	sd	ra,8(sp)
    80004ec6:	4601                	li	a2,0
    80004ec8:	45a1                	li	a1,8
    80004eca:	4515                	li	a0,5
    80004ecc:	8d9fb0ef          	jal	ra,800007a4 <xQueueGenericCreate>
    80004ed0:	872a                	mv	a4,a0
    80004ed2:	00035797          	auipc	a5,0x35
    80004ed6:	9f678793          	addi	a5,a5,-1546 # 800398c8 <xTestQueue>
    80004eda:	e398                	sd	a4,0(a5)
    80004edc:	00035797          	auipc	a5,0x35
    80004ee0:	9ec78793          	addi	a5,a5,-1556 # 800398c8 <xTestQueue>
    80004ee4:	639c                	ld	a5,0(a5)
    80004ee6:	0001b597          	auipc	a1,0x1b
    80004eea:	3da58593          	addi	a1,a1,986 # 800202c0 <__rodata_start+0x2c0>
    80004eee:	853e                	mv	a0,a5
    80004ef0:	b92fc0ef          	jal	ra,80001282 <vQueueAddToRegistry>
    80004ef4:	4881                	li	a7,0
    80004ef6:	4801                	li	a6,0
    80004ef8:	4781                	li	a5,0
    80004efa:	4709                	li	a4,2
    80004efc:	4681                	li	a3,0
    80004efe:	40000613          	li	a2,1024
    80004f02:	0001b597          	auipc	a1,0x1b
    80004f06:	3d658593          	addi	a1,a1,982 # 800202d8 <__rodata_start+0x2d8>
    80004f0a:	00000517          	auipc	a0,0x0
    80004f0e:	03c50513          	addi	a0,a0,60 # 80004f46 <vPrimaryBlockTimeTestTask>
    80004f12:	c6efc0ef          	jal	ra,80001380 <xTaskGenericCreate>
    80004f16:	4881                	li	a7,0
    80004f18:	4801                	li	a6,0
    80004f1a:	00035797          	auipc	a5,0x35
    80004f1e:	9b678793          	addi	a5,a5,-1610 # 800398d0 <xSecondary>
    80004f22:	4705                	li	a4,1
    80004f24:	4681                	li	a3,0
    80004f26:	40000613          	li	a2,1024
    80004f2a:	0001b597          	auipc	a1,0x1b
    80004f2e:	3b658593          	addi	a1,a1,950 # 800202e0 <__rodata_start+0x2e0>
    80004f32:	00000517          	auipc	a0,0x0
    80004f36:	43c50513          	addi	a0,a0,1084 # 8000536e <vSecondaryBlockTimeTestTask>
    80004f3a:	c46fc0ef          	jal	ra,80001380 <xTaskGenericCreate>
    80004f3e:	0001                	nop
    80004f40:	60a2                	ld	ra,8(sp)
    80004f42:	0141                	addi	sp,sp,16
    80004f44:	8082                	ret

0000000080004f46 <vPrimaryBlockTimeTestTask>:
    80004f46:	7139                	addi	sp,sp,-64
    80004f48:	fc06                	sd	ra,56(sp)
    80004f4a:	e42a                	sd	a0,8(sp)
    80004f4c:	ec02                	sd	zero,24(sp)
    80004f4e:	a069                	j	80004fd8 <vPrimaryBlockTimeTestTask+0x92>
    80004f50:	67e2                	ld	a5,24(sp)
    80004f52:	2781                	sext.w	a5,a5
    80004f54:	4729                	li	a4,10
    80004f56:	00f717bb          	sllw	a5,a4,a5
    80004f5a:	2781                	sext.w	a5,a5
    80004f5c:	d63e                	sw	a5,44(sp)
    80004f5e:	ed1fc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80004f62:	87aa                	mv	a5,a0
    80004f64:	d43e                	sw	a5,40(sp)
    80004f66:	00035797          	auipc	a5,0x35
    80004f6a:	96278793          	addi	a5,a5,-1694 # 800398c8 <xTestQueue>
    80004f6e:	639c                	ld	a5,0(a5)
    80004f70:	5632                	lw	a2,44(sp)
    80004f72:	0818                	addi	a4,sp,16
    80004f74:	4681                	li	a3,0
    80004f76:	85ba                	mv	a1,a4
    80004f78:	853e                	mv	a0,a5
    80004f7a:	d33fb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80004f7e:	87aa                	mv	a5,a0
    80004f80:	c799                	beqz	a5,80004f8e <vPrimaryBlockTimeTestTask+0x48>
    80004f82:	00035797          	auipc	a5,0x35
    80004f86:	96678793          	addi	a5,a5,-1690 # 800398e8 <xErrorOccurred>
    80004f8a:	4705                	li	a4,1
    80004f8c:	e398                	sd	a4,0(a5)
    80004f8e:	ea1fc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80004f92:	87aa                	mv	a5,a0
    80004f94:	2781                	sext.w	a5,a5
    80004f96:	5722                	lw	a4,40(sp)
    80004f98:	9f99                	subw	a5,a5,a4
    80004f9a:	d23e                	sw	a5,36(sp)
    80004f9c:	5792                	lw	a5,36(sp)
    80004f9e:	873e                	mv	a4,a5
    80004fa0:	57b2                	lw	a5,44(sp)
    80004fa2:	2701                	sext.w	a4,a4
    80004fa4:	2781                	sext.w	a5,a5
    80004fa6:	00f77863          	bgeu	a4,a5,80004fb6 <vPrimaryBlockTimeTestTask+0x70>
    80004faa:	00035797          	auipc	a5,0x35
    80004fae:	93e78793          	addi	a5,a5,-1730 # 800398e8 <xErrorOccurred>
    80004fb2:	4705                	li	a4,1
    80004fb4:	e398                	sd	a4,0(a5)
    80004fb6:	57b2                	lw	a5,44(sp)
    80004fb8:	27bd                	addiw	a5,a5,15
    80004fba:	0007871b          	sext.w	a4,a5
    80004fbe:	5792                	lw	a5,36(sp)
    80004fc0:	2781                	sext.w	a5,a5
    80004fc2:	00f77863          	bgeu	a4,a5,80004fd2 <vPrimaryBlockTimeTestTask+0x8c>
    80004fc6:	00035797          	auipc	a5,0x35
    80004fca:	92278793          	addi	a5,a5,-1758 # 800398e8 <xErrorOccurred>
    80004fce:	4705                	li	a4,1
    80004fd0:	e398                	sd	a4,0(a5)
    80004fd2:	67e2                	ld	a5,24(sp)
    80004fd4:	0785                	addi	a5,a5,1
    80004fd6:	ec3e                	sd	a5,24(sp)
    80004fd8:	6762                	ld	a4,24(sp)
    80004fda:	4791                	li	a5,4
    80004fdc:	f6e7dae3          	bge	a5,a4,80004f50 <vPrimaryBlockTimeTestTask+0xa>
    80004fe0:	ec02                	sd	zero,24(sp)
    80004fe2:	a815                	j	80005016 <vPrimaryBlockTimeTestTask+0xd0>
    80004fe4:	00035797          	auipc	a5,0x35
    80004fe8:	8e478793          	addi	a5,a5,-1820 # 800398c8 <xTestQueue>
    80004fec:	639c                	ld	a5,0(a5)
    80004fee:	0838                	addi	a4,sp,24
    80004ff0:	4681                	li	a3,0
    80004ff2:	4601                	li	a2,0
    80004ff4:	85ba                	mv	a1,a4
    80004ff6:	853e                	mv	a0,a5
    80004ff8:	9c9fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80004ffc:	872a                	mv	a4,a0
    80004ffe:	4785                	li	a5,1
    80005000:	00f70863          	beq	a4,a5,80005010 <vPrimaryBlockTimeTestTask+0xca>
    80005004:	00035797          	auipc	a5,0x35
    80005008:	8e478793          	addi	a5,a5,-1820 # 800398e8 <xErrorOccurred>
    8000500c:	4705                	li	a4,1
    8000500e:	e398                	sd	a4,0(a5)
    80005010:	67e2                	ld	a5,24(sp)
    80005012:	0785                	addi	a5,a5,1
    80005014:	ec3e                	sd	a5,24(sp)
    80005016:	6762                	ld	a4,24(sp)
    80005018:	4791                	li	a5,4
    8000501a:	fce7d5e3          	bge	a5,a4,80004fe4 <vPrimaryBlockTimeTestTask+0x9e>
    8000501e:	ec02                	sd	zero,24(sp)
    80005020:	a069                	j	800050aa <vPrimaryBlockTimeTestTask+0x164>
    80005022:	67e2                	ld	a5,24(sp)
    80005024:	2781                	sext.w	a5,a5
    80005026:	4729                	li	a4,10
    80005028:	00f717bb          	sllw	a5,a4,a5
    8000502c:	2781                	sext.w	a5,a5
    8000502e:	d63e                	sw	a5,44(sp)
    80005030:	dfffc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80005034:	87aa                	mv	a5,a0
    80005036:	d43e                	sw	a5,40(sp)
    80005038:	00035797          	auipc	a5,0x35
    8000503c:	89078793          	addi	a5,a5,-1904 # 800398c8 <xTestQueue>
    80005040:	639c                	ld	a5,0(a5)
    80005042:	5632                	lw	a2,44(sp)
    80005044:	0838                	addi	a4,sp,24
    80005046:	4681                	li	a3,0
    80005048:	85ba                	mv	a1,a4
    8000504a:	853e                	mv	a0,a5
    8000504c:	975fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005050:	87aa                	mv	a5,a0
    80005052:	c799                	beqz	a5,80005060 <vPrimaryBlockTimeTestTask+0x11a>
    80005054:	00035797          	auipc	a5,0x35
    80005058:	89478793          	addi	a5,a5,-1900 # 800398e8 <xErrorOccurred>
    8000505c:	4705                	li	a4,1
    8000505e:	e398                	sd	a4,0(a5)
    80005060:	dcffc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80005064:	87aa                	mv	a5,a0
    80005066:	2781                	sext.w	a5,a5
    80005068:	5722                	lw	a4,40(sp)
    8000506a:	9f99                	subw	a5,a5,a4
    8000506c:	d23e                	sw	a5,36(sp)
    8000506e:	5792                	lw	a5,36(sp)
    80005070:	873e                	mv	a4,a5
    80005072:	57b2                	lw	a5,44(sp)
    80005074:	2701                	sext.w	a4,a4
    80005076:	2781                	sext.w	a5,a5
    80005078:	00f77863          	bgeu	a4,a5,80005088 <vPrimaryBlockTimeTestTask+0x142>
    8000507c:	00035797          	auipc	a5,0x35
    80005080:	86c78793          	addi	a5,a5,-1940 # 800398e8 <xErrorOccurred>
    80005084:	4705                	li	a4,1
    80005086:	e398                	sd	a4,0(a5)
    80005088:	57b2                	lw	a5,44(sp)
    8000508a:	27bd                	addiw	a5,a5,15
    8000508c:	0007871b          	sext.w	a4,a5
    80005090:	5792                	lw	a5,36(sp)
    80005092:	2781                	sext.w	a5,a5
    80005094:	00f77863          	bgeu	a4,a5,800050a4 <vPrimaryBlockTimeTestTask+0x15e>
    80005098:	00035797          	auipc	a5,0x35
    8000509c:	85078793          	addi	a5,a5,-1968 # 800398e8 <xErrorOccurred>
    800050a0:	4705                	li	a4,1
    800050a2:	e398                	sd	a4,0(a5)
    800050a4:	67e2                	ld	a5,24(sp)
    800050a6:	0785                	addi	a5,a5,1
    800050a8:	ec3e                	sd	a5,24(sp)
    800050aa:	6762                	ld	a4,24(sp)
    800050ac:	4791                	li	a5,4
    800050ae:	f6e7dae3          	bge	a5,a4,80005022 <vPrimaryBlockTimeTestTask+0xdc>
    800050b2:	00035797          	auipc	a5,0x35
    800050b6:	83e78793          	addi	a5,a5,-1986 # 800398f0 <xRunIndicator>
    800050ba:	0007b023          	sd	zero,0(a5)
    800050be:	00035797          	auipc	a5,0x35
    800050c2:	81278793          	addi	a5,a5,-2030 # 800398d0 <xSecondary>
    800050c6:	639c                	ld	a5,0(a5)
    800050c8:	853e                	mv	a0,a5
    800050ca:	9ebfc0ef          	jal	ra,80001ab4 <vTaskResume>
    800050ce:	a021                	j	800050d6 <vPrimaryBlockTimeTestTask+0x190>
    800050d0:	4551                	li	a0,20
    800050d2:	df8fc0ef          	jal	ra,800016ca <vTaskDelay>
    800050d6:	00035797          	auipc	a5,0x35
    800050da:	81a78793          	addi	a5,a5,-2022 # 800398f0 <xRunIndicator>
    800050de:	6398                	ld	a4,0(a5)
    800050e0:	05500793          	li	a5,85
    800050e4:	fef716e3          	bne	a4,a5,800050d0 <vPrimaryBlockTimeTestTask+0x18a>
    800050e8:	4551                	li	a0,20
    800050ea:	de0fc0ef          	jal	ra,800016ca <vTaskDelay>
    800050ee:	00035797          	auipc	a5,0x35
    800050f2:	80278793          	addi	a5,a5,-2046 # 800398f0 <xRunIndicator>
    800050f6:	0007b023          	sd	zero,0(a5)
    800050fa:	ec02                	sd	zero,24(sp)
    800050fc:	a0c1                	j	800051bc <vPrimaryBlockTimeTestTask+0x276>
    800050fe:	00034797          	auipc	a5,0x34
    80005102:	7ca78793          	addi	a5,a5,1994 # 800398c8 <xTestQueue>
    80005106:	639c                	ld	a5,0(a5)
    80005108:	0818                	addi	a4,sp,16
    8000510a:	4681                	li	a3,0
    8000510c:	4601                	li	a2,0
    8000510e:	85ba                	mv	a1,a4
    80005110:	853e                	mv	a0,a5
    80005112:	b9bfb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80005116:	872a                	mv	a4,a0
    80005118:	4785                	li	a5,1
    8000511a:	00f70863          	beq	a4,a5,8000512a <vPrimaryBlockTimeTestTask+0x1e4>
    8000511e:	00034797          	auipc	a5,0x34
    80005122:	7ca78793          	addi	a5,a5,1994 # 800398e8 <xErrorOccurred>
    80005126:	4705                	li	a4,1
    80005128:	e398                	sd	a4,0(a5)
    8000512a:	00034797          	auipc	a5,0x34
    8000512e:	79e78793          	addi	a5,a5,1950 # 800398c8 <xTestQueue>
    80005132:	639c                	ld	a5,0(a5)
    80005134:	0838                	addi	a4,sp,24
    80005136:	4681                	li	a3,0
    80005138:	4601                	li	a2,0
    8000513a:	85ba                	mv	a1,a4
    8000513c:	853e                	mv	a0,a5
    8000513e:	883fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005142:	872a                	mv	a4,a0
    80005144:	4785                	li	a5,1
    80005146:	00f70863          	beq	a4,a5,80005156 <vPrimaryBlockTimeTestTask+0x210>
    8000514a:	00034797          	auipc	a5,0x34
    8000514e:	79e78793          	addi	a5,a5,1950 # 800398e8 <xErrorOccurred>
    80005152:	4705                	li	a4,1
    80005154:	e398                	sd	a4,0(a5)
    80005156:	00034797          	auipc	a5,0x34
    8000515a:	79a78793          	addi	a5,a5,1946 # 800398f0 <xRunIndicator>
    8000515e:	6398                	ld	a4,0(a5)
    80005160:	05500793          	li	a5,85
    80005164:	00f71863          	bne	a4,a5,80005174 <vPrimaryBlockTimeTestTask+0x22e>
    80005168:	00034797          	auipc	a5,0x34
    8000516c:	78078793          	addi	a5,a5,1920 # 800398e8 <xErrorOccurred>
    80005170:	4705                	li	a4,1
    80005172:	e398                	sd	a4,0(a5)
    80005174:	00034797          	auipc	a5,0x34
    80005178:	75c78793          	addi	a5,a5,1884 # 800398d0 <xSecondary>
    8000517c:	639c                	ld	a5,0(a5)
    8000517e:	4591                	li	a1,4
    80005180:	853e                	mv	a0,a5
    80005182:	ebcfc0ef          	jal	ra,8000183e <vTaskPrioritySet>
    80005186:	00034797          	auipc	a5,0x34
    8000518a:	76a78793          	addi	a5,a5,1898 # 800398f0 <xRunIndicator>
    8000518e:	6398                	ld	a4,0(a5)
    80005190:	05500793          	li	a5,85
    80005194:	00f71863          	bne	a4,a5,800051a4 <vPrimaryBlockTimeTestTask+0x25e>
    80005198:	00034797          	auipc	a5,0x34
    8000519c:	75078793          	addi	a5,a5,1872 # 800398e8 <xErrorOccurred>
    800051a0:	4705                	li	a4,1
    800051a2:	e398                	sd	a4,0(a5)
    800051a4:	00034797          	auipc	a5,0x34
    800051a8:	72c78793          	addi	a5,a5,1836 # 800398d0 <xSecondary>
    800051ac:	639c                	ld	a5,0(a5)
    800051ae:	4585                	li	a1,1
    800051b0:	853e                	mv	a0,a5
    800051b2:	e8cfc0ef          	jal	ra,8000183e <vTaskPrioritySet>
    800051b6:	67e2                	ld	a5,24(sp)
    800051b8:	0785                	addi	a5,a5,1
    800051ba:	ec3e                	sd	a5,24(sp)
    800051bc:	6762                	ld	a4,24(sp)
    800051be:	4791                	li	a5,4
    800051c0:	f2e7dfe3          	bge	a5,a4,800050fe <vPrimaryBlockTimeTestTask+0x1b8>
    800051c4:	a021                	j	800051cc <vPrimaryBlockTimeTestTask+0x286>
    800051c6:	4551                	li	a0,20
    800051c8:	d02fc0ef          	jal	ra,800016ca <vTaskDelay>
    800051cc:	00034797          	auipc	a5,0x34
    800051d0:	72478793          	addi	a5,a5,1828 # 800398f0 <xRunIndicator>
    800051d4:	6398                	ld	a4,0(a5)
    800051d6:	05500793          	li	a5,85
    800051da:	fef716e3          	bne	a4,a5,800051c6 <vPrimaryBlockTimeTestTask+0x280>
    800051de:	4551                	li	a0,20
    800051e0:	ceafc0ef          	jal	ra,800016ca <vTaskDelay>
    800051e4:	00034797          	auipc	a5,0x34
    800051e8:	70c78793          	addi	a5,a5,1804 # 800398f0 <xRunIndicator>
    800051ec:	0007b023          	sd	zero,0(a5)
    800051f0:	ec02                	sd	zero,24(sp)
    800051f2:	a815                	j	80005226 <vPrimaryBlockTimeTestTask+0x2e0>
    800051f4:	00034797          	auipc	a5,0x34
    800051f8:	6d478793          	addi	a5,a5,1748 # 800398c8 <xTestQueue>
    800051fc:	639c                	ld	a5,0(a5)
    800051fe:	0818                	addi	a4,sp,16
    80005200:	4681                	li	a3,0
    80005202:	4601                	li	a2,0
    80005204:	85ba                	mv	a1,a4
    80005206:	853e                	mv	a0,a5
    80005208:	aa5fb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    8000520c:	872a                	mv	a4,a0
    8000520e:	4785                	li	a5,1
    80005210:	00f70863          	beq	a4,a5,80005220 <vPrimaryBlockTimeTestTask+0x2da>
    80005214:	00034797          	auipc	a5,0x34
    80005218:	6d478793          	addi	a5,a5,1748 # 800398e8 <xErrorOccurred>
    8000521c:	4705                	li	a4,1
    8000521e:	e398                	sd	a4,0(a5)
    80005220:	67e2                	ld	a5,24(sp)
    80005222:	0785                	addi	a5,a5,1
    80005224:	ec3e                	sd	a5,24(sp)
    80005226:	6762                	ld	a4,24(sp)
    80005228:	4791                	li	a5,4
    8000522a:	fce7d5e3          	bge	a5,a4,800051f4 <vPrimaryBlockTimeTestTask+0x2ae>
    8000522e:	00034797          	auipc	a5,0x34
    80005232:	6a278793          	addi	a5,a5,1698 # 800398d0 <xSecondary>
    80005236:	639c                	ld	a5,0(a5)
    80005238:	853e                	mv	a0,a5
    8000523a:	87bfc0ef          	jal	ra,80001ab4 <vTaskResume>
    8000523e:	a021                	j	80005246 <vPrimaryBlockTimeTestTask+0x300>
    80005240:	4551                	li	a0,20
    80005242:	c88fc0ef          	jal	ra,800016ca <vTaskDelay>
    80005246:	00034797          	auipc	a5,0x34
    8000524a:	6aa78793          	addi	a5,a5,1706 # 800398f0 <xRunIndicator>
    8000524e:	6398                	ld	a4,0(a5)
    80005250:	05500793          	li	a5,85
    80005254:	fef716e3          	bne	a4,a5,80005240 <vPrimaryBlockTimeTestTask+0x2fa>
    80005258:	4551                	li	a0,20
    8000525a:	c70fc0ef          	jal	ra,800016ca <vTaskDelay>
    8000525e:	00034797          	auipc	a5,0x34
    80005262:	69278793          	addi	a5,a5,1682 # 800398f0 <xRunIndicator>
    80005266:	0007b023          	sd	zero,0(a5)
    8000526a:	ec02                	sd	zero,24(sp)
    8000526c:	a0c1                	j	8000532c <vPrimaryBlockTimeTestTask+0x3e6>
    8000526e:	00034797          	auipc	a5,0x34
    80005272:	65a78793          	addi	a5,a5,1626 # 800398c8 <xTestQueue>
    80005276:	639c                	ld	a5,0(a5)
    80005278:	0838                	addi	a4,sp,24
    8000527a:	4681                	li	a3,0
    8000527c:	4601                	li	a2,0
    8000527e:	85ba                	mv	a1,a4
    80005280:	853e                	mv	a0,a5
    80005282:	f3efb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005286:	872a                	mv	a4,a0
    80005288:	4785                	li	a5,1
    8000528a:	00f70863          	beq	a4,a5,8000529a <vPrimaryBlockTimeTestTask+0x354>
    8000528e:	00034797          	auipc	a5,0x34
    80005292:	65a78793          	addi	a5,a5,1626 # 800398e8 <xErrorOccurred>
    80005296:	4705                	li	a4,1
    80005298:	e398                	sd	a4,0(a5)
    8000529a:	00034797          	auipc	a5,0x34
    8000529e:	62e78793          	addi	a5,a5,1582 # 800398c8 <xTestQueue>
    800052a2:	639c                	ld	a5,0(a5)
    800052a4:	0818                	addi	a4,sp,16
    800052a6:	4681                	li	a3,0
    800052a8:	4601                	li	a2,0
    800052aa:	85ba                	mv	a1,a4
    800052ac:	853e                	mv	a0,a5
    800052ae:	9fffb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    800052b2:	872a                	mv	a4,a0
    800052b4:	4785                	li	a5,1
    800052b6:	00f70863          	beq	a4,a5,800052c6 <vPrimaryBlockTimeTestTask+0x380>
    800052ba:	00034797          	auipc	a5,0x34
    800052be:	62e78793          	addi	a5,a5,1582 # 800398e8 <xErrorOccurred>
    800052c2:	4705                	li	a4,1
    800052c4:	e398                	sd	a4,0(a5)
    800052c6:	00034797          	auipc	a5,0x34
    800052ca:	62a78793          	addi	a5,a5,1578 # 800398f0 <xRunIndicator>
    800052ce:	6398                	ld	a4,0(a5)
    800052d0:	05500793          	li	a5,85
    800052d4:	00f71863          	bne	a4,a5,800052e4 <vPrimaryBlockTimeTestTask+0x39e>
    800052d8:	00034797          	auipc	a5,0x34
    800052dc:	61078793          	addi	a5,a5,1552 # 800398e8 <xErrorOccurred>
    800052e0:	4705                	li	a4,1
    800052e2:	e398                	sd	a4,0(a5)
    800052e4:	00034797          	auipc	a5,0x34
    800052e8:	5ec78793          	addi	a5,a5,1516 # 800398d0 <xSecondary>
    800052ec:	639c                	ld	a5,0(a5)
    800052ee:	4591                	li	a1,4
    800052f0:	853e                	mv	a0,a5
    800052f2:	d4cfc0ef          	jal	ra,8000183e <vTaskPrioritySet>
    800052f6:	00034797          	auipc	a5,0x34
    800052fa:	5fa78793          	addi	a5,a5,1530 # 800398f0 <xRunIndicator>
    800052fe:	6398                	ld	a4,0(a5)
    80005300:	05500793          	li	a5,85
    80005304:	00f71863          	bne	a4,a5,80005314 <vPrimaryBlockTimeTestTask+0x3ce>
    80005308:	00034797          	auipc	a5,0x34
    8000530c:	5e078793          	addi	a5,a5,1504 # 800398e8 <xErrorOccurred>
    80005310:	4705                	li	a4,1
    80005312:	e398                	sd	a4,0(a5)
    80005314:	00034797          	auipc	a5,0x34
    80005318:	5bc78793          	addi	a5,a5,1468 # 800398d0 <xSecondary>
    8000531c:	639c                	ld	a5,0(a5)
    8000531e:	4585                	li	a1,1
    80005320:	853e                	mv	a0,a5
    80005322:	d1cfc0ef          	jal	ra,8000183e <vTaskPrioritySet>
    80005326:	67e2                	ld	a5,24(sp)
    80005328:	0785                	addi	a5,a5,1
    8000532a:	ec3e                	sd	a5,24(sp)
    8000532c:	6762                	ld	a4,24(sp)
    8000532e:	4791                	li	a5,4
    80005330:	f2e7dfe3          	bge	a5,a4,8000526e <vPrimaryBlockTimeTestTask+0x328>
    80005334:	a021                	j	8000533c <vPrimaryBlockTimeTestTask+0x3f6>
    80005336:	4551                	li	a0,20
    80005338:	b92fc0ef          	jal	ra,800016ca <vTaskDelay>
    8000533c:	00034797          	auipc	a5,0x34
    80005340:	5b478793          	addi	a5,a5,1460 # 800398f0 <xRunIndicator>
    80005344:	6398                	ld	a4,0(a5)
    80005346:	05500793          	li	a5,85
    8000534a:	fef716e3          	bne	a4,a5,80005336 <vPrimaryBlockTimeTestTask+0x3f0>
    8000534e:	4551                	li	a0,20
    80005350:	b7afc0ef          	jal	ra,800016ca <vTaskDelay>
    80005354:	00034797          	auipc	a5,0x34
    80005358:	58478793          	addi	a5,a5,1412 # 800398d8 <xPrimaryCycles>
    8000535c:	639c                	ld	a5,0(a5)
    8000535e:	00178713          	addi	a4,a5,1
    80005362:	00034797          	auipc	a5,0x34
    80005366:	57678793          	addi	a5,a5,1398 # 800398d8 <xPrimaryCycles>
    8000536a:	e398                	sd	a4,0(a5)
    8000536c:	b6c5                	j	80004f4c <vPrimaryBlockTimeTestTask+0x6>

000000008000536e <vSecondaryBlockTimeTestTask>:
    8000536e:	7179                	addi	sp,sp,-48
    80005370:	f406                	sd	ra,40(sp)
    80005372:	e42a                	sd	a0,8(sp)
    80005374:	4501                	li	a0,0
    80005376:	e18fc0ef          	jal	ra,8000198e <vTaskSuspend>
    8000537a:	ab5fc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    8000537e:	87aa                	mv	a5,a0
    80005380:	ce3e                	sw	a5,28(sp)
    80005382:	e802                	sd	zero,16(sp)
    80005384:	00034797          	auipc	a5,0x34
    80005388:	56c78793          	addi	a5,a5,1388 # 800398f0 <xRunIndicator>
    8000538c:	05500713          	li	a4,85
    80005390:	e398                	sd	a4,0(a5)
    80005392:	00034797          	auipc	a5,0x34
    80005396:	53678793          	addi	a5,a5,1334 # 800398c8 <xTestQueue>
    8000539a:	639c                	ld	a5,0(a5)
    8000539c:	0818                	addi	a4,sp,16
    8000539e:	4681                	li	a3,0
    800053a0:	0af00613          	li	a2,175
    800053a4:	85ba                	mv	a1,a4
    800053a6:	853e                	mv	a0,a5
    800053a8:	e18fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    800053ac:	87aa                	mv	a5,a0
    800053ae:	c799                	beqz	a5,800053bc <vSecondaryBlockTimeTestTask+0x4e>
    800053b0:	00034797          	auipc	a5,0x34
    800053b4:	53878793          	addi	a5,a5,1336 # 800398e8 <xErrorOccurred>
    800053b8:	4705                	li	a4,1
    800053ba:	e398                	sd	a4,0(a5)
    800053bc:	a73fc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    800053c0:	87aa                	mv	a5,a0
    800053c2:	2781                	sext.w	a5,a5
    800053c4:	4772                	lw	a4,28(sp)
    800053c6:	9f99                	subw	a5,a5,a4
    800053c8:	cc3e                	sw	a5,24(sp)
    800053ca:	47e2                	lw	a5,24(sp)
    800053cc:	0007871b          	sext.w	a4,a5
    800053d0:	0ae00793          	li	a5,174
    800053d4:	00e7e863          	bltu	a5,a4,800053e4 <vSecondaryBlockTimeTestTask+0x76>
    800053d8:	00034797          	auipc	a5,0x34
    800053dc:	51078793          	addi	a5,a5,1296 # 800398e8 <xErrorOccurred>
    800053e0:	4705                	li	a4,1
    800053e2:	e398                	sd	a4,0(a5)
    800053e4:	47e2                	lw	a5,24(sp)
    800053e6:	0007871b          	sext.w	a4,a5
    800053ea:	0be00793          	li	a5,190
    800053ee:	00e7f863          	bgeu	a5,a4,800053fe <vSecondaryBlockTimeTestTask+0x90>
    800053f2:	00034797          	auipc	a5,0x34
    800053f6:	4f678793          	addi	a5,a5,1270 # 800398e8 <xErrorOccurred>
    800053fa:	4705                	li	a4,1
    800053fc:	e398                	sd	a4,0(a5)
    800053fe:	00034797          	auipc	a5,0x34
    80005402:	4f278793          	addi	a5,a5,1266 # 800398f0 <xRunIndicator>
    80005406:	05500713          	li	a4,85
    8000540a:	e398                	sd	a4,0(a5)
    8000540c:	4501                	li	a0,0
    8000540e:	d80fc0ef          	jal	ra,8000198e <vTaskSuspend>
    80005412:	a1dfc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80005416:	87aa                	mv	a5,a0
    80005418:	ce3e                	sw	a5,28(sp)
    8000541a:	00034797          	auipc	a5,0x34
    8000541e:	4d678793          	addi	a5,a5,1238 # 800398f0 <xRunIndicator>
    80005422:	05500713          	li	a4,85
    80005426:	e398                	sd	a4,0(a5)
    80005428:	00034797          	auipc	a5,0x34
    8000542c:	4a078793          	addi	a5,a5,1184 # 800398c8 <xTestQueue>
    80005430:	639c                	ld	a5,0(a5)
    80005432:	0818                	addi	a4,sp,16
    80005434:	4681                	li	a3,0
    80005436:	0af00613          	li	a2,175
    8000543a:	85ba                	mv	a1,a4
    8000543c:	853e                	mv	a0,a5
    8000543e:	86ffb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80005442:	87aa                	mv	a5,a0
    80005444:	c799                	beqz	a5,80005452 <vSecondaryBlockTimeTestTask+0xe4>
    80005446:	00034797          	auipc	a5,0x34
    8000544a:	4a278793          	addi	a5,a5,1186 # 800398e8 <xErrorOccurred>
    8000544e:	4705                	li	a4,1
    80005450:	e398                	sd	a4,0(a5)
    80005452:	9ddfc0ef          	jal	ra,80001e2e <xTaskGetTickCount>
    80005456:	87aa                	mv	a5,a0
    80005458:	2781                	sext.w	a5,a5
    8000545a:	4772                	lw	a4,28(sp)
    8000545c:	9f99                	subw	a5,a5,a4
    8000545e:	cc3e                	sw	a5,24(sp)
    80005460:	47e2                	lw	a5,24(sp)
    80005462:	0007871b          	sext.w	a4,a5
    80005466:	0ae00793          	li	a5,174
    8000546a:	00e7e863          	bltu	a5,a4,8000547a <vSecondaryBlockTimeTestTask+0x10c>
    8000546e:	00034797          	auipc	a5,0x34
    80005472:	47a78793          	addi	a5,a5,1146 # 800398e8 <xErrorOccurred>
    80005476:	4705                	li	a4,1
    80005478:	e398                	sd	a4,0(a5)
    8000547a:	47e2                	lw	a5,24(sp)
    8000547c:	0007871b          	sext.w	a4,a5
    80005480:	0be00793          	li	a5,190
    80005484:	00e7f863          	bgeu	a5,a4,80005494 <vSecondaryBlockTimeTestTask+0x126>
    80005488:	00034797          	auipc	a5,0x34
    8000548c:	46078793          	addi	a5,a5,1120 # 800398e8 <xErrorOccurred>
    80005490:	4705                	li	a4,1
    80005492:	e398                	sd	a4,0(a5)
    80005494:	00034797          	auipc	a5,0x34
    80005498:	45c78793          	addi	a5,a5,1116 # 800398f0 <xRunIndicator>
    8000549c:	05500713          	li	a4,85
    800054a0:	e398                	sd	a4,0(a5)
    800054a2:	00034797          	auipc	a5,0x34
    800054a6:	43e78793          	addi	a5,a5,1086 # 800398e0 <xSecondaryCycles>
    800054aa:	639c                	ld	a5,0(a5)
    800054ac:	00178713          	addi	a4,a5,1
    800054b0:	00034797          	auipc	a5,0x34
    800054b4:	43078793          	addi	a5,a5,1072 # 800398e0 <xSecondaryCycles>
    800054b8:	e398                	sd	a4,0(a5)
    800054ba:	bd6d                	j	80005374 <vSecondaryBlockTimeTestTask+0x6>

00000000800054bc <xAreBlockTimeTestTasksStillRunning>:
    800054bc:	1141                	addi	sp,sp,-16
    800054be:	4785                	li	a5,1
    800054c0:	e43e                	sd	a5,8(sp)
    800054c2:	00034797          	auipc	a5,0x34
    800054c6:	41678793          	addi	a5,a5,1046 # 800398d8 <xPrimaryCycles>
    800054ca:	6398                	ld	a4,0(a5)
    800054cc:	00034797          	auipc	a5,0x34
    800054d0:	42c78793          	addi	a5,a5,1068 # 800398f8 <xLastPrimaryCycleCount.1>
    800054d4:	639c                	ld	a5,0(a5)
    800054d6:	00f71363          	bne	a4,a5,800054dc <xAreBlockTimeTestTasksStillRunning+0x20>
    800054da:	e402                	sd	zero,8(sp)
    800054dc:	00034797          	auipc	a5,0x34
    800054e0:	40478793          	addi	a5,a5,1028 # 800398e0 <xSecondaryCycles>
    800054e4:	6398                	ld	a4,0(a5)
    800054e6:	00034797          	auipc	a5,0x34
    800054ea:	41a78793          	addi	a5,a5,1050 # 80039900 <xLastSecondaryCycleCount.0>
    800054ee:	639c                	ld	a5,0(a5)
    800054f0:	00f71363          	bne	a4,a5,800054f6 <xAreBlockTimeTestTasksStillRunning+0x3a>
    800054f4:	e402                	sd	zero,8(sp)
    800054f6:	00034797          	auipc	a5,0x34
    800054fa:	3f278793          	addi	a5,a5,1010 # 800398e8 <xErrorOccurred>
    800054fe:	6398                	ld	a4,0(a5)
    80005500:	4785                	li	a5,1
    80005502:	00f71363          	bne	a4,a5,80005508 <xAreBlockTimeTestTasksStillRunning+0x4c>
    80005506:	e402                	sd	zero,8(sp)
    80005508:	00034797          	auipc	a5,0x34
    8000550c:	3d878793          	addi	a5,a5,984 # 800398e0 <xSecondaryCycles>
    80005510:	6398                	ld	a4,0(a5)
    80005512:	00034797          	auipc	a5,0x34
    80005516:	3ee78793          	addi	a5,a5,1006 # 80039900 <xLastSecondaryCycleCount.0>
    8000551a:	e398                	sd	a4,0(a5)
    8000551c:	00034797          	auipc	a5,0x34
    80005520:	3bc78793          	addi	a5,a5,956 # 800398d8 <xPrimaryCycles>
    80005524:	6398                	ld	a4,0(a5)
    80005526:	00034797          	auipc	a5,0x34
    8000552a:	3d278793          	addi	a5,a5,978 # 800398f8 <xLastPrimaryCycleCount.1>
    8000552e:	e398                	sd	a4,0(a5)
    80005530:	67a2                	ld	a5,8(sp)
    80005532:	853e                	mv	a0,a5
    80005534:	0141                	addi	sp,sp,16
    80005536:	8082                	ret

0000000080005538 <vStartCountingSemaphoreTasks>:
    80005538:	1141                	addi	sp,sp,-16
    8000553a:	e406                	sd	ra,8(sp)
    8000553c:	0c800593          	li	a1,200
    80005540:	0c800513          	li	a0,200
    80005544:	c32fb0ef          	jal	ra,80000976 <xQueueCreateCountingSemaphore>
    80005548:	872a                	mv	a4,a0
    8000554a:	00034797          	auipc	a5,0x34
    8000554e:	3c678793          	addi	a5,a5,966 # 80039910 <xParameters>
    80005552:	e398                	sd	a4,0(a5)
    80005554:	00034797          	auipc	a5,0x34
    80005558:	3bc78793          	addi	a5,a5,956 # 80039910 <xParameters>
    8000555c:	0aa00713          	li	a4,170
    80005560:	e798                	sd	a4,8(a5)
    80005562:	00034797          	auipc	a5,0x34
    80005566:	3ae78793          	addi	a5,a5,942 # 80039910 <xParameters>
    8000556a:	0007b823          	sd	zero,16(a5)
    8000556e:	4581                	li	a1,0
    80005570:	0c800513          	li	a0,200
    80005574:	c02fb0ef          	jal	ra,80000976 <xQueueCreateCountingSemaphore>
    80005578:	872a                	mv	a4,a0
    8000557a:	00034797          	auipc	a5,0x34
    8000557e:	39678793          	addi	a5,a5,918 # 80039910 <xParameters>
    80005582:	ef98                	sd	a4,24(a5)
    80005584:	00034797          	auipc	a5,0x34
    80005588:	38c78793          	addi	a5,a5,908 # 80039910 <xParameters>
    8000558c:	0207b023          	sd	zero,32(a5)
    80005590:	00034797          	auipc	a5,0x34
    80005594:	38078793          	addi	a5,a5,896 # 80039910 <xParameters>
    80005598:	0207b423          	sd	zero,40(a5)
    8000559c:	00034797          	auipc	a5,0x34
    800055a0:	37478793          	addi	a5,a5,884 # 80039910 <xParameters>
    800055a4:	639c                	ld	a5,0(a5)
    800055a6:	0001b597          	auipc	a1,0x1b
    800055aa:	d4258593          	addi	a1,a1,-702 # 800202e8 <__rodata_start+0x2e8>
    800055ae:	853e                	mv	a0,a5
    800055b0:	cd3fb0ef          	jal	ra,80001282 <vQueueAddToRegistry>
    800055b4:	00034797          	auipc	a5,0x34
    800055b8:	35c78793          	addi	a5,a5,860 # 80039910 <xParameters>
    800055bc:	6f9c                	ld	a5,24(a5)
    800055be:	0001b597          	auipc	a1,0x1b
    800055c2:	d3a58593          	addi	a1,a1,-710 # 800202f8 <__rodata_start+0x2f8>
    800055c6:	853e                	mv	a0,a5
    800055c8:	cbbfb0ef          	jal	ra,80001282 <vQueueAddToRegistry>
    800055cc:	00034797          	auipc	a5,0x34
    800055d0:	34478793          	addi	a5,a5,836 # 80039910 <xParameters>
    800055d4:	639c                	ld	a5,0(a5)
    800055d6:	e799                	bnez	a5,800055e4 <vStartCountingSemaphoreTasks+0xac>
    800055d8:	00034797          	auipc	a5,0x34
    800055dc:	33878793          	addi	a5,a5,824 # 80039910 <xParameters>
    800055e0:	6f9c                	ld	a5,24(a5)
    800055e2:	cba9                	beqz	a5,80005634 <vStartCountingSemaphoreTasks+0xfc>
    800055e4:	4881                	li	a7,0
    800055e6:	4801                	li	a6,0
    800055e8:	4781                	li	a5,0
    800055ea:	4701                	li	a4,0
    800055ec:	00034697          	auipc	a3,0x34
    800055f0:	32468693          	addi	a3,a3,804 # 80039910 <xParameters>
    800055f4:	40000613          	li	a2,1024
    800055f8:	0001b597          	auipc	a1,0x1b
    800055fc:	d1058593          	addi	a1,a1,-752 # 80020308 <__rodata_start+0x308>
    80005600:	00000517          	auipc	a0,0x0
    80005604:	15c50513          	addi	a0,a0,348 # 8000575c <prvCountingSemaphoreTask>
    80005608:	d79fb0ef          	jal	ra,80001380 <xTaskGenericCreate>
    8000560c:	4881                	li	a7,0
    8000560e:	4801                	li	a6,0
    80005610:	4781                	li	a5,0
    80005612:	4701                	li	a4,0
    80005614:	00034697          	auipc	a3,0x34
    80005618:	31468693          	addi	a3,a3,788 # 80039928 <xParameters+0x18>
    8000561c:	40000613          	li	a2,1024
    80005620:	0001b597          	auipc	a1,0x1b
    80005624:	cf058593          	addi	a1,a1,-784 # 80020310 <__rodata_start+0x310>
    80005628:	00000517          	auipc	a0,0x0
    8000562c:	13450513          	addi	a0,a0,308 # 8000575c <prvCountingSemaphoreTask>
    80005630:	d51fb0ef          	jal	ra,80001380 <xTaskGenericCreate>
    80005634:	0001                	nop
    80005636:	60a2                	ld	ra,8(sp)
    80005638:	0141                	addi	sp,sp,16
    8000563a:	8082                	ret

000000008000563c <prvDecrementSemaphoreCount>:
    8000563c:	7179                	addi	sp,sp,-48
    8000563e:	f406                	sd	ra,40(sp)
    80005640:	e42a                	sd	a0,8(sp)
    80005642:	e02e                	sd	a1,0(sp)
    80005644:	4681                	li	a3,0
    80005646:	4601                	li	a2,0
    80005648:	4581                	li	a1,0
    8000564a:	6522                	ld	a0,8(sp)
    8000564c:	b74fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005650:	872a                	mv	a4,a0
    80005652:	4785                	li	a5,1
    80005654:	00f71863          	bne	a4,a5,80005664 <prvDecrementSemaphoreCount+0x28>
    80005658:	00034797          	auipc	a5,0x34
    8000565c:	2b078793          	addi	a5,a5,688 # 80039908 <xErrorDetected>
    80005660:	4705                	li	a4,1
    80005662:	e398                	sd	a4,0(a5)
    80005664:	ec02                	sd	zero,24(sp)
    80005666:	a815                	j	8000569a <prvDecrementSemaphoreCount+0x5e>
    80005668:	4681                	li	a3,0
    8000566a:	4601                	li	a2,0
    8000566c:	4581                	li	a1,0
    8000566e:	6522                	ld	a0,8(sp)
    80005670:	e3cfb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80005674:	872a                	mv	a4,a0
    80005676:	4785                	li	a5,1
    80005678:	00f70863          	beq	a4,a5,80005688 <prvDecrementSemaphoreCount+0x4c>
    8000567c:	00034797          	auipc	a5,0x34
    80005680:	28c78793          	addi	a5,a5,652 # 80039908 <xErrorDetected>
    80005684:	4705                	li	a4,1
    80005686:	e398                	sd	a4,0(a5)
    80005688:	6782                	ld	a5,0(sp)
    8000568a:	639c                	ld	a5,0(a5)
    8000568c:	00178713          	addi	a4,a5,1
    80005690:	6782                	ld	a5,0(sp)
    80005692:	e398                	sd	a4,0(a5)
    80005694:	67e2                	ld	a5,24(sp)
    80005696:	0785                	addi	a5,a5,1
    80005698:	ec3e                	sd	a5,24(sp)
    8000569a:	6762                	ld	a4,24(sp)
    8000569c:	0c700793          	li	a5,199
    800056a0:	fce7f4e3          	bgeu	a5,a4,80005668 <prvDecrementSemaphoreCount+0x2c>
    800056a4:	4681                	li	a3,0
    800056a6:	4601                	li	a2,0
    800056a8:	4581                	li	a1,0
    800056aa:	6522                	ld	a0,8(sp)
    800056ac:	e00fb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    800056b0:	872a                	mv	a4,a0
    800056b2:	4785                	li	a5,1
    800056b4:	00f71863          	bne	a4,a5,800056c4 <prvDecrementSemaphoreCount+0x88>
    800056b8:	00034797          	auipc	a5,0x34
    800056bc:	25078793          	addi	a5,a5,592 # 80039908 <xErrorDetected>
    800056c0:	4705                	li	a4,1
    800056c2:	e398                	sd	a4,0(a5)
    800056c4:	0001                	nop
    800056c6:	70a2                	ld	ra,40(sp)
    800056c8:	6145                	addi	sp,sp,48
    800056ca:	8082                	ret

00000000800056cc <prvIncrementSemaphoreCount>:
    800056cc:	7179                	addi	sp,sp,-48
    800056ce:	f406                	sd	ra,40(sp)
    800056d0:	e42a                	sd	a0,8(sp)
    800056d2:	e02e                	sd	a1,0(sp)
    800056d4:	4681                	li	a3,0
    800056d6:	4601                	li	a2,0
    800056d8:	4581                	li	a1,0
    800056da:	6522                	ld	a0,8(sp)
    800056dc:	dd0fb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    800056e0:	872a                	mv	a4,a0
    800056e2:	4785                	li	a5,1
    800056e4:	00f71863          	bne	a4,a5,800056f4 <prvIncrementSemaphoreCount+0x28>
    800056e8:	00034797          	auipc	a5,0x34
    800056ec:	22078793          	addi	a5,a5,544 # 80039908 <xErrorDetected>
    800056f0:	4705                	li	a4,1
    800056f2:	e398                	sd	a4,0(a5)
    800056f4:	ec02                	sd	zero,24(sp)
    800056f6:	a815                	j	8000572a <prvIncrementSemaphoreCount+0x5e>
    800056f8:	4681                	li	a3,0
    800056fa:	4601                	li	a2,0
    800056fc:	4581                	li	a1,0
    800056fe:	6522                	ld	a0,8(sp)
    80005700:	ac0fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005704:	872a                	mv	a4,a0
    80005706:	4785                	li	a5,1
    80005708:	00f70863          	beq	a4,a5,80005718 <prvIncrementSemaphoreCount+0x4c>
    8000570c:	00034797          	auipc	a5,0x34
    80005710:	1fc78793          	addi	a5,a5,508 # 80039908 <xErrorDetected>
    80005714:	4705                	li	a4,1
    80005716:	e398                	sd	a4,0(a5)
    80005718:	6782                	ld	a5,0(sp)
    8000571a:	639c                	ld	a5,0(a5)
    8000571c:	00178713          	addi	a4,a5,1
    80005720:	6782                	ld	a5,0(sp)
    80005722:	e398                	sd	a4,0(a5)
    80005724:	67e2                	ld	a5,24(sp)
    80005726:	0785                	addi	a5,a5,1
    80005728:	ec3e                	sd	a5,24(sp)
    8000572a:	6762                	ld	a4,24(sp)
    8000572c:	0c700793          	li	a5,199
    80005730:	fce7f4e3          	bgeu	a5,a4,800056f8 <prvIncrementSemaphoreCount+0x2c>
    80005734:	4681                	li	a3,0
    80005736:	4601                	li	a2,0
    80005738:	4581                	li	a1,0
    8000573a:	6522                	ld	a0,8(sp)
    8000573c:	a84fb0ef          	jal	ra,800009c0 <xQueueGenericSend>
    80005740:	872a                	mv	a4,a0
    80005742:	4785                	li	a5,1
    80005744:	00f71863          	bne	a4,a5,80005754 <prvIncrementSemaphoreCount+0x88>
    80005748:	00034797          	auipc	a5,0x34
    8000574c:	1c078793          	addi	a5,a5,448 # 80039908 <xErrorDetected>
    80005750:	4705                	li	a4,1
    80005752:	e398                	sd	a4,0(a5)
    80005754:	0001                	nop
    80005756:	70a2                	ld	ra,40(sp)
    80005758:	6145                	addi	sp,sp,48
    8000575a:	8082                	ret

000000008000575c <prvCountingSemaphoreTask>:
    8000575c:	7179                	addi	sp,sp,-48
    8000575e:	f406                	sd	ra,40(sp)
    80005760:	e42a                	sd	a0,8(sp)
    80005762:	67a2                	ld	a5,8(sp)
    80005764:	ec3e                	sd	a5,24(sp)
    80005766:	67e2                	ld	a5,24(sp)
    80005768:	6798                	ld	a4,8(a5)
    8000576a:	0aa00793          	li	a5,170
    8000576e:	00f71a63          	bne	a4,a5,80005782 <prvCountingSemaphoreTask+0x26>
    80005772:	67e2                	ld	a5,24(sp)
    80005774:	6398                	ld	a4,0(a5)
    80005776:	67e2                	ld	a5,24(sp)
    80005778:	07c1                	addi	a5,a5,16
    8000577a:	85be                	mv	a1,a5
    8000577c:	853a                	mv	a0,a4
    8000577e:	ebfff0ef          	jal	ra,8000563c <prvDecrementSemaphoreCount>
    80005782:	67e2                	ld	a5,24(sp)
    80005784:	639c                	ld	a5,0(a5)
    80005786:	4681                	li	a3,0
    80005788:	4601                	li	a2,0
    8000578a:	4581                	li	a1,0
    8000578c:	853e                	mv	a0,a5
    8000578e:	d1efb0ef          	jal	ra,80000cac <xQueueGenericReceive>
    80005792:	872a                	mv	a4,a0
    80005794:	4785                	li	a5,1
    80005796:	00f71863          	bne	a4,a5,800057a6 <prvCountingSemaphoreTask+0x4a>
    8000579a:	00034797          	auipc	a5,0x34
    8000579e:	16e78793          	addi	a5,a5,366 # 80039908 <xErrorDetected>
    800057a2:	4705                	li	a4,1
    800057a4:	e398                	sd	a4,0(a5)
    800057a6:	67e2                	ld	a5,24(sp)
    800057a8:	6398                	ld	a4,0(a5)
    800057aa:	67e2                	ld	a5,24(sp)
    800057ac:	07c1                	addi	a5,a5,16
    800057ae:	85be                	mv	a1,a5
    800057b0:	853a                	mv	a0,a4
    800057b2:	f1bff0ef          	jal	ra,800056cc <prvIncrementSemaphoreCount>
    800057b6:	67e2                	ld	a5,24(sp)
    800057b8:	6398                	ld	a4,0(a5)
    800057ba:	67e2                	ld	a5,24(sp)
    800057bc:	07c1                	addi	a5,a5,16
    800057be:	85be                	mv	a1,a5
    800057c0:	853a                	mv	a0,a4
    800057c2:	e7bff0ef          	jal	ra,8000563c <prvDecrementSemaphoreCount>
    800057c6:	b7c5                	j	800057a6 <prvCountingSemaphoreTask+0x4a>

00000000800057c8 <xAreCountingSemaphoreTasksStillRunning>:
    800057c8:	1141                	addi	sp,sp,-16
    800057ca:	4785                	li	a5,1
    800057cc:	e43e                	sd	a5,8(sp)
    800057ce:	00034797          	auipc	a5,0x34
    800057d2:	13a78793          	addi	a5,a5,314 # 80039908 <xErrorDetected>
    800057d6:	639c                	ld	a5,0(a5)
    800057d8:	c391                	beqz	a5,800057dc <xAreCountingSemaphoreTasksStillRunning+0x14>
    800057da:	e402                	sd	zero,8(sp)
    800057dc:	00034797          	auipc	a5,0x34
    800057e0:	13478793          	addi	a5,a5,308 # 80039910 <xParameters>
    800057e4:	6b98                	ld	a4,16(a5)
    800057e6:	00034797          	auipc	a5,0x34
    800057ea:	15a78793          	addi	a5,a5,346 # 80039940 <uxLastCount0.1>
    800057ee:	639c                	ld	a5,0(a5)
    800057f0:	00f71463          	bne	a4,a5,800057f8 <xAreCountingSemaphoreTasksStillRunning+0x30>
    800057f4:	e402                	sd	zero,8(sp)
    800057f6:	a819                	j	8000580c <xAreCountingSemaphoreTasksStillRunning+0x44>
    800057f8:	00034797          	auipc	a5,0x34
    800057fc:	11878793          	addi	a5,a5,280 # 80039910 <xParameters>
    80005800:	6b98                	ld	a4,16(a5)
    80005802:	00034797          	auipc	a5,0x34
    80005806:	13e78793          	addi	a5,a5,318 # 80039940 <uxLastCount0.1>
    8000580a:	e398                	sd	a4,0(a5)
    8000580c:	00034797          	auipc	a5,0x34
    80005810:	10478793          	addi	a5,a5,260 # 80039910 <xParameters>
    80005814:	7798                	ld	a4,40(a5)
    80005816:	00034797          	auipc	a5,0x34
    8000581a:	13278793          	addi	a5,a5,306 # 80039948 <uxLastCount1.0>
    8000581e:	639c                	ld	a5,0(a5)
    80005820:	00f71463          	bne	a4,a5,80005828 <xAreCountingSemaphoreTasksStillRunning+0x60>
    80005824:	e402                	sd	zero,8(sp)
    80005826:	a819                	j	8000583c <xAreCountingSemaphoreTasksStillRunning+0x74>
    80005828:	00034797          	auipc	a5,0x34
    8000582c:	0e878793          	addi	a5,a5,232 # 80039910 <xParameters>
    80005830:	7798                	ld	a4,40(a5)
    80005832:	00034797          	auipc	a5,0x34
    80005836:	11678793          	addi	a5,a5,278 # 80039948 <uxLastCount1.0>
    8000583a:	e398                	sd	a4,0(a5)
    8000583c:	67a2                	ld	a5,8(sp)
    8000583e:	853e                	mv	a0,a5
    80005840:	0141                	addi	sp,sp,16
    80005842:	8082                	ret

0000000080005844 <vStartRecursiveMutexTasks>:
    80005844:	1141                	addi	sp,sp,-16
    80005846:	e406                	sd	ra,8(sp)
    80005848:	4511                	li	a0,4
    8000584a:	fe7fa0ef          	jal	ra,80000830 <xQueueCreateMutex>
    8000584e:	872a                	mv	a4,a0
    80005850:	00034797          	auipc	a5,0x34
    80005854:	10078793          	addi	a5,a5,256 # 80039950 <xMutex>
    80005858:	e398                	sd	a4,0(a5)
    8000585a:	00034797          	auipc	a5,0x34
    8000585e:	0f678793          	addi	a5,a5,246 # 80039950 <xMutex>
    80005862:	639c                	ld	a5,0(a5)
    80005864:	0001b597          	auipc	a1,0x1b
    80005868:	ab458593          	addi	a1,a1,-1356 # 80020318 <__rodata_start+0x318>
    8000586c:	853e                	mv	a0,a5
    8000586e:	a15fb0ef          	jal	ra,80001282 <vQueueAddToRegistry>
    80005872:	00034797          	auipc	a5,0x34
    80005876:	0de78793          	addi	a5,a5,222 # 80039950 <xMutex>
    8000587a:	639c                	ld	a5,0(a5)
    8000587c:	cbb5                	beqz	a5,800058f0 <vStartRecursiveMutexTasks+0xac>
    8000587e:	4881                	li	a7,0
    80005880:	4801                	li	a6,0
    80005882:	00034797          	auipc	a5,0x34
    80005886:	10678793          	addi	a5,a5,262 # 80039988 <xControllingTaskHandle>
    8000588a:	4709                	li	a4,2
    8000588c:	4681                	li	a3,0
    8000588e:	40000613          	li	a2,1024
    80005892:	0001b597          	auipc	a1,0x1b
    80005896:	a9658593          	addi	a1,a1,-1386 # 80020328 <__rodata_start+0x328>
    8000589a:	00000517          	auipc	a0,0x0
    8000589e:	05e50513          	addi	a0,a0,94 # 800058f8 <prvRecursiveMutexControllingTask>
    800058a2:	adffb0ef          	jal	ra,80001380 <xTaskGenericCreate>
    800058a6:	4881                	li	a7,0
    800058a8:	4801                	li	a6,0
    800058aa:	00034797          	auipc	a5,0x34
    800058ae:	0e678793          	addi	a5,a5,230 # 80039990 <xBlockingTaskHandle>
    800058b2:	4705                	li	a4,1
    800058b4:	4681                	li	a3,0
    800058b6:	40000613          	li	a2,1024
    800058ba:	0001b597          	auipc	a1,0x1b
    800058be:	a7658593          	addi	a1,a1,-1418 # 80020330 <__rodata_start+0x330>
    800058c2:	00000517          	auipc	a0,0x0
    800058c6:	13650513          	addi	a0,a0,310 # 800059f8 <prvRecursiveMutexBlockingTask>
    800058ca:	ab7fb0ef          	jal	ra,80001380 <xTaskGenericCreate>
    800058ce:	4881                	li	a7,0
    800058d0:	4801                	li	a6,0
    800058d2:	4781                	li	a5,0
    800058d4:	4701                	li	a4,0
    800058d6:	4681                	li	a3,0
    800058d8:	40000613          	li	a2,1024
    800058dc:	0001b597          	auipc	a1,0x1b
    800058e0:	a5c58593          	addi	a1,a1,-1444 # 80020338 <__rodata_start+0x338>
    800058e4:	00000517          	auipc	a0,0x0
    800058e8:	1e450513          	addi	a0,a0,484 # 80005ac8 <prvRecursiveMutexPollingTask>
    800058ec:	a95fb0ef          	jal	ra,80001380 <xTaskGenericCreate>
    800058f0:	0001                	nop
    800058f2:	60a2                	ld	ra,8(sp)
    800058f4:	0141                	addi	sp,sp,16
    800058f6:	8082                	ret

00000000800058f8 <prvRecursiveMutexControllingTask>:
    800058f8:	7179                	addi	sp,sp,-48
    800058fa:	f406                	sd	ra,40(sp)
    800058fc:	e42a                	sd	a0,8(sp)
    800058fe:	00034797          	auipc	a5,0x34
    80005902:	05278793          	addi	a5,a5,82 # 80039950 <xMutex>
    80005906:	639c                	ld	a5,0(a5)
    80005908:	853e                	mv	a0,a5
    8000590a:	fadfa0ef          	jal	ra,800008b6 <xQueueGiveMutexRecursive>
    8000590e:	872a                	mv	a4,a0
    80005910:	4785                	li	a5,1
    80005912:	00f71863          	bne	a4,a5,80005922 <prvRecursiveMutexControllingTask+0x2a>
    80005916:	00034797          	auipc	a5,0x34
    8000591a:	04278793          	addi	a5,a5,66 # 80039958 <xErrorOccurred>
    8000591e:	4705                	li	a4,1
    80005920:	e398                	sd	a4,0(a5)
    80005922:	ec02                	sd	zero,24(sp)
    80005924:	a815                	j	80005958 <prvRecursiveMutexControllingTask+0x60>
    80005926:	00034797          	auipc	a5,0x34
    8000592a:	02a78793          	addi	a5,a5,42 # 80039950 <xMutex>
    8000592e:	639c                	ld	a5,0(a5)
    80005930:	45a1                	li	a1,8
    80005932:	853e                	mv	a0,a5
    80005934:	fd9fa0ef          	jal	ra,8000090c <xQueueTakeMutexRecursive>
    80005938:	872a                	mv	a4,a0
    8000593a:	4785                	li	a5,1
    8000593c:	00f70863          	beq	a4,a5,8000594c <prvRecursiveMutexControllingTask+0x54>
    80005940:	00034797          	auipc	a5,0x34
    80005944:	01878793          	addi	a5,a5,24 # 80039958 <xErrorOccurred>
    80005948:	4705                	li	a4,1
    8000594a:	e398                	sd	a4,0(a5)
    8000594c:	4551                	li	a0,20
    8000594e:	d7dfb0ef          	jal	ra,800016ca <vTaskDelay>
    80005952:	67e2                	ld	a5,24(sp)
    80005954:	0785                	addi	a5,a5,1
    80005956:	ec3e                	sd	a5,24(sp)
    80005958:	6762                	ld	a4,24(sp)
    8000595a:	47a5                	li	a5,9
    8000595c:	fce7f5e3          	bgeu	a5,a4,80005926 <prvRecursiveMutexControllingTask+0x2e>
    80005960:	ec02                	sd	zero,24(sp)
    80005962:	a80d                	j	80005994 <prvRecursiveMutexControllingTask+0x9c>
    80005964:	4551                	li	a0,20
    80005966:	d65fb0ef          	jal	ra,800016ca <vTaskDelay>
    8000596a:	00034797          	auipc	a5,0x34
    8000596e:	fe678793          	addi	a5,a5,-26 # 80039950 <xMutex>
    80005972:	639c                	ld	a5,0(a5)
    80005974:	853e                	mv	a0,a5
    80005976:	f41fa0ef          	jal	ra,800008b6 <xQueueGiveMutexRecursive>
    8000597a:	872a                	mv	a4,a0
    8000597c:	4785                	li	a5,1
    8000597e:	00f70863          	beq	a4,a5,8000598e <prvRecursiveMutexControllingTask+0x96>
    80005982:	00034797          	auipc	a5,0x34
    80005986:	fd678793          	addi	a5,a5,-42 # 80039958 <xErrorOccurred>
    8000598a:	4705                	li	a4,1
    8000598c:	e398                	sd	a4,0(a5)
    8000598e:	67e2                	ld	a5,24(sp)
    80005990:	0785                	addi	a5,a5,1
    80005992:	ec3e                	sd	a5,24(sp)
    80005994:	6762                	ld	a4,24(sp)
    80005996:	47a5                	li	a5,9
    80005998:	fce7f6e3          	bgeu	a5,a4,80005964 <prvRecursiveMutexControllingTask+0x6c>
    8000599c:	00034797          	auipc	a5,0x34
    800059a0:	fb478793          	addi	a5,a5,-76 # 80039950 <xMutex>
    800059a4:	639c                	ld	a5,0(a5)
    800059a6:	853e                	mv	a0,a5
    800059a8:	f0ffa0ef          	jal	ra,800008b6 <xQueueGiveMutexRecursive>
    800059ac:	872a                	mv	a4,a0
    800059ae:	4785                	li	a5,1
    800059b0:	00f71863          	bne	a4,a5,800059c0 <prvRecursiveMutexControllingTask+0xc8>
    800059b4:	00034797          	auipc	a5,0x34
    800059b8:	fa478793          	addi	a5,a5,-92 # 80039958 <xErrorOccurred>
    800059bc:	4705                	li	a4,1
    800059be:	e398                	sd	a4,0(a5)
    800059c0:	00034797          	auipc	a5,0x34
    800059c4:	fb078793          	addi	a5,a5,-80 # 80039970 <uxControllingCycles>
    800059c8:	639c                	ld	a5,0(a5)
    800059ca:	00178713          	addi	a4,a5,1
    800059ce:	00034797          	auipc	a5,0x34
    800059d2:	fa278793          	addi	a5,a5,-94 # 80039970 <uxControllingCycles>
    800059d6:	e398                	sd	a4,0(a5)
    800059d8:	00034797          	auipc	a5,0x34
    800059dc:	f8878793          	addi	a5,a5,-120 # 80039960 <xControllingIsSuspended>
    800059e0:	4705                	li	a4,1
    800059e2:	e398                	sd	a4,0(a5)
    800059e4:	4501                	li	a0,0
    800059e6:	fa9fb0ef          	jal	ra,8000198e <vTaskSuspend>
    800059ea:	00034797          	auipc	a5,0x34
    800059ee:	f7678793          	addi	a5,a5,-138 # 80039960 <xControllingIsSuspended>
    800059f2:	0007b023          	sd	zero,0(a5)
    800059f6:	b721                	j	800058fe <prvRecursiveMutexControllingTask+0x6>

00000000800059f8 <prvRecursiveMutexBlockingTask>:
    800059f8:	1101                	addi	sp,sp,-32
    800059fa:	ec06                	sd	ra,24(sp)
    800059fc:	e42a                	sd	a0,8(sp)
    800059fe:	00034797          	auipc	a5,0x34
    80005a02:	f5278793          	addi	a5,a5,-174 # 80039950 <xMutex>
    80005a06:	639c                	ld	a5,0(a5)
    80005a08:	55f9                	li	a1,-2
    80005a0a:	853e                	mv	a0,a5
    80005a0c:	f01fa0ef          	jal	ra,8000090c <xQueueTakeMutexRecursive>
    80005a10:	872a                	mv	a4,a0
    80005a12:	4785                	li	a5,1
    80005a14:	06f71363          	bne	a4,a5,80005a7a <prvRecursiveMutexBlockingTask+0x82>
    80005a18:	00034797          	auipc	a5,0x34
    80005a1c:	f4878793          	addi	a5,a5,-184 # 80039960 <xControllingIsSuspended>
    80005a20:	6398                	ld	a4,0(a5)
    80005a22:	4785                	li	a5,1
    80005a24:	00f70963          	beq	a4,a5,80005a36 <prvRecursiveMutexBlockingTask+0x3e>
    80005a28:	00034797          	auipc	a5,0x34
    80005a2c:	f3078793          	addi	a5,a5,-208 # 80039958 <xErrorOccurred>
    80005a30:	4705                	li	a4,1
    80005a32:	e398                	sd	a4,0(a5)
    80005a34:	a889                	j	80005a86 <prvRecursiveMutexBlockingTask+0x8e>
    80005a36:	00034797          	auipc	a5,0x34
    80005a3a:	f1a78793          	addi	a5,a5,-230 # 80039950 <xMutex>
    80005a3e:	639c                	ld	a5,0(a5)
    80005a40:	853e                	mv	a0,a5
    80005a42:	e75fa0ef          	jal	ra,800008b6 <xQueueGiveMutexRecursive>
    80005a46:	872a                	mv	a4,a0
    80005a48:	4785                	li	a5,1
    80005a4a:	00f70863          	beq	a4,a5,80005a5a <prvRecursiveMutexBlockingTask+0x62>
    80005a4e:	00034797          	auipc	a5,0x34
    80005a52:	f0a78793          	addi	a5,a5,-246 # 80039958 <xErrorOccurred>
    80005a56:	4705                	li	a4,1
    80005a58:	e398                	sd	a4,0(a5)
    80005a5a:	00034797          	auipc	a5,0x34
    80005a5e:	f0e78793          	addi	a5,a5,-242 # 80039968 <xBlockingIsSuspended>
    80005a62:	4705                	li	a4,1
    80005a64:	e398                	sd	a4,0(a5)
    80005a66:	4501                	li	a0,0
    80005a68:	f27fb0ef          	jal	ra,8000198e <vTaskSuspend>
    80005a6c:	00034797          	auipc	a5,0x34
    80005a70:	efc78793          	addi	a5,a5,-260 # 80039968 <xBlockingIsSuspended>
    80005a74:	0007b023          	sd	zero,0(a5)
    80005a78:	a039                	j	80005a86 <prvRecursiveMutexBlockingTask+0x8e>
    80005a7a:	00034797          	auipc	a5,0x34
    80005a7e:	ede78793          	addi	a5,a5,-290 # 80039958 <xErrorOccurred>
    80005a82:	4705                	li	a4,1
    80005a84:	e398                	sd	a4,0(a5)
    80005a86:	00034797          	auipc	a5,0x34
    80005a8a:	ef278793          	addi	a5,a5,-270 # 80039978 <uxBlockingCycles>
    80005a8e:	639c                	ld	a5,0(a5)
    80005a90:	00178713          	addi	a4,a5,1
    80005a94:	00034797          	auipc	a5,0x34
    80005a98:	edc78793          	addi	a5,a5,-292 # 80039970 <uxControllingCycles>
    80005a9c:	639c                	ld	a5,0(a5)
    80005a9e:	00f70863          	beq	a4,a5,80005aae <prvRecursiveMutexBlockingTask+0xb6>
    80005aa2:	00034797          	auipc	a5,0x34
    80005aa6:	eb678793          	addi	a5,a5,-330 # 80039958 <xErrorOccurred>
    80005aaa:	4705                	li	a4,1
    80005aac:	e398                	sd	a4,0(a5)
    80005aae:	00034797          	auipc	a5,0x34
    80005ab2:	eca78793          	addi	a5,a5,-310 # 80039978 <uxBlockingCycles>
    80005ab6:	639c                	ld	a5,0(a5)
    80005ab8:	00178713          	addi	a4,a5,1
    80005abc:	00034797          	auipc	a5,0x34
    80005ac0:	ebc78793          	addi	a5,a5,-324 # 80039978 <uxBlockingCycles>
    80005ac4:	e398                	sd	a4,0(a5)
    80005ac6:	bf25                	j	800059fe <prvRecursiveMutexBlockingTask+0x6>

0000000080005ac8 <prvRecursiveMutexPollingTask>:
    80005ac8:	1101                	addi	sp,sp,-32
    80005aca:	ec06                	sd	ra,24(sp)
    80005acc:	e42a                	sd	a0,8(sp)
    80005ace:	00034797          	auipc	a5,0x34
    80005ad2:	e8278793          	addi	a5,a5,-382 # 80039950 <xMutex>
    80005ad6:	639c                	ld	a5,0(a5)
    80005ad8:	4581                	li	a1,0
    80005ada:	853e                	mv	a0,a5
    80005adc:	e31fa0ef          	jal	ra,8000090c <xQueueTakeMutexRecursive>
    80005ae0:	872a                	mv	a4,a0
    80005ae2:	4785                	li	a5,1
    80005ae4:	fef715e3          	bne	a4,a5,80005ace <prvRecursiveMutexPollingTask+0x6>
    80005ae8:	00034797          	auipc	a5,0x34
    80005aec:	ea078793          	addi	a5,a5,-352 # 80039988 <xControllingTaskHandle>
    80005af0:	639c                	ld	a5,0(a5)
    80005af2:	853e                	mv	a0,a5
    80005af4:	c3ffb0ef          	jal	ra,80001732 <eTaskGetState>
    80005af8:	87aa                	mv	a5,a0
    80005afa:	2781                	sext.w	a5,a5
    80005afc:	873e                	mv	a4,a5
    80005afe:	478d                	li	a5,3
    80005b00:	00f70563          	beq	a4,a5,80005b0a <prvRecursiveMutexPollingTask+0x42>
    80005b04:	30047073          	csrci	mstatus,8
    80005b08:	a001                	j	80005b08 <prvRecursiveMutexPollingTask+0x40>
    80005b0a:	00034797          	auipc	a5,0x34
    80005b0e:	e8678793          	addi	a5,a5,-378 # 80039990 <xBlockingTaskHandle>
    80005b12:	639c                	ld	a5,0(a5)
    80005b14:	853e                	mv	a0,a5
    80005b16:	c1dfb0ef          	jal	ra,80001732 <eTaskGetState>
    80005b1a:	87aa                	mv	a5,a0
    80005b1c:	2781                	sext.w	a5,a5
    80005b1e:	873e                	mv	a4,a5
    80005b20:	478d                	li	a5,3
    80005b22:	00f70563          	beq	a4,a5,80005b2c <prvRecursiveMutexPollingTask+0x64>
    80005b26:	30047073          	csrci	mstatus,8
    80005b2a:	a001                	j	80005b2a <prvRecursiveMutexPollingTask+0x62>
    80005b2c:	00034797          	auipc	a5,0x34
    80005b30:	e3c78793          	addi	a5,a5,-452 # 80039968 <xBlockingIsSuspended>
    80005b34:	6398                	ld	a4,0(a5)
    80005b36:	4785                	li	a5,1
    80005b38:	00f71a63          	bne	a4,a5,80005b4c <prvRecursiveMutexPollingTask+0x84>
    80005b3c:	00034797          	auipc	a5,0x34
    80005b40:	e2478793          	addi	a5,a5,-476 # 80039960 <xControllingIsSuspended>
    80005b44:	6398                	ld	a4,0(a5)
    80005b46:	4785                	li	a5,1
    80005b48:	00f70963          	beq	a4,a5,80005b5a <prvRecursiveMutexPollingTask+0x92>
    80005b4c:	00034797          	auipc	a5,0x34
    80005b50:	e0c78793          	addi	a5,a5,-500 # 80039958 <xErrorOccurred>
    80005b54:	4705                	li	a4,1
    80005b56:	e398                	sd	a4,0(a5)
    80005b58:	a8d5                	j	80005c4c <prvRecursiveMutexPollingTask+0x184>
    80005b5a:	00034797          	auipc	a5,0x34
    80005b5e:	e2678793          	addi	a5,a5,-474 # 80039980 <uxPollingCycles>
    80005b62:	639c                	ld	a5,0(a5)
    80005b64:	00178713          	addi	a4,a5,1
    80005b68:	00034797          	auipc	a5,0x34
    80005b6c:	e1878793          	addi	a5,a5,-488 # 80039980 <uxPollingCycles>
    80005b70:	e398                	sd	a4,0(a5)
    80005b72:	00034797          	auipc	a5,0x34
    80005b76:	e1e78793          	addi	a5,a5,-482 # 80039990 <xBlockingTaskHandle>
    80005b7a:	639c                	ld	a5,0(a5)
    80005b7c:	853e                	mv	a0,a5
    80005b7e:	f37fb0ef          	jal	ra,80001ab4 <vTaskResume>
    80005b82:	00034797          	auipc	a5,0x34
    80005b86:	e0678793          	addi	a5,a5,-506 # 80039988 <xControllingTaskHandle>
    80005b8a:	639c                	ld	a5,0(a5)
    80005b8c:	853e                	mv	a0,a5
    80005b8e:	f27fb0ef          	jal	ra,80001ab4 <vTaskResume>
    80005b92:	00034797          	auipc	a5,0x34
    80005b96:	dd678793          	addi	a5,a5,-554 # 80039968 <xBlockingIsSuspended>
    80005b9a:	6398                	ld	a4,0(a5)
    80005b9c:	4785                	li	a5,1
    80005b9e:	00f70a63          	beq	a4,a5,80005bb2 <prvRecursiveMutexPollingTask+0xea>
    80005ba2:	00034797          	auipc	a5,0x34
    80005ba6:	dbe78793          	addi	a5,a5,-578 # 80039960 <xControllingIsSuspended>
    80005baa:	6398                	ld	a4,0(a5)
    80005bac:	4785                	li	a5,1
    80005bae:	00f71863          	bne	a4,a5,80005bbe <prvRecursiveMutexPollingTask+0xf6>
    80005bb2:	00034797          	auipc	a5,0x34
    80005bb6:	da678793          	addi	a5,a5,-602 # 80039958 <xErrorOccurred>
    80005bba:	4705                	li	a4,1
    80005bbc:	e398                	sd	a4,0(a5)
    80005bbe:	4501                	li	a0,0
    80005bc0:	c11fb0ef          	jal	ra,800017d0 <uxTaskPriorityGet>
    80005bc4:	872a                	mv	a4,a0
    80005bc6:	4789                	li	a5,2
    80005bc8:	00f70563          	beq	a4,a5,80005bd2 <prvRecursiveMutexPollingTask+0x10a>
    80005bcc:	30047073          	csrci	mstatus,8
    80005bd0:	a001                	j	80005bd0 <prvRecursiveMutexPollingTask+0x108>
    80005bd2:	00034797          	auipc	a5,0x34
    80005bd6:	db678793          	addi	a5,a5,-586 # 80039988 <xControllingTaskHandle>
    80005bda:	639c                	ld	a5,0(a5)
    80005bdc:	853e                	mv	a0,a5
    80005bde:	b55fb0ef          	jal	ra,80001732 <eTaskGetState>
    80005be2:	87aa                	mv	a5,a0
    80005be4:	2781                	sext.w	a5,a5
    80005be6:	873e                	mv	a4,a5
    80005be8:	4789                	li	a5,2
    80005bea:	00f70563          	beq	a4,a5,80005bf4 <prvRecursiveMutexPollingTask+0x12c>
    80005bee:	30047073          	csrci	mstatus,8
    80005bf2:	a001                	j	80005bf2 <prvRecursiveMutexPollingTask+0x12a>
    80005bf4:	00034797          	auipc	a5,0x34
    80005bf8:	d9c78793          	addi	a5,a5,-612 # 80039990 <xBlockingTaskHandle>
    80005bfc:	639c                	ld	a5,0(a5)
    80005bfe:	853e                	mv	a0,a5
    80005c00:	b33fb0ef          	jal	ra,80001732 <eTaskGetState>
    80005c04:	87aa                	mv	a5,a0
    80005c06:	2781                	sext.w	a5,a5
    80005c08:	873e                	mv	a4,a5
    80005c0a:	4789                	li	a5,2
    80005c0c:	00f70563          	beq	a4,a5,80005c16 <prvRecursiveMutexPollingTask+0x14e>
    80005c10:	30047073          	csrci	mstatus,8
    80005c14:	a001                	j	80005c14 <prvRecursiveMutexPollingTask+0x14c>
    80005c16:	00034797          	auipc	a5,0x34
    80005c1a:	d3a78793          	addi	a5,a5,-710 # 80039950 <xMutex>
    80005c1e:	639c                	ld	a5,0(a5)
    80005c20:	853e                	mv	a0,a5
    80005c22:	c95fa0ef          	jal	ra,800008b6 <xQueueGiveMutexRecursive>
    80005c26:	872a                	mv	a4,a0
    80005c28:	4785                	li	a5,1
    80005c2a:	00f70863          	beq	a4,a5,80005c3a <prvRecursiveMutexPollingTask+0x172>
    80005c2e:	00034797          	auipc	a5,0x34
    80005c32:	d2a78793          	addi	a5,a5,-726 # 80039958 <xErrorOccurred>
    80005c36:	4705                	li	a4,1
    80005c38:	e398                	sd	a4,0(a5)
    80005c3a:	4501                	li	a0,0
    80005c3c:	b95fb0ef          	jal	ra,800017d0 <uxTaskPriorityGet>
    80005c40:	87aa                	mv	a5,a0
    80005c42:	e80786e3          	beqz	a5,80005ace <prvRecursiveMutexPollingTask+0x6>
    80005c46:	30047073          	csrci	mstatus,8
    80005c4a:	a001                	j	80005c4a <prvRecursiveMutexPollingTask+0x182>
    80005c4c:	b549                	j	80005ace <prvRecursiveMutexPollingTask+0x6>

0000000080005c4e <xAreRecursiveMutexTasksStillRunning>:
    80005c4e:	1141                	addi	sp,sp,-16
    80005c50:	00034797          	auipc	a5,0x34
    80005c54:	d4878793          	addi	a5,a5,-696 # 80039998 <uxLastControllingCycles.2>
    80005c58:	6398                	ld	a4,0(a5)
    80005c5a:	00034797          	auipc	a5,0x34
    80005c5e:	d1678793          	addi	a5,a5,-746 # 80039970 <uxControllingCycles>
    80005c62:	639c                	ld	a5,0(a5)
    80005c64:	00f71963          	bne	a4,a5,80005c76 <xAreRecursiveMutexTasksStillRunning+0x28>
    80005c68:	00034797          	auipc	a5,0x34
    80005c6c:	cf078793          	addi	a5,a5,-784 # 80039958 <xErrorOccurred>
    80005c70:	4705                	li	a4,1
    80005c72:	e398                	sd	a4,0(a5)
    80005c74:	a819                	j	80005c8a <xAreRecursiveMutexTasksStillRunning+0x3c>
    80005c76:	00034797          	auipc	a5,0x34
    80005c7a:	cfa78793          	addi	a5,a5,-774 # 80039970 <uxControllingCycles>
    80005c7e:	6398                	ld	a4,0(a5)
    80005c80:	00034797          	auipc	a5,0x34
    80005c84:	d1878793          	addi	a5,a5,-744 # 80039998 <uxLastControllingCycles.2>
    80005c88:	e398                	sd	a4,0(a5)
    80005c8a:	00034797          	auipc	a5,0x34
    80005c8e:	d1678793          	addi	a5,a5,-746 # 800399a0 <uxLastBlockingCycles.1>
    80005c92:	6398                	ld	a4,0(a5)
    80005c94:	00034797          	auipc	a5,0x34
    80005c98:	ce478793          	addi	a5,a5,-796 # 80039978 <uxBlockingCycles>
    80005c9c:	639c                	ld	a5,0(a5)
    80005c9e:	00f71963          	bne	a4,a5,80005cb0 <xAreRecursiveMutexTasksStillRunning+0x62>
    80005ca2:	00034797          	auipc	a5,0x34
    80005ca6:	cb678793          	addi	a5,a5,-842 # 80039958 <xErrorOccurred>
    80005caa:	4705                	li	a4,1
    80005cac:	e398                	sd	a4,0(a5)
    80005cae:	a819                	j	80005cc4 <xAreRecursiveMutexTasksStillRunning+0x76>
    80005cb0:	00034797          	auipc	a5,0x34
    80005cb4:	cc878793          	addi	a5,a5,-824 # 80039978 <uxBlockingCycles>
    80005cb8:	6398                	ld	a4,0(a5)
    80005cba:	00034797          	auipc	a5,0x34
    80005cbe:	ce678793          	addi	a5,a5,-794 # 800399a0 <uxLastBlockingCycles.1>
    80005cc2:	e398                	sd	a4,0(a5)
    80005cc4:	00034797          	auipc	a5,0x34
    80005cc8:	ce478793          	addi	a5,a5,-796 # 800399a8 <uxLastPollingCycles.0>
    80005ccc:	6398                	ld	a4,0(a5)
    80005cce:	00034797          	auipc	a5,0x34
    80005cd2:	cb278793          	addi	a5,a5,-846 # 80039980 <uxPollingCycles>
    80005cd6:	639c                	ld	a5,0(a5)
    80005cd8:	00f71963          	bne	a4,a5,80005cea <xAreRecursiveMutexTasksStillRunning+0x9c>
    80005cdc:	00034797          	auipc	a5,0x34
    80005ce0:	c7c78793          	addi	a5,a5,-900 # 80039958 <xErrorOccurred>
    80005ce4:	4705                	li	a4,1
    80005ce6:	e398                	sd	a4,0(a5)
    80005ce8:	a819                	j	80005cfe <xAreRecursiveMutexTasksStillRunning+0xb0>
    80005cea:	00034797          	auipc	a5,0x34
    80005cee:	c9678793          	addi	a5,a5,-874 # 80039980 <uxPollingCycles>
    80005cf2:	6398                	ld	a4,0(a5)
    80005cf4:	00034797          	auipc	a5,0x34
    80005cf8:	cb478793          	addi	a5,a5,-844 # 800399a8 <uxLastPollingCycles.0>
    80005cfc:	e398                	sd	a4,0(a5)
    80005cfe:	00034797          	auipc	a5,0x34
    80005d02:	c5a78793          	addi	a5,a5,-934 # 80039958 <xErrorOccurred>
    80005d06:	6398                	ld	a4,0(a5)
    80005d08:	4785                	li	a5,1
    80005d0a:	00f71463          	bne	a4,a5,80005d12 <xAreRecursiveMutexTasksStillRunning+0xc4>
    80005d0e:	e402                	sd	zero,8(sp)
    80005d10:	a019                	j	80005d16 <xAreRecursiveMutexTasksStillRunning+0xc8>
    80005d12:	4785                	li	a5,1
    80005d14:	e43e                	sd	a5,8(sp)
    80005d16:	67a2                	ld	a5,8(sp)
    80005d18:	853e                	mv	a0,a5
    80005d1a:	0141                	addi	sp,sp,16
    80005d1c:	8082                	ret

0000000080005d1e <strnlen>:
    80005d1e:	00b506b3          	add	a3,a0,a1
    80005d22:	87aa                	mv	a5,a0
    80005d24:	e589                	bnez	a1,80005d2e <strnlen+0x10>
    80005d26:	a829                	j	80005d40 <strnlen+0x22>
    80005d28:	0785                	addi	a5,a5,1
    80005d2a:	00f68863          	beq	a3,a5,80005d3a <strnlen+0x1c>
    80005d2e:	0007c703          	lbu	a4,0(a5)
    80005d32:	fb7d                	bnez	a4,80005d28 <strnlen+0xa>
    80005d34:	40a78533          	sub	a0,a5,a0
    80005d38:	8082                	ret
    80005d3a:	40a68533          	sub	a0,a3,a0
    80005d3e:	8082                	ret
    80005d40:	4501                	li	a0,0
    80005d42:	8082                	ret
