module vga_sw_edge_detector (
    input  logic clk,
    input  logic reset,
    input  logic sw_in,
    output logic edge_pulse
);

    logic sw_d;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            sw_d <= 1'b0;
        else
            sw_d <= sw_in;
    end

    assign edge_pulse = sw_in && !sw_d;

endmodule
