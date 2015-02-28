
void setup() {
    size(500, 500);
    rx = 50;
    ry = 50;
    ex = 350;
    ey = 450;
    rectMode(CENTER);
    frameRate(2);
    count = 20;
}
void draw() {
        background(225);
        rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
        if(count != 0){
            h = ey - ry;
            d = ex - rx;
            dh = h/count;
            dd = d/count;
            count--;
            rx += dd;
            ry += dh;
            ex+=20;
            rx%=width;
            ry%=height;
            ex%=width;
            ey%=height;
        }
        if(ex<0) ex=ex+widht;
        if(rx<0) rx=rx+widht;
        if(ey<0) ey=ey+height;
        if(ry<0) ry=ry+height;
}
void mousePressed() {
  if (mouseButton == LEFT) {
    dx=random(-20,20);
    dy=random(-20,20);
  } else if (mouseButton == RIGHT) {
    tmp = ex;
    ex = ey;
    ey = tmp;
  } else {
    ex=ex+100;
    ey=ey+100;
    }
}

