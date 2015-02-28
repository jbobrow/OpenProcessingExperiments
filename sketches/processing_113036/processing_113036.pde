

float diameter;
float angle = 0;
float counter = 0;
float s = 1;
float scaleSpeed = 0.01;
float hue = 0.0;
float offset = 1;
float diameterOffset = 10;


void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  
}


void draw()
{
  float degrees = radians(135);
  counter += 1 / 60.0;
  angle += .1;
  s += scaleSpeed;
  
  if (counter < 7)
  {
    if (s > 2 || s < 0)
    {
      scaleSpeed = -scaleSpeed;
    }
    pushMatrix();
     hue += offset;
    if (hue >= 360)
    {
      offset = -offset;
    }
    else if (hue < 0)
    {
      offset = -offset;
    }
    
    fill(hue, 100, 100);
    rotate(angle);
    scale(s);
    triangle(0, 0, width*.25, height*.25, width*.10, height*.15);
    
    popMatrix();
    
  }
   
  if (counter < 5)
  {
  if (s > 2 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
  
  rectMode(CENTER);
  pushMatrix();
  stroke(1);
  fill(0, 0, 100);
  translate(width*.25, height*.25);
  rotate(degrees);
  scale(s);
  rect(0, 0, 100, 100);
  
  popMatrix();
  }
  if (counter > 12)
  {
    noStroke();
    drawEllipsy();
  }
  
  pushMatrix();
  fill(0, 0, 100);
  translate(width*.5, height*.5);
  rotate(angle);
  scale(s);
  rect(0, 0, 50, 50);
  popMatrix();
  
  if (counter > 20)
  {
    stroke(0);
    strokeWeight(2);
    drawEllipse();
  }

  
}

float ellipseX = 0.0;
void drawEllipse()
{
  ellipseX += 1;
  hue += offset;
    if (hue >= 360)
    {
      offset = -offset;
    }
    else if (hue < 0)
    {
      offset = -offset;
    }
      fill(hue, 100, 100);
      float ellipseY = (height / 2) + sin(radians(ellipseX * 4)) * 100;
     
      ellipse(ellipseY, ellipseX, ellipseX, ellipseY);
      ellipse(ellipseX, ellipseY, ellipseY, ellipseX);
 
    }


void drawEllipsy()
{
  hue += offset;
  if (hue >= 360)
  {
    offset = -offset;
  }
  else if (hue < 0)
  {
    offset = - offset;
  }
  fill(hue, 100, 100, 75);
  ellipse(random(width), random(height), 50, 50);
}


