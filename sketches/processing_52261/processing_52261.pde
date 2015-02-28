
PImage img;

PFont font;

float x = 150 + (400-150)/2;
float y = 260 + (400-260)/2;

float hs = random(0.5, 1.2);
float c = random(36);

float tmphs;

void setup() {
  size(450, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  smooth();

  img = loadImage("hand.JPG");
  font = loadFont("font.vlw");
  textFont(font);

  //noLoop();
}

void draw() {
  y = x;

  background(0, 0, 100);
  fill(0, 100, 100);
  textSize(35);
  pushMatrix();
  translate(0, 0);
  rotate(radians(10));
  text("Happy Valentine's Day!", 20, 30);
  popMatrix();
  text("2012 2 14", 320, 130);

  noStroke();

  image(img, 150, 260);

  pushMatrix();
  translate(x, y);
  scale(tmphs);
  strokeWeight(3);
  fill(c*10, 80, 100, 200);
  rotate(0.7*sin(y*0.03));
  heart(0, 0, 100, 100);
  popMatrix();

  filter(BLUR, 1);

  if (tmphs > hs) {
    x -= 5;
  }
  else {
    tmphs += 0.01;
  }

  if (x < -70*hs) {
    x = 150 + (400-150)/2;
    hs = random(0.5, 1.2);
    c = random(36);
    tmphs = 0;
  }
}

//***************************************
// I referred to Proce55ing.walker,blog
// http://blog.p5info.com/?p=28
//***************************************

void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}

