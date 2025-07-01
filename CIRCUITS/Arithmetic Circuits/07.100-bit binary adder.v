module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0] c;
   one_bit_add fa1(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
       .cout(c[0])
    );
    /*one_bit_add fa99(
        .a(a[98]),
        .b(b[98]),
        .cin(cout[97]),
        .sum(sum[98]),
        .cout(cout[98])
    );*/
    
    genvar i;
    generate
    for(i=1;i<100;i++) begin:full_adder
        one_bit_add fa(
            .a(a[i]),
            .b(b[i]),
            .cin(c[i-1]),
            .sum(sum[i]),
            .cout(c[i])
        );
    end
    endgenerate
    assign cout = c[99];
                       
endmodule
module one_bit_add(
    input a,b,
    input cin,
    output cout,sum);
    assign sum=a^b^cin;
    assign cout=a&b || a&cin|| b&cin;
endmodule
