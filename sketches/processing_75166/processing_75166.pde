
int n = 50;
Turtle[] Tur;

void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB);
  Tur = new Turtle [n];
  for (int i=0;i<n;i++) {
    Tur [i] = new Turtle ();
  }
}

void draw() {
  background (#005ACB);
  for (int i=0;i<n;i++) {
    Tur [i].draw();
    Tur [i].walk();
    Tur [i].turn();
  }
}

class Turtle {
  color c;
  int x;
  int y;
  int wi;
  int s;
  int angle;

  Turtle() {
    c = color (random(255), random(255), random(255));
    s = 2;
    x = int (random(width));
    y = int (random(height));
    wi = 10;
    angle = 360;
    
  }

  void draw() {
    fill(c);
    stroke(c);
    strokeWeight(5);
    line(x-2*wi, y, x, y+2*wi);
    line(x+2*wi, y, x, y+2*wi);
    line(x-2*wi, y+3*wi, x, y+2*wi);
    line(x+2*wi, y+3*wi, x, y+2*wi);
    noStroke();
    ellipse(x, y, 2*wi, 2*wi);
    ellipse(x, y+2*wi, 3*wi, 3*wi);
    stroke(255);
    strokeWeight(2);
    line(x+5, y+10, x+5, y+30);
    line(x-5, y+10, x-5, y+30);
    line(x+10, y+15, x-10, y+15);
    line(x+10, y+25, x-10, y+25);
  }

  void walk() {
    x += random(s);
    if (x>width) {
      x = -20;
    }
    y += random(s);
    if (y>height) {
      y = -20;
    }
  }
  
  void turn() {
    rotate(angle);
  }
}


