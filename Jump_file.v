`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 01:20:55 PM
// Design Name: 
// Module Name: Jump_file
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


module Jump_file(
    input [31:0] Instruction_code,
    input [31:0] PC_IF_ID_jumpb,
    
    output [31:0] PC_JUMP_final
    );
    
    assign PC_JUMP_final[31:0] = {PC_IF_ID_jumpb[31:28],2'b00, Instruction_code[25:0]};
endmodule
