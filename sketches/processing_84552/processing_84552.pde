
class Line
{
  PVector start, end, middle;
  float sw = random (0.1, 0.25);
  color c;
  Line (PVector start, PVector end)
  {
    this.start = start;
    this.end = end;

    setMiddle ();
  }

  void setMiddle ()
  {
    float dis = PVector.dist (start, end) * random (0.25, 0.75);
    float angle = atan2 (end.y - start.y, end.x - start.x);
    float randomAngle = random (-PI/6, PI/6);
    float x = start.x + cos (angle + randomAngle) * dis;
    float y = start.y + sin (angle + randomAngle) * dis;
    middle = new PVector (x, y);
  }

  void setStrokeWeightAndColor(int [] img, int w, int h)
  {
    color c1 = img[(int)start.y*w+(int)start.x];
    color c2 = img[(int)end.y*w+(int)end.x];
    color c_ = lerpColor (c1, c2, 0.5);
    if (middle != null) 
    {
      int x = (int) constrain (middle.x, 0, w-1);
      int y = (int) constrain (middle.y, 0, h-1);
      color c3 = img[y*w+x];
      c_ = lerpColor (c_, c3, 0.25);
    }
    c = color (0, map (brightness (c_), 0, 255, 120, 70));
    sw = map (brightness (c_), 0, 255, 0.5, 0.20);
  }

  void strokeSytle()
  {
    stroke (c);
    strokeWeight (sw);
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


