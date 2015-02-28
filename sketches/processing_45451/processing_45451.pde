
void setup(){
  size(900, 400);
  background(255);
  smooth();
  frameRate(80);
  colorMode(HSB, 1.0, 1.0, 1.0);
}

/* variables for the draw() */
int x; 
int y; 
color myColor;
/*                          */

void draw(){
  myColor = color(noise(360), noise(100), noise(100));
  stroke(0);                          // black ring around
  fill(myColor, int(random(255)));    // random color inside!

  x = int(random(width));

  y = int(random(height));
  ellipse(x,y , random(10), random(10));
}

