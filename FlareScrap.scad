$fn = 64;
d = 18;

difference() {
    intersection() {
        difference() {
            rotate_extrude(convexity = 10)
                translate([2*d, 0, 0])
                    circle(d);
            translate([0, 0, -d])
                cube(size=[4*d, 4*d, 2*d], center=true);
        }

        #translate([0, 0, d])cylinder(h=2*d, r=2*d*.9, center=true);
    }
        cylinder(h=d, r=2*d, center=true);
        #translate([0, 0, d/2])
            rotate_extrude(convexity=10)
                translate([2*d, 0, 0])
                    circle(d/2);
}
