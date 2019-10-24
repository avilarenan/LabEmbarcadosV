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
  MRS r0, cpsr    @ salvando o modo corrente em R0
  MSR cpsr_ctl, #0b11010010
  LDR sp, =undefined_stack_top @ a pilha de undefined eh setada
  MSR cpsr, r0 @ volta para o modo anterior
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
  sub r14, r14, #4
  STMFD sp!, {r0-r12, LR}
  LDR r0, INTPND
  LDR r0, [r0]
  TST r0, #0x0010
  BLNE handler_timer
  LDMFD sp!,{R0-R12,pc}^

  handler_timer:
    BL handle_time

  timer_init:
   LDR r0, INTEN
   LDR r1,=0x10 @bit 4 for timer 0 interrupt enable
   STR r1,[r0]
   LDR r0, TIMER0L
   LDR r1, =0xff @setting timer value
   STR r1,[r0]
   LDR r0, TIMER0C
   MOV r1, #0xE0 @enable timer module
   STR r1, [r0]
   mrs r0, cpsr
   bic r0,r0,#0x80
   msr cpsr_c,r0 @enabling interrupts in the cpsr
   mov pc, lr

main:
  bl timer_init

stop:
    BL chamada_main
    b stop
