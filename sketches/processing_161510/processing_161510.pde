
int numCircles = 10;
int spacing = 20;
 
void setup() {
  size(800, 600);
  smooth();
  frameRate(1);
  background(0);
}
 
void draw() { 
  bullseye(int(random(width)), int(random(height))); // < ------- This right here!
}
 
void bullseye(int xPos, int yPos) {
  stroke(255,0,0, int(random(256)));
  strokeWeight(3);
  noFill();
 
  for (int i=0; i < numCircles; i++)
  {
    ellipse(xPos, yPos, i*spacing, i*spacing);
  }
}


