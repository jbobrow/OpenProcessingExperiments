
// Monkey Game Collision Example
int timer = 0; 
int diameter = 20; //diameter of food
int w = 30; //body size
int h = 30; //body size
float fX = 200; //food
float fY = 200;
float eX = 250; //enemy
float eY = 250;
float pX = 300; // player
float pY = 300;
float easing = 0.09;
//float speed = 10;
color pColor = color(#C99A33); //player color



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
  timer++; //timer + 1
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  noStroke();
  fill(#FF6708); //food
  ellipse(fX, fY, diameter, diameter);
  ellipse(fX, fY + 10, diameter, diameter);
  ellipse(fX + 30, fY, diameter, diameter);
  ellipse(fX + 30, fY + 10, diameter, diameter);
  rect(fX, fY - 5, 30, 20);
}

void player1() {
  //followexample from process control easing
  float targetX = mouseX;
  float targetY = mouseY;
  pX += ( targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  noStroke();
  rect(pX, pY, w, h); //head
  rect(pX + w, pY + 10, 50, 30); //body
  rect(pX + w, pY + 40, 10, 20); //front leg
  rect(pX + w + 40, pY + 40, 10, 20); //back leg
  rect(pX + w - 5, pY + h + 20, 15, 10); //front foot
  rect(pX + w + 35,pY + h + 20, 15, 10); //back foot
  rect(pX + w + 45, pY + 10, 5, -20); //tail
  rect(pX + w + 30, pY - 10, 20, 5); //tail 2
  rect(pX + w + 25, pY - 10, 5, 10); //tail 3 
  fill(0);
  rect(pX + 15, pY, 10, 15); //ear
  ellipse(pX + 7, pY + 10, 7, 7); // eye
  rect(pX, pY + 25, 15, 2); //mouth
  rect(pX + 13, pY + 25, 2, 5); //cornersofmouth
  
}

void collisions() {

  float pDist = dist(pX, pY, fX, fY);
  if (pDist<= 30) {
    pColor = color(#F22C68);
  }
  else {
    pColor = color(#9D7325);
  }
}


void bGround() { 
  stroke(0);
  for (int i = 0; i < width; i += 40) {
    for (int j = 0; j < height; j += 40) {
      fill(#B2D3FC);
      rect(i, j, 50, 50);
      if (mousePressed == true) {
        fill(#27D834); //make this color when click mouse
      }
      ellipse(i, j, 50, 50); //make this shape when click mouse
    }
  }
}










