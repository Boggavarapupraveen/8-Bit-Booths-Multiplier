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
 # INTRODUCTION:-## • Booth’s algorithm helps multiply signed binary numbers using fewer addition and
 subtraction steps.
 • It works by examining pairs of bits in the multiplier and deciding whether to add,
 subtract, or do nothing with the multiplicand, followed by right-shifting bits.
 • This reduces the total number of operations compared to simple multiplication,
 saving hardware and power.
 • In semi-custom VLSI design flow, this algorithm is implemented by designing cus
tom digital blocks (like adders, shifters, and control logic) using standard cell li
braries.
 • The multiplier circuit is then synthesized, placed, and routed on silicon using CAD
 tools, optimizing for speed, area, and power.
       Booth Algorithm Rules:-###

                 
                 




