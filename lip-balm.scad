// dimensions in mm
$fs = 0.1; // mm per facet in cylinder
$fa = 5; // degrees per facet in cylinder
$fn = 100;

width = 35; // mm
height = 4;
space = 0.1; // between top and bottom, so they snap

module bottom() {
    difference() {
        sphere(d = width);
        //sphere(d = width*.95);
        
        translate([0,0,-width + width * .1])
        cube([width, width, width], center = true);
        translate([0,0,width/2])
        cube([width, width, width], center = true);
    }
    
    module grid() {
        difference() {
            cylinder(d = width * .9, h = height);
            translate([0,0,height*.5]) cylinder(d = width * .8, h = height*200);
        }
        module spoke() {
        translate([0,0,height/2])
        cube([width * .85, 1, height], center = true);
        }
        for(i=[0:5]) {
        rotate(45*i) spoke();
        }

    }
    grid();
}
translate([0,0,-(-width + width * .2)/2])
bottom();

module top() {
    difference() {
        sphere(d = width);
        sphere(d = width*.9);
        
        translate([0,0,-width/2])
        cube([width, width, width], center = true);
        cylinder(d = width * .9 + space, h = height + space);
    }
}
translate([width*1.1,0,width/2])
rotate([180,0,0])
top();
