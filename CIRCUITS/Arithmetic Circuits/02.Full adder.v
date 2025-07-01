module top_module( 
    input a, b, cin,
    output cout, sum );
    assign sum=a^b^cin,cout=(a&b)|(a&cin)|(b&cin);

endmodule
