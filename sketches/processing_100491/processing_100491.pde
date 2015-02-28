
//Week-03

int timer  = 0;
float fX = 300;
float fY = 810;
float eX = 650;
float eY = 280;
float pX = 180;
float pY = 180;
float speed = 66; //for key response
float easing = .03; //for mouse response
color pColor = color(#EBBC4E); //declare pColor and define the orange color
 
void setup() {
  size(400, 400);  //size screen
  frameRate(19); //update or refresh my screen
}
 
void draw() {
  background(0);
  food(); //call function
  // player1();
  player2();
  Collision();
}
 
void food() {
  //respawn
  timer++;
  if (timer >= 87) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#428CC6);
  rect(fX, fY, 50, 50);
}
 
//void player1(){
//  if(keyPressed){
//   if(key == 'j'){
//      pX -= speed;
//  }
//   if(key == 'k'){
//      pX += speed;
//  }
//   if(key == 'l'){
//      pY += speed;
//  }
//    if(key == 'o'){
//      pY -= speed;
//  }
//}
//ellipse(pX,pY,70,10);
//}
 
void player2() {
  float targetX = mouseX; //move the circle to my mouse
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  rect(pX, pY, 70, 10);
}
 
void Collision() {
  float pDist = dist(pX, pY, fX, fY); //define the distance
  if (pDist <= 30) { //if lest than 3px
    pColor = color(#EA4CC3);
    rect(pX, pY, 30, 30);
  }
  else {
    pColor = color(#EBBC4E);
  }
}
