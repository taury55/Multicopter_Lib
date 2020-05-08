include <parameters.scad>;

module 888_1002(draft) {
    difference() {
        rotate([90,0,90])
        union() {
            difference() {
                cylinder(arm_pipe_length, d=arm_pipe_diameter, $fn = draft ? 10 : 50);
                translate([0,0,-1])
                cylinder(arm_pipe_length+2, d=arm_pipe_inner_diameter, $fn = draft ? 10 : 50);
            } 
        }
        
    translate([base_low_diameter/2-base_arm_screw_x_offset-arm_pipe_x_offset,0,0])
    cylinder(arm_pipe_diameter, d=M3_screw_diameter, $fn = draft ? 10 : 50);   
        
    translate([arm_pipe_length-screws_offset_x,0,0])
    cylinder(arm_pipe_diameter, d=M3_screw_diameter, $fn = draft ? 10 : 50);   
    }
        
}

888_1002();