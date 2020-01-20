`timescale 1ns / 1ps

module debouncer(input clk, x, output out);
reg q0, q1, q2; 

always @(posedge clk) 
begin
 q0 <= x;
 q1 <= q0;
 q2 <= q1;
end

and(out, q0,q1,q2);

endmodule
