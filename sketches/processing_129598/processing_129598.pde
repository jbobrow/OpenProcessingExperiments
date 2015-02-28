
float timer = 0.0;
float a = 0.0;
float s = 0.0;
float rad = 0.0;

void setup()
{
  size (500, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  a = a + 0.1;
  s = cos(a)*2;
  rad = rad + 1.0;
    
  if (timer >= 2.0 && timer < 5.0)
  {
   pushMatrix();
   translate(100, 200);
   scale(s);
   rectMode(CENTER);
   rect(0, 0, 100, 100);
   popMatrix();
  }
  else if (timer >= 5.0 && timer < 6.0)
  {
   ellipse(100, 100, 200, 200);
  }
  else if (timer >= 6.0)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rad);
    rectMode(CENTER);
    triangle(77, 100, 150, 50, 100, 50);
    popMatrix();
  }
  else 
  {
    background(255, 0, 0);
  }
}
    


