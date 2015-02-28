
//Clark Li
//Practice the function of "Class"

int _num = 10;
Circle[]_circleA= {
};

void setup() {
  size(800, 450);
  background(200);
  smooth(20);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(200);
  for (int i=0; i<_circleA.length; i++) {
    Circle thisCirc =_circleA[i];
    thisCirc.updateMe();
  }
}
void mousePressed() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleA=(Circle[])append(_circleA, thisCirc);
  }
}
class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 5;
    linecol = color(255,random(255));
    fillcol = color(255,random(255));
    alph = random(255);
    xmove=random(5)-2;
    ymove=random(5)+2;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 200);
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
      y=0+radius;
    }
    if (y < (0-radius)) { 
      y=0;
    }
    boolean touching = false;
for (int i=0; i<_circleA.length; i++) {
Circle otherCirc = _circleA[i];
if (otherCirc != this) {
float dis = dist(x, y, otherCirc.x, otherCirc.y);
float overlap = dis - radius - otherCirc.radius;
if (overlap < 0) {
float midx, midy;
midx = (x + otherCirc.x)/2;
midy = (y + otherCirc.y)/2;
stroke(0, 100);
fill(random(10));
overlap *= -1;
ellipse(midx, midy, overlap, overlap);
}
}
}
    drawMe();
  }
}



