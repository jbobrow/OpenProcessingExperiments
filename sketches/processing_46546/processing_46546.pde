
Ball sphr;

void setup() {

  size(500, 500);
  smooth();
  background(#ffffff);
  sphr = new Ball();
}

void draw() {
  rectMode(CENTER);
  fill(#ffffff, 20);
  noStroke();
  rect(width/2, height/2, width, height);
  sphr.move();
  sphr.display();
}
class Ball {

  color a;

  float r; 
  float n;
  float spd;
  float x2;

  Ball() {

    a= color (0, 0, 0);
    r = 40; 
    x2 = r*cos(n); 
    n = 1;
    spd = 4;
  }

  void display() {
    stroke(0, 0, 0);
    ellipse(width/2 +x2, height/2 + x2, 30+r, 30+r);
  }

  void move() {
    n=n+.1;
    r= r+2;
    x2 = r*cos(n);
    if (x2 > 400 ) {
      x2 = 0;
    }

    while (r == 400) {
      n =n *-.1;
      r = r*-1;
    }
  }
}


