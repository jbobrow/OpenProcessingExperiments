
/* a simple kaleidoscope
   press and draw, hover and delete
   mitakas@gmail.com
   */

void setup() {
  size(400, 400, P3D);
  background(255);
  frameRate(30);
  smooth();

}

void draw() {
  // the "point" in the middle
  rectMode(CENTER);
  fill(0);
  noStroke(); // fixing rect() which gets bigger when you draw
  rect(width/2,height/2,5,5);
  
  // kaleidoscope, draw with pressed mouse, delete with hover
  stroke(0);
  if(mousePressed) {
    strokeWeight(2);
    
    // two horizontal opposite lines
    stroke(255,0,0); //  red
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke(255,255,0); // yellow
    line(width-pmouseX,height-pmouseY,width-mouseX,height-mouseY);
    
    // two vertical opposite lines
    stroke(0,0,255); // blue
    line(pmouseY,height-pmouseX,mouseY,height-mouseX);
    
    stroke(0,255,0); // green
    line(width-pmouseY,pmouseX,width-mouseY,mouseX);
    
  } else valEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

// pattern
// from http://processingjs.org/learning/topic/pattern
// written by Casey Reas and Ben Fry
// modification - mitakas
void valEllipse(int x, int y, int px, int py) {
  fill(255);
  float speed = abs(x-px) + abs(y-py);
  noStroke(); // act like rubber
  ellipse(x, y, speed, speed);
}

