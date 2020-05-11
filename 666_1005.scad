include <parameters.scad>;


module 666_1005_locking_cylinder(draft) {
    difference() {
        union() {
            difference() {
                cylinder(locking_ring_height,d=locking_ring_diameter,$fn = draft ? 10 : 50);
                translate([0,0,locking_ring_height-locking_ring_hole_depth])
                cylinder(locking_ring_height,d=locking_ring_hole_diameter,$fn = draft ? 10 : 50);
            }
            
            // handle
            intersection() {
                difference() {
                    translate([-locking_ring_diameter/2,-locking_ring_handle_width/2,0])
                    cube([locking_ring_diameter,locking_ring_handle_width,locking_ring_height+locking_ring_handle_offset]);
                    
                    
                    translate([0,0,locking_ring_height-locking_ring_hole_depth])
                    cylinder(locking_ring_hole_depth+locking_ring_handle_offset-locking_ring_handle_height,d=locking_ring_hole_diameter,$fn = draft ? 10 : 50);
                }
                
                
                cylinder(locking_ring_height+locking_ring_handle_offset,d=locking_ring_diameter,$fn = draft ? 10 : 50);
            }
        }
        
        // locking slots
        hull() {
        translate([0,-(locking_slot_offset+locking_slot_diameter/2),-.1])
        cylinder(locking_slot_height,d=locking_slot_diameter,$fn = draft ? 10 : 50);
        
        translate([-(locking_slot_offset+locking_slot_diameter/2+locking_y_travel),0,-.1])
        cylinder(locking_slot_height,d=locking_slot_diameter,$fn = draft ? 10 : 50);
        }
        hull() {
        translate([0,locking_slot_offset+locking_slot_diameter/2,-.1])
        cylinder(locking_slot_height,d=locking_slot_diameter,$fn = draft ? 10 : 50);
        
        translate([locking_slot_offset+locking_slot_diameter/2+locking_y_travel,0,-.1])
        cylinder(locking_slot_height,d=locking_slot_diameter,$fn = draft ? 10 : 50);
        }
            
        // holding screw
        translate([0,0,-1])
        cylinder(+locking_ring_handle_offset+2,d=M3_screw_diameter,$fn = draft ? 10 : 50);
        translate([0,0,locking_ring_height-locking_ring_hole_depth-M3_nut_height])
        cylinder(M3_nut_height+1,d=M3_nut_diameter+5,$fn = draft ? 10 : 50);
        
        
    }
}




module 666_1005_locking_teeth(draft) {
    union() {
        difference() {
            // main tooth
            translate([locking_slot_diameter/2,-locking_slot_diameter/2,0])
            cube([locking_y_travel+locking_slot_diameter/2+locking_teeth_slot_length+locking_teeth_offset,locking_slot_diameter,locking_teeth_height]);
            
            // cutting edge
            hull() {
                translate([locking_y_travel+locking_slot_diameter+locking_teeth_slot_length-locking_teeth_cut_offset+locking_teeth_offset,-locking_slot_diameter/2-1,locking_teeth_height])
                cube([1,locking_slot_diameter+2,locking_teeth_height]);
                translate([locking_y_travel+locking_slot_diameter+locking_teeth_slot_length+locking_teeth_offset,-locking_slot_diameter/2-1,locking_teeth_height/2])
                cube([1,locking_slot_diameter+2,locking_teeth_height]);
            }
        }
        
        // slot cylinder
        translate([locking_slot_diameter/2,0,0])
        cylinder(locking_slot_height-0.5+locking_teeth_height,d=locking_slot_diameter,$fn = draft ? 10 : 50);

    }

}




module 666_1005(draft) {
    
}



666_1005_locking_cylinder();

translate([locking_slot_offset+locking_y_travel,0,-locking_teeth_height])
666_1005_locking_teeth();

rotate([0,0,180])
translate([locking_slot_offset+locking_y_travel,0,-locking_teeth_height])
666_1005_locking_teeth();



