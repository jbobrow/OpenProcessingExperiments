
/*Project 2D-2 by Sarah Sia
Coding by Christopher Warnow*/

void setup() {
  size(255, 255);
  smooth();
  background (255);
}
void draw() { 
  fill(255,10);
  stroke(random(255), random(255), random(255));
//only paint when the mouse is pressed
  if(mousePressed) {    
//the distance between the current and the last mouse position
    strokeWeight( dist(mouseX, mouseY, pmouseX, pmouseY)/10 ); 
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


