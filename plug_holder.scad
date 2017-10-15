module box(w,d,h,wall,t){
    difference(){
        wt2 = (wall+t)*2;
        //[width,depth,height]
        cube([w+wt2,d+wt2,h+wall+t], center=true); // outside
        translate([0,0,wall-t]) cube([w+t,d+t,h+t], center=true); // inside
    }
}

module plug_holder(blockonly) {
    t = 0.3; //tolerance
    wall = 1;
    half_wall = wall*0.5;
    w = 18.7;
    h = 6.62;
    d = 12.54; 

    module plug_block(){
        cube([w+wall+t,d+wall+t,h+wall+t], center=true);
    }

    module main() {
        //[width,depth,height]
        box(w,d,h,wall,t);
    }

    module main_with_holes(){
        hole_d = d+t;//-((wall+t)*2);
        module hole(){
          cube([t+wall*2,hole_d,h+wall+t], center=true);
        }

        difference(){
          main();
          translate([(w+wall)*.5,0,wall+t]) hole();
          translate([(w+wall)*-.5,0,wall+t]) hole();
        }
    }
    if (blockonly) plug_block(wall);
            else  main_with_holes();
}
//plug_holder(true);
plug_holder(false);
