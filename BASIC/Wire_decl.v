module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire and1;
    wire and2;
    and(and1,a,b);
    and(and2,c,d);
     wire y;
    or(y,and1,and2);
   
    assign out=y;
    not(out_n,y);

endmodule
