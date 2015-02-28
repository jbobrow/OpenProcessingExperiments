
class ParticleEngine
{
  private ArrayList<Particle> particles;
  int particleCount=10;
  ParticleEngine()
  {
      particles = new ArrayList<Particle>();
  }
  
  public void update(int size)
  {
    for(Particle p : particles)
    {
      p.update(size);
      p.draw();
    }
  }

  public void smoke(int x,int y,float wind)
  {
      //particles = new ArrayList<Particle>();
    
      int r = 40;
      for(int i=0;i<particleCount;i++)
      {
        float c = random(100,250);
        Particle p = new Particle(color(c,c,c),wind);
        p.setPos(int(x),int(y),cos(random(0,TWO_PI))*random(2),sin(random(0,TWO_PI))*random(2));
        particles.add(p);
      }
  }
  public void make(int x,int y, float wind)
  {
      particleCount=1;
      for(int i=0;i<particleCount;i++)
      {
        Particle p = new Particle(color(100,100,200),wind);
        p.setPos(int(x),int(y),cos(random(0,TWO_PI))*random(2),sin(random(0,TWO_PI))*random(2));
        particles.add(p);
      }
  }

}

