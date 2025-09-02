module tb_BIST_TOP(); 
    reg clk; 
    reg reset; 
    wire [7:0] result; 
    wire [3:0] signature; 
 
    BIST_TOP uut ( 
        .clk(clk), 
        .reset(reset), 
        .result(result), 
        .signature(signature) 
    ); 
 
    always #5 clk = ~clk; 
 
    integer file; 
    integer i; 
 
    initial begin 
        clk = 0; 
        reset = 1; 
19 
 
        file 
= 
$fopen("C:/Users/
PRADESH/OneDrive/Documents/verilog/18.1 
- 
Copy/work/signature_file.txt", "w"); 
        #15 reset = 0; 
        #20; 
         
        for (i = 0; i < 255; i = i + 1) begin 
            @(posedge clk); 
            $fwrite(file, "Test %0d: Signature = %b\n", i, signature); 
        end 
        $fclose(file); 
        #50; 
        $finish; 
    end 
endmodule
