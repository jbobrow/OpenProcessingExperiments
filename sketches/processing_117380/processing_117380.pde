
//practice random and forLoop, with line tilted
//Stella Wang, Tainan, 2013/10/24

void setup() {
  size(500, 200);
  //noLoop();
  background(255);
  strokeWeight(1);
  stroke(0, 30);
  line(20, 50, 480, 120);
}

void draw() {
  float a = random(50);
  stroke(20, 50, 70, a);
  float xstep = 46;
  float ystep = 7;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  int border = 20;
  for (int x=border; x<=width-border*5;
     x+=xstep, y += ystep) {
      xstep = random(46)+20;
    ystep = random(8)+3;
    //      ystep = random(7)*2;        with more ystep = 0
    //      ystep = random(10)-20;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

void mousePressed() {
  saveFrame("canvas  ###.png");
}

