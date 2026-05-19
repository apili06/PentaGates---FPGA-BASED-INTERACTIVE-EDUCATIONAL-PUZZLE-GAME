module vga_driver (
    input  logic       CLOCK_50,
    input  logic       reset,
    input  logic [3:0] KEY,
    input  logic [9:0] SW,
    output logic [7:0] VGA_R,
    output logic [7:0] VGA_G,
    output logic [7:0] VGA_B,
    output logic       VGA_HS,
    output logic       VGA_VS,
    output logic       VGA_BLANK_N,
    output logic       VGA_SYNC_N,
    output logic       VGA_CLK
);

    logic real_reset;
    logic clk_25M;
    logic [9:0] h_count;
    logic [9:0] v_count;
    logic video_on;
    logic frame_tick;

    vga_reset_controller u_reset_controller (
        .reset(reset),
        .sw9(SW[9]),
        .real_reset(real_reset)
    );

    vga_static_outputs u_static_outputs (
        .clk_25M(clk_25M),
        .video_on(video_on),
        .VGA_CLK(VGA_CLK),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N)
    );

    vga_clock_divider u_clk (
        .CLOCK_50(CLOCK_50),
        .real_reset(real_reset),
        .clk_25M(clk_25M)
    );

    vga_timing u_timing (
        .clk_25M(clk_25M),
        .real_reset(real_reset),
        .h_count(h_count),
        .v_count(v_count),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .video_on(video_on),
        .frame_tick(frame_tick)
    );

    vga_game_core u_game (
        .clk_25M(clk_25M),
        .real_reset(real_reset),
        .KEY(KEY),
        .SW(SW),
        .h_count(h_count),
        .v_count(v_count),
        .video_on(video_on),
        .frame_tick(frame_tick),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B)
    );

endmodule
