`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 03:01:59 AM
// Design Name: 
// Module Name: Instruction_Memory
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

module Instruction_Memory(
    input [31:0] PC,
    input reset,
    output [31:0] Instructionim
    );
    reg [7:0] Mem [0:36];
    
    assign Instructionim = {Mem[PC], Mem[PC+1], Mem[PC+2], Mem[PC+3]};
    always @(reset)
    begin
        if (reset == 0)
        begin
      Mem[0] = 8'hA0; Mem[1] = 8'h41; Mem[2] = 8'h00; Mem[3] = 8'h0C; // LW R1, 12[R2]          10100000010000010000000000001100 A041000C
      Mem[4] = 8'hA0; Mem[5] = 8'h83; Mem[6] = 8'h00; Mem[7] = 8'h12; // LW R3, 18[R4]          10100000100000110000000000010010 A0830012
      Mem[8] = 8'h00; Mem[9] = 8'h23; Mem[10] = 8'h28; Mem[11] = 8'h00; // SLT R5, R1, R3       00000000001000110010100000000000 00232800
      Mem[12] = 8'h34; Mem[13] = 8'hA6; Mem[14] = 8'h00; Mem[15] = 8'hC8; // ORI R6, R5, 200    00110100101001100000000011001000 34A600C8

      
         Mem[16] = 8'h8C; Mem[17] = 8'hC7; Mem[18] = 8'h00; Mem[19] = 8'h02; // SW R6, 2[R7]       10001101001001110000000000000010 8CC70002
         Mem[20] = 8'h08; Mem[21] = 8'h00; Mem[22] = 8'h00; Mem[23] = 8'h1C; // j L1               00001000000000000000000000011100  800001C  800001C
         Mem[24] = 8'hA0; Mem[25] = 8'hE7; Mem[26] = 8'h00; Mem[27] = 8'h0C; // LW R7, 12[R7]      10100000111001110000000000001100 A0E7000C
         Mem[28] = 8'h3C; Mem[29] = 8'h06; Mem[30] = 8'h00; Mem[31] = 8'h80; // L1:  	LUI R6, 128  00111100000001100000000010000000 3C060080
         
       end
    end
    endmodule