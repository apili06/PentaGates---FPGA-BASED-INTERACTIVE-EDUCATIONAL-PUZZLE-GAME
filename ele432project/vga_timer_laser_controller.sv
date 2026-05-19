module vga_timer_laser_controller (
    input  logic       clk,
    input  logic       reset,
    input  logic       timer_running,
    input  logic       state_gate_screen,
    input  logic       wrong_attempt,
    input  logic       laser_hit_start,
    input  logic       laser_touch_now,
    input  logic       gate_touch,
    output logic [9:0] time_count,
    output logic [1:0] laser1_phase_count,
    output logic [2:0] laser2_phase_count,
    output logic [1:0] laser3_phase_count,
    output logic       laser_touch_prev,
    output logic       gate_touch_prev,
    output logic       one_sec_tick
);

    localparam TIMER_MAX = 10'd999;

    logic [24:0] sec_counter;

    assign one_sec_tick = (sec_counter == 25'd24_999_999);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sec_counter <= 25'd0;
            time_count <= 10'd0;
            laser1_phase_count <= 2'd0;
            laser2_phase_count <= 3'd0;
            laser3_phase_count <= 2'd0;
            laser_touch_prev <= 1'b0;
            gate_touch_prev <= 1'b0;
        end
        else begin
            laser_touch_prev <= laser_touch_now;

            if (state_gate_screen)
                gate_touch_prev <= 1'b0;
            else
                gate_touch_prev <= gate_touch;

            if (!timer_running) begin
                sec_counter <= 25'd0;
            end
            else begin
                if (wrong_attempt) begin
                    if (time_count >= 10'd990)
                        time_count <= 10'd999;
                    else
                        time_count <= time_count + 10'd10;
                end
                else if (one_sec_tick) begin
                    sec_counter <= 25'd0;

                    if (laser1_phase_count == 2'd2)
                        laser1_phase_count <= 2'd0;
                    else
                        laser1_phase_count <= laser1_phase_count + 2'd1;

                    if (laser2_phase_count == 3'd1)
                        laser2_phase_count <= 3'd0;
                    else
                        laser2_phase_count <= laser2_phase_count + 3'd1;

                    if (laser3_phase_count == 2'd3)
                        laser3_phase_count <= 2'd0;
                    else
                        laser3_phase_count <= laser3_phase_count + 2'd1;

                    if (laser_hit_start) begin
                        if (time_count >= 10'd989)
                            time_count <= 10'd999;
                        else
                            time_count <= time_count + 10'd11;
                    end
                    else begin
                        if (time_count == TIMER_MAX)
                            time_count <= 10'd0;
                        else
                            time_count <= time_count + 10'd1;
                    end
                end
                else begin
                    sec_counter <= sec_counter + 25'd1;

                    if (laser_hit_start) begin
                        if (time_count >= 10'd990)
                            time_count <= 10'd999;
                        else
                            time_count <= time_count + 10'd10;
                    end
                end
            end
        end
    end

endmodule
