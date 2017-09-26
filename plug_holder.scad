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
//    h = 12.82; //h
//    w = 6.75; //w
//    d = 8.77; //d
    h = 10;
    w = 10;
    d = 100;

    
    module plug_block(){
        cube([w+wall+t,d+wall+t,h+wall+t], center=true);   
    }
    
    module main() {
        box(w,h,h,wall,t);
    }
    
    module main_with_holes(){
        hole_d = d-wall+t;
        module hole(){
            cube([wall*2,hole_d,h+wall+t], center=true);
        }
        
        difference(){ 
            main();
            translate([w*.5 ,0,wall*1.5]) hole();
            translate([w*-.5,0,wall*1.5]) hole();
        }
    }
    if (blockonly) plug_block(wall);
            else  main_with_holes();
}
//plug_holder(true);
plug_holder(false);
