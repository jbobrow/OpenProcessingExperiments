
/*
Author: Anita Chen
the rain irrigate green grass
 concept: mousePressed to stop raining
 reference:(rain)http://www.openprocessing.org/visuals/?visualID=16707
  */
Rain[] rain = new Rain[200];
void setup() {
  size(300, 300);
  smooth();
  frameRate(3);
  for (int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height), random(5));
  }
}
void earth() {
  float w=width;
  float h=20;
  noStroke();
  fill(153, 108, 51);
  rect(0, height-h, w, h);
  stroke(106, 57, 6, random(155));
  strokeWeight(3);
  int num=500;
  float[]x=new float[num];
  float[]y=new float[num];
  for (int i=0;i<num;i++) {
    x[i]=random(w);
    y[i]=random(height-h, height);
    point(x[i], y[i]);
  }
}
void grass() {
  strokeWeight(2);
  int s=second();
  float step=3;
  float border=10;
  float x=10;
  float h=20;
  float y=height-h;
  float num=width-(border*2)/step;
  stroke(140, 196, 6);
  for (x= border;x<=width-border;x+=step) {
    float tipy=y-80-random(40);
    float tipx=x+random(40)-15;
    float ym=y-random(50);
    line(x, y, x, ym);
    line(x, ym, tipx, tipy);
  }
}
void draw() {
  background(255);
  earth();
  grass();
  for (int i = 0; i < rain.length; i++) {
    rain[i].move();
    rain[i].display();
  }
  if (mousePressed==true ) {
    noLoop();
    background(255);
    earth();
    grass();
  }
}
class Rain {
  float x, y, s;
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
  void move() {
    y += s;
    if (y > height) y = 0;
  }
  void display() {
    stroke(132, 204, 201, random(80, 155));
    line(x, y, x, y + random(70));
  }
}
void keyPressed() {
 saveFrame("rain irrigate.jpg");
 }


