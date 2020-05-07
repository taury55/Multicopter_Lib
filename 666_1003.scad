include <parameters.scad>;

module 666_1003(draft) {
    difference(){
        cylinder(avionics_plate_height, d=avionics_plate_diameter, $fn = arm_n);
        
        // screws to base
        for (i = [0:360/arm_n:360-(360/arm_n)]) {
            rotate([0,0,i])
            translate([av_screws_diameter/2,0,-1])
            cylinder(avionics_plate_height+2,d=M3_screw_diameter+global_clearence*2, $fn = draft ? 10 : 50);
        }
        
        // holes for cables
        for (i = [0:90:360]) {
            rotate([0,0,i])
            translate([av_cable_holes_offset/2,-av_cable_holes_width/2,-1])
            cube([av_cable_holes_length,av_cable_holes_width,avionics_plate_height+2]);
        }
    }
}

666_1003();