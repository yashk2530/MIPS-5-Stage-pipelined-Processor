`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:42:20 AM
// Design Name: 
// Module Name: Mux2_1_5bits
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


module Mux2_1_5bits (
    input [4:0] in0,
    input [4:0] in1,
    input control,
    output [4:0] muxout
    );
    
    assign  muxout = (control == 0) ? in0 : in1;
endmodule
