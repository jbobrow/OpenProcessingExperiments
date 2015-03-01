
void setup(){
  // setup- runs one time
  
  
  size (400, 400);
  //set a stage size of 400X400
}

void draw(){
  //draw- runs once a frame
  
  background (255, 0, 0);
  //background is re
  fill (0);
  //fill is set to 0
  
  ellipse (width/2, height/2, 100, 100);
  // draw ellipse divided by the width and height of stage size
  
  fill (255, 0, 0);
  //fill is the same as the background color
  
  stroke (255, 0, 0); 
  //the stroke is set the same as the background color
  
  rect (width/2, height/2, 50, 50);
  //the rectancle is drawn half the width and height of the stage
}


