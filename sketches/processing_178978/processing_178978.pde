
int r = 400;

int Ax;
int Ay;
int Bx;
int By;

void setup() {
  size(550, 650);
  colorMode(HSB, 360, 100, 100);
  background(360);

  Ax = width/2;
  Ay = height/2 - r/2;
  Bx = width/2;
  By = height/2 + r/2;
}

void draw() {
  background(360);


  drawDragon(Ax+50, Ay+30, Bx+50, By+30, 11);
}

void drawDragon(int Ax, int Ay, int Bx, int By, int num) {
  int alp = 80;
  int st_w = 10;

  int xx = Bx - Ax;
  int yy = -(By - Ay);

  int Cx = Ax + (xx+yy)/2;
  int Cy = By + (xx+yy)/2;

  if (num <= 0) {
    strokeWeight(st_w);
    stroke(60, 50, 100, alp);
    point(Ax, Ay);

    stroke(150, 50, 100, alp);
    point(Bx, By);

    strokeWeight(st_w*1.2);
    stroke(230, 50, 100, alp);
    point(Cx, Cy);

    strokeWeight(1);
    stroke(0, 50);
    line(Ax, Ay, Cx, Cy);
    line(Bx, By, Cx, Cy);
  } else {
    drawDragon(Ax, Ay, Cx, Cy, num-1);
    drawDragon(Bx, By, Cx, Cy, num-1);
  }
}

void mousePressed() {  
  save(nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".png");
}



