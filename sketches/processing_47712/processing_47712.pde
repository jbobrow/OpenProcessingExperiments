
// set up
int _num = 10;
Circle[] _circleArr = {
};
void setup() {
  size(500, 300);
  background(5,5,160);
  smooth();
  strokeWeight(0.5);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(50,50,100,20);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
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
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


//------------class
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
linecol = color(random(255), random(255),
random(255));
fillcol = color(random(255), random(255),
random(255));
alph = random(10);
xmove = random(10) - 5;
ymove = random(10) - 5;
}
void drawMe() {
noStroke();
fill(fillcol, alph);
ellipse(x, y, radius*2, radius*2);
stroke(linecol, 10);
noFill();
ellipse(x, y, 10, 10);
}
void updateMe() {
x += xmove;
y += ymove;
if (x > (width+radius)) { x=0-radius; }
if (x < (0-radius)) { x=width+radius; }
if (y > (height+radius)) { y=0-radius; }
if (y < (0-radius)) { y=height+radius; }
boolean touching = false;
for (int i=0; i<_circleArr.length; i++) {
Circle otherCirc = _circleArr[i];
if (otherCirc != this) {
float dis = dist(x, y, otherCirc.x, otherCirc.y);
float overlap = dis - radius - otherCirc.radius;
if (overlap < 10) {
float midx, midy;
midx = (y+ otherCirc.x)/3;
midy = (x - otherCirc.y)/3;
stroke(0, 100);
noFill();
overlap *= 1;
ellipse(midx, midy, overlap, overlap);
}
}
}
drawMe();
}
}


