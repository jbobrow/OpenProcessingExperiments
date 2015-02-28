
int timer=0;
float fX=200;
float fY=200;
float eX=250;
float eY=250;
float pX=300;
float pY=300;
float easing =.05;
color pColor=color(#6ABF3A);

void setup(){
  size(500, 500);
  frameRate(20);
}
void draw(){
  background(0);
  food();
  player1();
  collisions();
}
void food() {
  //respawn
  timer++;
  if (timer >= 48) {
    fX=random(width);
    fY=random(height);
    timer=0;
  }
  fill(#BF903A);
  ellipse(fX, fY, 30, 30);
}

void player1() {
  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(pColor);
  ellipse(pX, pY, 30, 30);
}
void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <=30) {
    pColor=color(#3ABF9C);
  }
  else{
    pColor=color(#6ABF3A);
  }
}
