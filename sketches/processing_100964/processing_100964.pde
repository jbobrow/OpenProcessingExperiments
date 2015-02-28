
Circle[] circles = new Circle[64];

float hue;

void setup() {
  size(450, 450);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  int yoko = 0;
  int tate = 0;

  for (int i = 0; i < circles.length;i++) {  
    circles[i] = new Circle((yoko+1)*50, (tate+1)*50, yoko, tate);
    yoko++;
    if (yoko >= sqrt(circles.length)) {
      yoko = 0;
      tate++;
    }
  }
}

void draw() {
  background(360);

  for (int q = 0; q < circles.length -1; q++) {
    for (int p = 0; p < sqrt(circles.length) - 1; p++) {
      hue = p*q*1.2;

      stroke(hue, 100, 100);
      line(circles[p].x, circles[q].y, circles[p+1].x, circles[q+1].y);
    }
  }

  for (int i = 0; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  float center_x;
  float center_y;
  float x;
  float y;
  float tx;
  float ty;


  Circle(float tmpX, float tmpY, float tmpTX, float tmpTY) {
    center_x = tmpX;
    center_y = tmpY;
    tx = tmpTX;
    ty = tmpTY;
  }

  void move() {
    x = center_x+10*sin(tx);
    y = center_y+10*sin(ty);

    tx += 0.05;
    ty += 0.05;
  }

  void display() {
    stroke(0);
    noFill();

    ellipse(x, y, 10, 10);
  }
}



