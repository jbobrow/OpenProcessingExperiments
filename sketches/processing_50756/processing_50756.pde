
class Walker {
  int x,y;
  int r;

  Walker(int r_, int x_, int y_) 
  {
    x = x_;
    y = y_;
    r = r_;
  }

  void render() 
  {
   fill(r, 120, 0);
   arc(x, y, 10, 10, PI, 2*PI);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() 
  {
    int vx = int(random(3))-1;
    int vy = int(random(3))-1;
    x += vx*5;
    y += vy*8;
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}

