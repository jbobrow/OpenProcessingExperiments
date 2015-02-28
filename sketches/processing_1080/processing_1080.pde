
class Layer
{
  Vertex[] vertice;
  Vertex center;
  float radius;
  
  Layer(int input)
  {
    vertice = new Vertex[input];
    center = null;
  }
  
  void compute(Vertex _center, float r, float rx, float ry, float rz)
  {
    center = _center;
    radius = r;
    
    float seg = (float)Math.PI*2 / vertice.length;
    for(int i=0;i<vertice.length;i++)
    {
      float _x = r * sin(ry + seg*i) + r * cos(rz*i);
      float _z = r * cos(ry + seg*i) +r * cos(rx*i);
      float _y = r * sin(rx*i) + r * sin(rz*i);
      vertice[i] = new Vertex((_x + center.x),(_y+center.y),(_z + center.z)); 
    }
  }
  
  void render()
  {
    beginShape(TRIANGLE_FAN);
    for(int i=0;i<vertice.length;i++)
    {
      vertex(vertice[i].x,vertice[i].y,vertice[i].z);
    }
    endShape();
  }
}

