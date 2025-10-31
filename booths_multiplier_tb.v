module tb_booth_multiplier();
    reg [7:0] mc, mp;
    reg clk, start;
    wire [15:0] prod;
    wire busy;

    booth_multiplier uut (.prod(prod), .busy(busy), .mc(mc), .mp(mp), .clk(clk), .start(start));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Case 1
        mc = 8'd4; mp = 8'd3; start = 1; #10; start = 0;
        #80;
        // Test Case 2
        mc = 8'd15; mp = 8'd7; start = 1; #10; start = 0;
        #80;
        // Test Case 3 (Negative values)
        mc = -8'd4; mp = -8'd3; start = 1; #10; start = 0;
        #80;
        $stop;
    end
endmodule
