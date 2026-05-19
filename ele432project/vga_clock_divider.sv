module vga_clock_divider (
    input  logic CLOCK_50,
    input  logic real_reset,
    output logic clk_25M
);

    always_ff @(posedge CLOCK_50 or posedge real_reset) begin
        if (real_reset)
            clk_25M <= 1'b0;
        else
            clk_25M <= ~clk_25M;
    end

endmodule
