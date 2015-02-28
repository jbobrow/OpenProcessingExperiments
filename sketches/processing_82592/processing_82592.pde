
class Line
{
  PVector start, end, middle;
  color c;
  Line (PVector start, PVector end, float a)
  {
    this.start = start;
    this.end = end;
    setMiddle(a);
    c = color (5, 25);
  }
  
   Line (PVector start, PVector end)
  {
    this.start = start;
    this.end = end;
    setMiddle();
  }
  
  void setColor (PImage img)
  {
    color c1 = img.pixels[(int)start.y*img.width+(int)start.x];
    color c2 = img.pixels[(int)end.y*img.width+(int)end.x];
    c = lerpColor (c1, c2, 0.5);
    if (middle != null) 
    {
      int x = (int) constrain (middle.x, 0, img.width-1);
      int y = (int) constrain (middle.y, 0, img.height-1);
      color c3 = img.pixels[y*img.width+x];
      c = lerpColor (c, c3, 0.25);
    }
    c = color (c, 15);
  }

  void setMiddle ()
  {
    setMiddle (PI /6);
  }
  
  void setMiddle (float a)
  {
    float dis = PVector.dist (start, end) * random (0.25, 0.75);
    float angle = atan2 (end.y - start.y, end.x - start.x);
    float randomAngle = random (-a, a);
    float x = start.x + cos (angle + randomAngle) * dis;
    float y = start.y + sin (angle + randomAngle) * dis;
    middle = new PVector (x, y);
  }

  void draw ()
  {
    
    line (start.x, start.y, end.x, end.y);
  }

  void drawSmooth ()
  {
    
    if (middle == null) setMiddle();

    beginShape();
    curveVertex (start.x, start.y);
    curveVertex (start.x, start.y);
    curveVertex (middle.x, middle.y);
    curveVertex (end.x, end.y);
    curveVertex (end.x, end.y);
    endShape();
  }
}


