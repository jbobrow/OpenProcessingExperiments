
class Grid
{
  PVector loc;
  int w , l;
  float n;
  Particle[] ps;
  float boxSize;
  
  Grid(int w_, int l_)
  {
    loc = new PVector();
    w = w_;
    l = l_;
    n = random(255);
    boxSize = 16;
    
    ps = new Particle[w*l];
    for (int i=0; i<w; i++)
    {
      for (int j=0; j<l; j++)
      {
        float x = (i*boxSize)-(boxSize*w)/2;
        float y = (j*boxSize)-(boxSize*l)/2;
        float z = (noise(i/100f, j/100f, n)-0.45)*96;
        ps[i*w+j] = new Particle();
        ps[i*w+j].loc.x = x;
        ps[i*w+j].loc.y = y;
        ps[i*w+j].loc.z = z;
      }
    }
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    for (int i=0; i<w; i++)
    {
      for (int j=0; j<l; j++)
      {
        Particle p = new Particle();
        p.loc.x = (i*boxSize)-(boxSize*w)/2;
        p.loc.y = (j*boxSize)-(boxSize*l)/2;
        p.mass = 128;
        
        PVector f = ps[i*w+j].calcForce(p);
        ps[i*w+j].applyForce(f);
        //ps[i*w+j].applyForce(new PVector(0, 0, z));
        //ps[i*w+j].loc.z = z;
        ps[i*w+j].update();
      }
    }
    n+=0.008;
  }
  
  void render()
  {
    noFill();
    for (int i=0; i<w; i++)
    {
      for (int j=0; j<l; j++)
      {
        stroke(255, 32);
        fill(255, 128, ps[i*w+j].loc.z*16, ps[i*w+j].loc.z*8+128);
        pushMatrix();
        translate(ps[i*w+j].loc.x, ps[i*w+j].loc.y, ps[i*w+j].loc.z);
        box(boxSize);
        popMatrix();
      }
    }
  }
}
    

