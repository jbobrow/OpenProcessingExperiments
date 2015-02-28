
//Week-02, if staments, for loops, mouse/keyword response

int timer  = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float speed = 20; //for key response
float easing = .07; //for mouse response
color pColor = color(#EAAC4E); //declare pColor and define the orange color 

void setup() {
  size(500, 500);  //size screen
  frameRate(24); //update or refresh my screen
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
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#428CC6);
  rect(fX, fY, 30, 30);
}

//void player1(){
//  if(keyPressed){
//   if(key == 'a'){
//      pX -= speed; 
//  }
//   if(key == 'd'){
//      pX += speed; 
//  }
//   if(key == 's'){
//      pY += speed; 
//  }
//    if(key == 'w'){
//      pY -= speed; 
//  }
//}
//ellipse(pX,pY,30,30);
//}

void player2() {
  float targetX = mouseX; //move the circle to my mouse
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  rect(pX, pY, 30, 30);
}

void Collision() {
  float pDist = dist(pX, pY, fX, fY); //define the distance
  if (pDist <= 30) { //if lest than 3px
    pColor = color(#EA4EE3);
    rect(pX, pY, 60, 60);
  }
  else {
    pColor = color(#EAAC4E);
  }
}

//with autoformat is easy to read my project and looks better.





