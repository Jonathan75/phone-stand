//difference(){ 
//cube([50,50,100], center=true); 
//cube([50-x,50-x,101], center=true); 
//} 

module box(h,w,d,wall,t){
    difference(){
        cube([w+wall,d+wall,h+wall], center=true); // outside
        translate([0,0,wall+t]){
            cube([w-t,d-t,h], center=true); // inside    
        }
        
    }
    
}
//box(5.5,10,18.96,1,0.3);

module plug_holder(blockonly) {
    t = 0.3; //tolerance
    wall = 1;
    half_wall = wall*0.5; 
    h = 10;
    w = 5.5;
    d = 18.95;
    
    module plug_block(){
        cube([w+wall,d+wall,h+wall], center=true);   
    }
    
    module main() {
        box(5.5,10,18.96,1,0.3);
//        difference(){
//            //cube([w+wall,d+wall,h+wall], center=false);
//            plug_block(wall);
//            translate([half_wall,half_wall,half_wall]){ 
//                cube([w,d,h], center=true);
//            }
//        }
    }
    
    module main_with_whole(){
        difference(){
            difference(){ 
                main();
                translate([0,h,wall*2]) cube([h/2,wall*2,w+wall], center=true);
            }
            translate([0,h*-1,wall*2]) cube([h/2,wall*2,w+wall], center=true);
         //   translate([wall+t+1,d+half_wall,2.5]) cube([h/2,wall/2,7+t], center=true);
        }
}
    

    
    
    rotate([45,0,0]) { 
    //    rotate([180,180+90,0]) { 
            if (blockonly) plug_block(wall);
            else  main_with_whole();
      //  }
    }
}
//plug_holder(true);
//plug_holder(false);
