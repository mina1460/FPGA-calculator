`timescale 1ns / 1ps

module rising_edge (input clk, reset, x, output z);

reg [1:0] current_state, next_state; 

parameter [1:0] S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

always @(x, current_state)
    
    case (current_state)
        S0: if(x) next_state = S1;
      else next_state = S0;

        S1: if(x) next_state = S2;
    else next_state = S0;
 
        S2: if(x) next_state = S2;
    else next_state = S0;
    endcase 
        

always @(posedge clk, posedge reset)
begin
    if(reset) current_state <= S0;
    else current_state <= next_state;
end


assign z = (current_state == S1);

endmodule


/*
module lock(input clk, reset, a, b, c, d, output [6:0] e);

wire z;
wire [3:0] s;
wire [3:0] m;
wire [3:0] n;
syncho(clk, a, s[0]);
syncho(clk, b, s[1]);
syncho(clk, c, s[2]);
syncho(clk, d, s[3]);

debouncer(clk, s[0], m[0]);
debouncer(clk, s[1], m[1]);
debouncer(clk, s[2], m[2]);
debouncer(clk, s[3], m[3]);

transition (clk, reset, m[0], n[0]);
transition (clk, reset, m[1], n[1]);
transition (clk, reset, m[2], n[2]);
transition (clk, reset, m[3], n[3]);

FSM(clk, rst, n[0],n[1],n[2],n[3], z);

assign e=(z)? 7'b1110001:7'b1000001;
    
   
endmodule







module FSM(input clk, rst, a, b, c, d, output z);

reg [2:0] st, nst;
parameter  S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;

always @(a, b, c, d, st)
begin 
        case (st)
        S0: if(a==1) nst = S1;
        else nst = S0;
        
         S1: if(b==1) nst = S2;
               else if (a==1) nst = S1;
               else if(!a&!b&!c&!d) nst=S1;
               else nst = S0;
               
         S2: if(c==1) nst = S3;
             else if (a==1) nst = S1;
             else if(!a&!b&!c&!d) nst=S2;
             else nst = S0;        
        
         S3: if(d==1)  nst = S4;
           else if (a==1) nst = S1;
           else if(!a&!b&!c&!d) nst=S3;
           else nst = S0;       
           
          S4:  if (!a&!b&!c&!d) nst=S4;
          else nst = S0;
          
          
          default: nst = S0;
endcase
end

always @(posedge clk, posedge rst)
begin
    if(rst)
        st<=0;
    else
        st <= nst;

end

assign z = (st==S4)? 0:1;

endmodule


*/