
void setup() {
    size(500, 500);
    ex = 50;
    ey = 250;
    rx = 350;
    ry = 450;
    rectMode(CENTER);
    frameRate(2);
    count = 20;
    dx = 20;
    dy = 20;
}

void draw() {
    background(225);  
    ellipse(ex, ey, 20, 20);
    rect(rx, ry, 20, 20);
    if(count != 0){
    h = ey - ry;
    d = ex - rx;
    dh = h/count;
    dd = d/count;
    count--;
    rx += dd;
    ry += dh;
    ex+=dx;
    ey+=dy;
    ex%=width;
    ey%=height;
    rx%=width;
    ry%=height;
    if(ex<0)ex=ex+width;
    if(ey<0)ey=ey+height;
    if(rx<0)rx=rx+width;
    if(ry<0)ry=ry+height;
    }
    }

void mousePressed() {
        count = 10;
  if (mouseButton == LEFT) {
    dx=random(-20,20);
    dy=random(-20,20);
  } 
  else if(mousePressed == RIGHT)  {
tmp=ex;
ex=ey;
ey=tmp;
 }
 else {
    ex+=100;
    ey+=100;
 }
}
