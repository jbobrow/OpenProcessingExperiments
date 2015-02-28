
class PolygonSeed
{
  PVector[] vertices;
  int nv;
  float x,y,r;
  
  PolygonSeed(int nv, float r, float x, float y)
  {
    this.nv = nv;
    this.r = r;
    this.x = x;
    this.y = y;

    this.vertices = new PVector[this.nv];
    for(int i = 0; i < this.nv; i++)
    {
      this.vertices[i] = new PVector();
      this.vertices[i].x = r * cos((TWO_PI/this.nv) * i) + x;
      this.vertices[i].y = r * sin((TWO_PI/this.nv) * i) + y;
    }
  }
  
  void draw()
  {
    
    stroke(255,0,0,16);
    for(int i = 0; i < this.nv; i++)
      line(x,y,vertices[i].x,vertices[i].y);
    
    fill(0,0,128,8);
    stroke(128,32);
    beginShape();
    for(int i = 0; i < this.nv; i++)
      vertex(vertices[i].x,vertices[i].y);
    endShape(CLOSE);
  }
}

