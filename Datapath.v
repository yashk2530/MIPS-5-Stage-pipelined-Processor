`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2024 08:22:57 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input CLK,RESET,
    output [31:0] MEM_WB_FINAL_DATA,
    output [4:0] Destination_ADD,
    output  regwriteg
    );
     wire [31:0] datamemory_output;
     wire [31:0] MUX_MTR;
     wire [31:0] MUX_ALUresult;
     wire [31:0] MUX2_lui;
     wire memtoregg;
     wire immediateg;
     wire [31:0] writemux1;
     
     
    wire [31:0] ALUResult_EX_MEMf;
    wire [31:0] FWD2_EX_MEMf;
    wire [4:0] EX_MEMrtrdf;
    wire [31:0] EX_MEM_luif;
    wire EX_MEM_memreadf;
    wire EX_MEM_memwritef;
    wire EX_MEM_memtoregf;
    wire EX_MEM_immediatef;
    wire EX_MEM_regwritef;
     
    wire [31:0] ALUResult_ID_EXe;
    wire [4:0] ID_EXrtrde;
    wire [31:0] FWD2_ID_EXe;
   // wire [31:0] ID_EX_luie;
        
   // wire   MemRead_ID_EXe;
   // wire MemWrite_ID_EXe;
   // wire MemtoReg_ID_EXe;
   // wire RegWrite_ID_EXe;
   // wire immediate_ID_EXe;
    wire [31:0] fwd_mux1_out;
    wire [31:0] fwd_mux2_out;
    wire [31:0] fwd_mux2_to_ALU;
    wire [1:0]fwd1_sel;
    wire [1:0] fwd2_sel;
    
    
   wire  [31:0] Readdata1_ID_EXd;
   wire  [31:0] Readdata2_ID_EXd;
   wire  [31:0] ID_EX_luie;
   wire  [31:0] ID_EX_immediateaddressd;
   wire  [4:0] ID_EXrsd;
   wire  [4:0] ID_EXrtd;
   wire  [4:0] ID_EXrdd;
   wire   ALUsrc_ID_EXd;
   wire RegDst_ID_EXd;
   wire  MemRead_ID_EXe;
   wire MemWrite_ID_EXe;
   wire  MemtoReg_ID_EXe;
   wire RegWrite_ID_EXe;
   wire  [1:0] Aluop_ID_EXd;
   wire  immediate_ID_EXe;
   
   wire [31:0] Readdata1c, Readdata2c;
   wire [31:0] IF_ID_luic,IF_ID_immediateaddressc;
   wire [4:0] IF_IDrsc,IF_IDrtc,IF_IDrdc;
   wire Alusrc_IF_IDc,RegDst_IF_IDc;
   wire MemRead_IF_IDc,MemWrite_IF_IDc;
   wire MemtoReg_IF_IDc,RegWrite_IF_IDc;
   wire [1:0] Aluop_IF_IDc;
   wire immediate_IF_IDc;
   
   wire [5:0] opCodec;
   wire PC_SRC;
   
   //hazard
   wire stall_mux;
   //wire IF_ID_stall;
   wire PCwrite_stall;
   
   wire [31:0] PC_IF_IDb;
   wire IF_ID_Writea;
   wire [31:0] Instruction_Inputa;
   wire [31:0] PC_Next_Inputa;
    wire [31:0] Instruction_from_IF_IDb;
    
    wire [31:0] PC_jump_finala;
    // Implementing jump module
     Jump_file jmp_final(
    .Instruction_code(Instruction_from_IF_IDb),
   .PC_IF_ID_jumpb(PC_IF_IDb),
    
    .PC_JUMP_final(PC_jump_finala)
    );
    
    Instruction_Fetch FETCH(
    .PC_write(PCwrite_stall),
    .PC_source(PC_SRC),
    .clk(CLK),
    .reset(RESET),
    .PC_Jump(PC_jump_finala), 
    .PC_IF_ID(PC_IF_IDb),
    
    .PC_mux2(PC_Next_Inputa),
   // .PC_IF(PC_Next_Inputa), 
    .Instruction(Instruction_Inputa)    
    );
   
   
   
   IF_ID if_id_pipe1(

             .PC_Next_Input(PC_Next_Inputa), 
             .Instruction_Input(Instruction_Inputa),
             .clk(CLK),  
             .IF_ID_Write(IF_ID_Writea),
             
             .PC_Next(PC_IF_IDb), 
             .Instruction_IF_ID(Instruction_from_IF_IDb)
    );
    
    // Hazard detection unit
   
    Hazard_detection Hazard(
            .ID_EX_MemRead(MemRead_ID_EXe),
            .ID_EX_Register_Rt(ID_EXrtd), 
            .IF_ID_Register_Rs(IF_IDrsc), 
            .IF_ID_Register_Rt(IF_IDrtc),
            
            .Control_Select_StallMux(stall_mux), 
            .IF_ID_Write(IF_ID_Writea), 
            .PC_write(PCwrite_stall)
    );
   // Control unit
    Control_unit control(
    .opCode(opCodec),
    .Hazard_input(stall_mux),
    
    .jmp(PC_SRC),
    .alusrc(Alusrc_IF_IDc),
    .ALUOp(Aluop_IF_IDc),
    .Regdst(RegDst_IF_IDc),
    .memwrite(MemWrite_IF_IDc), 
    .memread(MemRead_IF_IDc),
    .memtoreg(MemtoReg_IF_IDc),
    .regwrite(RegWrite_IF_IDc),
    .Immediate_control(immediate_IF_IDc)
    );
  // Special module for decoding the instruction from directly IF/Id pipeli
   Decode decode_mod(
        .Instruction_from_IF_ID(Instruction_from_IF_IDb),
        .opcode(opCodec),
        .IF_IDregisterRs(IF_IDrsc),
        .IF_IDregisterRt(IF_IDrtc),
        .IF_IDregisterRd(IF_IDrdc),
    
        .IF_ID_lui(IF_ID_luic),
        .IF_ID_immediateaddress(IF_ID_immediateaddressc)
    

    );
   
  Register_File register(
          .Read_Reg_1(IF_IDrsc), 
          .Read_Reg_2(IF_IDrtc), 
          .Write_Reg(Destination_ADD), 
          .Write_Data(MEM_WB_FINAL_DATA),
          .reset(RESET), 
          .RegWrite(regwriteg), 
          .clk(CLK), 
           
          
          .Reg_Data_1(Readdata1c), 
          .Reg_Data_2(Readdata2c)
  );

    ID_EX id_ex_pipeline(
            .clk(CLK),
            .Readdata1(Readdata1c), 
            .Readdata2(Readdata2c),
            .IF_ID_lui(IF_ID_luic),
            .IF_ID_immediateaddress(IF_ID_immediateaddressc),
            .IF_IDrs(IF_IDrsc),
            .IF_IDrt(IF_IDrtc),
            .IF_IDrd(IF_IDrdc),
            .Alusrc_IF_ID(Alusrc_IF_IDc),
            .RegDst_IF_ID(RegDst_IF_IDc),
            .MemRead_IF_ID(MemRead_IF_IDc),
            .MemWrite_IF_ID(MemWrite_IF_IDc),
            .MemtoReg_IF_ID(MemtoReg_IF_IDc),
            .RegWrite_IF_ID(RegWrite_IF_IDc),
            .Aluop_IF_ID(Aluop_IF_IDc),
            .immediate_IF_ID(immediate_IF_IDc),
           
          .Readdata1_ID_EX(Readdata1_ID_EXd),
          .Readdata2_ID_EX(Readdata2_ID_EXd),
           .ID_EX_lui(ID_EX_luie),
           .ID_EX_immediateaddress(ID_EX_immediateaddressd),
          .ID_EXrs(ID_EXrsd),
          .ID_EXrt(ID_EXrtd),
          .ID_EXrd(ID_EXrdd),
           .ALUsrc_ID_EX(ALUsrc_ID_EXd),
           .RegDst_ID_EX(RegDst_ID_EXd),
          .MemRead_ID_EX(MemRead_ID_EXe),
          .MemWrite_ID_EX(MemWrite_ID_EXe),
           .MemtoReg_ID_EX(MemtoReg_ID_EXe),
           .RegWrite_ID_EX(RegWrite_ID_EXe),
           .Aluop_ID_EX(Aluop_ID_EXd),
           .immediate_ID_EX(immediate_ID_EXe)
    );
      
   MUX4_1 fw1(
    .sel(fwd1_sel),
    .i0(Readdata1_ID_EXd),
    .i1(MEM_WB_FINAL_DATA),
    .i2(ALUResult_EX_MEMf),   
    .y(fwd_mux1_out));
     
     MUX4_1 fw2(
    .sel(fwd2_sel),
    .i0(Readdata2_ID_EXd),
    .i1(MEM_WB_FINAL_DATA),
    .i2(ALUResult_EX_MEMf),   
    .y(fwd_mux2_out));
     
     Mux2_1 ALUsrc_mux(
    .in0(fwd_mux2_out),
    .in1(ID_EX_immediateaddressd),
    .control(ALUsrc_ID_EXd),
    .muxout(fwd_mux2_to_ALU)
    );
     
    Mux2_1_5bits reg_dest_select(
    .in0(ID_EXrtd),
    .in1(ID_EXrdd),
    .control(RegDst_ID_EXd),
    .muxout(ID_EXrtrde)
    );
     
    ALU alu1(
    .op1(fwd_mux1_out),
    .op2(fwd_mux2_to_ALU),
    .ALUOp(Aluop_ID_EXd),
    .aluOut(ALUResult_ID_EXe)
    );
    
    Forwarding_Unit fwdunit(
     .EX_MEM_Register_Rd(EX_MEMrtrdf), 
     .ID_EX_Register_Rs(ID_EXrsd), 
     .ID_EX_Register_Rt(ID_EXrtd), 
     .MEM_WB_Register_Rd(Destination_ADD),
    .EX_MEM_RegWrite(EX_MEM_regwritef), 
    .MEM_WB_RegWrite(regwriteg),
    
     .Forward_MuxA(fwd1_sel), 
    .Forward_MuxB(fwd2_sel)
    );
     
      EX_MEMpipeline ex_mempipe(
                 .clk(CLK),
                 .ALUResult_ID_EX(ALUResult_ID_EXe),
                 .ID_EXrtrd(ID_EXrtrde),
                 .FWD2_ID_EX(FWD2_ID_EXe),
                 .ID_EX_lui(ID_EX_luie),
                
                 .MemRead_ID_EX(MemRead_ID_EXe),
                 .MemWrite_ID_EX(MemWrite_ID_EXe),
                 .MemtoReg_ID_EX(MemtoReg_ID_EXe),
                 .RegWrite_ID_EX(RegWrite_ID_EXe),
                 .immediate_ID_EX(immediate_ID_EXe),
                
                 .ALUResult_EX_MEM(ALUResult_EX_MEMf),
                 .EX_MEMrtrd(EX_MEMrtrdf),
                 .FWD2_EX_MEM(FWD2_EX_MEMf),
                 .EX_MEM_lui(EX_MEM_luif),
                
                  .MemRead_EX_MEM(EX_MEM_memreadf),
                  .MemWrite_EX_MEM(EX_MEM_memwritef),
                  .MemtoReg_EX_MEM(EX_MEM_memtoregf),
                  .RegWrite_EX_MEM(EX_MEM_regwritef),
                  .immediate_EX_MEM(EX_MEM_immediatef)
    );
     Data_Memory dm( 
     .MemRead(EX_MEM_memreadf), 
     .Address(ALUResult_EX_MEMf), .ReadData(datamemory_output), .MemWrite(EX_MEM_memwritef), .WriteData(FWD2_EX_MEMf)
     );
    
    
     MEM_WB mem_wb_pipeline(
      .clk(CLK),
      .dm_EX_MEM(datamemory_output),
      .ALUResult_EX_MEM(ALUResult_EX_MEMf),
      .EX_MEM_lui(EX_MEM_luif),
     .EX_MEMrtrd(EX_MEMrtrdf),
     .MemtoReg_EX_MEM(EX_MEM_memtoregf),
     .RegWrite_EX_MEM(EX_MEM_regwritef),
     .immediate_EX_MEM(EX_MEM_immediatef),
    
    
      .dm_MEM_WB(MUX_MTR),
      .ALUResult_MEM_WB(MUX_ALUresult),
      .MEM_WB_lui(MUX2_lui),
      .MEM_WBrtrd(Destination_ADD),
      .MemtoReg_MEM_WB(memtoregg),
      .RegWrite_MEM_WB(regwriteg),
      .immediate_MEM_WB(immediateg)
    );
    
     Mux2_1 Memory_to_reg (
    .in0 (MUX_ALUresult),
    .in1 (MUX_MTR),
    .control(memtoregg),
    .muxout(writemux1)
    );
    
     Mux2_1 lui_instruction(
      .in0(writemux1),
      .in1(MUX2_lui),
     .control(immediateg),
    .muxout(MEM_WB_FINAL_DATA)
    );
    
    
endmodule
