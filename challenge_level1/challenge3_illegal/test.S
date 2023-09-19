# See https://gitlab.com/vyoma_systems/common/-/blob/main/LICENSE.vyoma for more details
 
#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  .align 2              # load the value 2 into the register TESTNUM.
  .option norvc

  li TESTNUM, 2
illegal_instruction:
  .word 0              
  j fail
  TEST_PASSFAIL

  .align 8
  .global mtvec_handler
mtvec_handler:
  li t1, CAUSE_ILLEGAL_INSTRUCTION
  csrr t0, mcause             # machine cause register (mcause) is loaded into t0.
  bne t0, t1, fail            # if t0 not equal to t1 then fail 
  csrr t0, mepc               # machine exception program counter (mepc) is loaded into t0.
  addi t0, t0, 8      # Move to the next instruction after the invalid one.
  csrw mepc, t0        # Update the program counter   
  mret                        # return from the trap handler and continue execution after the exception.

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END