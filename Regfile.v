`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 12:24:53 AM
// Design Name: 
// Module Name: Regfile
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


	module Register_File(
    input [4:0] Read_Reg_1, Read_Reg_2, Write_Reg,
    input [31:0] Write_Data,
    input reset, RegWrite, clk,
    output reg [31:0] Reg_Data_1, Reg_Data_2    
    );
    integer i;
    reg [31:0] Regfile [0:31];
    always @ (negedge clk) 
    begin
    Reg_Data_1 = Regfile[Read_Reg_1];
    Reg_Data_2 = Regfile[Read_Reg_2];
    end
       always@(negedge reset) 
    begin 
    if(reset == 0) begin
        for(i=0; i<32; i=i+1) Regfile[i] = 32'd2;
    end
    end
    
    always @( clk) 
    begin
    if (RegWrite == 1 && Write_Reg != 0 && reset != 0)
    Regfile[Write_Reg] = Write_Data;
    end    endmodule