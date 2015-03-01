
float angle = 0.0;
float offset = 50;
float scalar = 30;
float speed = 0.02;

void setup() {
  frameRate(30);
  size(500, 500);
  smooth();
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(0);
//  float sinval = sin(angle);
//  println(sinval);
//  float gray = map(sinval, -1, 1, 0, 255);
//  angle += 0.15;
  fill(random(255));
  for (int i = 20; i < 400; i +=10) {
    for (int l = 30; l < 400; l += 10) {
//  float x = offset + cos(angle) * scalar;
//  float y = offset + sin(angle) * scalar;
  ellipse(i+48, l+48, random(10), random(10));
  }
  }
  for (int i = 10; i < 400; i +=10) {
    for (int l = 10; l < 400; l += 10) {
//  float x = offset + cos(angle) * scalar;
//  float y = offset + sin(angle) * scalar;
  ellipse(i+48, l+48, random(10), random(10));
  }
  }
  angle += speed;
}


