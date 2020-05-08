include <parameters.scad>;
use <666_1001.scad>;
use <888_1002.scad>;
use <666_1003.scad>;
use <666_1004.scad>;



// base
666_1004();


// avionics plate
translate([0,0,avionics_plate_z_offset+base_height])
666_1003();

// arms
for (i = [0:360/arm_n:360]) {
    
    // pipes
    rotate([0,0,i+360/arm_n/2])
    translate([arm_pipe_x_offset,0,arm_pipe_z_offset+arm_pipe_diameter/2])
    888_1002();
    
    
    // motor holders
    rotate([0,0,i+(360/arm_n)/2])
    translate([arm_pipe_x_offset+arm_pipe_length+motor_tube_x_offset,0,motor_tube_z_offset+arm_pipe_z_offset+arm_pipe_diameter/2])
    rotate([180,0,180])
    666_1001();
}

// battery
rotate([0,0,90])
translate([-Battery_length/2,-Battery_height/2,-Battery_width])
cube([Battery_length,Battery_height,Battery_width]);