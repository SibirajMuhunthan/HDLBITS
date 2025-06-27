module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
   genvar i;
     generate
         for(i=0;i<99;i++)begin: any_loop
            assign out_both[i]=in[i]&in[i+1];   
        end
     endgenerate
    generate
        for(i=1;i<100;i++)begin: out_loop
            assign out_any[i]=in[i]|in[i-1];
        end
    endgenerate
    assign out_different[99] = in[99] ^ in[0];
    generate
        for(i=0;i<99;i++)begin: any_diff
            assign out_different[i]=in[i]^in[i+1];
        end
    endgenerate
endmodule
