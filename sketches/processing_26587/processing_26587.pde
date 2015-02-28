
//Existing code from OpenProcessing file "Simple Particles" which has been edited. I found this code rather confusing, 
//dispite playing around with the coding for hours to try and simplify it and make it do what I want.


class Particle
{
  float x = width/2;
  float y = height/2;
  float xv = -100+random(6);
  float yv = -random(4);
  float maxYV = 0.5;
  float gravity = 1;
  float friction = 1;
  float radius = random(10) + 5;
  color c = color(255,244,183); 
  Particle(){  }
 
  Particle(float xp,float yp)
  {
    x = xp;
    y = yp;
  }
 
  Particle(float xp,float yp,float xvel,float yvel)
  {
    this(xp, yp);
    xv = xvel;
    yv = yvel;
  }
 
  void run()
 {
   update();
   render();
  }
 
  public void update()
  {
    if(x <= radius)
    {
      xv = abs(xv);
    }
    else if(x >= width - radius)
    {
      xv = -abs(xv);
    }


 
    if((yv < maxYV))
   {
     yv += gravity;
   }
   yv *= friction;
    //println(yv);
    y += yv;
 
    x += xv;
  }
 
  void render()
  {
    fill(c);
    ellipse(x,y,2,2);
  }
}

