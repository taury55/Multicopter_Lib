include <parameters.scad>;

module 888_1002(draft) {
    rotate([90,0,0])
    union() {
        difference() {
            cylinder(drone_diameter, d=arm_pipe_diameter, $fn = draft ? 10 : 50);
            translate([0,0,-1])
            cylinder(drone_diameter+2, d=arm_pipe_inner_diameter, $fn = draft ? 10 : 50);
        } 
    }
        
}

888_1002();