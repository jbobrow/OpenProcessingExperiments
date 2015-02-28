
//twk of Mt. Jade
//practice random, noise and forLoop, develop the feeling of carpet fabric.
//Stella Wang, Tainan, 2013/10/23

void setup() {
  size(500, 200);
  //noLoop();
  background(255);
  strokeWeight(1);
  stroke(0, 30);
  line(20, 50, 480, 120);
}

void draw() {
  float a = random(10);
  strokeWeight(a/8);
  stroke(20, 50, 70, a*2);
  float xstep = 43;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  int border = 20;
  for (int x=border; x<=width-border*5;
     x+=xstep) {
      xstep = random(30)-10;
    //      ystep = random(10)+20;
    ystep = noise(10)*10;
    x += xstep;
    y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

void mousePressed() {
  saveFrame("canvas  ###.png");
}

