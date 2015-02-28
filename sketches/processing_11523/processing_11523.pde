
float xoff = 0.0;
float xincrement = 0.01; 

void setup() {
  size(900,350);
  background(100);
  frameRate(30);
  smooth();
}

void draw()
{

  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float m = noise(xoff)*height;

  // With each cycle, increment xoff
  xoff += xincrement;

  // Draw the ellipse at the value produced by perlin noise
  fill(255,0,0,10);
  stroke(200,200);
  ellipse(n,m,50,50);
}


