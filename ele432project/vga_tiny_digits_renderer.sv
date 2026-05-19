module vga_tiny_digits_renderer (
    input  logic [9:0] px,
    input  logic [9:0] py,
    output logic       tiny_digits_on
);

    logic tiny_zero_on;
    logic tiny_zero2_on;
    logic tiny_zero3_on;
    logic tiny_zero4_on;
    logic tiny_zero5_on;
    logic tiny_zero6_on;
    logic tiny_zero7_on;
    logic tiny_zero8_on;
    logic tiny_one_on;
    logic tiny_one2_on;
    logic tiny_one3_on;
    logic tiny_one4_on;
    logic tiny_one5_on;
    logic tiny_one6_on;
    logic tiny_one7_on;

    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero1 (.px(px), .py(py), .ox(10'd75),  .oy(10'd339), .digit(4'd0), .pixel_on(tiny_zero_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero2 (.px(px), .py(py), .ox(10'd206), .oy(10'd334), .digit(4'd0), .pixel_on(tiny_zero2_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero3 (.px(px), .py(py), .ox(10'd236), .oy(10'd409), .digit(4'd0), .pixel_on(tiny_zero3_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero4 (.px(px), .py(py), .ox(10'd364), .oy(10'd210), .digit(4'd0), .pixel_on(tiny_zero4_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero5 (.px(px), .py(py), .ox(10'd364), .oy(10'd68),  .digit(4'd0), .pixel_on(tiny_zero5_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero6 (.px(px), .py(py), .ox(10'd160), .oy(10'd127), .digit(4'd0), .pixel_on(tiny_zero6_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero7 (.px(px), .py(py), .ox(10'd236), .oy(10'd45),  .digit(4'd0), .pixel_on(tiny_zero7_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_zero8 (.px(px), .py(py), .ox(10'd323), .oy(10'd336), .digit(4'd0), .pixel_on(tiny_zero8_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one2  (.px(px), .py(py), .ox(10'd323), .oy(10'd174), .digit(4'd1), .pixel_on(tiny_one2_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one3  (.px(px), .py(py), .ox(10'd38),  .oy(10'd172), .digit(4'd1), .pixel_on(tiny_one3_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one4  (.px(px), .py(py), .ox(10'd102), .oy(10'd60),  .digit(4'd1), .pixel_on(tiny_one4_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one5  (.px(px), .py(py), .ox(10'd102), .oy(10'd252), .digit(4'd1), .pixel_on(tiny_one5_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one6  (.px(px), .py(py), .ox(10'd495), .oy(10'd60),  .digit(4'd1), .pixel_on(tiny_one6_on));
    vga_digit_pixel #(10'd10, 10'd16, 10'd2) u_one7  (.px(px), .py(py), .ox(10'd590), .oy(10'd336), .digit(4'd1), .pixel_on(tiny_one7_on));

    assign tiny_one_on = ((px >= 10'd109 && px <= 10'd111) && (py >= 10'd415 && py <= 10'd425));

    assign tiny_digits_on = tiny_zero_on || tiny_zero2_on || tiny_zero3_on || tiny_zero4_on || tiny_zero5_on ||
                            tiny_zero6_on || tiny_zero7_on || tiny_zero8_on || tiny_one_on || tiny_one2_on ||
                            tiny_one3_on || tiny_one4_on || tiny_one5_on || tiny_one6_on || tiny_one7_on;

endmodule
