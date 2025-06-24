module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire w1,w2,w3,w4;
    assign w1=a<b&a<c&a<d;
    assign w2=b<a&b<c&b<d;
    assign w3=c<a&c<b&c<d;
    assign w4=d<a&d<b&d<c;
    assign min=w1?a:w2?b:w3?c:d;
    
    // assign intermediate_result1 = compare? true: false;

endmodule
