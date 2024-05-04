`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 12:24:25 AM
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input [5:0] opCode,
    input Hazard_input,
    output reg jmp,
    output reg alusrc,
    output reg [1:0] ALUOp,
    output reg Regdst,
    output reg memwrite, memread,
    output reg memtoreg,regwrite,
    output reg Immediate_control
    );
    
    wire lwInstruction;
    wire swInstruction;
    wire oriInstruction;
    wire luiInstruction;
    wire jInstruction;
    wire sltInstruction;
    wire mulInstruction;
 
    assign lwInstruction = (opCode == 6'b101000) ? 1'b1 : 1'b0;
    assign swInstruction = (opCode == 6'b100011) ? 1'b1 : 1'b0;
    assign oriInstruction = (opCode == 6'b001101) ? 1'b1 : 1'b0;
    assign luiInstruction = (opCode == 6'b001111) ? 1'b1 : 1'b0;
    assign jInstruction = (opCode == 6'b000010) ? 1'b1 : 1'b0;
    assign sltInstruction = (opCode == 6'b000000 ) ? 1'b1 : 1'b0;
   

 
 always @(*)
 begin
  if (Hazard_input ==1 ) 
  begin
              jmp = 0;
              alusrc = 0;
              ALUOp [1:0] = 00; 
              Regdst = 0;
              memwrite = 0;
              memread = 0;
              memtoreg = 0;
              regwrite = 0;
              Immediate_control = 0; 
              
     end
     
     else  begin
 
    if(lwInstruction)
    begin
              jmp = 0;
              alusrc = 1;
              ALUOp [1:0] = 01; 
              Regdst = 0;
              memwrite = 0;
              memread = 1;
              memtoreg = 1;
              regwrite = 1;
              Immediate_control = 0; 
    end
    else if (swInstruction)
    begin
              jmp = 0;
              alusrc = 1;
              ALUOp [1:0] = 01; 
              Regdst = 0;
              memwrite = 1;
              memread = 0;
              memtoreg = 0;
              regwrite = 0;
              Immediate_control = 0; 
    end
    else if (oriInstruction)
    begin
              jmp = 0;
              alusrc = 1;
              ALUOp [1:0] = 00; 
              Regdst = 0;
              memwrite = 0;
              memread = 0;
              memtoreg = 0;
              regwrite = 1;
              Immediate_control = 0;  
    end
    else if (luiInstruction)
    begin
              jmp = 0;
              alusrc = 0;
              ALUOp [1:0] = 00; 
              Regdst = 0;
              memwrite = 0;
              memread = 0;
              memtoreg = 0;
              regwrite = 1;
              Immediate_control = 1;  
    end
     else if (jInstruction)
    begin
              jmp = 1;
              alusrc = 0;
              ALUOp [1:0] = 00; 
              Regdst = 0;
              memwrite = 0;
              memread = 0;
              memtoreg = 0;
              regwrite = 0;
              Immediate_control = 0;  
    end
    else if (sltInstruction)
    begin
              jmp = 0;
              alusrc = 0;
              ALUOp [1:0] = 11; 
              Regdst = 1;
              memwrite = 0;
              memread = 0;
              memtoreg = 0;
              regwrite = 1;
              Immediate_control = 0; 
    end
    
    
 end
 end
 
endmodule
