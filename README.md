# digital_clock
Designing Digital Clock on Spartan-3 xc3s40

The main objective of the digital clock is to display the time digitally using 7-segment display on Spartan-3 FPGA Board. The digital clock by default displays the run time and time can be set by using time set assigned to switch on board. The digital clock designed is a 24-clock hour format. It displays the time in format of hours : minutes : seconds. Out of total 4MHz,it used only 1Hz frequency with 22 bit register. It uses the already existing blocks like counter.

The major steps in the flow are:
1. Design of code and Addition of constrains:
Design the system and derive the HDL(Hardware Description Language) file. To specify certain implementation constraints, we may need to add a separate constraint file.
       
2. Development of testbench code for simulation:
Develop the testbench in HDL and perform RTL simulation. The RTL term proves the fact that the HDL code is done at the register transfer level.

4. Synthesis and Implementation:
Perform synthesis and implementation. The synthesis process is known as logic synthesis, in which the software transforms the HDL constructs to generic gatelevel components, such as simple logic gates and FlipFlops. The implementation process consists of three smaller processes namely: translate, map, place and route. The translate process merges multiple design files to a single netlist. The map process, which is generally known as technology mapping, maps the generic gates in the netlist to FPGA’s logic cells and 10Bs. The place and route process, which is generally known as placement and routing, derives the physical layout inside the FPGA chip. It places the cells in various physical locations and determines the routes to connect various signals accordingly. In the Xilinx flow, static timing analysis, which determines various timing parameters, such as maximal propagation delay and maximal clock frequency, is performed at the end of the implementation process.
                                                    

5. Generation of Bit stream and configuration of the file:
Create and download the programming document. In this procedure, an arrangement record is created by the last netlist. This document is then downloaded to a FPGA gadget serially to design the switches and rationale cells. The discretionary useful reproduction can be performed after union, and the discretionary planning recreation can be performed after usage. To supplant the RTL depiction and check the accuracy of the combination handle, utilitarian reenactment utilizes an integrated netlist. Timing recreation utilizes the last netlist, alongside nitty gritty planning information, to perform reproduction. Practical and Timing recreation may require a huge sum of time as a result of the multifaceted nature of the netlist. In the event that we take after great outline and coding hones, the HDL code will be integrated and executed effectively. We have to utilize just RTL reenactment to check the accuracy of the HDL code and afterward utilize static planning examination to look at the pertinent planning data. Both useful and timing reenactments might be discarded from the improvement stream.

