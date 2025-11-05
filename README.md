# Project Title

## Implementation of 8-bit Booth’s Multiplier using Semi-Custom VLSI Design Flow

# Aim:-

## To design, synthesize, implement, and analyze an 8-bit Booth’s Multiplier using the semi-custom VLSI design approach, including RTL coding, functional verification, synthesis, floorplanning, placement, routing, and performance evaluation.

# Apparatus / Tools Used

## 1.Cadence Genus (Synthesis)

## 2.Cadence Innovus (Place & Route)

## 3.Verilog HDL Code

## 4.Testbench (Functional Verification)

## 5.sdc File (Timing Constraints)

## 6.run.tcl (Automation Script)

## 7.Standard Cell Library (Technology Dependent)

# Introduction

## Booth’s algorithm is a fast and hardware-efficient algorithm used to multiply signed binary numbers. Unlike conventional multiplication which may require several addition and shift operations, Booth’s algorithm reduces the number of partial products, especially when there are consecutive 1’s in the multiplier.

## In VLSI design, Booth’s multiplier is preferred because it:

### Reduces hardware complexity

### Lowers power consumption

### Improves computational efficiency

### Supports signed arithmetic directly


# ✅ Advantages of Booth’s Multiplier


| Feature                                 | Advantage Description                                                                                                                      |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **Efficient for Signed Multiplication** | Booth’s algorithm directly supports **2’s complement numbers**, reducing the need for separate handling of negative values.                |
| **Reduced Computational Steps**         | It minimizes the number of **addition/subtraction operations**, especially when the multiplier contains **long sequences of 1’s**.         |
| **Lower Hardware Complexity**           | Requires fewer arithmetic circuits compared to traditional shift-and-add multiplication methods.                                           |
| **Better Power Efficiency**             | **Reduced switching activity** leads to lower dynamic power consumption, making it suitable for **low-power VLSI designs**.                |
| **Scalable in VLSI Flow**               | The architecture fits well into **semi-custom VLSI implementation**, and can be optimized easily during synthesis, placement, and routing. |
| **Performance Improvement**             | Shows improved **speed and area trade-off** for moderate operand sizes like **8-bit and 16-bit** multipliers.                              |

# ❌ Disadvantages of Booth’s Multiplier


| Limitation                                            | Explanation                                                                                                                                 |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **Performance Drops with Alternating Bits (101010…)** | When the multiplier has a pattern of alternating bits, the efficiency benefit decreases because more add/subtract operations are triggered. |
| **Complex Control Logic**                             | The need to track the previous bit and perform conditional operations increases **controller complexity** compared to simple multipliers.   |
| **Variable Latency**                                  | The number of effective arithmetic steps is **not fixed**, making timing optimization slightly harder for high-speed designs.               |
| **More Power for High Bit-Widths**                    | For large bit-width multipliers (32-bit and above), Booth multipliers can still consume significant **routing and register power**.         |
| **Not Ideal for Unsigned Multiplication**             | Needs adjustments to handle **unsigned numbers**, since Booth’s algorithm assumes **signed 2’s complement representation**.                 |


# General Comparison of Multipliers

| **Multiplier Type**                 | **Signed Number Support**  | **Partial Product Count** | **Hardware Complexity**   | **Efficiency** |
| ----------------------------------- | -------------------------- | ------------------------- | ------------------------- | -------------- |
| **Array Multiplier**                | ✖ Requires Extra Logic     | ❗ High                    | 🔧 High (Many Adders)     | ⭐⭐☆☆☆          |
| **Carry Save Multiplier (CSA)**     | ✖ Not Direct               | ⚖ Medium                  | 🔧 High (Multiple Stages) | ⭐⭐⭐⭐☆          |
| **Booth Multiplier (This Project)** | ✅ **Yes – Direct Support** | ✅ **Reduced**             | ⚙ **Moderate**            | ⭐⭐⭐⭐⭐          |

# Speed, Area, and Power Analysis

| **Multiplier**                      | **Operational Speed** | **Area Utilization**           | **Power Consumption**          | **Target Applications**          |
| ----------------------------------- | --------------------- | ------------------------------ | ------------------------------ | -------------------------------- |
| **Array Multiplier**                | ⚡ Medium              | 🧱 **High** (Dense Logic)      | 🔥 High                        | Small Bit-Width Designs          |
| **Wallace Tree Multiplier**         | ⚡⚡ **Very High**      | 🔩 High (Complex Interconnect) | ⚡ Medium                       | High-Performance DSP/CPU         |
| **Booth Multiplier (This Project)** | ⚡⚡ High               | ✅ **Low–Medium** (Optimized)   | 🌱 **Low** (Reduced Switching) | **Low-Power & VLSI ASIC Design** |

# Behavioral & Algorithmic Performance

| **Condition**                          | **Array Multiplier**    | **Wallace Tree Multiplier** | **Booth Multiplier (This Project)** |
| -------------------------------------- | ----------------------- | --------------------------- | ----------------------------------- |
| **Signed Number Handling**             | ❌ Needs Sign Correction | ❌ Needs Extra Logic         | ✅ **Supported Natively**            |
| **Consecutive ‘1’ Bits in Multiplier** | 😐 No Improvement       | 😐 No Improvement           | ✅ **Less Operations → Faster**      |
| **Alternating Bits (e.g., 1010)**      | 😐 Normal Performance   | 😐 Normal Performance       | ⚠ Slight Efficiency Drop            |
| **Implementation Complexity**          | ⭐ Easy                  | 🔧 Very Complex             | ⚙ **Moderate + Optimized**          |


# Conclusion: 
  ## Booth Multiplier offers the best balance of speed, area, and power, especially suitable for ASIC and SoC designs.

# Booth Algorithm Working Principle

## Let A = Accumulator

## M = Multiplicand

## Q = Multiplier

## Q₋₁ = Previous LSB

## At each iteration:

## Check the pair (Q₀, Q₋₁)

# Perform:

## 10 → A = A − M

## 01 → A = A + M

## 00 or 11 → No arithmetic operation

## Perform Arithmetic Right Shift

## Repeat for number of bits in Q

### This reduces the number of addition/subtraction operations.

# Procedure

## Write RTL code for Booth’s Multiplier in Verilog.

```
 module booth_multiplier (
    output reg [15:0] prod, 
    output reg busy,
    input [7:0] mc, mp, 
    input clk, start
);
    reg [7:0] A, Q, M;
    reg Q_1;
    reg [3:0] count;
    wire [7:0] sum, diff;

    always @(posedge clk) begin
        if (start) begin
            A <= 8'b0;
            M <= mc;
            Q <= mp;
            Q_1 <= 1'b0;
            count <= 4'b0;
            busy <= 1'b1;
        end else if (busy) begin
            case ({Q[0], Q_1})
                2'b01 : {A, Q, Q_1} <= {sum[7], sum, Q};     // Add
                2'b10 : {A, Q, Q_1} <= {diff[7], diff, Q};   // Subtract
                default : {A, Q, Q_1} <= {A[7], A, Q};       // Shift only
            endcase
            count <= count + 1'b1;
            if (count == 4'd8)
                busy <= 1'b0;
        end
        prod <= {A, Q};
    end

    alu add1 (sum, A, M, 1'b0);
    alu sub1 (diff, A, ~M, 1'b1);
endmodule

module alu (
    output [7:0] out, 
    input [7:0] a, b, 
    input cin
);
    assign out = a + b + cin;
endmodule
```



# Develop a testbench and perform functional simulation.
```
module tb_booth_multiplier();
    reg [7:0] mc, mp;
    reg clk, start;
    wire [15:0] prod;
    wire busy;

    booth_multiplier uut (.prod(prod), .busy(busy), .mc(mc), .mp(mp), .clk(clk), .start(start));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Case 1
        mc = 8'd4; mp = 8'd3; start = 1; #10; start = 0;
        #80;
        // Test Case 2
        mc = 8'd15; mp = 8'd7; start = 1; #10; start = 0;
        #80;
        // Test Case 3 (Negative values)
        mc = -8'd4; mp = -8'd3; start = 1; #10; start = 0;
        #80;
        $stop;
    end
endmodule
```

# Provide timing constraints using .sdc.
```
# Set clock period to 10ns (100MHz)
create_clock -name clk -period 10 [get_ports clk]

# Input/output delay for primary inputs/outputs
set_input_delay 2 [get_ports mc]
set_input_delay 2 [get_ports mp]
set_output_delay 2 [get_ports prod]

# Set drive strength and load (optional, example values)
set_drive 4 [get_ports mc]
set_load 10 [get_ports prod]
```

# Run.TCL Code
```
# Set library search path
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/
set_db library slow.lib

# Set HDL search path (directory, not file)
set_db init_hdl_search_path {.}

# Read RTL files
read_hdl booths_multiplier.v

# If the top module name inside the file is different, change it here
elaborate booths_multiplier

# Read timing constraints
read_sdc input_constraints.sdc

# Run synthesis
syn_generic
syn_map
syn_opt

# Write output netlist/SDF/SDC
write_hdl > outputs/booths_multiplier_netlist.v
write_sdf > outputs/booths_multiplier.sdf
write_sdc > outputs/booths_multiplier_syn.sdc

# Reports
report_area   > reports/area.rpt
report_timing > reports/timing.rpt
report_power  > reports/power.rpt

# Optional GUI
gui_show

```


# Perform:

## 1.Floorplanning

## 2.Placement

## 3.Clock Tree Synthesis

## 4.Routing

## 5.Timing Sign-off

## 6.Generate layout view and performance reports.

# Simulation Output


![WhatsApp Image 2025-10-30 at 17 13 28_5953e401](https://github.com/user-attachments/assets/02fd421c-a7eb-4a54-9e84-93b65a912035)



# Explanation:
### The output stabilizes after sequential add/subtract and shift operations, confirming correct Booth multiplication behavior in RTL simulation.

# Synthesized Gate-Level Schematic


![WhatsApp Image 2025-10-30 at 17 13 28_5caad923](https://github.com/user-attachments/assets/6775a316-e283-469f-b701-c1cc58e9d617)



# This shows:

## Registers for data holding

## Adders for arithmetic operations

## Shifters for intermediate right shifts

# Timing Report Interpretation

![WhatsApp Image 2025-10-30 at 17 13 28_404ec258](https://github.com/user-attachments/assets/fc1b5696-ebf3-4b68-a5e4-a079e88ae23b)


## Setup Time and Hold Time requirements satisfied

## Positive Slack observed → design meets timing

## Design can run reliably at the target clock frequency

# Power and Area Analysis

![WhatsApp Image 2025-10-30 at 17 13 28_7530dcb0](https://github.com/user-attachments/assets/2d22540a-a97f-4cae-becc-5e526c21c5b2)


## Booth encoding reduces unnecessary switching

## Result: Lower dynamic power

## Area is optimized due to reduced partial product logic

# Layout Results

## Placement View

![WhatsApp Image 2025-10-30 at 17 13 28_2fcb3954](https://github.com/user-attachments/assets/9f98cf26-1444-42d2-9b6e-8a530ed9e679)

# Explanation:-
## This placement step arranges the standard cells to minimize routing complexity and reduce wire delay. Proper placement ensures better performance and lower power.

# Routing View

![WhatsApp Image 2025-10-30 at 17 13 29_8c071f80](https://github.com/user-attachments/assets/234ff7ad-0f4b-4a66-83d2-e891bc6ef994)


# Explanation:-
## The routed layout completes the signal connections using multi-layer interconnects. This step ensures that all timing and electrical constraints are satisfied.

# 3D Layout View

![WhatsApp Image 2025-10-30 at 17 13 29_d8d653d4](https://github.com/user-attachments/assets/cbcc29d9-121e-4492-98fa-f672e4b66ea5)


# Explanation:-
## The 3D visualization shows multiple metal layers and vias. This verifies that the physical implementation follows DRC/LVS rules and is fabrication-ready.

# Result

### The Booth’s multiplier was successfully designed, synthesized, placed, and routed.
### It meets timing, power, and area constraints, making it suitable for VLSI implementation.

# Conclusion

### Booth’s multiplication algorithm significantly optimizes signed multiplication by reducing the number of required operations. Through the semi-custom VLSI design flow, the multiplier was converted from Verilog RTL to final layout, demonstrating the complete IC design cycle and performance validation. This project highlights how algorithmic efficiency directly translates to improved hardware performance in terms of speed, area, and power consumption.

# Research References
# 1.Huang & Ercegovac, "High-Performance Booth Multipliers", IEEE, 1988
## https://ieeexplore.ieee.org/document/16765
## 2.Comparison of Multipliers for VLSI Application
### https://www.ijert.org/comparison-of-multipliers-for-vlsi-application
