`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 02:19:35 AM
// Design Name: 
// Module Name: Hazard_detection
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


module Hazard_detection(
    input ID_EX_MemRead,
    input [4:0] ID_EX_Register_Rt, IF_ID_Register_Rs, IF_ID_Register_Rt,
    output reg Control_Select_StallMux, IF_ID_Write, PC_write
    );
    initial begin
    Control_Select_StallMux = 1;
    IF_ID_Write = 0;
    PC_write = 0;
    end
    always@(*) begin
    if(ID_EX_MemRead == 1 && (ID_EX_Register_Rt == IF_ID_Register_Rs || ID_EX_Register_Rt == IF_ID_Register_Rt)) begin
        IF_ID_Write = 1;
        PC_write = 1;
        Control_Select_StallMux = 1;
    end
    else begin
        IF_ID_Write = 0;
        PC_write = 0;
        Control_Select_StallMux = 0;
    end
    end
    
endmodule