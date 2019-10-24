.globl _start
.text
_start:
  b _Reset
  ldr pc, _undefined_instruction
  ldr pc, _software_interrupt
  ldr pc, _prefetch_abort
  ldr pc, _data_abort
  ldr pc, _not_used
  ldr pc, _irq
  ldr pc, _fiq

_undefined_instruction: .word undefined_instruction
_software_interrupt: .word software_interrupt
_prefetch_abort: .word prefetch_abort
_data_abort: .word data_abort
_not_used: .word not_used
_irq: .word irq
_fiq: .word fiq

INTPND: .word 0x10140000 @Interrupt status register
INTSEL: .word 0x1014000C @interrupt select register( 0 = irq, 1 = fiq)
INTEN: .word 0x10140010 @interrupt enable register
TIMER0L: .word 0x101E2000 @Timer 0 load register
TIMER0V: .word 0x101E2004 @Timer 0 value registers
TIMER0C: .word 0x101E2008 @timer 0 control register
TIMER0X: .word 0x101E200c @timer 0 interrupt clear register

_Reset:
  bl main
  b .

undefined_instruction:
  b .

software_interrupt:
  b do_software_interrupt

prefetch_abort:
  b .

data_abort:
  b .

not_used:
  b .

irq:
  b do_irq_interrupt

fiq:
  b .

do_software_interrupt:
  add r1, r2, r3
  mov pc, r14

do_irq_interrupt:
  STMFD sp!, {r0-r3, LR}

  LDR r0, INTPND
  LDR r0, [r0]

  TST r0, #0x0010
  BNE handler_timer

  LDMFD sp!, {r0-r3, lr}
  mov pc, r14

handler_timer:
  LDR r0, TIMER0X
  MOV r1, #0x0
  STR r1, [r0]

  LDMFD sp!, {r0 - r3, lr}
  mov pc, r14

timer_init:
  mrs r0, cpsr
  bic r0, r0, #0x80
  msr cpsr_c, r0
  LDR r0, INTEN
  LDR r1, =0x10
  STR r1, [r0]
  LDR r0, TIMER0C
  LDR r1, [r0]
  MOV r1,#0xA0
  STR r1, [r0]
  LDR r0, TIMER0V
  MOV r1, #0xff
  STR r1, [r0]
  mov pc, lr

main:
  bl timer_init

stop: b stop
