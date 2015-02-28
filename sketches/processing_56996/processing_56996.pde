
Ball ball[]=new Ball[100];
//int sijainti[50,60,30,20,10,80];
int i;
void setup() {
  background(0);
  size (600, 400);
  ellipseMode(CENTER);
  for (i=0;i<ball.length;i++) {
    ball[i]=new Ball(random(35, 45), color(random(50, 150), random(50, 150), random(50, 150), 50), random(100, 500), random(100, 300));
  }
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  for (i=0;i<ball.length;i++) {
    ball[i].move();
    ball[i].display();
  }
}

class Ball {
  float s;
  float x, y;
  color c;

  Ball(float _s, color _c, float _x, float _y) {
    s=_s;
    x=_x;
    y=_y;
    c=_c;
  }
  void move() {
    x+= random(-2, 2);
    y+= random(-2, 2);
  }
  void display() {
//    fill(c);
    stroke(100,120,211, 10);
    //    scale(0.8);
    line(x, y, mouseX, mouseY);
  }
}


