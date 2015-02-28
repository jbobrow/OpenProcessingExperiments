
float hue = 0;
float timer = 0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  // Increment timer by frames per second.
  timer = timer + 0.0167; // (1 / 60.0)
  
  // increment hue from 0 -> 360
  hue = hue + 1;
  
  // If the hue gets to 360 reset to 0
  if (hue >= 360)
  {
    hue = 0;
  }
  
  // Draw gradient only until 10 seconds have passed
  if (timer < 10)
  {
    drawGradient();
  }
  
  // don't draw ellipse until 5 seconds have passed
  if (timer > 0)
  {
    drawEllipse();
  }
  
  drawCircle(100);
  drawCircle(50);
  drawCircle(200);
}

void drawCircle(float radius)
{
  int centX = width / 2;
  int centY = height / 2;

  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <= 360; ang += 5) 
  {    
    float rad = radians(ang);   
    x = centX + (radius * cos(rad)) + random(-10, 10);
    y = centY + (radius * sin(rad)) + random(-2, 2);
    //ellipse(x, y, 10, 10);
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
}


void drawGradient()
{
  // Draw line 1px wide across screen width
  for (int i = 0; i < width; i = i + 1)
  {
    // percent is the fraction i / width, which always < 1
    float percent = i / (float)width;
    
    // Use the i for the brightness to gradient from black
    stroke(hue, 100, 100 * percent);
    
    line(i, 0, i, height);
  }
}

// x position of ellipse
float ellipseX = 0.0;
void drawEllipse()
{
  // move ellipse over 1 in x each frame
  ellipseX += 1;
  
  // If off screen reset to 0
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  // compuer the y position from sine
  float waveSpeed = 10;
  float waveHeight = 100;
  float angle = radians(ellipseX * waveSpeed);
  float ellipseY = sin(angle) * waveHeight;
  
  fill(hue, 100, 100);
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);
  ellipse(height/2 + ellipseY, ellipseX, 100, 100);
  
  // Add another ellipse using cosine instead of sine
  ellipseY = cos(angle) * waveHeight;
  ellipse(ellipseX, height/2 + ellipseY, 100, 100);

}


