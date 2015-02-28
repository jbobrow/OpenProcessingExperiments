
int _num =5;
Circle[] _circleArr = {};

void setup() {
size(700,400);
background(255);
smooth();
strokeWeight(1);
fill(150, 50);
drawCircles();
frameRate(35);
}
void draw() {

background(0);
for(int i=0; i<_circleArr.length; i++) {
Circle thisCirc = _circleArr[i];
thisCirc.updateMe();
}  
  
  
}
void mouseReleased() {
drawCircles();
}

/*-------------------------------------------------
void drawCircles() {
for (int i=0; i<_num; i++) {
  
float x = random(width);
float y = random(height);
float radius = random(100) + 10;
noStroke();

rectMode (CENTER);
rect(x, y, radius*2, radius*2);

//ellipse(x, y, radius*2, radius*2);
stroke(0, 150);
ellipse(x, y, 10, 10);
}
}
*/

void drawCircles() {
for (int i=0; i<_num; i++) {
Circle thisCirc = new Circle();
thisCirc.drawMe();

 _circleArr = (Circle[])append(_circleArr, thisCirc);

}
}





//---------------------------------------

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
xmove = -random(10) - 1;
ymove = -random(10) - 1;
}


void drawMe() {

  


  
//ellipse(centX,centY,radius*2,radius*2);
  
  
noStroke();
fill(fillcol, alph);

rectMode (CENTER);
rect(x, y, radius*2, radius*2);

ellipse(x, y, radius*2, radius*2);
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
if (y < (0-radius)) { y=height+radius;}

boolean touching = false;
for (int i=0; i<_circleArr.length; i++) {
Circle otherCirc = _circleArr[i];
if (otherCirc != this) {
float dis = dist(x, y, otherCirc.x, otherCirc.y);


/*
if ((dis-radius-otherCirc.radius) < 0) {
touching = true;
break;
}
}
}
if (touching) {
if (alph > 0) { alph--; }
} else {
if (alph<255) { alph += 2; }
}

*/




float overlap = dis - radius - otherCirc.radius;
if (overlap < 0) {
float midx, midy;
midx = (x + otherCirc.x)/2;
midy = (y + otherCirc.y)/2;
stroke(255, 100);
noFill();
overlap *= -1;


if (x>y) {
if (alph > 0) { alph--; }
} else {
if (alph<255) { alph += 2; }
}




//rotate(radians(45));

rectMode (CENTER);


rect(midx, midy, overlap, overlap);

//for (float ang=0; ang<=360*1; ang+=5) {
 //   radius += 0.8;
  //  float rad = radians(ang);
  //  a = centX + (radius * cos(30));
 //   b = centY + (radius * sin(30));
//    point(a, b);
  //  if (lastx > -999) {
 //     line(a, b, lastx, lasty);
 //   }
//    lastx = x;
 //   lasty = y;
 // }







}
}
}

drawMe();
}

}



