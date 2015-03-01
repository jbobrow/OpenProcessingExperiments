
// Two global variables
float x;
float y;

PShape s;


void setup() {
  size(750,750);
  smooth();
  background(0);
  frameRate(500);
  // Start x and y in the center
  x = width/2;
  y = height/2;
  s = loadShape("brain-01.svg");

}

void draw() {
  // A new x,y location is picked as the current (x,y) plus or minus a random value. 
  // The new location is constrained within the window's pixels.  
  float newx = constrain(x + random(-20,20),0,width);
  float newy = constrain(y + random(-20,20),0,height);
  
  //s shape
  shape(s, 0, 0,750,750);
  
  // Draw a line from x,y to the newx,newy
  stroke(0,0,0);
  strokeWeight(10);
  line(x,y,newx,newy);
  frameRate(1500);
  // We save the new location in (x,y) in order to start the process over again.
  x = newx; 
  y = newy;
}



