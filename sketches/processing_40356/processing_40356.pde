
Life a;

void setup() {
  size(500, 500);
  smooth();
  noStroke();

  a = new Life();
  a.s = 10;
  a.x =width/2;
  a.y =0;
  a.v = 10;
}

void draw() {
  a.c=color(255, random(100, 150), 0);
  fill(64, 1);
  rect(0, 0, width, height);
  a.start();
  a.follow();
  a.follow2();
}

class Life {
  float x, y;
  float x2, y2;
  int s;
  color c;
  int v;

  void start() {
    for (int i=0; i<1; i++) {
      for (x=0; x<300; x+=1) {
        fill(c);
        ellipse(x+random(-250, 250), y, s, s);
      }
      for (x2=0; x2<300; x2+=1) {
        fill(c);
        ellipse(x2+random(-250, 250), y2, s, s);
      }
    }
  }
  void follow() {
    y +=1;
    if (y>500) {
      y=0;
    }
  }
      void follow2() {
    y2 -=1;
    if (y2<0) {
      y2=500;
    }
  }
}



