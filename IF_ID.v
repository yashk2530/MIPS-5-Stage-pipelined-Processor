module IF_ID(

    input [31:0] PC_Next_Input, 
    input [31:0] Instruction_Input,
    input clk,  
    input IF_ID_Write, 
    output reg [31:0] PC_Next, Instruction_IF_ID
    );
    
    always @(posedge clk) 
    begin
               
                    if (IF_ID_Write == 0) // for no stalling 
                        begin
                        PC_Next = PC_Next_Input;
                        Instruction_IF_ID = Instruction_Input;
                        end
                    else  // for stalling
                        begin
                        PC_Next = PC_Next;
                        Instruction_IF_ID = Instruction_IF_ID;
                        end
                
    end
    
endmodule