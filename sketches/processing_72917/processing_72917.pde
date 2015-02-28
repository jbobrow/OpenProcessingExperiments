
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//Ticklish Penguin: Basic Random Walk
//9.28.12
//OpenProcessing or awxrus.webs.com

//variables
int r = 0;
int a = 0;
int b = 0;
int c = 0;
float t = 0;

//setup
void setup() {
  size(500, 500, P3D);
  smooth();
  frameRate(24);
}

//draw
void draw() {
  background(255, 255, 255, .5);
  if (t == 600000000) {
    fill(a, b, c);
    t = 0;
  }
  textAlign(CENTER);
  textSize(30);
  text("p l a y    s o m e    m u s i c", 250, 400);
  fill(a, b, c, 220);
  translate(250 + r*1.5, 250 + r*1.5, 0 + r*1.5);
  rotateX(-.5 + r/6);
  rotateY(.5 + r/6);
  rotateZ(0 + r/6);
  box(100);
  r = r + int(random(-2, 2));
  a = int(random(0, 255));
  b = int(random(0, 255));
  c = int(random(0, 255));
  t = t + .00000000005;
}
