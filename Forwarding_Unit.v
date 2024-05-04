`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:13:47 AM
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(
    input [4:0] EX_MEM_Register_Rd, ID_EX_Register_Rs, ID_EX_Register_Rt, MEM_WB_Register_Rd,
    input EX_MEM_RegWrite, MEM_WB_RegWrite,
    output reg [1:0] Forward_MuxA, Forward_MuxB
    );
    
    initial
     begin
      Forward_MuxA = 2'b00;
      Forward_MuxA = 2'b00;
     end
    
    always @(*) 
    begin // for Mux A 
    if ( EX_MEM_RegWrite == 1 && EX_MEM_Register_Rd !=0 && (EX_MEM_Register_Rd == ID_EX_Register_Rs))
    begin 
    Forward_MuxA = 2'b10;
    end
    
    else if (MEM_WB_RegWrite == 1 && MEM_WB_Register_Rd != 0 && !(EX_MEM_RegWrite == 1 && EX_MEM_Register_Rd != 0 && EX_MEM_Register_Rd == ID_EX_Register_Rs) && MEM_WB_Register_Rd == ID_EX_Register_Rs) begin
    Forward_MuxA = 2'b01;
    end 
    
    else 
    Forward_MuxA = 2'b00;
    
    if (EX_MEM_RegWrite == 1 && EX_MEM_Register_Rd != 0 && EX_MEM_Register_Rd == ID_EX_Register_Rt) begin
    Forward_MuxB = 2'b10;
    end
    else if (MEM_WB_RegWrite == 1 && MEM_WB_Register_Rd != 0 && !(EX_MEM_RegWrite == 1 && (EX_MEM_Register_Rd != 0) && (EX_MEM_Register_Rd == ID_EX_Register_Rt)) && MEM_WB_Register_Rd == ID_EX_Register_Rt) begin
    Forward_MuxB = 2'b01;
    end 
    else
    Forward_MuxB = 2'b00;    
    end 
endmodule

