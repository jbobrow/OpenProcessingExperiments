
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 -> based on exercise in Andrew Glassner's 
 Processing for Visual Artists
 */

//setup -----

void setup() {
  size(800, 800);
  background(0);
  smooth();
  translate(300, 300);

//draw -----

  for (float i=0; i<360; i += 0.3) { //controlling density
    pushMatrix();
    rotate(radians(i));
    translate(0, 200);
    rotate(radians(i*3));
    scale(map(cos(radians(i*20)), -1, 1, .5, 1), 
    map(cos(radians(i*9)), -6, 1, .5, 1));
    drawEllipse();
    popMatrix();
  }
}
void drawEllipse() {
  noFill();
  stroke(255, 128);
  ellipse(0, 0, 120, 80);
  ellipse(width/2, height/2, 20, 4); 
}



