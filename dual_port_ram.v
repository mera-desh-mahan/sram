`timescale 1 ns/100 ps
//#############################################
//# Behavioral dual-port SRAM description :
//# Active High write enable (WE)
//# Active High read enable (RE)
//# Rising clock edge (Clock)
//#############################################
module reg_dpram(Data, Q, Clock, WE, RE, WAddress, RAddress);
parameter width = 8;
parameter depth = 8;
parameter addr = 3;
input Clock, WE, RE;
input [addr-1:0] WAddress, RAddress;
input [width-1:0] Data;
output [width-1:0] Q;
reg [width-1:0] Q;
reg [width-1:0] mem_data [depth-1:0];
// ############################################
// # Write Functional Section
// ############################################
always @(posedge Clock)
begin
if(WE)
 mem_data[WAddress] = #1 Data;
end
//#############################################
//# Read Functional Section
//#############################################
always @(posedge Clock)
begin
if(RE)
Q = #1 mem_data[RAddress];
end
endmodule
