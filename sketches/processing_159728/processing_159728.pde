
void setup() {
  size(640, 480);
}

void draw() {
}

void mouseDragged() {
  
  // declare variable speed and set to the distance 
  // between current and previous mouse position
  float speed = (abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2;
  
  // print out speed so that we can see what range of
  // values we're getting (uncomment to activate);
  // println(speed);
  
  // set strokeWeight to speed
  strokeWeight(speed);
  
  // declare variable transparency - multiply speed so that
  // it falls within a range of approximately 0 to 255 
   float transparency = speed*20;
   
  // make sure transparency is never more than 255 
  transparency = constrain(transparency ,0, 255);
  
  // set stroke to black and transparency value
  stroke(0, transparency);
  
  // draw a line from previous to current mouse position
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  
  // c key clears the drawing
  if (key == 'c') {
    background(200);
  }
}



