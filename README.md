# BIST Embedded-SPI Protocol

## 📌 Project Overview
This project demonstrates the design and implementation of a **Built-In Self-Test (BIST) Embedded Serial Peripheral Interface (SPI) Protocol**.  
The BIST framework enables autonomous fault detection in SPI communication systems without external testing equipment, ensuring improved reliability and faster verification.

## 🛠 Components of the Design
- **Test Pattern Generator (TPG):** Generates pseudo-random test patterns using LFSR.
- **Circuit Under Test (CUT):** Performs addition or subtraction operations on inputs.
- **Output Response Analyzer (ORA):** Compresses outputs into a signature using MISR and compares with a golden reference.
- **Controller (FSM):** Orchestrates the testing process (IDLE → TESTING → DONE).

## ⚙️ Features
- Autonomous fault detection in SPI communication.
- LFSR-based test pattern generation.
- MISR-based response compression.
- Verilog implementation with testbenches for validation.
- Simulation results demonstrating correctness.

## 📂 Repository Structure
- BIST_Report → Full PDF project report.
- `Code/` → Verilog modules and testbenches.
- BIST_images → Diagrams (algorithm, block diagram, circuit).

## 🚀 Future Enhancements
- Extend to multi-LFSR-based BIST for higher fault coverage.
- Add fault tolerance mechanisms for real-time environments.
- Integrate into FPGA-based embedded systems.

## 📖 References
- Shumit Saha et al., *Design and Implementation of SPI Bus Protocol with Built-In-Self-Test Capability over FPGA*, IEEE ICEEICT 2014.
- I.S. Kourtev, W. Vogler, *Serial Peripheral Interface (SPI) Testing with Built-In Self-Test*, IEEE ITC 2017.
- Abhilash S. Warrier et al., *FPGA Implementation of SPI to I2C Bridge*, IJERT 2013.
