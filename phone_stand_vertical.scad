include <plug_holder.scad>
wall = 1;
t = 0.4; //tolerance
base_w = 88+wall+t;
base_d = 120;

holder_w = 9;
holder_d = 13;
holder_h = 34;

module base() { 
    difference() {
        cube([base_w,base_d,wall], center=false);
        translate([holder_w,10,d]) cube([base_w-(holder_w*2),base_d-20,2], center=false); 
    }
} 
base();


module support(t) { 
    hull(){
        translate([t,30,0]) { 
            cube([wall,1,39], center=false);
            rotate([90,0,0]) translate([0,0,4]) cube([wall,1,34], center=false);
        }
    }
}

module holder() {
    w = holder_w;
    d = holder_d;
    h = holder_h;
    
    translate([0,-8,d]) {
        rotate([-45,0,0]) { 
            difference() {
                cube([w,d+(wall*2),h], center=false);      
                translate([wall,wall,wall]) cube([w-wall,d,h-wall], center=false);      
             }
         }
     }
}

module plug_holder_at_angel(){
    m = -11;
    translate([(base_w/2),m,m+11]) plug_holder(false);
}


module base_with_hole(){
    d = holder_d+(wall*2);
    difference(){
        rotate([45,0,0]) translate([0,3,0]) cube([base_w,wall,d], center=false);   
        translate([(base_w/2),d*-.25,7]) plug_holder(true);            
    }
}

support_z = 12;
support_x = 19;
translate([0,support_x,support_z]){
    holder();
    mirror([180,0,0]) translate([base_w*-1,0,0]) holder(); 
    base_with_hole();
    plug_holder_at_angel();
} 

translate([0,support_x-4,0]){
    support(0);
    support(base_w-wall);
}




