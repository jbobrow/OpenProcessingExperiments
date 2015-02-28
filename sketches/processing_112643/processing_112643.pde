
float angle = 0;
float counter = 0;
float s = 1;
float scaleSpeed = 0.01;
float anlge = 0;
float hue = 0.0;
float offset = 1;

void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  
}

void draw()
{
  counter += 1 / 60.0;
  angle += 0.01;
  s += scaleSpeed;
  
  if (counter < 8.5)
  {
    if (s > 3 || s < 0)
    {
      scaleSpeed = -scaleSpeed;
    }
  
  float degrees = radians(45);
  rectMode(CENTER);
  
  pushMatrix();
  noFill();
  translate(width/2, height/2);
  rotate(angle);
  scale(s);
  rect(0, 0, 100, 100);
  
  popMatrix();
  }
  
  
  if (counter < 10)
  {
    if (s > 4 || s < 0)
    {
      scaleSpeed = -scaleSpeed;
    }
    
    anlge += 0.1;
    
    pushMatrix();
    
    fill(#3E5579);
    translate(width/2, height/2);
    rotate(anlge);
    scale(s);
    rect(0, 0, 100, 100);
    
    popMatrix();
  }
  
  if (counter > 10)
  {
    stroke(0);
    strokeWeight(2);
    drawEllipse();
  }
  
  if (counter < 22)
  {
    if (s > 3 || s < 0)
    {
      scaleSpeed = -scaleSpeed;
    }
    
    pushMatrix();
    
    translate(width/2, height/2);
    scale(s);
    ellipse(0, 0, 100, 100);
    
    popMatrix();
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




