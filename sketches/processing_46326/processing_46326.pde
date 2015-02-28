
class Heart
{
  PVector[] vs;
  float[] vsNoise;
  int num;
  float r;
  float m;
  float incr;
  int counter;
  
  Heart(float r_)
  {
    num = 20;
    r = r_;
    m = 10*(r/100);
    incr = 0.1;
    counter = 0;
    
    vs = new PVector[num];
    vsNoise = new float[num];
    for (int i=0; i<num; i++)
    {
      vs[i] = new PVector();
      vsNoise[i] = random(255);
    }
    
    buildShape(0);
  }
  
  void run()
  {
    update();
    render();
  }
  
  void update()
  {
     if (counter>70) {
      counter = 0;
      isContracting = false;
    } else if ( counter>65) {
      m+=8;
    } else if (counter>60) {
      m-=8;
    } else if (counter>55) {
      m+=4;
    } else if (counter>50) {
      m-=4;
      isContracting = true;
    }
    
    buildShape(m);
    counter++;
  }
  
  void render()
  {
    // top ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[0], vs[i+1], vs[((i+1)%6)+1]);
    }
    
    // top middle ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[i+1], vs[i+7], vs[((i+1)%6)+1]);
      renderTriangle(vs[((i+1)%6)+1], vs[i+7], vs[((i+1)%6)+7]);
    }
    
    // bottom middle ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[i+13], vs[i+7], vs[((i+1)%6)+13]);
      renderTriangle(vs[i+7], vs[((i+1)%6)+13], vs[((i+1)%6)+7]);
    }
    
    // bottom ring
    for (int i=0; i<6; i++)
    {
      renderTriangle(vs[num-1], vs[i+13], vs[((i+1)%6)+13]);
    }
  }
  
  void renderTriangle(PVector v1_, PVector v2_, PVector v3_)
  {
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
    n = noise(vsNoise[num-1])*n_;
    vs[num-1] = new PVector(0.0, 100.0+n, 0.0);
  }
}


