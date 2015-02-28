
float x;
float y;

float deg = 360 / (1 + ((1 + sqrt(5)) / 2));
float dia = 15;
int i;
float t;

color bd = color(0, 0, 225, 150); 
color rd = color(255, 100, 200, 150);

void setup() {
  size(500, 500);
  background(0);
  strokeWeight(3);
  stroke(255,100);
  smooth();
}

void draw() {
  PImage preImage = get();
  background(0);
  blend(preImage, 10, 0, width, height, 0, 0, width, height, ADD);

  translate(width/2, height/2);

  danmaku(bd, 1);
  danmaku(rd, -1);
}

void danmaku(color clr, int fugou) {

  float rad = radians(deg * i);

  x = fugou * cos(rad) * i * 0.2;
  y = fugou * sin(rad) * i * 0.2;

  fill(clr);
  ellipse(x, y, dia, dia);
//
//  if (i < 600) {
//    dia = 20;
//    i += 5;
//  }
  if (i < 1300) {
    dia += 0.1;
    i += 2;
  }
//  else if (i < 1500) {
//    dia = 30;
//    i += 2;
//  }
  else {
    dia = 15;
    i = 0;
  }
}

