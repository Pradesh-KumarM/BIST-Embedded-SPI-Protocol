module ORA( 
    output reg [3:0] signature, 
    input [3:0] response_in, 
    input clk, reset 
); 
 
    reg [3:0] misr; 
    wire feedback0, feedback1, feedback2, feedback3; 
 
    assign feedback0 = misr[3] ^ response_in[0]; 
    assign feedback1 = misr[0] ^ response_in[1]; 
    assign feedback2 = misr[1] ^ response_in[2]; 
    assign feedback3 = misr[2] ^ misr[3] ^ response_in[3]; 
 
    always @(posedge clk or posedge reset) begin 
        if (reset) 
            misr <= 4'b0000; 
        else 
            misr <= {feedback3, feedback2, feedback1, feedback0}; 
20 
 
    end 
 
    always @(*) begin 
        signature = misr; 
    end 
endmodule
