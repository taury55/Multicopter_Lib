rotor_diameter = 250;
arm_n = 6;
drone_diameter = (rotor_diameter/sin(180/arm_n));

M3_screw_diameter = 3;
global_clearence = 0.1;


// motor parameters ======================================
motor_diameter = 40;
motor_height = 18;
motor_n_screws = 4;
motor_screws_diameter = 20;


// motor holder para. (666_1001) =========================
motor_plate_height = 7;
motor_plate_diameter = motor_diameter;
motor_plate_hole_diameter = 10;
motor_tube_x_offset = motor_diameter/2 - 5;
motor_tube_z_offset = 20;

screws_n = 2;
screws_gap = 15;
screws_offset_x = 7.5;
screws_offset_y = 5;
holding_part_x = 30;
upper_holding_part_height = 15;
washer_size_x = 10;


// avionics plate para. (666_1003) =======================
avionics_plate_diameter = 200;
avionics_plate_height = 3;

av_screws_diameter = 160;
av_cable_holes_offset = 70;
av_cable_holes_width = 8;
av_cable_holes_length = 20;




arm_pipe_diameter = 20;
arm_pipe_inner_diameter = 18;
pipe_length = drone_diameter-motor_tube_x_offset;