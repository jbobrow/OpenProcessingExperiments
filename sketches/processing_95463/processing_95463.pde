
void setup()
{
  size(400, 400);
  smooth();
  background(255);
}

void draw()
{
  noStroke();
  ellipseMode(RADIUS);
 
  // Ears
  fill(106, 53, 11);          // Dark Brown
  ellipse(70, 150, 30, 50);
  ellipse(330, 150, 30, 50);
  
  fill(237, 199, 162);        // Light Brown
  ellipse(70, 150, 20, 40);
  ellipse(330, 150, 20, 40);
  
  // Head
  fill(106, 53, 11);          // Dark Brown
  ellipse(200, 125, 125, 100);
  ellipse(200, 225, 140, 100);
  
  fill(237, 199, 162);        // Light Brown
  ellipse(150, 125, 60, 70);
  ellipse(250, 125, 60, 70);
  ellipse(200, 225, 130, 90);
  
  // Eyes
  fill(255);                  // White
  ellipse(160, 140, 35, 35);
  ellipse(240, 140, 35, 35);
  
  fill(0);                    // Black
  ellipse(160, 140, 25, 25);
  ellipse(240, 140, 25, 25);
  
  fill(255);                  // White

  // Rotate eyes with mouse movement
  int mX = mouseX - 200;
  int mY = mouseY - 140;
  float a;
  float b;
  float t;
  int r = 10;
  
  // Make sure that we are not dividing by 0
  if(mX != 0)
  {
    t = atan(mY / mX);
    a = cos(t) * r;
    b = sin(t) * r;
    
    if(mX < 0)
    {
      a = a * -1;
      b = b * -1;
    }
  }
  else
  {
    a = 0;
    b = -1 * r;
  }
  
  ellipse(160 + a, 140 + b, 10, 10);
  ellipse(240 + a, 140 + b, 10, 10);
  
  // Mouth changes based on mouse being pressed
  if(mousePressed)
  {
    fill(106, 53, 11);          // Dark Brown
    ellipse(200, 240, 70, 30);
  }
  else
  {
    noFill();
    stroke(106, 53, 11);       // Dark Brown
    strokeWeight(7);
    curve(140, 70, 140, 240, 260, 240, 260, 70);
  }
}
