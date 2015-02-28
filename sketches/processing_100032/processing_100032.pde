
int timer=0;
float fX=220;
float fY=220;
float eX=250;
float eY=250;
float pX=310;
float pY=310;
float easing =.07;
color pColor=color(#6ABF3A);

void setup(){
  size(500, 500);
  frameRate(20);
}
void draw(){
  food();
  player1();
  collisions();
}
void food() {
  //respawn
  timer++;
  if (timer >=24) {
    fX=random(width);
    fY=random(height);
    timer=0;
  }
  fill(#BF903A);
  ellipse(fX, fY, 40, 40);
}

void player1() {
  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(pColor);
  ellipse(pX, pY, 45, 45);
}
void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <=25) {
    pColor=color(#3ABF9C);
  }
  else{
    pColor=color(#6ABF3A);
  }
}

void bGround(){
for(int i = 0; i <= width; i += 50){
    for(int j = 0; j <= height; j += 50){
      fill(#E5DEB5);
      rect(i,j,50,50);
 }
}
}
