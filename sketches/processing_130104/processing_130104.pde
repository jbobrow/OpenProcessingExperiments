
int timer = 0;
float fX = 300;
float fY = 300;
float eX = 350;
float eY = 350;
float pX = 400;
float pY = 400;
float easing = .07;
color pColor = color(#FF0303);


void setup() {
  size(450, 450);
  frameRate(24);
}  

void draw() {
  background(#ACF0CE);
  for(int y = 0; y <= height; y += 10) {
   for (int x = 0; x <= width; x += 10) {
      fill(#92F5F4);
      ellipse(x, 0, 40, 40);
   }
  }
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
  fill(#9D09E8);
  ellipse(fX, fY, 30, 30);
}

void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY -pY) * easing;
  fill(pColor);
  ellipse(pX, pY, 30, 30);
}

void collisions() {
float pDist = dist(pX, pY, fX, fY);
if (pDist <= 25){
    pColor = color(#22E809);
}else {
    pColor = color(#FF0303);
  }
}





