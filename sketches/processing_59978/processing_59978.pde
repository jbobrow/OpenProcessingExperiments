
class Ring
{
  PVector[] dots;
  float[] dotsNoise;
  float r, rInc, rScale;
    
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
    r = 0;
    rInc = 0;
    rScale = 12;
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
      nr = (noise(dotsNoise[i])*(r/rScale))+((rScale - 1)*(r/rScale));
      a = i*(TWO_PI/dotsNoise.length);
      dots[i] = new PVector(cos(a)*nr, sin(a)*nr);
    }
    r=sin(rInc)*160+160;
    rInc += 0.01;
  }
  
  void render()
  {
    beginShape();
    for (int i=0; i<dots.length; i++)
    {
      noFill();
      stroke(0, 128);
      strokeWeight(1);
      vertex(dots[i].x, dots[i].y);
    }
    endShape(CLOSE);
    n+=0.001;
    o+=0.01;
  }
}

