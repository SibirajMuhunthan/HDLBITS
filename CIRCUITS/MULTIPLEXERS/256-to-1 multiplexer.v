module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    int i;
    assign out=in[sel];

endmodule
