
//if statements, for loops, response

int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .05;
color pColor = color(#FCDC24);

void setup() {
  size(500, 500);
  frameRate(24);
}

void draw() {
  background(0);
  food();
  player1();
}

void food() {
  //respawn
  timer++;
  if (timer >= 48) {
    fX = random(500);
    fY = random(500);
    timer = 0;
  }
  fill(#02EA13);  
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
    pColor = color(#B4ABAB);
  }
  else {
    pColor = color(#FCDC24);
  }
}

void bGround(){
for(int i = 0; i < width; i += 50){
  for(int j = 0; j < height; j += 50){
    fill(#E5DEB5);
    rect(i,j,50,50);}
}
}



