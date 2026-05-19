module vga_professor_touch_detector #(
    parameter integer SQUARE_SIZE = 20
) (
    input  logic       state_game,
    input  logic [9:0] square_x,
    input  logic [9:0] square_y,
    input  logic [9:0] text_x,
    input  logic [9:0] text_y,
    output logic       professor_touch_now
);

    assign professor_touch_now =
        state_game &&
        (square_x + SQUARE_SIZE - 10'd1 >= text_x) &&
        (square_x <= text_x + 10'd93) &&
        (square_y + SQUARE_SIZE - 10'd1 >= text_y) &&
        (square_y <= text_y + 10'd13);

endmodule
