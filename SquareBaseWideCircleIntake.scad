use <MCAD/polyholes.scad>

mount_thickness = 12;
mount_hole_d = 16;
mount_tab_d = 16;
mount_plate_width = 50;
mount_plate_depth = 100;

intake_mount_d = 85;
intake_top_d = 85;
intake_height = 120;
intake_wall_thickness = 2;

difference()
{
    union()
    {
        difference()
        {
            hull()
            {
                cube(size=[mount_plate_width,mount_plate_depth,mount_thickness], center = true);
                translate([mount_plate_width + mount_tab_d/2,0,0])
                    cylinder(h=mount_thickness, r=mount_tab_d, center = true);
                translate([-(mount_plate_width + mount_tab_d/2),0,0])
                    cylinder(h=mount_thickness, r=mount_tab_d, center = true);
            }
            translate([mount_plate_width + mount_tab_d/2,0,0])
                cylinder(h=mount_thickness+1, r=mount_hole_d/2 , center = true);
            translate([-(mount_plate_width + mount_tab_d/2),0,0])
                cylinder(h=mount_thickness+1, r=mount_hole_d/2 , center = true);
        }
        translate([0,0,(intake_height/2)-mount_thickness/2]) cylinder(h=intake_height, r1=intake_mount_d/2, r2=intake_top_d/2, center = true, $fn=64);
    }
    translate([0,0,(intake_height/2)-mount_thickness/2])
        cylinder(h=intake_height+intake_wall_thickness, r1=intake_mount_d/2 - intake_wall_thickness, r2=intake_top_d/2 - intake_wall_thickness, center = true, $fn = 64);
}
