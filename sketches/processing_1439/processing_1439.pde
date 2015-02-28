
class PSystem 
{
  float th;
  PVector ps_loc;  
  ArrayList particles;
  
  public PSystem(PVector ps_loc, int num, float th) 
  {
    this.ps_loc = ps_loc;
    this.th = th;
    particles = new ArrayList();
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(new PVector(), new PVector(), new PVector(ps_loc.x, ps_loc.y, 0), random(1.0, 70.0), i));
    }
  }
 
  void run()
  {
    update();    
      for (int i = particles.size()-1; i >= 0; i--) {        
         Particle prt = (Particle) particles.get(i);
         prt.run();
         prt.move(new PVector(ps_loc.x,ps_loc.y,0));
      }
      //ellipse(ps_loc.x,ps_loc.y, 10, 10);
  }
  
  void update()
  {
      th += 0.0025f;
      ps_loc.x = inx + r * cos(th);
      ps_loc.y = iny + r * sin(th);
      ps_loc.x += random(-30.0f, 30.0f);
      ps_loc.y += random(-30.0f, 30.0f);
  }
  
}

