`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 03:01:06 AM
// Design Name: 
// Module Name: Instruction_Fetch
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

module Instruction_Fetch(
    input PC_write,PC_source, clk, reset,
    input [31:0] PC_Jump, PC_IF_ID,
   // output reg [31:0] PC_IF, 
    output [31:0] Instruction,
   output reg [31:0] PC_mux2
     
    );
    reg [31:0] PC_mux1;
    // reg [31:0] PC_mux2;
    
    Instruction_Memory im1 (PC_mux2,reset,Instruction);
    
   initial 
    begin
    PC_mux2=32'b0;
    end
    
   always @(negedge reset) begin
    PC_mux2 = 32'b0;
    end
    
    always @(posedge clk) begin   #1
        if (PC_write == 1)
                begin 
                PC_mux1 = PC_IF_ID;
               PC_mux2 = PC_IF_ID;      
             //   PC_IF <= PC_mux2;
                end
        else if (PC_write == 0 && PC_source == 1) 
                begin
               
                PC_mux1 = PC_Jump;
                PC_mux2 = PC_mux1;
               // PC_IF <= PC_mux2;
                end
        else if (PC_write == 0 && PC_source == 0)
             begin
               
                PC_mux1=PC_mux2 +4;
                PC_mux2 =PC_mux1;
                           
            //    PC_IF <= PC_mux2;
            end
        
   end 
    
/*Mux2_1 mux1 (
    .in0(PC_IF),
    .in1(PC_Jump),
    .control(PC_source),
    .muxout(PC_mux1)
    );
    
    Mux2_1 mux2 (
    .in0(PC_mux1),
    .in1(PC_IF_ID),
    .control(PC_write),
    .muxout(PC_mux2)
    );
    
    always @(posedge clk) begin
     PC_IF = PC_mux2 + 4 ; 
    end*/
endmodule


