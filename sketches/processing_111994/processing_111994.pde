
float timer = 0;
float angle = 0.0;
float hue = 0;
float ellipseX = 0.0;

void setup()
{
 size(500, 500);
 colorMode(HSB, 360, 100, 100);
}

void draw()
{
 
  hue = hue + 3;
  if (hue >=360)
  {
    hue = 0;
  }
  fill(hue, 100, 100);
  
  timer = timer + 0.0167;
  println(timer);
  
  if (timer >= 6)
  {
    timer = 0;
  }
  
  
  
  if (timer > 3)
  {
    angle += 0.1;
  
    if (angle > TWO_PI)
    angle = 0;
  
 
    rectMode(CENTER);
    translate(250, 250);
    rotate(angle);
    rect(0, 0, 100, 100);
  }
  else
  {
    ellipseX += 1;
  
    float waveSpeed = 10;
    float waveHeight = 200;
    float centerY = height/2;
  
    float angle = radians(ellipseX * waveSpeed);
  
    float offset = sin(angle) * waveHeight;
  
    float ellipseY = centerY + offset;
  
    ellipse(ellipseX + 50, ellipseY, 100, 100);
    
    
    ellipse(ellipseX, ellipseY, 50, 50);    
    
    if (ellipseX >= 400)
    {
      ellipseX = 0;
    }
  } 

}


