include <parameters.scad>;

module 666_1004_bottom_side(draft) {
    difference() {
        cylinder(base_bottom_height, d=base_diameter, $fn = arm_n);
        
        // pipe holes & screws to avionics plate
        for (i = [0:360/arm_n:360]) {
            // avionics screws
            rotate([0,0,i])
            translate([av_screws_diameter/2,0,-1])
            cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            
            // pipes
            rotate([0,0,i+(360/arm_n)/2])
            translate([arm_pipe_x_offset,0,arm_pipe_z_offset+arm_pipe_diameter/2])
            rotate([90,0,90])
            cylinder(arm_pipe_length+2,d=arm_pipe_diameter, $fn = draft ? 10 : 50);
        }
    }
    
}

module 666_1004_top_side(draft) {
    difference() {
        translate([0,0,base_bottom_height])
        cylinder(base_height-base_bottom_height, d=base_diameter, $fn = arm_n);
        
        // pipe holes & screws to avionics plate
        for (i = [0:360/arm_n:360]) {
            // avionics screws
            rotate([0,0,i])
            translate([av_screws_diameter/2,0,-1])
            cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            
            
            // pipe holes
            rotate([0,0,i+(360/arm_n)/2])
            translate([arm_pipe_x_offset,0,arm_pipe_z_offset+arm_pipe_diameter/2])
            rotate([90,0,90])
            cylinder(arm_pipe_length+2,d=arm_pipe_diameter, $fn = draft ? 10 : 50);
            

            // arm screws
            rotate([0,0,i+(360/arm_n)/2])
            translate([base_low_diameter/2-base_arm_screw_x_offset,0,-1])
            cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        }
    }
    
}

module 666_1004_arm_washer(draft) {
    difference() {
        intersection() {
            translate([-base_arm_washer_width/2,-arm_pipe_diameter/2,0])
            cube([base_arm_washer_width,arm_pipe_diameter,arm_pipe_diameter]);
            
            translate([-base_arm_washer_width/2-1,0,0])
            rotate([90,0,90])
            cylinder(base_arm_washer_width+2,d=arm_pipe_diameter, $fn = draft ? 10 : 50);
        }
        
        translate([0,0,-1])
        cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        
        translate([0,0,-.1])
        cylinder(M3_nut_height,d=M3_nut_diameter, $fn = 6);
    }
    
}

module 666_1004(draft) {
        
    666_1004_bottom_side();
    666_1004_top_side();
    
}


666_1004_bottom_side();
666_1004_top_side();
666_1004_arm_washer();




