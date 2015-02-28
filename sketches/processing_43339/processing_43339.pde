
Circle c1;
Circle c2;
Circle c3;
Circle c4;
Circle c5;
Circle c6;
Circle c7;
Circle c8;
Circle c9;
Circle c10;

int y = 500;

void setup() {
  size(500, 500);
  c1 = new Circle(color(200, 200), 0, 0, 60, 60, 4);
  c2 = new Circle(color(200, 200), 50, 50, 170, 170, 2);
  c3 = new Circle(color(200, 200), 120, 120, 50, 50, 5);
  c4 = new Circle(color(200, 200), 300, 450, 280, 280, 1);
  c5 = new Circle(color(200, 200), 350, 0, 30, 30, 6);
  c6 = new Circle(color(200, 200), 300, 400, 170, 170, 3);
  c7 = new Circle(color(200, 200), 250, 250, 80, 80, 3);
  c8 = new Circle(color(200, 200), 150, 150, 80, 80, 3);
  c9 = new Circle(color(200, 200), 400, 0, 50, 50, 5);
  c10 = new Circle(color(200, 200), 450, 300, 100, 100, 4);
}

void draw() {
  background(0);

  for (int y = 500; y>0; y=y-25) {
    noStroke();
    fill(0, 0, y);
    rect(0, y, 500, 50);
  }


  c1.move();
  c1.display();
  c2.move();
  c2.display();
  c3.move();
  c3.display();
  c4.move();
  c4.display();
  c5.move();
  c5.display();
  c6.move();
  c6.display();
  c7.move();
  c7.display();
  c8.move();
  c8.display();
  c9.move();
  c9.display();
  c10.move();
  c10.display();
}


class Circle {
  color c;
  float x;
  float y;
  float cWidth;
  float cHeight;
  float yspeed;

  Circle(color tempC, float tempX, float tempY, float tempCwidth, float tempCheight, float tempYspeed) {
    c = tempC;
    x = tempX;
    y = tempY;
    cWidth = tempCwidth;
    cHeight = tempCheight;
    yspeed = tempYspeed;
  }

  void display() {
    smooth();
    strokeWeight(4);
    stroke(c);
    fill(mouseX,0,mouseY,180);
    ellipse(x, y, cWidth, cHeight);
  }

  void move() {
     y=y+yspeed;
    if (y>height+150) {
     y=-150;
    }
  }
}

