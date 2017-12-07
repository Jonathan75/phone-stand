include <plug_holder.scad>
wall = 1;
t = 0.4; //tolerance
base_w = 77+wall+t;
base_d = 120;

holder_w = 9;
holder_d = 11.32;
holder_h = 34;

module base() {
    boarder = 6;
    h = wall*2.5;
    translate([0,-26,0]) {
      difference() {
        cube([base_w,base_d,h], center=false);
        translate([boarder,boarder,d]) cube([base_w-(boarder*2),base_d-(boarder*2),h], center=false);
      }
    }
}
base();

module support(t) {
  translate([t+0.5,17,25]) {
    rotate([90,30,90]){
      cylinder(r=50, h=wall, center=true, $fn=3);
    }
  }
}

module holder() {
    w = holder_w;
    d = holder_d;
    h = holder_h;

    translate([0,-8,d]) {
        rotate([-90,0,0]) {
            difference() {
                cube([w,d+(wall*2),h], center=false);
                translate([wall,wall,wall]) cube([w-wall,d,h-wall], center=false);
             }
         }
     }
}

module holder_bottom(){
    d = holder_d+(wall*2);
    w = base_w;
    h = wall;
    plug_holder_move = [(base_w/2),-18,3];

    difference(){
      translate([w*.5,-8,4.65]) cube([w,h,d], center=true);
      translate(plug_holder_move) rotate([0,0,90]) plug_holder(true);
    }
    back_wall_height = 50;
    translate([(w*.5),back_wall_height * -0.5,-1.5]) cube([w-wall,back_wall_height,h], center=true); //back
    translate(plug_holder_move) rotate([0,0,90]) plug_holder(false);
}

translate([0,22,50]) rotate([90,0,0]) {
    holder();
    mirror([180,0,0]) translate([base_w*-1,0,0]) holder();
    holder_bottom();
}


support(0);
support(base_w-wall);
