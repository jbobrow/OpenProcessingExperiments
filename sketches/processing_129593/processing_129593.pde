
float timer = 0.0;
float myscale = 1.0;
float speed = 0.01;
float rad = radians(45);

void setup()
{
  size(500,500);
  frameRate(30);
  
}

void draw()
{
  timer = timer + (1.0 / 30.0);
   println(timer);
  myscale = myscale + speed;
  rad = rad + 0.1;

  if (timer >= 3.0 && timer < 8.0)
  {
   background(0);
    
    translate(width/2, height/2);
    rotate(rad);
    scale(myscale);
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    
    if(myscale >= 2.5)
    {
      myscale = - myscale;
    }
    if(myscale <= 1.5)
    {
      myscale = myscale;
    }
  }
}


