include <parameters.scad>;

module 666_1004_bottom_sides(draft) {
    intersection() {
        if(base_can_fit) {
            cylinder(base_height-base_bottom_height, d=base_diameter, $fn = arm_n); 
        } else {
            rotate([0,0,360/arm_n/2+90])
            union() {
                hull() {
                    difference() {
                        translate([-mid_poly_side/2-cutting_edge_width/2,mid_poly_low_diameter/2-.1,0])
                        cube([mid_poly_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([mid_poly_side/2-cutting_edge_width/2,mid_poly_low_diameter/2-.1,0])
                        cube([mid_poly_side,.1,base_bottom_height/2]);
                    }
                    
                    difference() {
                        translate([-base_side/2-cutting_edge_width/2,base_low_diameter/2-.1,0])
                        cube([base_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([base_side/2-cutting_edge_width/2,base_low_diameter/2-.1,0])
                        cube([base_side,.1,base_bottom_height/2]);
                    }
                }
                
                hull() {
                    difference() {
                        translate([-mid_poly_side/2+cutting_edge_width/2,mid_poly_low_diameter/2-.1,base_bottom_height/2])
                        cube([mid_poly_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([mid_poly_side/2+cutting_edge_width/2,mid_poly_low_diameter/2-.1,base_bottom_height/2])
                        cube([mid_poly_side,.1,base_bottom_height/2]);
                    }
                    
                    difference() {
                        translate([-base_side/2+cutting_edge_width/2,base_low_diameter/2-.1,base_bottom_height/2])
                        cube([base_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([base_side/2+cutting_edge_width/2,base_low_diameter/2-.1,base_bottom_height/2])
                        cube([base_side,.1,base_bottom_height/2]);
                    }
                }
            }
        }
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
            
            // middle hole
            translate([0,0,-1])
            cylinder(base_bottom_height-arm_pipe_diameter/2+2, d=base_middle_hole_diameter, $fn = arm_n);
            
            // cut mid
            translate([0,0,base_bottom_height-arm_pipe_diameter/2])
            cylinder(base_bottom_height+1, d=mid_poly_diameter, $fn = arm_n);
            
                
            //screws to mount distribution board
            for (i = [45:90:315]) {
                rotate([0,0,i])
                translate([base_middle_screws_diameter/2,0,-1])
                cylinder(base_bottom_height-arm_pipe_diameter/2+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            }
            
            
            
            // base cant fit different printing ==================================
            
            if(!base_can_fit) {
                
                
                // cut mid
                translate([0,0,-1])
                cylinder(base_height+2, d=mid_poly_diameter, $fn = arm_n);
                
                
                // screw holes to mid
                for (i = [0:360/arm_n:360]) {
                    rotate([0,0,i+360/arm_n/2+90])
                    translate([0,-mid_poly_low_diameter/2+1,screws_z_offset])
                    rotate([90,0,0])
                    union() {
                        translate([screws_y_offset+arm_pipe_diameter/2,0,0])
                        union() {
                            cylinder(screws_x_offset_outside+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                            translate([0,0,screws_x_offset_outside+1])
                            cylinder((base_low_diameter-mid_poly_low_diameter)/2,d=M3_nut_diameter, $fn = draft ? 10 : 50);
                        }
                        translate([-screws_y_offset-arm_pipe_diameter/2,0,0])
                        union() {
                            cylinder(screws_x_offset_outside+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                            translate([0,0,screws_x_offset_outside+1])
                            cylinder((base_low_diameter-mid_poly_low_diameter)/2,d=M3_nut_diameter, $fn = draft ? 10 : 50);
                        }
                    }
                }
                
                
                // screw holes to other sides
                for (i = [0:360/arm_n:360]) {
                    // avionics screws
                    rotate([0,0,i])
                    translate([screws_joining_sides_diameter/2,0,-1])
                    cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                    
                }
            }
        }
        
    }
}








module 666_1004_bottom_mid(draft) {
    difference() {
        cylinder(base_bottom_height/2, d=mid_poly_diameter, $fn = arm_n);
        
        // screw holes to sides
        for (i = [0:360/arm_n:360]) {
            rotate([0,0,i+360/arm_n/2+90])
            translate([0,mid_poly_low_diameter/2+1,screws_z_offset])
            rotate([90,0,0])
            union() {
                translate([arm_pipe_diameter/2+screws_y_offset,0,0])
                union(){
                    rotate([0,0,90])
                    translate([0,0,screws_x_offset_inside])
                    cylinder(M3_nut_height,d=M3_nut_diameter, $fn = 6);
                    translate([0,-screws_z_offset/2-1,screws_x_offset_inside+M3_nut_height/2])
                    cube([M3_nut_pocket, screws_z_offset+2, M3_nut_height],true);
                    cylinder(screws_x_offset_inside+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                }
                
                translate([-arm_pipe_diameter/2-screws_y_offset,0,0])
                union(){
                    rotate([0,0,90])
                    translate([0,0,screws_x_offset_inside])
                    cylinder(M3_nut_height,d=M3_nut_diameter, $fn = 6);
                    translate([0,-screws_z_offset/2-1,screws_x_offset_inside+M3_nut_height/2])
                    cube([M3_nut_pocket, screws_z_offset+2, M3_nut_height],true);
                    cylinder(screws_x_offset_inside+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                }
            }
            
            //screws to mount distribution board
            for (i = [45:90:315]) {
                rotate([0,0,i])
                translate([base_middle_screws_diameter/2,0,-1])
                cylinder(base_bottom_height-arm_pipe_diameter/2+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
            }
        }
        
        translate([0,0,-1])
        cylinder(base_bottom_height-arm_pipe_diameter/2+2, d=base_middle_hole_diameter, $fn = arm_n);
    }
    
}

module 666_1004_top_sides(draft) {
    intersection() {
        if(base_can_fit) {
            cylinder(base_height, d=base_diameter, $fn = arm_n); 
        } else {
            translate([0,0,base_bottom_height])
            rotate([0,0,360/arm_n/2+90])
            union() {
                hull() {
                    difference() {
                        translate([-mid_poly_side/2-cutting_edge_width/2,mid_poly_low_diameter/2-.1,0])
                        cube([mid_poly_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([mid_poly_side/2-cutting_edge_width/2,mid_poly_low_diameter/2-.1,0])
                        cube([mid_poly_side,.1,base_bottom_height/2]);
                    }
                    
                    difference() {
                        translate([-base_side/2-cutting_edge_width/2,base_low_diameter/2-.1,0])
                        cube([base_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([base_side/2-cutting_edge_width/2,base_low_diameter/2-.1,0])
                        cube([base_side,.1,base_bottom_height/2]);
                    }
                }
                
                hull() {
                    difference() {
                        translate([-mid_poly_side/2+cutting_edge_width/2,mid_poly_low_diameter/2-.1,base_bottom_height/2])
                        cube([mid_poly_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([mid_poly_side/2+cutting_edge_width/2,mid_poly_low_diameter/2-.1,base_bottom_height/2])
                        cube([mid_poly_side,.1,base_bottom_height/2]);
                    }
                    
                    difference() {
                        translate([-base_side/2+cutting_edge_width/2,base_low_diameter/2-.1,base_bottom_height/2])
                        cube([base_side+cutting_edge_width/2,.1,base_bottom_height/2]);
                        
                        translate([base_side/2+cutting_edge_width/2,base_low_diameter/2-.1,base_bottom_height/2])
                        cube([base_side,.1,base_bottom_height/2]);
                    }
                }
            }
        }
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
            
            //cut mid
            translate([0,0,-1])
            cylinder(base_height+2, d=mid_poly_diameter, $fn = arm_n);
            
            if(!base_can_fit) {
                //screws to other sides
                for (i = [0:360/arm_n:360]) {
                    rotate([0,0,i])
                    translate([screws_joining_sides_diameter/2,0,-1])
                    cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
                }
            }
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
            cylinder(base_arm_washer_width+2,d=arm_pipe_inner_diameter, $fn = draft ? 10 : 50);
        }
        
        translate([0,0,-1])
        cylinder(base_height+2,d=M3_screw_diameter, $fn = draft ? 10 : 50);
        
        translate([0,0,-.1])
        cylinder(M3_nut_height,d=M3_nut_diameter, $fn = 6);
    }
    
}

module 666_1004(draft) {
    for (i = [0:360/arm_n:360]) {
        if(!base_can_fit) {
            rotate([0,0,i])
            666_1004_bottom_sides();
            
            rotate([0,0,i])
            666_1004_top_sides();
        }
        
        
        rotate([0,0,i+360/arm_n/2])
        translate([base_low_diameter/2-base_arm_screw_x_offset,0,arm_pipe_z_offset+arm_pipe_diameter/2])
        666_1004_arm_washer();
    }
    
    if(base_can_fit) {
        666_1004_bottom_sides();
        666_1004_top_sides();
    } else {
        666_1004_bottom_mid();
    }  
}


for (i = [0:360/arm_n:360]) {
    if(!base_can_fit) {
        rotate([0,0,i])
        666_1004_bottom_sides();
        
        rotate([0,0,i])
        666_1004_top_sides();
    }
    
    
    rotate([0,0,i+360/arm_n/2])
    translate([base_low_diameter/2-base_arm_screw_x_offset,0,arm_pipe_z_offset+arm_pipe_diameter/2])
    666_1004_arm_washer();
}

if(base_can_fit) {
    666_1004_bottom_sides();
    666_1004_top_sides();
} else {
    666_1004_bottom_mid();
}




