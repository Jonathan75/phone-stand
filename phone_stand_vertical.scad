include <plug_holder.scad>
wall = 1;
t = 0.4; //tolerance
base_w = 88+wall+t;
base_d = 120;

holder_w = 9;
holder_d = 13;
holder_h = 34;

module base() { 
    boarder = 6;
    difference() {
        cube([base_w,base_d,wall], center=false);
        translate([boarder,boarder,d]) cube([base_w-(boarder*2),base_d-(boarder*2),2], center=false); 
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


module holder_bottom(){
    d = holder_d+(wall*2);
    w = base_w;
    h = wall;
    difference(){
        rotate([45,0,0]) translate([0,3,0]) cube([w,h,d], center=false);   
        translate([(base_w/2),d*-.25,7]) plug_holder(true);            
    }
    rotate([-45,0,0]) translate([0,-1,-18]) cube([w,h,22], center=false);   
    
}

support_z = 13;
support_x = 19;
translate([0,support_x,support_z]){
    holder();
    mirror([180,0,0]) translate([base_w*-1,0,0]) holder(); 
    holder_bottom();
    plug_holder_at_angel();
} 

translate([0,support_x-4,0]){
    support(0);
    support(base_w-wall);
}




