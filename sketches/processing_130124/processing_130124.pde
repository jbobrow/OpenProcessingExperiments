
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .10;
color pColor = color(#F4F51E);

void setup() {
  size(500, 500);
  frameRate(24);
}

void draw() {
  background(0);
  bGround();
  food();
  player1();
  collisions();
  
}

void food() {
  //respawn
  timer++;
  if (timer>=48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#24E517);
  rect(fX, fY, 20, 20);
}

void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX -pX) * easing;
  pY += (targetY -pY) * easing;
  fill(pColor);
  arc(pX, pY, 40, 40, PI, TWO_PI+HALF_PI);
}

void collisions() {
  float pDist = dist(pX,pY,fX,fY);
  if(pDist <= 35) {
    pColor = color(#211FED);
  }
  else {
    pColor = color(#F4F51E);
  }
}

void bGround(){
for(int i = 0; i < width; i +=50){
  for(int j = 0; j < height; j +=50){
    fill(#EC1FED);
    rect(i,j,50,50);
  }
}
}



