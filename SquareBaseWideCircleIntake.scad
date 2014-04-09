use <MCAD/polyholes.scad>

difference() {
    union() {

            difference() {
                translate([0,0,5])cube(size=[260,260,10], center = true);
                translate([130-25,130-25,-1])polyhole(12, 25);
                translate([-130+25,130-25,-1])polyhole(12, 25);
                translate([130-25,-130+25,-1])polyhole(12, 25);
                translate([-130+25,-130+25,-1])polyhole(12, 25);
            }
        translate([0,0,110])
                cylinder(h=200, r1=75, r2=150, center = true, $fn=64);
        translate([0,0,210])
            rotate_extrude(convexity = 16, $fn=64)
                translate([150, 0, 0])
                    circle(r = 15);
    }
    translate([0,0,110])
        cylinder(h=250, r1=50, r2=145, center = true, $fn = 64);
}
