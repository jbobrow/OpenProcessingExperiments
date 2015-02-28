
float timer = 0.0;
float myscale = 1.0;
float myscalespeed = 0.02;
float myscalespeed2 = -0.02;

void setup()
{
 size(500, 500); 
 frameRate(30);
}

void draw()
{
  background(0);
  timer = timer + (1.0 / 12.0);
  println(timer);
  
  if (timer >= 2.0 && timer < 15.0)
  {
    if (timer >= 2.0 && timer <= 8.0)
    {
    myscale = myscale + myscalespeed;
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(timer*30));
    scale(myscale);
    rectMode(CENTER);
    rect(0,0,100, 100);
    popMatrix();
    }
    else if (timer >= 8.0)
    {
      myscale = myscale + myscalespeed2;
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(timer*30));
    scale(myscale);
    rectMode(CENTER);
    rect(0,0,100, 100);
    popMatrix();
    }
    
  }
  else if (timer > 3.0 && timer < 3.5)
  {
    ellipse(100, 100, 200, 200);
  }
  else if (timer > 3.0 && timer < 4.0)
  {
    triangle(77,100,150,50, 100,50); 
  }
  else
  {
    background(255,0,0);
  }
}


