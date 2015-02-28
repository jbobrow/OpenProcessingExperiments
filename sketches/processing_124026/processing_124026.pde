
PImage img;

void setup() {
  // Images must be in the "data" directory to load correctly
  img = loadImage("Baldy.jpg");
  size(492,330);
  background(img);
  
}

void draw() {
}

void mousePressed() {
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,10,10);
}



