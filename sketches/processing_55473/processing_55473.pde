
size(250,250);
background(255);
smooth();
translate(125,125);  //set coordinates to start from center
rectMode(CENTER);  //set rect to measure from center

pushMatrix();  //start scale/rotate
    scale(1.5);    //scale this flower 1.5
    rotate(3);    //rotate 3
    fill(255,30,20,30);  //start with reddish color, low opacity
      for(int x=200; x>0;x=x-10){ //x goes up to 200 in -10 intervals
        stroke(x,255-x,255-x,30);  //stroke color starts with cyan and ends w red, low opacity
        strokeWeight(.5);  //thin stroke
        fill(255-x,x,x);  //red --> cyan
            rect(0,0,x,x);  //size of rect
        rotate (7);  //each rectangle rotates this amt more respective to the last rotation
}
popMatrix(); //end these transformations.

rotate(-3);
    fill(255,30,20,30);
      for(int x=200; x>0;x=x-10){ 
        stroke(x,255-x,255-x,40);  //stroke is little darker
        strokeWeight(.5);
        fill(255-x,x,x);
            rect(0,0,x,x);
        rotate (7);
}
