module box(w,h,d,wall,t){
    difference(){
        //[width,depth,height]
        cube([w+wall+t,h+wall+t,d+wall+t], center=true); // outside
        translate([0,0,wall]) cube([w-t,h-t,d+t], center=true); // inside    
    }
}

module plug_holder(blockonly) {
    t = 0.4; //tolerance
    wall = 1;
    half_wall = wall*0.5; 
    h = 8.77;
    w = 11;
    d = 23.38;

    
    module plug_block(){
        cube([w+wall+t,d+wall+t,h+wall+t], center=true);   
    }
    
    module main() {
        box(w,d,h,wall,t);
    }
    
    module main_with_holes(){
        hole_w = w-wall+t;
        module hole(){
            cube([hole_w,wall*3,h+wall], center=true);
        }
        
        difference(){
            difference(){ 
                main();
                translate([0,w,wall*4]) hole();
            }
            translate([0,w*-1,wall*4]) hole();
        }
    }
    rotate([45,0,0]) { 
            if (blockonly) plug_block(wall);
            else  main_with_holes();
    }
}
//plug_holder(true);
//plug_holder(false);
