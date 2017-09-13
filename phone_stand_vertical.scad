include <plug_holder.scad>
wall = 2;
t = 0.4; //tolerance
base_w = 87.55+wall+t;
base_d = 120;

holder_w = 9;
holder_d = 13;
holder_h = 34;

module base() { 
    difference() {
        cube([base_w,base_d,2], center=false);
        translate([holder_w,10,d]) cube([base_w-(holder_w*2),base_d-20,2], center=false); 
    }
} 
base();


module support(t) { 
    hull(){
        translate([t,15,0]) { 
            cube([holder_w,2,25], center=false);
            rotate([90,0,0]) translate([0,0,4]) cube([holder_w,2,19], center=false);
        }
    }
}

module holder() {
    w = holder_w;
    d = holder_d;
    h = holder_h;
    wall = 2;
    
    translate([0,-11,d]) {
        rotate([-45,0,0]) { 
            difference() {
                cube([w,d+(wall*2),h], center=false);      
                translate([wall,wall,wall]) cube([w-wall,d,h-wall], center=false);      
             }
         }
     }
}

module plug_holder_at_angel(){
    translate([(base_w/2),-10,-2]) plug_holder(false);
}


module base_with_hole(){
    d = holder_d+(wall*2);
    difference(){
        rotate([45,0,0]) translate([0,1.5,0]) cube([base_w,wall,d], center=false);   
        translate([(base_w/2),d*-.25,8]) plug_holder(true);            
    }
}

support_h = 16;
translate([0,15,support_h]){
    holder();
    mirror([180,0,0]) { translate([base_w*-1,0,0]) {holder();} }
    base_with_hole();
    plug_holder_at_angel();
} 

translate([0,7,0]){
    support(0);
    support(base_w-holder_w);
}




