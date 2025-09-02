module tb_BIST_TOP_compare(); 
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
    reg [3:0] expected_signature; 
17 
 
    integer pass_count; 
 
    task display_progress; 
        input integer count; 
        integer j; 
        begin 
            $write("\rProgress: ["); 
            for (j = 0; j < 10; j = j + 1) begin 
                if (j < (count / 25)) 
                    $write("#"); 
                else 
                    $write(" "); 
            end 
            $write("] %0d%% Complete", (count * 100) / 255); 
        end 
    endtask 
 
    initial begin 
        clk = 0; 
        reset = 1; 
        pass_count = 0; 
        file 
= 
$fopen("C:/Users/PRADESH/OneDrive/Documents/verilog/18.1 
- 
Copy/work/signature_file.txt", "r"); 
        #15 reset = 0; 
        #20; 
         
        for (i = 0; i < 255; i = i + 1) begin 
            @(posedge clk); 
            $fscanf(file, "Test %d: Signature = %b\n", i, expected_signature); 
            if (signature === expected_signature) begin 
                pass_count = pass_count + 1; 
                $write("\a"); 
                display_progress(pass_count); 
18 
 
                $display("Test %0d: Match! Expected = %b, Actual = %b", i, expected_signature, 
signature); 
            end else begin 
                $display("Test %0d: Mismatch! Expected = %b, Got = %b", i, expected_signature, 
signature); 
            end 
        end 
        $fclose(file); 
        #50; 
        $finish; 
    end 
endmodule
