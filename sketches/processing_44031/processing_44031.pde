
// draw some wiggle lines
// schien@mail.ncku.edu.tw

void setup() {
  size(500, 500);
  background(255);
  strokeWeight(5);
  smooth();
  stroke(0, 30);
  line(20, 50, 480, 50);
  line(50, 20, 50, 480);
  noLoop();  // this is to control that it is drawn only once
}

void draw() {
  stroke(20, 50, 70);
  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  for (int x=20; x<=480; x+=xstep) {
    ystep = random(20) - 10;
    y += ystep;
    line(x, y, lastx, lasty);  // herzontal
    line(y, x, lasty, lastx);  // vertical
    //line(x, x, lastx, lastx);
    line(x, x+y-50, lastx, lastx+lasty-50);  // almost diagnal
    line(x, height-(x+y-50), lastx, height-(lastx+lasty-50));  // another angle
    lastx = x;
    lasty = y;
  }
}



