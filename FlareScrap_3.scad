use <Libraries/bezier_solids.scad>


points = [
[0,0],
[9,9],
[9,7.5],
[5,0]
];

union() {
rotate_extrude()
translate([10, 0, 0])
bezier_polygon([
    points[0], points[0] + [0,9], points[1] - [0,0],
    points[1], points[1] + [1,0], points[2] - [-1,-.5],
    points[2], points[2] + [-4,-2], points[3] - [0,-2],
    points[3], points[3] + [0,0], points[0] - [0,0],
    points[0]
    ]
);
translate([7.6,0,-2.5])cube(5, center = true);
}
