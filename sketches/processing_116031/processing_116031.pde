
PImage[] img = new PImage[16];

void setup() {
  size(900, 800);
  background(0);
  for (int i = 1; i<16; i ++) {
    img[i] = loadImage(i+".png");
  }
  frameRate(10);
}

float angle = 0;
float x1 = 200;
float y1 = 200;
float sx1 = 1;
float sy1 = 1;
float x2 = 800;
float y2 = 500;
float sx2 = 2;
float sy2 = 0.5;
float x3 = 400;
float y3 = 300;
float sx3 = 1.2;
float sy3 = 2;
float r1 = 135;
float r2 = 225;
float r3 = 315;
float r4 = 225;

void draw() {
  float r = random(-360, 360);
  float rX1 = random(300, 600);
  float rY1 = random(100, 700);
  float rX2 = random(300, 600);
  float rY2 = random(100, 700);
  float rX3 = random(300, 600);
  float rY3 = random(100, 700);

  pushMatrix();
  translate(width, 0);
  rotate(-radians(angle));
  imageMode(CENTER);
  image(img[12], 0, 0, 440, 440);
  popMatrix();

  pushMatrix();
  translate(0, height);
  rotate(radians(angle));
  imageMode(CENTER);
  image(img[13], 0, 0, 440, 440);
  popMatrix();

  pushMatrix();
  rotate(radians(angle));
  imageMode(CENTER);
  image(img[14], 0, 0, 440, 440);
  popMatrix();

  pushMatrix();
  translate(width, height);
  rotate(-radians(angle));
  imageMode(CENTER);
  image(img[15], 0, 0, 440, 440);
  popMatrix();

  pushMatrix();
  translate(width, 0);
  rotate(radians(r1));
  imageMode(CORNER);
  image(img[8], 110, 110, 160, 160);
  popMatrix();

  pushMatrix();
  translate(0, height);
  rotate(radians(r2));
  imageMode(CORNER);
  image(img[7], 110, 110, 160, 160);
  popMatrix();

  pushMatrix();
  rotate(radians(r3));
  imageMode(CORNER);
  image(img[6], 120, 120, 160, 160);
  popMatrix();

  pushMatrix();
  translate(width, height);
  rotate(radians(r4));
  imageMode(CORNER);
  image(img[5], 110, 110, 160, 160);
  popMatrix();


  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(angle));
  image(img[1], 0, 0);
  popMatrix();

  imageMode(CENTER);
  pushMatrix();
  translate(rX1, rY1);
  rotate(radians(r));
  image(img[9], 0, 0);
  popMatrix();

  imageMode(CENTER);
  pushMatrix();
  translate(rX2, rY2);
  rotate(radians(r));

  image(img[10], 0, 0);
  popMatrix();


  imageMode(CENTER);
  pushMatrix();
  translate(rX3, rY3);
  rotate(radians(r));
  image(img[11], 0, 0);
  popMatrix();

  if ( x1 > 800 || x1 < 100) {
    sx1 = sx1 * -1;
  }
  if ( y1 > 700 || y1 < 100) {
    sy1 = sy1 * -1;
  }
  x1 = x1 + 15 * sx1;
  y1 = y1 + 15 * sy1;
  image(img[2], x1, y1);

  if ( x2 > 800 || x2 < 100) {
    sx2 = sx2 * -1;
  }
  if ( y2 > 700 || y2 < 100) {
    sy2 = sy2 * -1;
  }
  x2 = x2 + 25 * sx2;
  y2 = y2 + 20 * sy2;
  image(img[3], x2, y2);

  if ( x3 > 800 || x3 < 100) {
    sx3 = sx3 * -1;
  }
  if ( y3 > 700 || y3 < 100) {
    sy3 = sy3 * -1;
  }
  x3 = x3 + 15 * sx3;
  y3 = y3 + 20 * sy3;
  image(img[4], x3, y3);

  angle = angle + 1;
  r1 = r1 - 1;
  r2 = r2 + 1;
  r3 = r3 + 1;
  r4 = r4 - 1;

  if (angle == 360) {
    angle = 0;
  }
  if (r1 == 45 ) {
    r1 = 135;
  }
  if (r2 == 315 ) {
    r2 = 225;
  }
  if (r3 == 405 ) {
    r3 = 315;
  }
  if (r4 == 135 ) {
    r4 = 225;
  }
}

void keyPressed() {
  saveFrame("_######.png");
}



