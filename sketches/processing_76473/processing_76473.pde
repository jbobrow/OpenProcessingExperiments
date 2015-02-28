
// This sets up the canvas so we can draw on it
void setup() 
{
  size(800, 800);
  stroke(255, 0, 255);
  background(0);
}

// This function is what draws the ellipses on the canvas
void drawCircle() 
{
    ellipse(random(1000), random(1000), random(10), random(10));
}

// This is where the drawCircle function is called and
// the left and right mouse buttons are assigned
void draw()
{
  drawCircle();
  if (mousePressed && (mouseButton == LEFT))
  {
    fill(0);
    background(255);
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
    background(0);
  }
}



