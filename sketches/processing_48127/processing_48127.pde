
// creater: Mavies Lo/taiwan student
// concept: fall/falling
// the emergence u'll see that when someone falling down the starry sky
// then see the Maple's leaves falling    
// set up
int _num = 10;
Circle[] _circleArr = {
};
void setup() {
  size(600, 600);
  background(255);
  smooth();
  strokeWeight(0.5);
  fill(200, 50);
  drawCircles();
}
 
void draw() {
  background(50,60,90,20);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
// you have to dragged 1-2 times 
//then you'll just like a painter drawing on the conputer 
void mouseDragged() {
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
radius = random(80) + 5;
linecol = color(random(255), random(255),
random(255));
fillcol = color(random(255), random(255),
random(255));
alph = random(20);
xmove = random(10) - 5;
ymove = random(10) + 5;
}
void drawMe() {
noStroke();
fill(fillcol, alph);
ellipse(x, y, radius*2, radius*2);
stroke(linecol, 20);
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
if (overlap <0) {
float midx, midy;
midx = (y+otherCirc.x);
midy = (x-otherCirc.y);
stroke(250,180,0);
fill(255,180,0);
overlap *= 1;
ellipse(midx, midy, overlap, overlap);
}
}
}
drawMe();
}
}


