// RAM Model
// 
// +-----------------------------+
// |    Copyright 1996 DOULOS    |
// |       Library: Memory       |
// |   designer : John Aynsley   |
// +-----------------------------+
 
module RamChip (Address, Data, CS, WE, OE);

parameter AddressSize = 1;
parameter WordSize = 1;

input [AddressSize-1:0] Address;
inout [WordSize-1:0] Data;
input CS, WE, OE;

reg [WordSize-1:0] Mem [0:(1<<AddressSize)-1];

assign Data = (!CS && !OE) ? Mem[Address] : {WordSize{1'bz}};

always @(CS or WE)
  if (!CS && !WE)
    Mem[Address] = Data;

always @(WE or OE)
  if (!WE && !OE)
    $display("Operational error in RamChip: OE and WE both active");

endmodule
