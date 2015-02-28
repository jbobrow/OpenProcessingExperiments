
class Link
{
  Particle p0;
  Particle p1;
  Link(Particle p0, Particle p1)
  {
    this.p0 = p0;
    this.p1 = p1;
  }

  void Draw(PGraphics pg)
  {
    float dx = p0.x - p1.x;
    float dy = p0.y - p1.y;
    float d = sqrt(dx*dx+dy*dy);
    if(d < (p0.r_view + p1.r_view) * 0.5)
    {
      pg.line(p0.x, p0.y, p1.x, p1.y);
    }
  }
}


