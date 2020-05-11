



arm_n = 6;
rotor_diameter = 250;
drone_diameter = (rotor_diameter/sin(180/arm_n));

global_clearence = 0.1;


// M3 parameters =========================================
M3_screw_diameter = 3.2;
M3_nut_height = 2.7;
M3_nut_diameter = 6.6;
M3_nut_pocket = 5.6;


// Battery size ==========================================
battery_length = 195;
battery_height = 91;
battery_width = 64;


// 3D printer para. ======================================
print_plate_x = 200;
print_plate_y = 220;


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
avionics_plate_z_offset = 25;

av_screws_diameter = 160;
av_cable_holes_offset = 70;
av_cable_holes_width = 8;
av_cable_holes_length = 20;


// mid poly base para. (666_1004) ========================
mid_poly_diameter = 120;
mid_poly_low_diameter = mid_poly_diameter*cos(180/arm_n);
mid_poly_side = mid_poly_low_diameter*tan(180/arm_n);


// arm pipe para. (888_1002) =============================
arm_pipe_diameter = 20;
arm_pipe_inner_diameter = 18;
arm_pipe_x_offset = mid_poly_low_diameter/2-.1;
arm_pipe_z_offset = 5;
arm_pipe_length = drone_diameter-motor_tube_x_offset-arm_pipe_x_offset;


// main base para. (666_1004) ============================
base_diameter = 300;
base_height = 40;
base_bottom_height = base_height/2;
base_arm_screw_x_offset = 5;

base_low_diameter = base_diameter*cos(180/arm_n);
base_side = base_low_diameter*tan(180/arm_n);
base_arm_washer_width = 10;
base_middle_hole_diameter = 70;
base_middle_screws_diameter = base_middle_hole_diameter+10;

screws_x_offset_inside = 5;
screws_x_offset_outside = 15;
screws_y_offset = 2.5;
screws_z_offset = (base_bottom_height-arm_pipe_diameter/2)/2;

cutting_edge_width = 10;
screws_joining_sides_diameter = base_diameter-50;


// battery module  para. (666_1005) =======================
battery_cartridge_width = battery_height+6;
battery_cartridge_height = battery_width+6;


// battery module mechanism para. (666_1005) =======================
locking_y_travel = 10;
locking_ring_diameter = battery_width;
locking_ring_height = 15;
locking_ring_handle_offset = 20;
locking_ring_handle_height = 10;
locking_ring_handle_width = 15;
locking_ring_hole_diameter = locking_ring_diameter-20;
locking_ring_hole_depth = locking_ring_height/2-5;
locking_slot_diameter = 10;
locking_slot_height = 5;
locking_slot_offset = 10;
locking_teeth_cut_offset = 5;
locking_teeth_height = 5;
locking_teeth_slot_length = (battery_cartridge_width-locking_ring_diameter-2*locking_y_travel)/2;
locking_teeth_offset = locking_ring_diameter/2-locking_slot_diameter-locking_y_travel-locking_slot_offset;


// mid poly if base cant fit =============================
base_can_fit = base_diameter <= min(print_plate_x,print_plate_y) ? true : false;






