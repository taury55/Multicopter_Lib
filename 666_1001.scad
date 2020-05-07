include <parameters.scad>;

module 666_1001_motor_plate(draft) {
    difference() {
        union() {
            translate([motor_tube_x_offset,-motor_plate_diameter/2,0])
            cube([holding_part_x,motor_plate_diameter,motor_tube_z_offset]);
            
            translate([0,-motor_plate_diameter/2,0])
            cube([holding_part_x+motor_tube_x_offset,motor_plate_diameter,motor_plate_height]);
                
            cylinder(motor_plate_height, d=motor_plate_diameter, $fn = draft ? 10 : 50);
        }
        
        translate([motor_tube_x_offset-1,0,motor_tube_z_offset])
        rotate([0,90,0])
        cylinder(holding_part_x+2, d=arm_pipe_diameter, $fn = draft ? 10 : 50);
        
        
        translate([0,0,-1])
        cylinder(motor_plate_height+2,d=motor_plate_hole_diameter, $fn = draft ? 10 : 50);
        
        // screws to motor
        for (i = [45:90:315]) {
            rotate([0,0,i])
            translate([motor_screws_diameter/2,0,-1])
            cylinder(motor_plate_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        }
        
        // screws to arm
        for (i = [0:screws_n-1]) {
            translate([motor_tube_x_offset+screws_offset_x+i*screws_gap,arm_pipe_diameter/2+screws_offset_y,-1])
            cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            
            translate([motor_tube_x_offset+screws_offset_x+i*screws_gap,-arm_pipe_diameter/2-screws_offset_y,-1])
            cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        }
        
        translate([motor_tube_x_offset+screws_offset_x,0,-1])
        cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
    }
}

module 666_1001_arm_plate(draft) {
    difference() {
        translate([motor_tube_x_offset,-motor_plate_diameter/2,motor_tube_z_offset+2])
        cube([holding_part_x,motor_plate_diameter,upper_holding_part_height]);
        
        translate([motor_tube_x_offset-1,0,motor_tube_z_offset])
        rotate([0,90,0])
        cylinder(holding_part_x+2, d=arm_pipe_diameter, $fn = draft ? 10 : 50);
        
        // screws to arm
        for (i = [0:screws_n-1]) {
            translate([motor_tube_x_offset+screws_offset_x+i*screws_gap,arm_pipe_diameter/2+screws_offset_y,-1])
            cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            
            translate([motor_tube_x_offset+screws_offset_x+i*screws_gap,-arm_pipe_diameter/2-screws_offset_y,-1])
            cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        }
    }
}

module 666_1001_arm_washer(draft) {
    difference() {
        intersection() {
            translate([motor_tube_x_offset+screws_offset_x-washer_size_x/2,-motor_plate_diameter/2,0])
            cube([washer_size_x,motor_plate_diameter,motor_tube_z_offset]);
        
            translate([motor_tube_x_offset-1,0,motor_tube_z_offset])
            rotate([0,90,0])
            cylinder(holding_part_x+2, d=arm_pipe_inner_diameter, $fn = draft ? 10 : 50);
        }
        
        // screws to arm
        translate([motor_tube_x_offset+screws_offset_x,0,-1])
        cylinder(holding_part_x+motor_tube_x_offset+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        
        translate([motor_tube_x_offset+screws_offset_x,0,motor_tube_z_offset+.1-M3_nut_height])
        cylinder(M3_nut_height,d=M3_nut_diameter, $fn = 6);
    }
}

module 666_1001() {
    
    666_1001_motor_plate();
    666_1001_arm_plate();
    666_1001_arm_washer();

}



666_1001_motor_plate();
666_1001_arm_plate();
666_1001_arm_washer();







