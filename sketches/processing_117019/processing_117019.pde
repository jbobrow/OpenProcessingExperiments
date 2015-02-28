
//practice random and for loop
//Stella Wang, Tainan, 2013/10/23

void setup() {
  size(500, 100);
  //noLoop();
  background(255);
  strokeWeight(1);
  stroke(0, 30);
  line(20, 50, 480, 80);
}

void draw() {
  float a = random(50);
  stroke(20, 50, 70, a);
  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  int border = 20;
  for (int x=border; x<=width-border;
     x+=xstep) {
      ystep = random(20)-10;
    y += ystep;
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

