module booths_multiplier (
    output reg [15:0] prod, 
    output reg busy,
    input [7:0] mc, mp, 
    input clk, start
);
    reg [7:0] A, Q, M;
    reg Q_1;
    reg [3:0] count;
    wire [7:0] sum, diff;

    always @(posedge clk) begin
        if (start) begin
            A <= 8'b0;
            M <= mc;
            Q <= mp;
            Q_1 <= 1'b0;
            count <= 4'b0;
            busy <= 1'b1;
        end else if (busy) begin
            case ({Q[0], Q_1})
                2'b01 : {A, Q, Q_1} <= {sum[7], sum, Q};     // Add
                2'b10 : {A, Q, Q_1} <= {diff[7], diff, Q};   // Subtract
                default : {A, Q, Q_1} <= {A[7], A, Q};       // Shift only
            endcase
            count <= count + 1'b1;
            if (count == 4'd8)
                busy <= 1'b0;
        end
        prod <= {A, Q};
    end

    alu add1 (sum, A, M, 1'b0);
    alu sub1 (diff, A, ~M, 1'b1);
endmodule

module alu (
    output [7:0] out, 
    input [7:0] a, b, 
    input cin
);
    assign out = a + b + cin;
endmodule
