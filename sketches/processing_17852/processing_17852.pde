
class Particle
{
  float x = 0;
  float y = 0;
  float xv = -random(5);
  float yv = -random(3);
  float maxYV = 20;
  float gravity = 0.1;
  float friction = 1;
  float radius = 10;

   
  Particle(){  }
 
  Particle(float xp,float yp)
  {
    x = xp;
    y = yp;
   
  }
 
  void run()
  {
    update();
    display();
  }
 
  public void update()
  {
    if(x <= radius)
    {
      xv = abs(xv);
    }
    else if(x >= width)
    {
      xv = -abs(xv);
    }
 
    if(y >= height)
    {
      yv = -abs(yv);
      if(y - height >= 0.15)
      {
        y = height;
        if(yv > -0.1)
        {
          xv *= 0.96;
        }
      }
    }
 
    if((yv < maxYV))
    {
      yv += gravity;
    }
    yv *= friction;
      
    y += yv;
 
    x += xv;
  }
 
  void display()
  {
    fill(255);
    ellipse(x,y,radius,radius);
  }
}


