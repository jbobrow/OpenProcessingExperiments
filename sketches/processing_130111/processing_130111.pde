
//WEEK 2
 
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .05;
color pColor = color(#92E5AA);
  
void setup() {
  size(500, 600);
  frameRate(24);
}
  
void draw() {
  background(#9BE9F0);
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
  fill(#050505);
  rect(fX, fY, 30, 30);
}
  
  
void player1() {
float targetX = mouseX;
float targetY = mouseY;
pX += (targetX - pX) * easing;
pY += (targetY - pY) * easing;
  fill(pColor);
  rect(pX, pY, 30, 30);
}
  
void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <= 30) {
    pColor = color(#F50737);
  }
  else {
    pColor = color(#92E5AA);
  }
}
  
void bGround(){
  for(int i = 0; i < width; i += 60){
    for(int j = 0; j < height; j += 60){
      noStroke();
      fill(#B4B2B2);
      rect(i,j,50,50);
    }
  }
}


