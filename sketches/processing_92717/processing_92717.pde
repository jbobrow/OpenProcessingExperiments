
float gravity = 1;
Apple billy = new Apple();
void setup () {
  size (500, 500);
}
void draw () {
  background (255);
  billy.display();
  billy.fall();
}

class Apple {
  float x;
  float y;
  float w;
  float h;
  float speed;
 
  Apple () {
    x = 50;
    y = 20;
    w = 30;
    h = 50;
    speed = -1;
  }
  //functions
  void display () {
    fill (48, 157, 85);
    ellipse (35, y, 10, 5);
    strokeWeight (3);
    stroke (108, 78, 78);
    line (50, y+30, 40, y-5);
    noStroke();
    fill (255, 0, 0);
    ellipse (50, y+30, 40, 50);
  }
  void fall () {
    y = y + speed;
    speed = speed + gravity;
  }
}
