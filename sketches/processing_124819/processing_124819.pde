
void setup() {
    size(500, 500);
    rx = 50;
    ry = 50;
    ex = 350;
    ey = 450;
    ee = 0;
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
          　ey+=10;
            rx%=width;
            ry%=height;
            ex%=width;
            ey%=height;
        }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    ex+=random(-20,20);
    ey+=random(-20,20);
  } else if (mouseButton == RIGHT) {
    ex = ee;
    ey = ex;
    ee = ey;
  } else {
    ex+=100;
    ey+=100;
  }
}

