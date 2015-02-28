
class Ball {

  int x;
  int y;
  int destinationX;
  int destinationY;
  int s;
  color c;

  int speed;

  Ball(int _x, int _y, int _s, color _c) {
    x=_x;
    y=_y;
    destinationX=x;
    destinationY=y;
    s=_s;
    c=_c;
    speed=20;
  }

  void display() {
    if (x<destinationX)x=min(destinationX,x+speed);
    else if (x>destinationX) x=max(destinationX,x-speed);

    if (y<destinationY) y=min(destinationY,y+speed);
    else if (y>destinationY) y=max(destinationY,y-speed);
    noStroke();
    fill(c);
    ellipse(x,y,s,s);
  }

  void resize(int _s) {

    s=_s;
  }

  void place(int _x, int _y) {
    x=_x;
    y=_y;
    destinationX=_x;
    destinationY=_y;
  }

  void placeTravel(int _x, int _y) {
    destinationX=_x;
    destinationY=_y;
  }
}


