`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 12:24:41 AM
// Design Name: 
// Module Name: Decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decode(
input [31:0] Instruction_from_IF_ID,
output  [5:0] opcode,
output  [4:0] IF_IDregisterRs,
output [4:0] IF_IDregisterRt,
output [4:0] IF_IDregisterRd,

output [31:0] IF_ID_lui,
output [31:0] IF_ID_immediateaddress


    );
   // wire [15:0] IF_IDoffset;
    
   assign opcode [5:0] = Instruction_from_IF_ID [31:26];
   assign IF_IDregisterRs [4:0] = Instruction_from_IF_ID [25:21];
   assign IF_IDregisterRt [4:0] = Instruction_from_IF_ID [20:16];
   assign IF_IDregisterRd [4:0] = Instruction_from_IF_ID [15:11];
   //assign IF_IDoffset [15:0] = Instruction_from_IF_ID [15:0];
   assign IF_ID_lui [31:0] = {Instruction_from_IF_ID [15:0], 16'b0};
   assign IF_ID_immediateaddress [31:0] = {16'b0, Instruction_from_IF_ID [15:0]};
   
endmodule

