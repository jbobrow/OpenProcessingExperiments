
float r, g, b, a; //red,green,blue,alpha variables
float diam, x, y; //diameter,x&y position

void setup() {
  size(500, 500); //window size
  background(10); //black background
  smooth(); //smooth shapes
}

void draw() {
  //generating random numbers for r,g,b,a
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  //generating randoms for diameter,x&y position
  diam = random(35);
  x = random(width);
  y = random(height);
  
  //drawing ellipses
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}
