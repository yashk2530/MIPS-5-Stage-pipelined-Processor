`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 08:25:39 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory( MemRead, Address, ReadData, MemWrite, WriteData);
	input MemRead, MemWrite;
	input [31:0]  Address;
	input [31:0] WriteData;
	output reg [31:0] ReadData;
	reg [7:0] data [0:207];
	integer addr;
	initial
		begin
			data[0] = 8'd4;  
			data[1] = 8'd4;
			data[2] = 8'd4;
			data[3] = 8'd4;  
			data[4] = 8'd4;  
			data[5] = 8'd4;  
			data[6] = 8'd4;  
			data[7] = 8'd4;  
			data[8] = 8'd4;  
			data[9] = 8'd4;  
			data[10] = 8'd4;  
			data[11] = 8'd4;  
			data[12] = 8'd4;  
			data[13] = 8'd4;  
			data[14] = 8'd4;  
			data[15] = 8'd4;  
			data[16] = 8'd4;  
			data[17] = 8'd4;  
			data[18] = 8'd4;  
			data[19] = 8'd4;  
			data[20] = 8'd4;  
			data[21] = 8'd4;  
			data[22] = 8'd4;  
			data[23] = 8'd4;  
			data[24] = 8'd4;  
			data[25] = 8'd4;  
			data[26] = 8'd4;  
			data[27] = 8'd4;  
			data[28] = 8'd4;  
			data[29] = 8'd4;  
			data[30] = 8'd4;  
			data[31] = 8'd4;  
			data[200] = 8'd4;  
			data[201] = 8'd4; 
			data[202] = 8'd4; 
			data[203] = 8'd4; 
			data[204] = 8'd4; 
			data[205] = 8'd4; 
			data[206] = 8'd4; 
			data[207] = 8'd4; 
			
			
			
		end
		
	always @(*) begin
		
		addr = Address;
		if(MemRead)
			ReadData = data[addr/4];
		else if(MemWrite)
			data[addr/4] = WriteData;
	end
	
endmodule
