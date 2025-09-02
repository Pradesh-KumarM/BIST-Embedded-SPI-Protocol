module CUT(output reg [7:0] result, input [7:0] in1, in2, input control); 
    always @(*) begin 
        if (control) 
            result = in1 + in2; 
        else 
            result = in1 - in2; 
    end 
endmodule
