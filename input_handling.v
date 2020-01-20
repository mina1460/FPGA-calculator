`timescale 1ns / 1ps

module input_handling (input clk, reset, a, output reg [6:0] sd, output [3:0] number);

reg [3:0] counter;

wire z;
wire z1;
wire z2;

syncho(clk, a, z);
debouncer de (clk, z, z1);
rising_edge re (clk, reset, z1, z2);


always @(posedge clk, posedge reset)
        begin 
         if(reset)
            counter <= 4'd0;
         else if (counter == 4'd10) counter <= 0;
         else if(z2)  
                  counter <= counter + 1;
        
        end
        
assign number = counter;    
always @(*) 
begin 
    
case (counter)
    4'd0: sd=7'b0000001;
    4'd1: sd=7'b1001111;
    4'd2: sd=7'b0010010;
    4'd3: sd=7'b0000110;
    4'd4: sd=7'b1001100;
    4'd5: sd=7'b0100100;
    4'd6: sd=7'b0100000;
    4'd7: sd=7'b0001111;
    4'd8: sd=7'b0000000;
    4'd9: sd=7'b0000100;
    default: sd=7'b1111111;
endcase
end

endmodule
