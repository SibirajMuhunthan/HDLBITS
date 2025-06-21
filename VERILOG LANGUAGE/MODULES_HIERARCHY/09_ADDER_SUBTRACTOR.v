module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]cout1;
    wire cout2;
    assign cout1={32{sub}}^b;
    add16 a1(a[15:0],cout1[15:0],sub,sum[15:0],cout2);
    add16 a2(a[31:16],cout1[31:16],cout2,sum[31:16],);
endmodule
