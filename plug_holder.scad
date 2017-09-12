module box(h,w,d,wall,t){
    difference(){
        cube([w+wall,d+wall,h+wall], center=true); // outside
        translate([0,0,wall+t]) cube([w-t,d-t,h], center=true); // inside    
    }
}

module plug_holder(blockonly) {
    t = 0.4; //tolerance
    wall = 1;
    half_wall = wall*0.5; 
    h = 11;
    w = 8.77;
    d = 23.38;

    
    module plug_block(){
        cube([h+wall-t,d+wall,w+wall], center=true);   
    }
    
    module main() {
        box(w,h,d,wall,t);
    }
    
    module main_with_holes(){
        hole_w = h-wall+t;
        module hole(){
cube([hole_w,wall*3,w+wall], center=true);
         }
        
        difference(){
            difference(){ 
                main();
                translate([0,h,wall*2]) hole();
            }
            translate([0,h*-1,wall*2]) hole();
            //cube([h/2,wall*3,w+wall], center=true);
        }
    }
    rotate([45,0,0]) { 
            if (blockonly) plug_block(wall);
            else  main_with_holes();
    }
}
//plug_holder(true);
//plug_holder(false);
