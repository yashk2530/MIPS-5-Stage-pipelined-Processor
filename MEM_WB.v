`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 08:23:25 PM
// Design Name: 
// Module Name: MEM_WB
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

module MEM_WB(
    input clk,
    input [31:0] dm_EX_MEM,
    input [31:0] ALUResult_EX_MEM,
    input [31:0] EX_MEM_lui,
    input [4:0] EX_MEMrtrd,
    input MemtoReg_EX_MEM,
    input RegWrite_EX_MEM,
    input immediate_EX_MEM,
    
    
    output reg [31:0] dm_MEM_WB,
    output reg [31:0] ALUResult_MEM_WB,
    output reg [31:0] MEM_WB_lui,
    output reg [4:0] MEM_WBrtrd,
    output reg MemtoReg_MEM_WB,
    output reg RegWrite_MEM_WB,
    output reg immediate_MEM_WB
    );
    
    always @(posedge clk) 
    begin
     dm_MEM_WB = dm_EX_MEM;
     ALUResult_MEM_WB = ALUResult_EX_MEM;
     MEM_WB_lui = EX_MEM_lui;
     MEM_WBrtrd = EX_MEMrtrd;
     MemtoReg_MEM_WB = MemtoReg_EX_MEM;
     RegWrite_MEM_WB = RegWrite_EX_MEM;
     immediate_MEM_WB = immediate_EX_MEM;
     
    end
    
endmodule
