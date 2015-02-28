
class Dog {
  float x, y, w, h;
  Tail tail;
  Leg leg;
  Head head;

  Dog(float xx, float yy, float ww, float hh)
  {
    x = xx;
    y = yy;
    w = ww;
    h = ww;
    tail = new Tail (x+w, y);
    leg = new Leg (x, y+h);
    head = new Head (x,y);
    
  }
  
  void display()
  {
    rect(x,y,w,h);
    tail.display();
    leg.display();
    head.display();
  }
}


