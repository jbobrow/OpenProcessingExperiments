
float rad = -0.0;
float radi = 0.0;
float scale1 = 3.0;
float timer = 0.0;
float myscaleSpeed = 0.025;
float scale2 = 1.0;
float radius = 0.0;
float center = 0.0;
float prevX = 0.0;
float prevY = 0.0;
 

 
void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB, 160, 200, 50);
   
}
 
void draw()
{
  timer = timer + (1.0 / 30.0);
   
  if (timer >= 0.0 && timer < 10.0)
  {
  
  rad = rad + -0.5;
  scale1 = scale1 + 0.005;
  
  fill(random(255), random(255), random(255), random(255));
   
  pushMatrix();
   
  translate(width/2, height/2);
  rotate(rad);
  scale(scale1);
   
  rectMode(CORNER);
  rect(0, 0, 150, 150);
  
   
  popMatrix();
   
  pushMatrix();
   
  translate(100, 100);
  rotate(radians(90));
  scale(4);
 
   
  popMatrix(); 
  }
  timer = timer + (1.0 / 30.0);
  scale2 = scale2 + myscaleSpeed;
  
 if (scale2 >= 3.0)
 {
   myscaleSpeed = -.05;
 }
 if (timer >= 2.0 && timer < 6.0)
  {
    fill(random (255), 90, 0);
    pushMatrix();
    scale(scale2);
    rect(0, 0, 500, 500);
    rectMode(CENTER);
    popMatrix();
  }
    else if (timer > 6.0 && timer < 7.0)
  {
    fill(250, 140, 0);
    ellipse (154,84,200,200);
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
      float spiralOffset = 5.0;
    float x = radius * cos(timer * spiralOffset);
    float y = radius * sin(timer * spiralOffset);
    x += center;
    y += center;
   
    if (timer == 0.0)
    {
      prevX = x;
      prevY = y;
    }
 fill(random(255), random(255), random(255), random(255));
  rect(100, 100, 55, 55);
  translate(20, 20);
  
  if (timer >= 15)
  rect(500,500,500, 500);
 
}



