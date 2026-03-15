# 📟 Microprocessor & Assembly Language Lab

This repository contains a collection of **8086 Assembly Language** programs developed as part of my Microprocessors course at the **Arab Academy for Science and Technology (AAST)**. The projects focus on understanding CPU architecture, register management, memory addressing, and hardware interfacing.

---

## 🚀 Getting Started

### Prerequisites

To run these programs, you will need an emulator for the 8086 microprocessor.

* **Recommended:** [emu8086](https://emu8086-microprocessor-emulator.en.softonic.com/) (Ideal for beginners as it provides a visual representation of registers and flags).
* **Alternative:** DOSBox with TASM/MASM for a more authentic low-level environment.

### How to Run

1. Clone this repository:
```bash
git clone https://github.com/your-username/microprocessor-assembly.git

```


2. Open the `.asm` files in **emu8086**.
3. Click **Emulate** and use the **Single Step** button to watch how the registers ($AX, BX, CX, DX$) change with each instruction.

---

## 📂 Repository Structure

| File | Description | Key Concepts |
| --- | --- | --- |
| `hello_world.asm` | Basic string output to the console. | `INT 21h`, `Data Segment` |
| `arithmetic.asm` | Addition, subtraction, and multiplication of hex values. | `ADD`, `SUB`, `MUL`, `Flags` |
| `array_sum.asm` | Calculating the sum of an array using loops. | `SI/DI Registers`, `LOOP`, `Memory Offsets` |
| `sorting.asm` | Implementing Bubble Sort at the assembly level. | `CMP`, `JMP`, `Conditional Branching` |
| `io_interfacing.asm` | Reading input from the keyboard and displaying it. | `Interrupts`, `ASCII conversion` |

---

## 🧠 What I Learned

* **Register-Level Programming:** Managing General Purpose, Segment, and Index registers.
* **The Stack:** Understanding how `PUSH` and `POP` operations manage memory during subroutines.
* **Interrupts:** Using BIOS and DOS interrupts to handle I/O operations.
* **Instruction Set Architecture (ISA):** Hands-on experience with Data Transfer, Arithmetic, and Logical instructions.

---

## 🛠️ Tools Used

* **Language:** 8086 Assembly (ASM)
* **Emulator:** emu8086 / DOSBox
* **Architecture:** x86 (16-bit)

---

### 💡 Pro-Tip for Viewers

If you are debugging these scripts, pay close attention to the **Flags Register**. Understanding why the `Zero Flag (ZF)` or `Carry Flag (CF)` flips is the secret to mastering assembly!

---

**Would you like me to generate a specific code snippet, like a "Bubble Sort" or "Matrix Addition," to add as the first complex program in your repo?**
