
ArrayList<PVector> p = new ArrayList<PVector>();

void setup()
{
  size(200, 200);
  smooth();
  
  p.add(new PVector(10, 150));
  p.add(new PVector(20, 75));
  p.add(new PVector(180, 25));
  p.add(new PVector(190, 175));
}

void draw()
{
  background(255);
  drawBezier();
}

// lerp between to PVectors
PVector plerp(PVector a, PVector b, float val)
{
  return new PVector(lerp(a.x, b.x, val), lerp(a.y, b.y, val));
}

void drawBezier()
{
  float val = norm(mouseX, 0, width);
  
  PVector a = p.get(0);
  PVector b = p.get(1);
  PVector c = p.get(2);
  PVector d = p.get(3);
  PVector e = plerp(a, b, val);
  PVector f = plerp(b, c, val);
  PVector g = plerp(c, d, val);
  PVector h = plerp(e, f, val);
  PVector i = plerp(f, g, val);
  PVector j = plerp(h, i, val);
  
  // Let processing draw the bezier curve
  noFill();
  stroke(0, 200, 0);
  bezier(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
  
  // now draw the inner workings of the bezier curve
  stroke(120);
  line(a.x, a.y, b.x, b.y);
  line(b.x, b.y, c.x, c.y);
  line(c.x, c.y, d.x, d.y);
  line(e.x, e.y, f.x, f.y);
  line(f.x, f.y, g.x, g.y);
  line(h.x, h.y, i.x, i.y);
  
  // this is an actual point on the curve
  ellipse(j.x, j.y, 5, 5);
  
  // draw the 4 main points
  stroke(0);
  fill(0);
  for(PVector _p : p)
    ellipse(_p.x, _p.y, 5, 5);
  
  text(val, 20, 20);
}

