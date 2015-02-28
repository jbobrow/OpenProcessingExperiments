
class Connection {
  Sprite s1, s2;
  PVector d1, d2;
  
  Connection(Sprite s1, PVector d1, Sprite s2, PVector d2) {
    this.s1 = s1;
    this.d1 = d1;
    this.s2 = s2;
    this.d2 = d2;
  }
  
  void draw()
  {
    stroke(255, 255, 0);
    strokeWeight(2);
    line(s1.x + d1.x, s1.y + d1.y, s2.x + d2.x, s2.y + d2.y);
    s1.drawDot(d1);
    s2.drawDot(d2);
  }
  
  Sprite otherSprite(Sprite s)
  {
    if (s == s1) return s2;
    if (s == s2) return s1;
    return null;
  }
  
  PVector otherDot(PVector d)
  {
    if (d == d1) return d2;
    if (d == d2) return d1;
    return null;
  }
}

