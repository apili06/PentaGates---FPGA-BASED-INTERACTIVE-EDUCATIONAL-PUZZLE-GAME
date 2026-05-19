module vga_static_outputs (
    input  logic clk_25M,
    input  logic video_on,
    output logic VGA_CLK,
    output logic VGA_BLANK_N,
    output logic VGA_SYNC_N
);

    assign VGA_CLK = clk_25M;
    assign VGA_BLANK_N = 1'b1;
    assign VGA_SYNC_N = 1'b0;

endmodule