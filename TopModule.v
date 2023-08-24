`timescale 1ns / 1ps

//Verilog Counter

module TopModule(
    input btn,
    input clk,
    output LED0,
    output LED1,
    output LED2,
    output LED3
    );

    wire [30:0] sum;

    Add inst(
        .clk(clk),
        .reset(btn),
        .sum(sum)
    );

    assign LED0 = sum[27];
    assign LED1 = sum[28];
    assign LED2 = sum[29];
    assign LED3 = sum[30];

endmodule

module Add(
    input clk,
    input reset,
    output reg [30:0] sum  
    );

    always @(posedge clk) begin
        if (reset) 
            sum <= 0; // Need to create a flip-flop to latch reset signal for next clock cylce
        else
            sum <= sum + 1;
    end

endmodule