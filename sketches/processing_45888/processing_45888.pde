
class Grid
{
  int w;
  int l;
  float s;
  float nOff;
  PVector[] vs;
  float[] nVals;
  float n = 0;
  float m = 0;
  float y;
  
  Grid(int w_, int l_, float s_, float n_)
  {
    w = w_;
    l = l_;
    s = s_;
    nOff = n_;
    vs = new PVector[w*l];
    nVals = new float[w*l];
    
    for (int i=0; i<vs.length; i++)
    {
      vs[i] = new PVector();
      nVals[i] = random(255);
    }
    y = 0;
  }
  
  void init()
  {
    noiseDetail(4, nOff);
    for (int i=0; i<w; i++)
    {
      for (int j=0; j<l; j++)
      {
        vs[(i*w)+j].set(i*s, (noise(n)*(s*2.4)-y), j*s);
        n+=0.1;
      }
    }
  }
  
  void renderQuad(int q)
  {
    stroke(255, 16);
    fill(255*noise(n), 64, 255*noise(m), 32);
    beginShape(QUADS);
    vertex(vs[q].x, vs[q].y, vs[q].z);
    vertex(vs[q+1].x, vs[q+1].y, vs[q+1].z);
    vertex(vs[q+w+1].x, vs[q+w+1].y, vs[q+w+1].z);
    vertex(vs[q+w].x, vs[q+w].y, vs[q+w].z);
    endShape(CLOSE);
  }
}

