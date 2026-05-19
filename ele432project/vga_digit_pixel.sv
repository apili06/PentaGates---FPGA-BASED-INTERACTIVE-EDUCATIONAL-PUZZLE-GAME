module vga_digit_pixel #(
    parameter logic [9:0] DIGIT_W = 10'd24,
    parameter logic [9:0] DIGIT_H = 10'd48,
    parameter logic [9:0] SEG_T   = 10'd4
) (
    input  logic [9:0] px,
    input  logic [9:0] py,
    input  logic [9:0] ox,
    input  logic [9:0] oy,
    input  logic [3:0] digit,
    output logic       pixel_on
);

    logic [6:0] seg;

    always_comb begin
        case (digit)
            4'd0: seg = 7'b1111110;
            4'd1: seg = 7'b0110000;
            4'd2: seg = 7'b1101101;
            4'd3: seg = 7'b1111001;
            4'd4: seg = 7'b0110011;
            4'd5: seg = 7'b1011011;
            4'd6: seg = 7'b1011111;
            4'd7: seg = 7'b1110000;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1111011;
            default: seg = 7'b0000000;
        endcase

        pixel_on = 1'b0;

        if (px >= ox && px < ox + DIGIT_W && py >= oy && py < oy + DIGIT_H) begin
            if (seg[6] &&
                py >= oy && py < oy + SEG_T &&
                px >= ox + SEG_T && px < ox + DIGIT_W - SEG_T)
                pixel_on = 1'b1;
            else if (seg[5] &&
                     px >= ox + DIGIT_W - SEG_T && px < ox + DIGIT_W &&
                     py >= oy + SEG_T && py < oy + (DIGIT_H >> 1) - 1)
                pixel_on = 1'b1;
            else if (seg[4] &&
                     px >= ox + DIGIT_W - SEG_T && px < ox + DIGIT_W &&
                     py >= oy + (DIGIT_H >> 1) + 1 && py < oy + DIGIT_H - SEG_T)
                pixel_on = 1'b1;
            else if (seg[3] &&
                     py >= oy + DIGIT_H - SEG_T && py < oy + DIGIT_H &&
                     px >= ox + SEG_T && px < ox + DIGIT_W - SEG_T)
                pixel_on = 1'b1;
            else if (seg[2] &&
                     px >= ox && px < ox + SEG_T &&
                     py >= oy + (DIGIT_H >> 1) + 1 && py < oy + DIGIT_H - SEG_T)
                pixel_on = 1'b1;
            else if (seg[1] &&
                     px >= ox && px < ox + SEG_T &&
                     py >= oy + SEG_T && py < oy + (DIGIT_H >> 1) - 1)
                pixel_on = 1'b1;
            else if (seg[0] &&
                     py >= oy + (DIGIT_H >> 1) - (SEG_T >> 1) &&
                     py < oy + (DIGIT_H >> 1) + ((SEG_T + 1) >> 1) &&
                     px >= ox + SEG_T && px < ox + DIGIT_W - SEG_T)
                pixel_on = 1'b1;
        end
    end

endmodule
