
class Dit
{

  PVector loc, vel, acc;  
  Dit()
  {
    loc = new PVector((float) Math.random()*width, (float)Math.random()*height);
    vel= new PVector(   (float) ( 2*Math.random()-1), (float) (2*Math.random()-1));
    vel.normalize();  


    acc= new PVector();
  }


  void run()
  {
    update();
    render();
  }
  void update()
  {

    if (useAcc)
    {
      vel.add(acc);
    }
    loc.add(vel);

    if (boundary)
    {
      if (loc.x<0 || loc.x>width)
      {
        vel.x *= -1;
      }
      if (loc.y<0 || loc.y>height)
      {
        vel.y *= -1;
      }
    }
    else
    {

      if (loc.x<0  )
      {
        loc.x=width+loc.x;
      }
      if (  loc.x>width)
      {
        loc.x=width-loc.x;
      }
      if (loc.y<0  )
      {
        loc.y=height+loc.y;
      }
      if (  loc.y>height)
      {
        loc.y=height-loc.y;
      }
    }



    if (slowDown)
    {
      vel.mult(.99);
    }

    acc.mult(0);
  }

  void render()
  {
   // okToDrawGrid=false;
    stroke(c, c, c);
    fill(c, c, c);
    rect(loc.x, loc.y, ds, ds);
    //okToDrawGrid=true;
    //rect(loc.x, loc.y, 1,1);
  }
}


