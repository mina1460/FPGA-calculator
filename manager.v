`timescale 1ns / 1ps

module clk_div (input clkin, reset, output reg clk);




reg [31:0] counter_clk_div; 

    always @(posedge clkin, posedge reset)
    begin 
        
        if(reset) begin 
            counter_clk_div <= 0;
            clk <= 0;     
        end
        
        else if (counter_clk_div == 32'd49999)
            begin 
                counter_clk_div <= 0;
                clk <= ~clk; 
            end

    else counter_clk_div = counter_clk_div + 1;        
        
    end
    
endmodule


module manager(input clkin, reset, add, subtract, multiply, divide, b1, b2, b3, b4, b5, output reg [3:0] enable, output reg [6:0] shuffle_led_output, output reg decimal);
    


reg [1:0] led_counter;
reg [6:0] disp_result; 
   
   wire [6:0] output1, output2, output3, output4, output5, ones_sd , tens_sd , hunds_sd , thous_sd;
   wire clk;
   clk_div c1(clkin, reset, clk);

    wire [3:0] num1, num2, num3, num4;
    
    
   input_handling button1 (clk, reset, b1, output1, num1);
   input_handling button2 (clk, reset, b2, output2, num2);
   input_handling button3 (clk, reset, b3, output3, num3);
   input_handling button4 (clk, reset, b4, output4, num4);


reg [13:0] result;

wire [6:0] v1, v2, v3, v4;

    always @(posedge clk, posedge reset)
        begin 
         if(reset)
            led_counter <= 2'd0;
         else   
            led_counter <= led_counter + 1;
        end
        
        reg [6:0] temp;

    
    always @(*)
        begin 
            case(led_counter)
            2'd0: begin 
                 enable = 4'b1110;
                 temp =  output1; 
                 disp_result =  v1;
                 decimal = 1;
                 
            end
            
            2'd1: begin enable = 4'b1101;
               temp =  output2;         
               if (b5) decimal = 1 ;
               else decimal = 0;
               disp_result =  v2;

               
            end
            
            2'd2: begin enable = 4'b1011;
               temp =  output3;  
               decimal = 1;
               disp_result =  v3;

            end
            2'd3: begin enable = 4'b0111; 
               temp =  output4;
               decimal = 1;
               disp_result =  v4;
  
            end
            endcase
            end
            
    always @(*)
            begin
            case (b5)
            
               1'b1:   shuffle_led_output = disp_result;
               
               1'b0:   shuffle_led_output = temp;
               
            endcase 
     end

reg [9:0] midway1, midway2;
reg f;
always @(add, subtract, multiply, divide)
    begin 
    midway1 = (num1 * 4'd10);
    midway2 = (num3 * 4'd10);
        if(add) begin
            result = num2 + midway1 + num4 + midway2;
            f=0;
            end
            /*
        if(subtract)
            result = num2 + midway1 - (num4 + midway2);*/
        if(subtract)begin
        if (num2 + midway1 >=(num4 + midway2))begin
              result = num2 + midway1 - (num4 + midway2);
              f=0;
              end
        else begin
        result = -(num2 + midway1) + (num4 + midway2);
        f=1;
        end 
              end
        if(multiply) begin
            result = (num2 + midway1) * (num4 + midway2);
            f=0;
       end
        if (divide)begin
            result = (num2 + midway1) / (num4 + midway2);
           f=0;
      end
            
               
    end
binary_to_BCD b2b (result,f, v4, v3, v2 , v1);
endmodule
