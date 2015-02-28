
class HeavyBall
{
  float x,y,s,px,py;
  int r,dr;
  int col;
  
  HeavyBall(float x, float y, float s, int r, int posneg)
  {
    this.x = x;
    this.y = y;
    this.s = s;
    this.r = r;
    this.px = x;
    this.py = y;
    this.dr = 5;
    if(posneg == 0)
      col = 0;
    else
      col = 255;
  }
  
  void move()
  {
    py = y;
    y += s;
  }
  
  void draw()
  {
    int i,d;
    PVector foo;
    ArrayList dirt = new ArrayList();
    
    // calculate dirt
    d = round(random(1,5));
    for(i = 0; i < d; i++)
      dirt.add(new PVector(random(px-r-dr,px),random(py,py+r)));
    d = round(random(1,5));
    for(i = 0; i < d; i++)
      dirt.add(new PVector(random(px,px+r+dr),random(py,py+r)));
    // erase
    fill(col);
    stroke(col);
    ellipse(px,py,r*2,r*2);
    // ball
    stroke(col);
    ellipse(x,y,r*2,r*2);
    // dirt
    stroke(col);
    for(i = 0; i < dirt.size(); i++)
    {
      foo = (PVector) dirt.get(i);
      point(foo.x,foo.y);
    }
  }
  
  void roll()
  {
    move();
    draw();
  }
}

