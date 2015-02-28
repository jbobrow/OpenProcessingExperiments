
class Ball {
  int c1;
  int c2;
  int c3;
  float x;
  float y;
  float py;
  float size;
  float speed;
  float boundary;
  float gravity;

  Ball(int _c1, int _c2, int _c3, float _x, float _y, float _gravity) {
    c1 = _c1;
    c2 = _c2;
    c3 = _c3;
    x = _x;
    y = _y;
    py = 0;
    size = 25;
    speed = 0;
    boundary = 300;
    gravity = _gravity;
  }

  void move() {   
    y = y + speed;
    speed = speed + gravity;

    if (gravity > 0) {
      if ((y > boundary) && (py < boundary)) {
        speed = speed * -0.95;
        println("hello");
      }
    }
    else if (gravity < 0) {
      if ((y < 0) && (py > 0)) {
        speed = speed *-0.95;
        println("");
      }
    }
    
   py = y;
  }

  void display() {
    noStroke();
    fill(c1, c2, c3);
    ellipse(x, y, size, size);
  }
}

