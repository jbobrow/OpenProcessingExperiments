
float hue = 0.0;
float offset = 10;
float counter = 0;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  //background(0);
  counter += 1 / 60.0; // 0.0167;
  //println(counter);
 
  // Afer 5 seconds it stops redrawing so the moving circles show/smear
  if (counter < 5)
  {
    // draw background gradient
    drawGradient();
  }
  
  // draw background circle
  stroke(360, 0, 100);
  strokeWeight(5);
  float radius = 200;
  int centX = width / 2;
  int centY = height / 2;
  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <= 360; ang += 5) 
  {   
    float rad = radians(ang);  
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
  
  // draw moving circles
  strokeWeight(2);
  drawEllipse();
}

float ellipseX = 0.0;

void drawEllipse()
{
  ellipseX += 1;
  
  if (ellipseX > width)
  {
    ellipseX = 0;
  }
  
  hue += offset;
  if (hue >= 360)
  {
     offset = -offset;
     hue = 360; // make sure to set to 360 otherwise js freezes
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0; // make sure to set to 0 otherwise js freezes
  }
  fill(hue, 100, 100);
  
  float angle = ellipseX * 4;
  float ellipseY = (height / 2) + cos(radians(angle)) * (height / 2);
  ellipse(ellipseY, ellipseX, 100, 100);
  ellipse(ellipseX, ellipseY, 100, 100);
}

void drawGradient()
{
  for (int x = 0; x < width; x += 1)
  {
    // convert x into percentage of screen. use (float) to convert to float division
    float percentage = x / (float)width;
    stroke(50, 100, 100 * percentage);
    line(x, 0, x, height);
  }
}


