`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 11:08:34 PM
// Design Name: 
// Module Name: ID_EX
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

module ID_EX(
input clk,
   input [31:0] Readdata1, Readdata2,
   input [31:0] IF_ID_lui,IF_ID_immediateaddress,
   input [4:0] IF_IDrs,IF_IDrt,IF_IDrd,
   input Alusrc_IF_ID,RegDst_IF_ID,
   input MemRead_IF_ID,MemWrite_IF_ID,
   input MemtoReg_IF_ID,RegWrite_IF_ID,
   input [1:0] Aluop_IF_ID,
   input immediate_IF_ID,
   
   output reg [31:0] Readdata1_ID_EX,Readdata2_ID_EX,
   output reg [31:0] ID_EX_lui,ID_EX_immediateaddress,
   output reg [4:0] ID_EXrs,ID_EXrt,ID_EXrd,
   output reg  ALUsrc_ID_EX,RegDst_ID_EX,
   output reg MemRead_ID_EX,MemWrite_ID_EX,
   output reg MemtoReg_ID_EX,RegWrite_ID_EX,
   output reg [1:0] Aluop_ID_EX,
   output reg immediate_ID_EX
    );
    
    always @(posedge clk)
    begin
        Readdata1_ID_EX <= Readdata1;
        Readdata2_ID_EX <= Readdata2;
        ID_EX_lui = IF_ID_lui;
        ID_EXrs <= IF_IDrs;
        ID_EXrt <= IF_IDrt;
        ID_EXrd <= IF_IDrd;
        ALUsrc_ID_EX <= Alusrc_IF_ID;
        RegDst_ID_EX <= RegDst_IF_ID;
        MemRead_ID_EX <= MemRead_IF_ID;
        MemWrite_ID_EX <= MemWrite_IF_ID;
        MemtoReg_ID_EX <= MemtoReg_IF_ID;
        RegWrite_ID_EX <= RegWrite_IF_ID;
        Aluop_ID_EX <= Aluop_IF_ID;
        immediate_ID_EX <= immediate_IF_ID;
        ID_EX_immediateaddress <= IF_ID_immediateaddress;
    end
endmodule

