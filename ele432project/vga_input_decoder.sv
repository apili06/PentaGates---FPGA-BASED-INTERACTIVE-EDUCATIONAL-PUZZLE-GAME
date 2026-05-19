module vga_input_decoder (
    input  logic [3:0] KEY,
    output logic       btn_right,
    output logic       btn_left,
    output logic       btn_down,
    output logic       btn_up
);

    assign btn_right = ~KEY[0];
    assign btn_left  = ~KEY[1];
    assign btn_down  = ~KEY[3];
    assign btn_up    = ~KEY[2];

endmodule
