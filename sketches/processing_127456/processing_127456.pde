
/**
 This is a simple program for drawing regular convex polygons.
 
 We use a for loop and a little trigonometry to draw the various polygons.
 
 C. Andrews
 2014-01-8
 **/


int numSides = 8; // change this for different polygons
float radius = 50; // change this to change the size of the polygon
float angle = TWO_PI / numSides; // the angle of one "slice" of the circle


void setup() {
  size(600, 600); 
  strokeWeight(3);
}


void draw() {
  background(255);
  fill(100, 90, 255);

  // move the the center of the canvas so we can draw around (0,0)
  translate(width/2, height/2);

  // We can specify arbitrary shapes by using beginShape() and endShape()
  // any call to vertex() between those two will be added as the next point
  // in the shape.
  beginShape();
  for (int i = 0; i <= numSides; i++) {
    float x = cos(i*angle) * radius;
    float y = sin(i*angle) * radius;
    vertex(x, y);
  }
  endShape();
}



