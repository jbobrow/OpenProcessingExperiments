
int _num = 15;
Circle[] cArray = {
};
void setup() {
  size(500, 500);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(255);
  for (int i=0; i< cArray.length; i++) {
    Circle thisCirc = cArray[i];
    thisCirc.updateMe();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    cArray = (Circle[])append(cArray, thisCirc);
  }
}

//----------------------------------

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(50) + 20;
    linecol = color(255);
    fillcol = color(random(5), random(60, 140), random(120, 255));
    alph = random(90);
    xmove = random(2) - 5;
    ymove = random(2) - 5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    strokeWeight(random(0.1,2));
    noFill();
    float s= random(15,55);
    ellipse(x, y, s, s);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) {
      x=0-radius;
    }
    if (x < (0-radius)) {
      x=width+radius;
    }
    if (y > (height+radius)) {
      y=0-radius;
    }
    if (y < (0-radius)) {
      y=height+radius;
    }
    boolean touching = false;
    for (int i=0; i<cArray.length; i++) {
      Circle otherCirc = cArray[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 100);
          strokeWeight(1);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    drawMe();
  }
}

void keyPressed() {
  saveFrame("bubbles-###.jpg");
}


