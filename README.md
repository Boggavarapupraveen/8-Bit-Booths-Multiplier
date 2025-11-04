# 8-Bit-Booths-Multiplier
# AIM:-Implementation of 8-bit Booth’s Multiplier  using Semi-Custom VLSI Design Flow
# Apparatus:-➤ Using Cadance
 ##            ➤ Verilog code
  ##           ➤ testbanch code
   ##          ➤  run.tcl
  ##           ➤ input_constraints code
   ##          ➤ Genus
   ##          ➤ innovus
# 📝📝⚙️Procedure:-  1. Write Verilog code for Booth’s Multiplier.
##                      2. Write a testbench and verify the output using simulation.
 ##                     3. Apply timing constraints using .sdc.
  ##                    4. Synthesize the circuit using Cadence Genus.
   ##                   5. Import synthesized netlist into Cadence Innovus.
   ##                 6. Perform floorplanning,placement,CTS, routing,and sign off checks
 # INTRODUCTION:-
##  • Booth’s algorithm helps multiply signed binary numbers using fewer addition and
 subtraction steps.
## • It works by examining pairs of bits in the multiplier and deciding whether to add,
 subtract, or do nothing with the multiplicand, followed by right-shifting bits.
## • This reduces the total number of operations compared to simple multiplication,
 saving hardware and power.
## • In semi-custom VLSI design flow, this algorithm is implemented by designing cus
tom digital blocks (like adders, shifters, and control logic) using standard cell li
braries.
## • The multiplier circuit is then synthesized, placed, and routed on silicon using CAD
 tools, optimizing for speed, area, and power.
##,Booth Algorithm Rules:-<img width="415" height="110" alt="Screenshot 2025-11-04 084403" src="https://github.com/user-attachments/assets/35fb6585-b761-43b9-b112-d1693e86706c" />
 ## Booth multiplication is efficient for signed numbers.
## It reduces number of additions/subtractions compared to normal binary multiplication.
 ## It works well even when large consecutive 1’s appear in the multiplier.
## • A = Accumulator register
## • M = Multiplicand
## • Q = Multiplier
## • Q = Stored previous least significant bit
## • After the chosen operation, perform an Arithmetic Right Shift (ARS) on the com
## bined register(A,Q,Q1)
## • Repeat this procedure for each bit of the multiplier.
## • After all iterations, the final product is obtained as: Product = A parallel Q
## DISADVANTAGES– 
## It is less efficient if the multiplier has alternating 1s and 0s (like 1010).
## The number of addition and subtraction steps can vary, making design com
## plex.– It is harder to understand and implement compared to simple multiplication.
## – Hardware using it may consume more power and space.
## – Works mainly for signed numbers and needs changes for unsigned numbers.
 ## dvantages– 
 ## Efficient for signed multiplication–
 ## Reduces number of additions/subtractions–
 ## Reduces hardware complexit
#  SimulationWaveform:-
![img jpg](https://github.com/user-attachments/assets/53cc7a7e-235b-4cb5-8403-579b5bde195f)
##  Explanation: The waveform shows that the Boothmultiplier is working correctly. When you give inputs(multipli candand multiplier), the output product becomes
  stable after the multiplier do esaser iesofadding, subtracting, and shifting steps
 one by one.This means the Verilogcode runs the Booth algorithm properly before
 the final chip design process (synthesis)

 # Synthesized Gate-Level Schematic:-
 ![IMG-20251030-WA0002](https://github.com/user-attachments/assets/0ea63236-6eb1-4271-acef-476c70c05584)
 ##  Explanation:
 ## This schematic is a simple drawing thatshows how the Boothmultiplier hardware looksafter theVerilogcode is changed intoactual circuitparts tiplierhardware looks after the Verilogcode is changed intoactual circuitparts  duringsynthesis.
# It includes importan0t parts like:-–Registers:These hold numbers temporarily.
## Adders:These add numbers during multiplication
## –Arithmetic shifters: These shift bits left orr right,which is part of them ultiplication process.
# Timing Report:-
![WhatsApp Image 2025-10-30 at 17 13 28_31b68896](https://github.com/user-attachments/assets/e5d63a4e-259e-4d8d-9896-38ba4c595f1e)
##  Explanation:-
###  The timing report shows how well thec ircuit meets its timing goals. It includes
###  –Set up time:The minimum time input signals must be stable before the clock.–
### Hold time:The minimum time input signals must stay stable after the clock.–
### Slack:The extra time available beyond what’sneeded.
###  If the slack is positive, it means the design works on time and can run safely at the chosen clock speed with out errors. This means the circuit is reliable
### and runs fastenough.
# Power and Area Report:-
![WhatsApp Image 2025-10-30 at 17 13 29_244ad4a0](https://github.com/user-attachments/assets/a535c4a9-b68c-4914-b63a-05f645b8471d)
##  Explanation: The report displays total power consumption, leakage power, and
## silicon area used. Booth’s algorithm reduces switching activity, improving power
## efficiency while maintaining acceptable area utilization.
#  Placed Layout:-
![WhatsApp Image 2025-10-30 at 17 13 29_fcb86368](https://github.com/user-attachments/assets/8dcf4242-8a8a-4d4a-9016-f83226432ebd)
##  Explanation:This placement step arranges the standard cells to minimize routing
## complexity and reduce wire delay. Proper placement ensures better performance
## and lower power
# Routed Layout:-
![WhatsApp Image 2025-10-30 at 17 13 29_2cf3ca52](https://github.com/user-attachments/assets/3df2c83b-2477-4305-bcae-fc7429250352)
##  Explanation: The routed layout completes the signal connections using multilayer interconnects.
This steps ensures that all timing ande electrical constraints are  satisfied

 # 3D VIEW :-
 ![WhatsApp Image 2025-10-30 at 17 13 30_2c0220ad](https://github.com/user-attachments/assets/f9f312a7-bc2a-4acb-9e6e-3205f2d725ce)
 ##  Explanation: The 3D visualization shows multiple metal layers and vias. This
## verifies that the physical implementation follows DRC/LVS rules and is fabrication ready
 #  Result:-
 ## The 8-bit Booth’s multiplier was successfully designed and implemented.Functional
 ## simulation,synthesis,place and route operations were completed.The circuit meets
 ## timing,area,and power constraints.
# CONCLYSION:-
## Booth’s algorithm is an efficient technique for signed multiplication. Using a semi
## custom VLSI design flow, the design was successfully taken from behavioral Verilog
## description to a physical layout suitable for fabrication. The experiment demonstrates the complete hardware realization process from RTL to GDSII generation









                 




