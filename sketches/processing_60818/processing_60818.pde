
class Predator
{
  PVector loc, vel, acc;

  float sz=2;

  int life;


  Predator()
  {
    loc = new PVector(random(width), random(height));
    vel = new PVector((float) (2*Math.random()-1), (float)(2*Math.random()-1));
    vel.normalize();

    acc = new PVector();
  }

  Predator(PVector loc)
  {
    this.loc = loc;// new PVector(random(width), random(height));
    vel = new PVector((float) (2*Math.random()-1), (float)(2*Math.random()-1));
    vel.normalize();

    acc = new PVector();
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

    if (!stopPred)
    {  
      loc.add(vel);
    }

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


    seekPrey();

    if (useTimeout)
    {
      life++;
    }

    if (slowDown)
    {
      vel.mult(.99);
    }

    acc.mult(0);
  }


  void seekPrey()
  {
    Prey p = (Prey) prey.get(0);
    float d= PVector.dist(p.loc, this.loc);
    for (int i=1;i<prey.size();i++)
    {
      Prey p2 = (Prey) prey.get(i);

      float d2 =PVector.dist(p2.loc, this.loc);
      if (d2<d)
      {
        p=p2;
        d=d2;
      }

      if (d2<this.sz/2)
      {
        //println("eating"); 
        sz+=.01;

        prey.remove(p2);
        life-=100;
        if (i!=prey.size()-1)
        {
          i--;
        }
      }
    }

    PVector v = PVector.sub(p.loc, loc);

    v.normalize();

    if (d<100)
    {
      vel.add(v);
      vel.normalize();
      vel.mult(.6);
    }
  }


  void render()
  {
    noStroke();
    fill(255, 0, 0);
    rect(loc.x, loc.y, sz, sz);
  }
}


