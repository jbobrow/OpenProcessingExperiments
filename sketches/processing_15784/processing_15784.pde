
class Building
{ 
  float x,y,c;
  int r,h;

  Building()
  {
    x = random(-100,800);
    y = 400;
    h = (int)random(-500,-100);
    r = (int)random(100,150);
    c = color(156,165,0);
  }
  void show()
  {
    fill(c);
    rect(x,y,r,h);
  }
}

