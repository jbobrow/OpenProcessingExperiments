
float x2, y2;
float radius;
float speedX, speedY;
float damping;
float friction;
float gravity;


void setup(){
  size(640, 380);
  background(0, 55, 255);
  
  x2 = 0.0;
  y2 = 0.0;
  radius = 5.0;
  speedX = 2.0;
  speedY = 0;
  damping = 0.8;
  friction = 0.75; 
  gravity = .02;
  drawStairs();
  
}
 
void drawStairs(){ 
  float x = 0.0;
  float y = 30.0;
  
  noStroke();
  fill(255, 0, 0);
  rect(x, y, 80, 50);
  
  pushMatrix();
  translate(0, 50);
  rect(x, y, 160, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 100);
  rect(x, y, 240, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 150);
  rect(x, y, 320, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 200);
  rect(x, y, 400, 50);
  popMatrix();
  
  pushMatrix();
  translate(0, 250);
  rect(x, y, 480, 50);
  popMatrix();
  
  
  pushMatrix();
  translate(0, 300);
  rect(x, y, 560, 50);
  popMatrix();
}
  
void draw(){
  background(0, 55, 255);
  drawStairs();
  fill(70, 0, 230);
  ellipse(x2, y2, radius*4, radius*4);
  x2 += speedX;
  speedY += gravity;
  y2 += speedY;
 
  
  collide();

  
}

void collide(){
  x2 += speedX;
  speedY += gravity;
  y2 += speedY;
  if (x2 > width-radius){
    speedX *= -1;
  }
  if (y2 > 380-radius){
    y2 = 380-radius;
    speedY *= -1;
    speedY *= damping;
    speedX *= friction;
  } 
  if (x2 < 240+radius){
    x2 = 240+radius;
    speedX *= -1;
  } 
  if (y2 == 380-radius && abs(speedX) > 0.5 && abs(speedY) > 0.5){
   ellipse(x2, y2+(radius/4) , radius*2, radius*1.5);
  } else {
    ellipse(x2, y2, radius*2, radius*2);
  }

  if (y2 > 380-radius){
    y2 = 380-radius;
    speedY *= -1;
    speedY *= damping;
    speedX *= friction;
  } else if (x2 < 320+radius){
    x2 = 320+radius;
    speedX *= -1;
  } if (x2 < 480+radius){
    x2 = 480+radius;
    speedX *= -1;
  }
 
 
}


