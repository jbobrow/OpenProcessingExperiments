
//if statments, for loops, response

int timer = 0;
float fX = 210;
float fY = 210;
float eX = 250;
float eY = 250;
float pX = 320;
float pY = 320;
float easing = .08;
color pColor = color(#3781A5);

void setup(){
  size(500,300);
  frameRate(24);
}

void draw(){
  background(#83A7BC);
  food();
  player1();
  fill(289,mouseX,18);
  beginShape();
vertex(72,30);
vertex(71,75);
vertex(71,56);
vertex(72,35);
vertex(87,89);
vertex(90,72);
vertex(90,90);
vertex(63,72);
vertex(63,59);
vertex(117,89);
vertex(130,90);
endShape(CLOSE);
}

void food() {
  //respawn
  timer++;
  if(timer >= 48){
    fX = random(width);
    fY = random(height);
    timer = 0;
  }
  rect(fX, fY, 30, 30);
}

void player1() {
 float targetX = mouseX;
 float targetY = mouseY;
 pX += (targetX - pX) * easing;
 pY += (targetY - pY) * easing;
 fill(pColor);
 ellipse(pX, pY, 56, 56);
}

void collision(){
  float pDist = dist(pX, pY, fX, fY);
  if(pDist <= 60){
    pColor = color(#135D09);
}
else{
    pColor = color(#3781A5);
 }
}

void bGround(){
  for(int j = 0; j <width; j = 50){
    for(int o = 0; o <height; o+= 50){
      fill(#E8AE1A);
      rect(j,o,50,50);
    }
}
}


