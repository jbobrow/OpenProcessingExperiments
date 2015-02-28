
class People
{
  int xloc;
  int yloc;
  int speed=5;

  People( int tempx, int tempy)
  {
    xloc=tempx;
    yloc=tempy;
  }
  void Pdisplay()
  {
    fill(255);
    //stroke(255);
    rect((xloc),(yloc),5,2.5);
    //println("rect ppl displayed ");
    //ellipse(xloc,yloc,15,15);
  }
  void update()
  {
    fill(255);
    stroke(255);
    xloc = xloc+speed;
    if (xloc >=width)
      xloc = 0;
  }
}

