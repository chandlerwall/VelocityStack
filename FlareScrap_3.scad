use <Libraries/bezier_solids.scad>


points = [
[0,0],
[9,12],
[9,9],
[5,0]
];

//rotate_extrude()
//translate([10, 0, 0])
bezier_polygon([
    points[0], points[0] + [0,9], points[1] - [0,0],
    points[1], points[1] + [1,0.5], points[2] + [1.5, 0.5],
    points[2], points[2] + [-4,-2], points[3] - [0,-2],
    points[3], points[3] + [0,0], points[0] - [0,0],
    points[0]
    ]
);
