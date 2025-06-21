module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lo;
    wire carry_out_lo;

    wire [15:0] sum_hi_0, sum_hi_1;
    wire carry_out_hi_0, carry_out_hi_1;
    add16 add_lo (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (1'b0),
        .sum  (sum_lo),
        .cout (carry_out_lo)
    );

    // Upper 16-bit addition (cin = 0)
    add16 add_hi_0 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b0),
        .sum  (sum_hi_0),
        .cout (carry_out_hi_0)
    );

    // Upper 16-bit addition (cin = 1)
    add16 add_hi_1 (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (1'b1),
        .sum  (sum_hi_1),
        .cout (carry_out_hi_1)
    );

    // MUX selects the correct upper sum based on carry_out from lower add
    assign sum = { (carry_out_lo ? sum_hi_1 : sum_hi_0), sum_lo };

endmodule
