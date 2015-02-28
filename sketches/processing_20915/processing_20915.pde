
// Declare variables
float r1;
float g1;
float b1;
float a1;
float r2;
float g2;
float b2;
float a2;
float r3;
float g3;
float b3;
float a3;
float r4;
float g4;
float b4;
float a4;
float backGround;
int stall;
int circleXa;
int circleXb;
int circleYa;
int circleYb;
int circleSize = 100;

// Give a value to variables based to window size
void setup () {
  size (400, 400);
  background (255);
  int circleXa = width / 2;
  int circleXb = width / 2;
  int circleYa = height / 2; // I want this to be length
  int circleYb = height / 2; // I want this to be length
}


void draw () {
  background (backGround);


  // Circle 1
  fill (r1, b1, g1, a1);
  ellipse (mouseX, -(circleSize / 2) + circleYa, circleSize, circleSize);
  circleYa = (circleYa + stall) % (height + circleSize);

  // Circle 2
  fill (r2, b2, g2, a2);
  ellipse (mouseX, height + (circleSize /2) + circleYb, circleSize, circleSize);
  circleYb = (circleYb - stall) % (height + circleSize);

  // Circle 3
  fill (r3, b3, g3, a3);
  ellipse (-(circleSize / 2) + circleXa, mouseY, circleSize, circleSize);
  circleXa = (circleXa + stall) % (width + circleSize);

  // Circle 4
  fill (r4, b4, g4, a4);
  ellipse (width + (circleSize / 2) + circleXb, mouseY, circleSize, circleSize);
  circleXb = (circleXb - stall) % (width + circleSize);
}

void mousePressed () {
  backGround = random (255);
  stall = 1;
  r1 = random(255);
  g1 = random(255);
  b1 = random(255);
  a1 = random(255);
  r2 = random(255);
  g2 = random(255);
  b2 = random(255);
  a2 = random(255);
  r3 = random(255);
  g3 = random(255);
  b3 = random(255);
  a3 = random(255);
  r4 = random(255);
  g4 = random(255);
  b4 = random(255);
  a4 = random(255);
}


