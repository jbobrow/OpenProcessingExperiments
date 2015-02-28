
int _num = 10;
Circle[] _circleArr = {};
void setup() {
size(500,300);
background(255);
smooth();
strokeWeight(1);
fill(150, 50);
drawCircles();
}

// ----------set fuction------------------
void draw() {

for(int i=0; i<_circleArr.length; i++) {
Circle thisCirc = _circleArr[i];
thisCirc.updateMe();
}
}
//  make realeased
void mouseReleased() {
drawCircles();
}
void drawCircles() {
for (int i=0; i<_num; i++) {
Circle thisCirc = new Circle();
thisCirc.drawMe(); _circleArr = (Circle[])append(_circleArr, thisCirc);
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
radius = random(150) + 20;
linecol = color(random(250), random(50),
random(255));
fillcol = color(random(255), random(20),
random(150));
alph = random(5);
xmove = random(20) - 10;
ymove = random(25) - 10;
}

void drawMe() {
noStroke();
fill(fillcol, alph);
ellipse(x, y, radius, radius);
stroke(linecol, 0);
noFill();
ellipse(x, y, 10, 10);
}
void updateMe() {
x -= xmove;
y -= ymove;
if (x > (width+radius)) { x=0-radius; }
if (x < (0-radius)) { x=width+radius; }
if (y > (height+radius)) { y=0-radius; }
if (y < (0-radius)) { y=height+radius; }
drawMe();
}
}

