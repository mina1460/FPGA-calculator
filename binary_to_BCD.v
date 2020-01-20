
`timescale 1ns / 1ps
/*


module binary_to_BCD(input [13:0] result, output reg [6:0] ones_sd , tens_sd , hunds_sd , thous_sd);
     
       integer i; 
reg[3:0]ones = 4'd0;
reg[3:0]  tens = 4'd0;
reg[3:0]  hunds = 4'd0;
reg[3:0] thous = 4'd0;
       always @(result)
       begin 
      
           
           for(i=13; i>=0; i = i-1)
           begin 
               if(thous >= 5)
                   thous = thous +3;
               if(hunds>=5)
                   hunds = hunds + 5;
               if(tens>=5)
                   tens= tens + 3;
                if(ones>=5)
                   ones = ones + 3;
                   
                 thous = thous << 1;
                 thous[0] = hunds[3];
                 hunds = hunds << 1;  
                 hunds[0] = tens[3];
                 tens = tens << 1;
                 tens[0] = ones[3];
                 ones = ones << 1;
                 ones[0] = result[i];
              end
              
              case (ones)
                  4'd0:ones_sd=7'b0000001;
                  4'd1:ones_sd=7'b1001111;
                  4'd2:ones_sd=7'b0010010;
                  4'd3:ones_sd=7'b0000110;
                  4'd4:ones_sd=7'b1001100;
                  4'd5:ones_sd=7'b0100100;
                  4'd6:ones_sd=7'b0100000;
                  4'd7:ones_sd=7'b0001111;
                  4'd8:ones_sd=7'b0000000;
                  4'd9:ones_sd=7'b0000100;
                  default: ones_sd=7'b1010101;
                  endcase
                  
                  case (hunds)
                      4'd0:hunds_sd=7'b0000001;
                      4'd1:hunds_sd=7'b1001111;
                      4'd2:hunds_sd=7'b0010010;
                      4'd3:hunds_sd=7'b0000110;
                      4'd4:hunds_sd=7'b1001100;
                      4'd5:hunds_sd=7'b0100100;
                      4'd6:hunds_sd=7'b0100000;
                      4'd7:hunds_sd=7'b0001111;
                      4'd8:hunds_sd=7'b0000000;
                      4'd9:hunds_sd=7'b0000100;
                      default: hunds_sd=7'b1010101;
                      endcase
                                 
                             case (thous)
                                 4'd0:thous_sd=7'b0000001;
                                 4'd1:thous_sd=7'b1001111;
                                 4'd2:thous_sd=7'b0010010;
                                 4'd3:thous_sd=7'b0000110;
                                 4'd4:thous_sd=7'b1001100;
                                 4'd5:thous_sd=7'b0100100;
                                 4'd6:thous_sd=7'b0100000;
                                 4'd7:thous_sd=7'b0001111;
                                 4'd8:thous_sd=7'b0000000;
                                 4'd9:thous_sd=7'b0000100;
                                 default:thous_sd=7'b1010101;
                                 endcase
                                 
                                 
                                  case (tens)
                                 4'd0:tens_sd=7'b0000001;
                                 4'd1:tens_sd=7'b1001111;
                                 4'd2:tens_sd=7'b0010010;
                                 4'd3:tens_sd=7'b0000110;
                                 4'd4:tens_sd=7'b1001100;
                                 4'd5:tens_sd=7'b0100100;
                                 4'd6:tens_sd=7'b0100000;
                                 4'd7:tens_sd=7'b0001111;
                                 4'd8:tens_sd=7'b0000000;
                                 4'd9:tens_sd=7'b0000100;
                                 default: tens_sd=7'b1010101;
                                  endcase
                      
              
   
           end
       
endmodule
*/





module binary_to_BCD(input [13:0] number,input f, output reg [6:0] ones_sd, tens_sd,hunds_sd, thous_sd );
wire [13:0] v1,v2,v3,v4,n1,n2;
     assign v1 = number % 10;
     assign n1 = number / 10;
    
     assign v2 = n1 % 10;
     assign n2 = n1 / 10;
    
     assign v3 = n2 % 10;
     assign v4 = n2 / 10;
    
     always@(*)
     begin 
     case (v1)
               4'd0:ones_sd=7'b0000001;
               4'd1:ones_sd=7'b1001111;
               4'd2:ones_sd=7'b0010010;
               4'd3:ones_sd=7'b0000110;
               4'd4:ones_sd=7'b1001100;
               4'd5:ones_sd=7'b0100100;
               4'd6:ones_sd=7'b0100000;
               4'd7:ones_sd=7'b0001111;
               4'd8:ones_sd=7'b0000000;
               4'd9:ones_sd=7'b0000100;
               default: ones_sd=7'b1010101;
               endcase
               
               case (v3)
                   4'd0:hunds_sd=7'b0000001;
                   4'd1:hunds_sd=7'b1001111;
                   4'd2:hunds_sd=7'b0010010;
                   4'd3:hunds_sd=7'b0000110;
                   4'd4:hunds_sd=7'b1001100;
                   4'd5:hunds_sd=7'b0100100;
                   4'd6:hunds_sd=7'b0100000;
                   4'd7:hunds_sd=7'b0001111;
                   4'd8:hunds_sd=7'b0000000;
                   4'd9:hunds_sd=7'b0000100;
                   default: hunds_sd=7'b1010101;
                   endcase
                         if (~f) begin             
                  case (v4) 
                      4'd0:thous_sd=7'b0000001;
                      4'd1:thous_sd=7'b1001111;
                      4'd2:thous_sd=7'b0010010;
                      4'd3:thous_sd=7'b0000110;
                      4'd4:thous_sd=7'b1001100;
                      4'd5:thous_sd=7'b0100100;
                      4'd6:thous_sd=7'b0100000;
                      4'd7:thous_sd=7'b0001111;
                      4'd8:thous_sd=7'b0000000;
                      4'd9:thous_sd=7'b0000100;
                      default:thous_sd=7'b1010101;
                      endcase
                      end
                      else thous_sd=7'b1111110;
                      
                       case (v2)
                      4'd0:tens_sd=7'b0000001;
                      4'd1:tens_sd=7'b1001111;
                      4'd2:tens_sd=7'b0010010;
                      4'd3:tens_sd=7'b0000110;
                      4'd4:tens_sd=7'b1001100;
                      4'd5:tens_sd=7'b0100100;
                      4'd6:tens_sd=7'b0100000;
                      4'd7:tens_sd=7'b0001111;
                      4'd8:tens_sd=7'b0000000;
                      4'd9:tens_sd=7'b0000100;
                      default: tens_sd=7'b1010101;
                       endcase
           end

endmodule































