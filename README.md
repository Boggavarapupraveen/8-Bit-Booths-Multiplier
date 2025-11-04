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
  ##                    4. SynthesizethecircuitusingCadenceGenus.
   ##                   5. Importsynthesizednetlist intoCadenceInnovus.
   ##                 6. Performfloorplanning,placement,CTS, routing,andsignoffchecks
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
##  Explanation: ThewaveformshowsthattheBoothmultiplierisworkingcorrectly. Whenyougive inputs(multiplicandandmultiplier), theoutputproductbecomes
 stableafter themultiplierdoesaseriesofadding, subtracting, andshiftingsteps
 onebyone.ThismeanstheVerilogcoderunstheBoothalgorithmproperlybefore
 thefinalchipdesignprocess(synthesis)

 # SynthesizedGate-LevelSchematic:-
 ![IMG-20251030-WA0002](https://github.com/user-attachments/assets/0ea63236-6eb1-4271-acef-476c70c05584)
 ##  Explanation:
 ## This schematic is a simple drawing thatshows how the Boothmultiplier hardware looksafter theVerilogcode is changed intoactual circuitparts tiplierhardware looks after the Verilogcode is changed intoactual circuitparts  duringsynthesis.
 It includes importan0t parts like:-–Registers:Theseholdnumberstemporarily.




 

                 




