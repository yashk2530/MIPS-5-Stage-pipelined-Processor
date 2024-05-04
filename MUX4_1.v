`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 12:21:51 AM
// Design Name: 
// Module Name: MUX4_1
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


module MUX4_1(
  input [1:0] sel,
  input [31:0] i0,i1,i2,
  output reg [31:0] y);
    
  always @(*) begin
    case(sel)
      2'h0: y = i0;
      2'h1: y = i1;
      2'h2: y = i2;
      
      default: $display("Invalid sel input");
    endcase
  end
endmodule