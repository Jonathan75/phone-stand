include <plug_holder.scad>
wall = 1;
t = 0.4; //tolerance
base_w = 88+wall+t;
base_d = 120;

holder_w = 9;
holder_d = 13-3;
holder_h = 34;

module base() { 
    boarder = 6;
    h = wall*2.5;
    difference() {
        cube([base_w,base_d,h], center=false);
        translate([boarder,boarder,d]) cube([base_w-(boarder*2),base_d-(boarder*2),h], center=false); 
    }
} 
base();

module support(t) { 
    hull(){
        translate([t,41,0]) { 
            cube([wall,1,41], center=false);
            rotate([90,0,0]) translate([0,0,4]) cube([wall,1,37], center=false);
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
    plug_holder_move = [(base_w/2),-19.5,4];
    
    difference(){
        translate([w*.5,-8,4]) cube([w,h,d], center=true);  
        translate(plug_holder_move) plug_holder(true);            
    }
    translate([45,-20,-1.5]) cube([w-wall,23.5,h], center=true);   
    translate(plug_holder_move) plug_holder(false);
}

translate([0,22,24]) rotate([45,0,0]) {
    holder();
    mirror([180,0,0]) translate([base_w*-1,0,0]) holder(); 
    holder_bottom();
} 


support(0);
support(base_w-wall);




