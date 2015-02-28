
float timer = 0.0;
float myscale = 1.0;
float myscalespeed = .01;
float rad = 0.0;

void setup()
{
  size(500, 500);
  frameRate(30);
}

void draw()
{
  background(0);
  
  timer = timer + (1.0 / 30.0);
  myscale = myscale + myscalespeed;
  rad = rad + .1;
  
  if (myscale > 2)
  {
    myscalespeed = -.05;
  }
  else if (myscale <= 1)
  {
    myscalespeed = .01;
  }
  

  
  if (timer >= 2.0 && timer < 10.0)
  {
    pushMatrix();
    
    translate(250, 250);
    rotate(rad);
    scale(myscale);
    rectMode(CENTER);
    rect(0,0,100,100);
    println(myscale);
    
    popMatrix();
  }
  
  else if (timer >= 10.0 && timer < 13.5)
  {
    ellipse(300, 300, 200, 200);
  }
  
  else if (timer > 13.0 && timer < 14.0)
  {
    triangle(77, 100, 150, 50, 100, 50);
  }
  
  else
  {
    background(255, 0, 0);
  }
}


