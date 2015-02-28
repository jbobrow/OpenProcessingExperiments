
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float speed = 10;
color pColor = color(#92E5AA);

void setup() {
  size(500, 500);
  frameRate(24);
}

void draw() {
  background(120);
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
  fill(#2EFF0F);
  ellipse(fX, fY, 30, 30);
}


void player1() {
  if (keyPressed) {
    if (key=='a') {
      pX -= speed;
    }
    if (key=='d') {
      pX += speed;
    }
    if (key=='s') {
      pY += speed;
    }
    if (key=='w') {
      pY -= speed;
    }
  }
  fill(pColor);
  rect(pX, pY, 30, 30);
}

void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(#F50737);
  }
  else {
    pColor = color(#080002);
  }
}

void bGround(){
  for(int i = 0; i < width; i += 25){
    for(int j = 0; j < height; j += 25){
      fill(#E1F4F5);
      ellipse(i,j,25,25);
    }
  }
}
  







