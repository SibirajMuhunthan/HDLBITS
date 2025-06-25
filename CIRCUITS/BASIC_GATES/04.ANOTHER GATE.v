module top_module (
    input in1,
    input in2,
    output out);
    wire w1;
    not n1(w1,in2);
    and a1(out,in1,w1);
endmodule
