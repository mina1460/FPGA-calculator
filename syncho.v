`timescale 1ns / 1ps

module syncho(input clk, x, output reg z);
reg q0; 
always @(posedge clk) 
    begin
         q0 <= x;
         z <= q0;
    end
endmodule
