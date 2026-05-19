module vga_pixel_room_indexer (
    input  logic [9:0] px,
    input  logic [9:0] py,
    output logic [2:0] pixel_room_col,
    output logic [1:0] pixel_room_row,
    output logic [3:0] pixel_room_idx
);

    always_comb begin
        if (px <= 10'd128)
            pixel_room_col = 3'd0;
        else if (px <= 10'd256)
            pixel_room_col = 3'd1;
        else if (px <= 10'd384)
            pixel_room_col = 3'd2;
        else if (px <= 10'd512)
            pixel_room_col = 3'd3;
        else
            pixel_room_col = 3'd4;

        if (py <= 10'd160)
            pixel_room_row = 2'd0;
        else if (py <= 10'd320)
            pixel_room_row = 2'd1;
        else
            pixel_room_row = 2'd2;

        pixel_room_idx = pixel_room_row * 4'd5 + pixel_room_col;
    end

endmodule
