`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:10:48 AM
// Design Name: 
// Module Name: ALU
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


module ALU (
    input [31:0] op1,
    input [31:0] op2,
    input [1:0] ALUOp,
    output reg [31:0] aluOut
    );
    
    reg carry;
    
    
    
    always @(*)
    begin
        carry = 0;
        case(ALUOp)
            2'b00:begin
                aluOut = op1 | op2;
            end
            2'b01:begin
                {carry,aluOut} = op1 + op2;
            end
            2'b10:begin
                aluOut = op1*op2;
            end             
            2'b11:begin
         //   aluOut = op1 + op2;
                if(op1 <= op2)
                    aluOut = 32'b1;
                 else
                    aluOut = 32'b0;
            end
            default:begin
                aluOut = 0;
            end
        endcase
    end
    
endmodule
