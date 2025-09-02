module tpg( 
    input wire clk, 
    input wire reset, 
    output wire [7:0] tpg_out 
); 
    wire feedback; 
    reg [7:0] q; 
 
16 
 
    initial begin 
        q = 8'b11111111; 
    end 
 
    always @(posedge clk or posedge reset) begin 
        if (reset) 
            q <= 8'b11111111; 
        else 
            q <= {q[6:0], feedback}; 
    end 
 
    assign feedback = q[7] ^ q[5] ^ q[4] ^ q[3]; 
    assign tpg_out = q; 
endmodule
