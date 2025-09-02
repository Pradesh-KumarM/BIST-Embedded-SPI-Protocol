module Controller(output reg start_test, input clk, reset); 
    reg [1:0] state; 
     
    parameter IDLE = 2'b00, TESTING = 2'b01, DONE = 2'b10; 
 
    always @(posedge clk or posedge reset) begin 
        if (reset) 
            state <= IDLE; 
        else begin 
            case (state) 
                IDLE: state <= TESTING; 
                TESTING: state <= DONE; 
                DONE: state <= IDLE; 
                default: state <= IDLE; 
            endcase 
        end 
    end 
 
21 
 
    always @(*) begin 
        start_test = (state == TESTING); 
    end 
endmodule
