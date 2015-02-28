
Ball ball[]=new Ball[400];
//int sijainti[50,60,30,20,10,80];
int i;
void setup() {
  background(0);
  size (600, 600);
  ellipseMode(CENTER);
  for (i=0;i<ball.length;i++) {
    ball[i]=new Ball(random(35, 45), color(random(50,150), random(50,150), random(50,150),50));
  }
}

void draw() {
  
  for (i=0;i<ball.length;i++) {
    ball[i].move();
    ball[i].display();
  }
}

class Ball {
  float s;
  int x, y;
  color c;

  Ball(float _s, color _c) {
    s=_s;
    x=300;
    y=300;
    c=_c;
  }
  void move() {
    x+= random(-1, 2);
    y+= random(-1, 2);
  }
  void display() {
    fill(c);
    noStroke();
//    scale(0.8);
    ellipse(x, y, s, s);
  }
}


