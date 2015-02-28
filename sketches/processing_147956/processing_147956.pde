
float xh;
float yh;
float xm;
float ym;
float xs;
float ys;
 
void setup() {
  size(400, 400);
  smooth(6);
  frameRate(1);
  background(253);
}
 
void draw() {
  background(255);
  stroke(0);
  strokeWeight(0.2);
  //dial
  for (int i = 0; i < 12; i++) {
    float cx = cos(i * TWO_PI / 12);
    float cy = sin(i * TWO_PI / 12);
    line(200 + 87 * cx, 200 + 87 * cy, 200 + 145 * cx, 200 + 145 * cy);
  }
  for (int i = 0; i < 4; i++) {
    float cx = cos(i * TWO_PI / 4);
    float cy = sin(i * TWO_PI / 4);
    line(200 + 87 * cx, 200 + 87 * cy, 200 + 145 * cx, 200 + 145 * cy);
  }
  //hours
  stroke(88);
  strokeWeight(4);
  xh = 200 + 80 * cos(hour() * TWO_PI / 12 - PI / 2.0f);
  yh = 200 + 80 * sin(hour() * TWO_PI / 12 - PI / 2.0f);
  point(xh, yh);
  //minute
  strokeWeight(2);
  xm = 200 + 116 * cos(minute() * TWO_PI / 60 - PI / 2.0f);
  ym = 200 + 116 * sin(minute() * TWO_PI / 60 - PI / 2.0f);
  point(xm, ym);
  //second
  strokeWeight(2);
  stroke(255, 0, 0);
  xs = 200 + 145 * cos(second() * TWO_PI / 60 - PI / 2.0f);
  ys = 200 + 145 * sin(second() * TWO_PI / 60 - PI / 2.0f);
  point(xs, ys);
  //triangle
  strokeWeight(2);
  stroke(175, 8);
  fill(25, 8);
  triangle(xh, yh, xm, ym, xs, ys);
}

