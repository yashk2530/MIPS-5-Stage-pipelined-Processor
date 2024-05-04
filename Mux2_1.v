`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 08:24:06 PM
// Design Name: 
// Module Name: Mux2_1
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


module Mux2_1 (
    input [31:0] in0,
    input [31:0] in1,
    input control,
    output [31:0] muxout
    );
    
    assign  muxout = (control == 0) ? in0 : in1;
endmodule

