
base_w = 164;
base_d = 60;

holder_w = 9;
holder_d = 13;
holder_h = 34;

module base() { 
    difference() {
        cube([base_w,base_d,2], center=false);
        translate([holder_w,10,d]) { 
            cube([base_w-(holder_w*2),base_d-20,2], center=false); 
        }
    }
}
 
base();


module support(t) { 
    hull(){
        translate([t,25,0]) { 
            cube([holder_w,2,25], center=false);
            rotate([90,0,0]) cube([holder_w,2,25], center=false);
        }
    };
}

module holder(t) {
    w = holder_w;
    d = holder_d;
    h = holder_h;
    wall = 2;
    
    translate([0,-11,d]) {
        rotate([-45,0,0]) { 
            difference() {
                cube([w,d+(wall*2),h], center=false);      
                translate([wall,wall,wall]) {
                    cube([w-wall,d,h-wall], center=false);      
                }
             }
         }
     }
}

holder();
mirror([180,0,0]) { translate([base_w*-1,0,0]) {holder();} }

support(0);
support(base_w-holder_w);


