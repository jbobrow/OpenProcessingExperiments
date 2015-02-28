
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .07;
color pColor = color(255, 0, 0);

void setup() {
 size(500,500);
 frameRate(24);
 smooth();
 noStroke();
}

void draw() {
 background(#9BE9F0);
 for(int y = 0; y <= height; y += 10) {
   for (int x = 0; x <= width; x += 10) {
     fill(#6FB4B9);
     ellipse (x, y, 4, 4);
    
   }
 }
  food();
  player1();
  collisions();
}

void food() {
  timer++;
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
 fill(0, 0, 255);
 ellipse (fX, fY, 30, 30);
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
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(0,200,100);
  }
  else {
    pColor = color(255,0,0);
  }
}



