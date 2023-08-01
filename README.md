This repository contains the whole summary of hands on done by Abhinav Prakash (IS22MTECH14002) during the [RISC-V CTB 2023 Processor Design Verification Hackathon](https://community.riscv.org/events/details/risc-v-international-risc-v-academy-presents-risc-v-capture-the-bug-hackathon/) aims to introduce participants to the RISC-V ecosystem and familiarize them with the fundamentals of processor verification. Through this event, the RISC-V CTB imparts knowledge about the process of identifying bugs in RISC-V designs, emphasizing the importance of thorough processor verification.

![UPTICKPRO](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/36d42d70-c197-4ec8-8e87-82c763351a4b)

# Table of Contents
  * [Level-1](#Level-1)
  * [Level-2](#Level-2)
  * [Refrences](#Refrences)
  
# Level-1
## Challenge-1 logical
### Identifying the Bug 
- To find the bug, we ran the `make` command and found the bug in 2 bugs.

![Screenshot (2635)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/bd23eaaf-9f2d-4079-890c-c6a36eed57f3)

### Correcting the Bug
- To correct the bug, `and` is an R-Format ISA, so we replaced z4 with any defined registers in RV32I, like t0. So final instruction of line 15855 in `test.S` file in `and s7,ra,t0`.
- Whereas in the next bug, `addi` is I-Format ISA, hence it performs addition with immediate data and s0 is not immediate data, so we replace s0 with any immediate data like 2. So final instruction of line no 25584 in `test.S` file in `addi s5,t1,2`.
  
#### Defined Registers in RV32I
![Screenshot (2650)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/c320ae7e-6523-4df1-8b0b-ac2047051637)

#### R-Format ISA
![Screenshot (2649)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/4ea0e946-4141-4087-93fd-59f5973f1144)

#### I-Format ISA

![Screenshot (2651)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/14216fed-1db9-4fcb-9066-c1b58a2713f2)


- Then we run the make command, which generates `test.disass`,`test.elf` and `test_spike.dump` files.

![Screenshot (2642)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/3b9009f5-a997-4da2-bf5f-4d23af3a4f73)

## Challenge-2 logical
###  Identifying the Bug
- To find the bug we ran `make` command, and found the loop is running infinite times, so we came out of the loop using `Ctrl+c` and `q` and tried to find the bug.

![Screenshot (2645)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/c16847ee-32d3-4469-83ca-726119754c0b)

### Correcting the Bug
- We made the following changes in the code to run the loop properly.

![Screenshot (2646)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/96a922d4-8781-407c-bd17-0f45fdd1343c)
 
- Finally, after running `make`, the required files were generated.

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-abhinavprakash199/assets/120498080/481380cc-534c-44b8-a088-d0f0cb400c96)


## Challenge-3 illegal
###  Identifying the Bug
- To find the bug we ran `make` command and found the loop was running infinite times, so we came out of the loop using `Ctrl+c` and `q` and tried to find the bug.
  
![Capture](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/c7a08ccf-cb47-44e6-a90c-a0e6c9772991)

### Correcting the Bug
- We made the following changes in the code to run the loop properly.

![Screenshot (2660)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/76988f0f-b57b-4fd6-98f3-ada6744b3da7)


- Finally, after running `make`, the required files were generated.

![Screenshot (2653)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/45058480-e18b-4d1f-bbe1-6b0d7f30dadb)

## Level-1 Refrences 
- [RISC-V Testing Environments - 1st RISC-V Bootcamp](https://www.youtube.com/watch?v=mbyb7BgYyXg)
- [rircv-test GitHub](https://github.com/riscv-software-src/riscv-tests)


# Level-2
## Challenge-1 instructions
###  Identifying the Bug 
- To find the bug, we ran the `make` command and found some errors.

![Screenshot (2663)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/20ed017e-00f0-48c6-b8d8-b7a36cba13dd)


### Correcting the Bug
- To find the bug, we went though the `rv32i.yaml` file and found an ISA-instruction-distribution of 64 bits which was initialized to 10 but was working in rv32i, so we changed it to 0.
  
![Screenshot (2665)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/40c9cd68-5510-4c36-a6c4-c31d754660ec)

- We changed `rel_rv64m: 10` to `rel_rv64m: 0` to correct the bug.
- Finally, after running `make` the required files were generated.

![Screenshot (2661)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/1671c561-99c4-4a75-964e-c869b78f184f)

## Challenge-2 exceptions
###  Identifying the Bug 
- To find the bug, we ran the `make` command and found it generated only one illegal exception.

![Screenshot (2668)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/2dc0572d-ed4b-477d-851b-8cf4c8c08f07)

### Correcting the Bug
- Here, we need to generate 10 illegal exceptions, so we made some changes in the `rv32i.yalm` file.
- Changed `total_instructions: 1000` to `total_instructions: 200`, `rel_rv32i.data: 10` to `rel_rv32i.data: 0` ,  `rel_rv32m: 0` to `rel_rv32m: 1` and `ecause00: 0` to `ecause00: 1`.


- Finally, after running the `make` command to generate all illegal exceptions, which are saved in generated `exception.log` file.

![Screenshot (2667)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/bc693785-18cb-470a-b181-a36ed86ca655)

#### Generated illegal exception.

![Screenshot (2672)](https://github.com/abhinavprakash199/RISC-V-CTB-Hackathon/assets/120498080/dbad2f4d-e295-425c-a55f-9118088d3a2e)

## Level-2 Refrences 
- [Automated Assembly Program Generator](https://gitlab.com/shaktiproject/tools/aapg)
- [Wiki AAPG](https://gitlab.com/shaktiproject/tools/aapg/-/wikis/Wiki-AAPG-%5B2.2.2%5D)

# Refrences 
- [RISC-V Intro](https://www.youtube.com/watch?v=cLE2UppGZ1A)
- [RISC-V Base RV32I](https://www.youtube.com/watch?v=bp-Y7nSJa8o)
- [ Processor Verification](https://www.youtube.com/watch?v=aS3TwoqUWk0)
- [RISCV CTB Challenges Vyoma](https://www.youtube.com/watch?v=XSPxKUGsnkY)
