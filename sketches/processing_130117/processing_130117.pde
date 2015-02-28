
int timer = 0;
float fX = 100;
float fY = 100;
float eX = 200;
float eY = 200;
float pX = 300;
float pY = 300;
float easing = .4;
color pColor = color(#F2DA4E);

void setup() {
  size(500, 500);
  frameRate(24);
}
void draw() {
  background(#338890);
  bGround();
  food();
  player1();
  collisions();
}

void food() {
  //respawn
  timer++;
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#FA0F23);
  ellipse(fX, fY, 30, 30);
}

void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  ellipse(pX, pY, 30, 30);
}

void collisions() {
  float pDist = dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(#F75605);
  }
  else {
    pColor = color(#F2DA4E);
  }
}

void bGround() {
  for (int i = 0; i < width; i += 50) {
    for (int j = 0; j < height; j += 50) {
      fill(#3A9033);
      rect(i, j, 50, 50);
    }
  }
}




