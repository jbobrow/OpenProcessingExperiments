
// an exercise based on the "Emergence" chapter in Pearson (2011)
// schien@mail.ncku.edu.tw

// -------------------------- main program
int _num = 10;
Circle[] cArray = {
};
void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 150);
  drawCircles();
}
void draw() {
  //background(255);
  fill(255, 5);
  rect(0, 0, width, height);
  for (int i=0; i<cArray.length; i++) {
    cArray[i].updateMe();
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

// -------------------------- object ----------
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
    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
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
        float overlap = dis-radius-otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(0, 0, 20, 100);
          strokeWeight(0.5);
          noFill();
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }

    //drawMe();
  }
}


