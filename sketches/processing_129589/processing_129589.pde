
float timer = 0.0;
float myscale = 1.0;
float myscaleSpeed = 0.025;
float radius = 0.0;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;

void setup()
{
  size(500, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  myscale = myscale + myscaleSpeed;
 
 if (myscale >= 3.0)
 {
   myscaleSpeed = -.05;
 }
 if (timer >= 2.0 && timer < 6.0)
  {
    fill(100, 90, 0);
    pushMatrix();
    scale(myscale);
    rect(0, 0, 100, 100);
    rectMode(CENTER);
    popMatrix();
  } 
    else if (timer > 6.0 && timer < 7.0)
  {
    fill(250, 140, 0);
    ellipse (340,200,200,200);
  } 
  else if (timer > 7.0 && timer < 7.5)
  {
    triangle(77,100,150,50, 100, 50);
  }
  if (timer >= 7.5)
  {
    timer = 0.0;
  }
  fill(0, 255, 90);
      float spiralOffset = 10.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
  
    if (timer == 0.0)
    {
      prevX = x;
      prevY = y;
    }


}



