
int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300;
float easing = .05;
color pColor = color(#0AD4FA);

void setup (){
  size(500,350);
  frameRate(24);
}

void draw(){
  background(#3FFAF8);
  food();
  player1();
  collision();
  
   
   
beginShape();
vertex(350, 200);
vertex(85, 20);
vertex(85, 75);
vertex(30, 75);
endShape(CLOSE);

}
 

void food() {
  //respwn
  timer++;
  if (timer >= 48) {
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  fill(#F27907);
  ellipse(fX, fY, 75, 175);
}

void player1() {
  float targetX = mouseX;
  float targetY = mouseY;
  pX += (targetX - pX) * easing;
  pY += (targetY - pY) * easing;
  fill(pColor);
  ellipse(pX, pY, 75, 175);
}

void collision() {
  float pDist = dist(pX, pY, fX, fY);
  if (pDist<=60) {
    pColor = color(#9C52E8);
  }
  else {
    pColor = color(#F02ED6);
  }
}



