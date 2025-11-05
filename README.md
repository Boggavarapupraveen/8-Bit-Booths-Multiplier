Project Title

Implementation of 8-bit Booth’s Multiplier using Semi-Custom VLSI Design Flow

Aim

To design, synthesize, implement, and analyze an 8-bit Booth’s Multiplier using the semi-custom VLSI design approach, including RTL coding, functional verification, synthesis, floorplanning, placement, routing, and performance evaluation.

Apparatus / Tools Used

Cadence Genus (Synthesis)

Cadence Innovus (Place & Route)

Verilog HDL (RTL Implementation)

Testbench (Functional Verification)

.sdc File (Timing Constraints)

run.tcl (Automation Script)

Standard Cell Library (Technology Dependent)

Introduction

Booth’s algorithm is a fast and hardware-efficient algorithm used to multiply signed binary numbers. Unlike conventional multiplication which may require several addition and shift operations, Booth’s algorithm reduces the number of partial products, especially when there are consecutive 1’s in the multiplier.

In VLSI design, Booth’s multiplier is preferred because it:

Reduces hardware complexity

Lowers power consumption

Improves computational efficiency

Supports signed arithmetic directly

This project implements the algorithm in Verilog and maps it through the complete semi-custom VLSI flow from RTL to Physical Layout.

✅ Advantages of Booth’s Multiplier
| Feature                                 | Advantage Description                                                                                                                      |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **Efficient for Signed Multiplication** | Booth’s algorithm directly supports **2’s complement numbers**, reducing the need for separate handling of negative values.                |
| **Reduced Computational Steps**         | It minimizes the number of **addition/subtraction operations**, especially when the multiplier contains **long sequences of 1’s**.         |
| **Lower Hardware Complexity**           | Requires fewer arithmetic circuits compared to traditional shift-and-add multiplication methods.                                           |
| **Better Power Efficiency**             | **Reduced switching activity** leads to lower dynamic power consumption, making it suitable for **low-power VLSI designs**.                |
| **Scalable in VLSI Flow**               | The architecture fits well into **semi-custom VLSI implementation**, and can be optimized easily during synthesis, placement, and routing. |
| **Performance Improvement**             | Shows improved **speed and area trade-off** for moderate operand sizes like **8-bit and 16-bit** multipliers.                              |

❌ Disadvantages of Booth’s Multiplier
| Limitation                                            | Explanation                                                                                                                                 |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **Performance Drops with Alternating Bits (101010…)** | When the multiplier has a pattern of alternating bits, the efficiency benefit decreases because more add/subtract operations are triggered. |
| **Complex Control Logic**                             | The need to track the previous bit and perform conditional operations increases **controller complexity** compared to simple multipliers.   |
| **Variable Latency**                                  | The number of effective arithmetic steps is **not fixed**, making timing optimization slightly harder for high-speed designs.               |
| **More Power for High Bit-Widths**                    | For large bit-width multipliers (32-bit and above), Booth multipliers can still consume significant **routing and register power**.         |
| **Not Ideal for Unsigned Multiplication**             | Needs adjustments to handle **unsigned numbers**, since Booth’s algorithm assumes **signed 2’s complement representation**.                 |


General Comparison of Multipliers
| **Multiplier Type**                 | **Signed Number Support**  | **Partial Product Count** | **Hardware Complexity**   | **Efficiency** |
| ----------------------------------- | -------------------------- | ------------------------- | ------------------------- | -------------- |
| **Array Multiplier**                | ✖ Requires Extra Logic     | ❗ High                    | 🔧 High (Many Adders)     | ⭐⭐☆☆☆          |
| **Carry Save Multiplier (CSA)**     | ✖ Not Direct               | ⚖ Medium                  | 🔧 High (Multiple Stages) | ⭐⭐⭐⭐☆          |
| **Booth Multiplier (This Project)** | ✅ **Yes – Direct Support** | ✅ **Reduced**             | ⚙ **Moderate**            | ⭐⭐⭐⭐⭐          |

Speed, Area, and Power Analysis
| **Multiplier**                      | **Operational Speed** | **Area Utilization**           | **Power Consumption**          | **Target Applications**          |
| ----------------------------------- | --------------------- | ------------------------------ | ------------------------------ | -------------------------------- |
| **Array Multiplier**                | ⚡ Medium              | 🧱 **High** (Dense Logic)      | 🔥 High                        | Small Bit-Width Designs          |
| **Wallace Tree Multiplier**         | ⚡⚡ **Very High**      | 🔩 High (Complex Interconnect) | ⚡ Medium                       | High-Performance DSP/CPU         |
| **Booth Multiplier (This Project)** | ⚡⚡ High               | ✅ **Low–Medium** (Optimized)   | 🌱 **Low** (Reduced Switching) | **Low-Power & VLSI ASIC Design** |

Behavioral & Algorithmic Performance
| **Condition**                          | **Array Multiplier**    | **Wallace Tree Multiplier** | **Booth Multiplier (This Project)** |
| -------------------------------------- | ----------------------- | --------------------------- | ----------------------------------- |
| **Signed Number Handling**             | ❌ Needs Sign Correction | ❌ Needs Extra Logic         | ✅ **Supported Natively**            |
| **Consecutive ‘1’ Bits in Multiplier** | 😐 No Improvement       | 😐 No Improvement           | ✅ **Less Operations → Faster**      |
| **Alternating Bits (e.g., 1010)**      | 😐 Normal Performance   | 😐 Normal Performance       | ⚠ Slight Efficiency Drop            |
| **Implementation Complexity**          | ⭐ Easy                  | 🔧 Very Complex             | ⚙ **Moderate + Optimized**          |


Conclusion: Booth Multiplier offers the best balance of speed, area, and power, especially suitable for ASIC and SoC designs.

Booth Algorithm Working Principle

Let A = Accumulator

M = Multiplicand

Q = Multiplier

Q₋₁ = Previous LSB

At each iteration:

Check the pair (Q₀, Q₋₁)

Perform:

10 → A = A − M

01 → A = A + M

00 or 11 → No arithmetic operation

Perform Arithmetic Right Shift

Repeat for number of bits in Q

This reduces the number of addition/subtraction operations.

Procedure

Write RTL code for Booth’s Multiplier in Verilog.

Develop a testbench and perform functional simulation.

Provide timing constraints using .sdc.

Synthesize the design using Cadence Genus.

Import netlist to Cadence Innovus.

Perform:

Floorplanning

Placement

Clock Tree Synthesis

Routing

Timing Sign-off

Generate layout view and performance reports.

Simulation Output

(Waveform image retained from your repository)

Explanation:
The output stabilizes after sequential add/subtract and shift operations, confirming correct Booth multiplication behavior in RTL simulation.

Synthesized Gate-Level Schematic

(Image retained from your repository)

This shows:

Registers for data holding

Adders for arithmetic operations

Shifters for intermediate right shifts

Timing Report Interpretation

Setup Time and Hold Time requirements satisfied

Positive Slack observed → design meets timing

Design can run reliably at the target clock frequency

Power and Area Analysis

Booth encoding reduces unnecessary switching

Result: Lower dynamic power

Area is optimized due to reduced partial product logic

Layout Results
Placement View

Cells are arranged to minimize routing length and delay.

Routing View

Metal layers and interconnects are automatically generated and verified for DRC/LVS correctness.

3D Layout View

Shows physical implementation across metal layers ensuring fabrication readiness.

Result

The Booth’s multiplier was successfully designed, synthesized, placed, and routed.
It meets timing, power, and area constraints, making it suitable for VLSI implementation.

Conclusion

Booth’s multiplication algorithm significantly optimizes signed multiplication by reducing the number of required operations. Through the semi-custom VLSI design flow, the multiplier was converted from Verilog RTL to final layout, demonstrating the complete IC design cycle and performance validation. This project highlights how algorithmic efficiency directly translates to improved hardware performance in terms of speed, area, and power consumption.

Research References
https://ieeexplore.ieee.org/document/16765
https://www.ijert.org/comparison-of-multipliers-for-vlsi-application
