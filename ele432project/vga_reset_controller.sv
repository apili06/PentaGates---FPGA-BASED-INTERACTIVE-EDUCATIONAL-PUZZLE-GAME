module vga_reset_controller (
    input  logic reset,
    input  logic sw9,
    output logic real_reset
);

    assign real_reset = ~reset | sw9;

endmodule
