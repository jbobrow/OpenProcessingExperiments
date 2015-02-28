
class Heart
{
  PVector[] vs;
  float[] vsNoise;
  int num;
  float r;
  float m;
  float incr;
  int counter;
  color[] cs;
  
  Heart(float r_)
  {
    num = 20;
    r = r_;
    m = 10*(r/100);
    incr = 0.01;
    counter = 0;
    
    vs = new PVector[num];
    cs = new color[num];
    vsNoise = new float[num];
    for (int i=0; i<num; i++)
    {
      vs[i] = new PVector();
      vsNoise[i] = random(255);
      cs[i] = color(random(128, 255), random(128, 255), random(128, 255));
    }
    
    buildShape(0);
  }
  
  
  void render()
  {
    buildShape(100);
    
    // top ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[0], vs[i+1], vs[((i+1)%6)+1], cs[i]);
    }
    
    // top middle ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[i+1], vs[i+7], vs[((i+1)%6)+1], cs[i]);
      renderTriangle(vs[((i+1)%6)+1], vs[i+7], vs[((i+1)%6)+7], cs[i+6]);
    }
    
    // bottom middle ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[i+13], vs[i+7], vs[((i+1)%6)+13], cs[i+6]);
      renderTriangle(vs[i+7], vs[((i+1)%6)+13], vs[((i+1)%6)+7], cs[i+12]);
    }
    
    // bottom ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[num-1], vs[i+13], vs[((i+1)%6)+13], cs[i+6]);
    }
  }
  
  void renderTriangle(PVector v1_, PVector v2_, PVector v3_, color c_)
  {
    stroke(c_);
    fill(c_);
    beginShape();
    vertex(v1_.x, v1_.y, v1_.z);
    vertex(v2_.x, v2_.y, v2_.z);
    vertex(v3_.x, v3_.y, v3_.z);
    endShape(CLOSE);
  }
  
  void buildShape(float n_)
  {
    float n;
    float j;
    
    // top vertex
    vsNoise[0]+=incr;
    n = noise(vsNoise[0])*n_;
    vs[0] = new PVector(0.0, -(100.0+n), 0.0);
    
    // top ring
    for (int i=0; i<6; i++)
    {
      n = noise(vsNoise[i+1])*n_;
      vsNoise[i+1]+=incr;
      j = i;
      vs[i+1] = new PVector(cos(j*(TWO_PI/6.0))*(r*(2.0/3.0))+cos(j*(TWO_PI/6.0))*n, 
                            -60.0, 
                            sin(j*(TWO_PI/6.0))*(r*(2.0/3.0))+sin(j*(TWO_PI/6.0))*n);
    }
    
    // middle ring
    for (int i=0; i<6; i++)
    {
      n = noise(vsNoise[i+7])*n_;
      vsNoise[i+7]+=incr;
      j = i;
      vs[i+7] = new PVector(cos((j*(TWO_PI/6.0))+(TWO_PI/12.0))*r+cos(j*(TWO_PI/6.0))*n,
                            0.0,
                            sin((j*(TWO_PI/6.0))+(TWO_PI/12.0))*r+sin(j*(TWO_PI/6.0))*n);
    }
    
    // bottom ring
    for (int i=0; i<6; i++)
    {
      n = noise(vsNoise[i+13])*n_;
      vsNoise[i+13]+=incr;
      j = i;
      vs[i+13] = new PVector(cos(j*(TWO_PI/6.0))*(r*(2.0/3.0))+cos(j*(TWO_PI/6.0))*n,
                             60.0,
                             sin(j*(TWO_PI/6.0))*(r*(2.0/3.0))+sin(j*(TWO_PI/6.0))*n);
    }
    
    // bottom vertex
    vsNoise[num-1]+=incr;
    n = noise(vsNoise[num-1])*n_;
    vs[num-1] = new PVector(0.0, 100.0+n, 0.0);
  }
}


