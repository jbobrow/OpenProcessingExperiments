
Dot dot;

void setup() {
  size(640, 480);
  smooth();
  background(0, 255, 255);
  dot = new Dot(width/2, height/2, 22);
}


void draw() {
  background(0, 255, 255);
  dot.move();
  dot.display();
}

class Dot {
  float x;
  float y;
  int size;
  float yspeed = 33;

  Dot(float _x, float _y, int _size) {
    x = _x;
    y = _y;
    size = _size;
  }

  void display(){
    noStroke();
    fill(255);
    ellipseMode(CENTER);
    float r = random(-10, 10);
    ellipse(x, y , size + r, size + r);
  }

  void move(){
    y -= yspeed * random(-1, 1);
    if (y < 0){
      y =0;
    }
    if (y > height) {
      y = height;
    }
  }
}


