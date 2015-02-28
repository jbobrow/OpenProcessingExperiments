
    Eye[] hiEye= new Eye[100];

void setup() {
  size(600, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);
  for (int i=0; i<hiEye.length; i++) {
    hiEye[i] =new Eye(color(random(360), 100, 100), random(30, width-30), random(height), random(5, 30));
  }
}

void draw() {
  background(250);
  for (int i=0; i<hiEye.length; i++) {
    hiEye[i].move();
    hiEye[i].display();
    }
  }

class Eye {
  color c;
  float x;
  float y;
  float xspeed;
  float d;

  Eye(color tempC, float tempX, float tempY, float tempD) {
    c=tempC;
    x=tempX;
    y=tempY;
    xspeed=2;
    d=tempD;
  }

  void display() {
    stroke(0);
    strokeWeight(d/15);
    fill(360);
    ellipse(x, y, d*2, d);
    strokeWeight(d/20);
    fill(c);
    ellipse(x, y, d, d);
    fill(0);
    noStroke();
    ellipse(x, y, d/3, d/3);
  }

  void move() {
    x=x+xspeed;
    if (x>width-d || x<d) {
      xspeed = -xspeed;
    }
  }
}  
         
