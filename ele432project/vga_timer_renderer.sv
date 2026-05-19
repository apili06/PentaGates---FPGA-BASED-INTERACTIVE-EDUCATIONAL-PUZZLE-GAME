module vga_timer_renderer #(
    parameter logic [9:0] D0_X = 10'd540,
    parameter logic [9:0] D1_X = 10'd568,
    parameter logic [9:0] D2_X = 10'd596,
    parameter logic [9:0] D_Y  = 10'd20
) (
    input  logic [9:0] px,
    input  logic [9:0] py,
    input  logic [3:0] hundreds,
    input  logic [3:0] tens,
    input  logic [3:0] ones,
    output logic       pixel_on
);

    logic d0_on;
    logic d1_on;
    logic d2_on;

    vga_digit_pixel u_d0 (
        .px(px),
        .py(py),
        .ox(D0_X),
        .oy(D_Y),
        .digit(hundreds),
        .pixel_on(d0_on)
    );

    vga_digit_pixel u_d1 (
        .px(px),
        .py(py),
        .ox(D1_X),
        .oy(D_Y),
        .digit(tens),
        .pixel_on(d1_on)
    );

    vga_digit_pixel u_d2 (
        .px(px),
        .py(py),
        .ox(D2_X),
        .oy(D_Y),
        .digit(ones),
        .pixel_on(d2_on)
    );

    assign pixel_on = d0_on || d1_on || d2_on;

endmodule
