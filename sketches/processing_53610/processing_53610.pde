
float x;
float y;

float deg = 360 / (1 + ((1 + sqrt(5)) / 2));
float dia;
int i;
float alp = 200;
float t;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  PImage preImage = get();
  background(0);
  blend(preImage, 0, 1, width, height, 0, 8, width, height, ADD);

  translate(width/2, height/2);

  blue_danmaku();
}

void blue_danmaku() {

  float rad = radians(deg * i);

  x = cos(rad) * i * 0.2;
  y = sin(rad) * i * 0.2;

  fill(0, 0, random(50, 255), alp);
  noStroke();
  ellipse(x, y, dia, dia);

  if (i < 600) {
    dia = 20;
    i += 5;
  }
  else if (i < 800) {
    dia = 15;
    i += 2;
    blue_danmaku();
  }
  else if (i < 1000) {
    dia = 30;
    i += 2;
    blue_danmaku();
  }
  else {
    i = 0;
  }
}


