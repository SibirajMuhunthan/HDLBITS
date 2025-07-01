module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0]c;
    assign c[0]=cin;
     bcd_fadd fa1(
         .a(a[3:0]),
         .b(b[3:0]),
         .cin(c[0]),
         .sum(sum[3:0]),
         .cout(c[1])
     );
    
     genvar i;
    generate
        for(i=1;i<4;i++) begin: bcd_faddrs
            bcd_fadd fa(
                .a(a[i*4 +:4]),
                .b(b[i*4 +:4]),
                .cin(c[i]),
                .sum(sum[i*4 +:4]),
                .cout(c[i+1])
            );
            end
    endgenerate
    assign cout=c[4];

endmodule
/*module bcd_fadd(
    input a,b,
    input cin,
    output sum,cout);
    assign sum=a^b^cin;
    assign cout=a&b|a&cin|b&cin;
endmodule*/
