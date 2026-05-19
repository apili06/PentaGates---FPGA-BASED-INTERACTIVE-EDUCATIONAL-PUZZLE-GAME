module vga_timer_digit_splitter (
    input  logic [9:0] value,
    output logic [3:0] hundreds,
    output logic [3:0] tens,
    output logic [3:0] ones
);

    assign hundreds = value / 10'd100;
    assign tens     = (value % 10'd100) / 10'd10;
    assign ones     = value % 10'd10;

endmodule
