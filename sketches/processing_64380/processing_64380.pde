

int cnt;
float w;

void setup() {
  size(720, 400);
  smooth();
  frameRate(30);
}

void draw() {
  background(255);
  sinCurve();

  if (cnt > width) {
    cnt = 0;
  }
  fill(0,0,random(255));
  w = random(100);
  ellipse(cnt, sin(radians(cnt))*(height/2), w, w);
  cnt++;
}

void sinCurve() {
  translate(0, height/2);
  for (int i=0; i<width; i++) {
    point(i, sin(radians(i)) * (height/2));
  }
}


