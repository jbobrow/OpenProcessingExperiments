
// Jeff Chien
// DESMA 28 Workshop 3
// Pressing Control-R will render this sketch.

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

void setup()
{
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd / 2;
  ry = height * 0.5 - rd / 2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw()
{
  background(102);
  
  drawRect();
  drawEllipse();
}

void drawRect()
{
  stroke(0);
  fill(255);
  rect(rx, ry, rd, rd);
  
  // Hover/Pressed: translucent rect over
  if(mouseX < rx + rd && mouseX > rx 
    && mouseY < ry + rd && mouseY > ry)
  {
    stroke(255);
    fill(0, 0, 0, 128);
    pushMatrix();
    translate(rx + rd / 2, ry + rd / 2);
    // Pressed: Make rect rotate
    if(mousePressed)
      rotate(frameCount / 10.0f);
    rect(-rd / 2, -rd / 2, rd, rd);
    popMatrix();
  }
}

void drawEllipse()
{
  boolean mouseOver = dist(ex, ey, mouseX, mouseY) < ed / 2;
  
  // Pressed: draw radial gradient
  if(mousePressed && mouseOver)
  {
    fill(0, 0, 0, 0);
    colorMode(HSB, ed);
    for(int d = 0; d < ed; d++)
    {
      stroke((d + frameCount) % ed, ed, ed);
      ellipse(ex, ey, d, d);
    }
    colorMode(RGB, 255);
  }
  else
  {
    stroke(0); 
    fill(255);
    
    ellipse(ex, ey, ed, ed);
    
    // Hover: paints crosshair
    if(mouseOver)
    {
      int crosshairLen = 10;
      line(mouseX - crosshairLen / 2, mouseY,
          mouseX + crosshairLen / 2, mouseY);
      line(mouseX, mouseY - crosshairLen / 2,
          mouseX, mouseY + crosshairLen / 2);
    }
  }
}

