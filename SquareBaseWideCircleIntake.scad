use <MCAD/polyholes.scad>
use <Libraries/bezier.scad>

mount_thickness = 4.15;
mount_tab_d = 14;
mount_tab_r = mount_tab_d/2;
mount_hole_d = 7;
mount_hole_r = mount_hole_d/2;
mount_plate_width = 51.4;
mount_plate_depth = 58.3;

intake_mount_d = 50;
intake_mount_r = intake_mount_d/2;
intake_top_d = 50;
intake_top_r = intake_top_d/2;
intake_height = 10 - mount_thickness;
//intake_height = 48.3 - mount_thickness;
intake_wall_thickness = 5;

fillet_size = 2.5;

pad = 0.02;
smooth = 64;

difference()
{
    // Raise the unioned model in order to align the bottom with the z-axis
    translate([0, 0, mount_thickness/2])
    union()
    {
        hull()
        {
            translate([0,0,0])
                cube(size=[mount_plate_width,mount_plate_depth,mount_thickness], center = true);
            translate([mount_plate_width/2+mount_tab_r,0,0])
                cylinder(h=mount_thickness, r=mount_tab_r, center = true);
            translate([-((mount_plate_width/2)+(mount_tab_r)),0,0])
                cylinder(h=mount_thickness, r=mount_tab_r, center = true);
        }

        translate([0,0,(intake_height/2)])
            cylinder(h=intake_height, r1=intake_mount_r, r2=intake_top_r, center = true, $fn = smooth);

        translate([0, 0, intake_height-pad])
        rotate_extrude(convexity=10, $fn=smooth)
        translate([20, 0, 0])
        union() {
        BezWall(
            [[0, 0],
            [0, 6.5],
            [0, 15.0],
            //[274, 71]
            [8, 22.0],
            [18.00, 15.75],
            //[367, 191]
            [5.0, 9.0],
            [5.0, 6.5],
            [5.0, 0]],
            width = 4, height = 0, steps = smooth, showCtls = false);
        translate([7.25,13.55])circle(1.75, $fn=smooth);
        }

        translate([0,0,mount_thickness/2])
            difference() {
                rotate_extrude(convexity=10, $fn = smooth)
                    translate([intake_mount_r, 0, 0])
                        square(fillet_size + pad, fillet_size + pad);
                rotate_extrude(convexity=10, $fn = smooth)
                    translate([intake_mount_r + fillet_size, fillet_size, 0])
                        circle(r=fillet_size, $fn = smooth);
            }
    }

    // Hollow the cylinder
    translate([0,0,(intake_height/2)])
        cylinder(h=intake_height+intake_wall_thickness, r1=intake_mount_r - intake_wall_thickness, r2=intake_top_r - intake_wall_thickness, center = true, $fn = smooth);

    // Mounting holes
    #translate([mount_plate_width/2+mount_tab_r,0,-pad/2])
        polyhole(h=mount_thickness+pad, d=mount_hole_r);
    #translate([-((mount_plate_width/2)+(mount_tab_r)),0,-pad/2])
        polyhole(h=mount_thickness+pad, d=mount_hole_r);

}
