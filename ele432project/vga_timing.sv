module vga_timing (
    input  logic       clk_25M,
    input  logic       real_reset,
    output logic [9:0] h_count,
    output logic [9:0] v_count,
    output logic       VGA_HS,
    output logic       VGA_VS,
    output logic       video_on,
    output logic       frame_tick
);

    always_ff @(posedge clk_25M or posedge real_reset) begin
        if (real_reset) begin
            h_count <= 10'd0;
            v_count <= 10'd0;
        end
        else begin
            if (h_count == 10'd799) begin
                h_count <= 10'd0;
                if (v_count == 10'd524)
                    v_count <= 10'd0;
                else
                    v_count <= v_count + 10'd1;
            end
            else begin
                h_count <= h_count + 10'd1;
            end
        end
    end

    assign VGA_HS = (h_count >= 10'd656 && h_count <= 10'd751) ? 1'b0 : 1'b1;
    assign VGA_VS = (v_count >= 10'd490 && v_count <= 10'd491) ? 1'b0 : 1'b1;
    assign video_on = (h_count < 10'd640 && v_count < 10'd480);
    assign frame_tick = (h_count == 10'd0 && v_count == 10'd0);

endmodule
