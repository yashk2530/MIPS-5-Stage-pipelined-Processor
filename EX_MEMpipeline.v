`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 11:50:08 PM
// Design Name: 
// Module Name: EX_MEMpipeline
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

module EX_MEMpipeline(
input clk,
input [31:0] ALUResult_ID_EX,
input [4:0] ID_EXrtrd,
input [31:0] FWD2_ID_EX,
input [31:0] ID_EX_lui,

input   MemRead_ID_EX,MemWrite_ID_EX,
input MemtoReg_ID_EX,RegWrite_ID_EX,
input immediate_ID_EX,

output reg [31:0] ALUResult_EX_MEM,
output reg [4:0] EX_MEMrtrd,
output reg [31:0] FWD2_EX_MEM,
output reg [31:0] EX_MEM_lui,

output reg MemRead_EX_MEM,
output reg MemWrite_EX_MEM,
output reg  MemtoReg_EX_MEM,
output reg RegWrite_EX_MEM,
output reg immediate_EX_MEM
    );
    
    always @(posedge clk)
    begin
        ALUResult_EX_MEM = ALUResult_ID_EX;
        EX_MEMrtrd = ID_EXrtrd;
        FWD2_EX_MEM = FWD2_ID_EX;
        EX_MEM_lui = ID_EX_lui;
        MemRead_EX_MEM = MemRead_ID_EX;
        MemWrite_EX_MEM = MemWrite_ID_EX;
        MemtoReg_EX_MEM = MemtoReg_ID_EX;
        RegWrite_EX_MEM = RegWrite_ID_EX;
        immediate_EX_MEM = immediate_ID_EX;
    end
    
endmodule

