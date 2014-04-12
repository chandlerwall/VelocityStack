use <MCAD/polyholes.scad>

mount_thickness = 4;
mount_hole_d = 7;
mount_tab_d = 14;
mount_plate_width = 51.4;
mount_plate_depth = 58.3;

intake_mount_d = 50;
intake_top_d = 50;
intake_height = 48.3 - mount_thickness;
intake_wall_thickness = 5;

fillet_size = 2.5;

padding = 0.01;
smooth = 180;

difference()
{
    union()
    {
        difference()
        {
            hull()
            {
                cube(size=[mount_plate_width,mount_plate_depth,mount_thickness], center = true);
                translate([mount_plate_width/2+mount_tab_d/2,0,0])
                    cylinder(h=mount_thickness, r=mount_tab_d/2, center = true);
                translate([-((mount_plate_width/2)+(mount_tab_d/2)),0,0])
                    cylinder(h=mount_thickness, r=mount_tab_d/2, center = true);
            }
            #translate([mount_plate_width/2+mount_tab_d/2,0,0])
                cylinder(h=mount_thickness+1, r=mount_hole_d/2 , center = true);
            #translate([-((mount_plate_width/2)+(mount_tab_d/2)),0,0])
                cylinder(h=mount_thickness+1, r=mount_hole_d/2 , center = true);
        }

        translate([0,0,(intake_height/2)-mount_thickness/2])
            cylinder(h=intake_height, r1=intake_mount_d/2, r2=intake_top_d/2, center = true, $fn = smooth);

        translate([0,0,mount_thickness/2-padding]) difference() {
            rotate_extrude(convexity=10, $fn = smooth)
                translate([intake_mount_d/2+padding,ct-pad,0])
                    square(fillet_size+padding,fillet_size+padding);
            rotate_extrude(convexity=10,  $fn = smooth)
                translate([intake_mount_d/2+fillet_size,fillet_size,0])
                    circle(r=fillet_size,$fn = smooth);
        }
    }

    translate([0,0,(intake_height/2)-mount_thickness/2])
        cylinder(h=intake_height+intake_wall_thickness, r1=intake_mount_d/2 - intake_wall_thickness, r2=intake_top_d/2 - intake_wall_thickness, center = true, $fn = smooth);
}
