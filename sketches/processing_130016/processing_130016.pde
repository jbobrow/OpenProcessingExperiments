
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250; 
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .03;
color pColor = color(#953039);

void setup() {
  size(500, 500);
  frameRate(24);
}

void draw() {
  background(#C192CB);
  food();
  player1();
  collisions();
}

void food() {
  //respawn
  timer++;
  if (timer >+ 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#103A93);
  ellipse(fX, fY, 30, 30);
}

void player1(){
 float targetX = mouseX;
 float targetY = mouseY;
 pX += (targetX - pX) * easing;
 pY += (targetY -pY) * easing;
  fill(#953039);
  ellipse(pX, pY, 30, 30);
}

void collisions() {
  float pDist = dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(#189310);
  } 
  else {
    pColor = color(#953039);
  }
}

void bGround(){
  for(int i = 0; i < width; i += 50){
    for(int j = 0; j< height; j += 50){
      fill(#F1D7F7);
      rect(i,j,50,50);
    }
}
}


