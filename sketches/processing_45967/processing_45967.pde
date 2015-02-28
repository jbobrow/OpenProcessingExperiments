
class Ring
{
  PVector[] dots;
  float[] dotsNoise;
  float r;
  float n, o;
  
  Ring(int d_, float r_)
  {
    dots = new PVector[d_];
    dotsNoise = new float[d_];
    float a;
    
    for (int i=0; i<dotsNoise.length; i++)
    {
      dotsNoise[i] = random(255);
      a = i*(TWO_PI/dotsNoise.length);
      dots[i] = new PVector(cos(a)*r, sin(a)*r);
    }
    r = r_;
    n = random(255);
    o = random(255);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
    float nr;
    float a;
    for (int i=0; i<dots.length; i++)
    {
      dotsNoise[i]+=0.1;
      nr = (noise(dotsNoise[i])*(r/8))+(7*(r/8));
      a = i*(TWO_PI/dotsNoise.length);
      dots[i] = new PVector(cos(a)*nr, sin(a)*nr);
    }
    r*=0.98;
  }
  
  void render()
  {
    color c;
    beginShape();
    for (int i=0; i<dots.length; i++)
    {
      c = color(128*noise(n)+128, 64*noise(o)+128, 128);
      stroke(c, 24);
      fill(0, 4);
      vertex(dots[i].x, dots[i].y);
    }
    endShape(CLOSE);
    n+=0.001;
    o+=0.01;
  }
}

