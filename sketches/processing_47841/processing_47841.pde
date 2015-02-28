
class Explosion
{
  PVector loc;
  ArrayList ps;
  int numPs;
  int life;
  boolean isDead;
  
  Explosion(PVector l_, color c_)
  {
    loc = l_;
    ps = new ArrayList();
    numPs = 12;
    life = 256;
    isDead = false;
    
    for (int i=0; i<numPs; i++)
    {
      ps.add(new Particle(loc, c_));
    }
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    for (int i=numPs-1; i>=0; i--)
    {
      Particle p = (Particle)ps.get(i);
      p.update();
      if (p.isDead)
      {
        ps.remove(i);
        numPs--;
        if (ps.size()==0)
        {
          isDead = true;
        }
      }
    }
  }
  
  void render()
  {
    if (numPs>0) 
    {
      for (int i=0; i<numPs; i++)
      {
        Particle p = (Particle)ps.get(i);
        p.render();
      }
    }
  }
}

