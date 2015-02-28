

//ORIGINAL PROGRAMM

int _num = 10;
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
  }
}


// CLASS DEFINITION

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    fill (fillcol);
    ellipse(x, y, radius-random(9), radius-random(9));
  }
}


