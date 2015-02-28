
//ORIGINAL PROGRAMM

int _num = 10;
Circle [] cArray = {
};
void setup() {
  size(500, 300);
  background(0, 50);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background (0, 50);
  for (int i=0; i< cArray.length; i++) {
    Circle thisCirc = cArray [i];
    thisCirc.updateMe ();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    thisCirc.drawMe ();
    cArray = (Circle []) append (cArray, thisCirc);
  }
}


// CLASS DEFINITION

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    xmove = random (10) -5;
    ymove = random (10) - 5;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x-5, y- random (4), radius, radius);
    fill (fillcol);
    ellipse(x, y, radius-30, radius-30);
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
          midx = (x + otherCirc.radius);
          midy = (y + otherCirc.radius);
          stroke (5, 199, 250);
          //stroke(random(255), random(255), random(255));
          fill (21, 117, 232, 75);
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    //drawMe();
  }
}


