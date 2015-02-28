
// Ball
float x2, y2;
float radius;
float speedX, speedY;
float damping;
float friction;
float gravity;

// Blocks
float bx, by;
float bw, bh;
 
void setup(){
  size(650, 400);
  background(0, 255, 0);
   
  x2 = 0.0;
  y2 = 0.0;
  radius = 5.0;
  speedX = 2.0;
  speedY = 0;
  damping = 0.9;
  //friction = 0.75;
  gravity = 0.01;
  drawBlocks();
   
}
  
void drawBlocks(){
  float x = 0.0;
  float y = 30.0;
   
  noStroke(); // Box 1
  fill(51, 0, 0);
  rect(50, 50, 90, 30);
   
  pushMatrix();  // Box 2
  translate(0, 50);
  rect(50, 270, 90, 30);
  popMatrix();
   
  pushMatrix();  // Box 3
  translate(0, 50);
  rect(500, 0, 90, 30);
  popMatrix();
   
  pushMatrix();  // Box 4
  translate(0, 200);
  rect(500, 120, 90, 30);
  popMatrix();
   
  pushMatrix(); // Box 5 (center)
  translate(0, 0);
  rect(300, 200, 50, 30);
  popMatrix();
}
   
void draw(){
  background(51, 0, 255);
  drawBlocks();
  fill(70, 0, 130);
  ellipse(x2, y2, radius*4, radius*4);
  
  
  x2 += speedX;
  speedY += gravity;
  y2 += speedY;
  
  if (x2 > width-radius) {
    x2 = width-radius;
    speedX *= -1;
  }
  if (x2 < radius) {
    x2 = radius;
    speedX *= -1;
  }
  
  if (y2 > width-radius){
    y2 = width-radius;
    speedY *= -1;
  }
  
  if (y2 < radius) {
    y2 = radius;
    speedY *= -1;
  }
  
  if (y2 > height-radius){
    y2 = height-radius;
    speedY *= -1;
    speedY *= damping;
    //speedX *= friction;
  }
  
  if (y2 == 400-radius && abs(speedX) > 0.5 && abs(speedY) > 0.5){
   ellipse(x2, y2+(radius/4) , radius*2, radius*1.5);
  } else {
    ellipse(x2, y2, radius*2, radius*2);
  }
//begin block collision

//Block 1
//Left Edge
 if (y2 > 50 && y2 < 50 + 30 && x2 > 50-radius && x2 < 50 + 45) {
 x2 = 50-radius; 
 speedX *= -1;
}
  //Right Edge
  if (x2 > by && y2 < 50 + 30 && x2 < 50 + 90+radius && x2 > 50 + 90/2) {
   speedX *= -1;
 }
 //Top Edge
 if (x2 > 50 && x2 < 50 + 90 && y2 > 50-radius && y2 < 50 + 30/2) {
   speedY *= -1;
 }
 
 //Bottom Edge
 if (x2 > 50 && x2 < 50 + 90 && y2 < 50 + 30+radius && y2 > 50 + 30/2) {
   speedY *= -1;
 }
 
 // Block 2
 // Left Edge
  if (y2 > 370 &&  y2 < 370 + 30 && x2 > 50-radius && x2 < 50 + 45) {
    x2 = 50-radius;
    speedX *= -1;
  }

  // Right Edge
  if (y2 > 370 &&  y2 < 370 + 30 && x2 < 50 + 90+radius && x2 > 50 + 45) {
    speedX *= -1;
  }
  
  // Top Edge
  if (x2 > 50 &&  x2 < 50 + 90 && y2 > 370-radius && y2 < 370 + 15) {
    speedY *= -1;
  }
  
  // Bottom Edge
   if (x2 > 50 &&  x2 < 50 + 90 && y2 < 370 + 30+radius && y2 > 370 + 15) {
    speedY *= -1;
  }
 
 //Block 3
// Left Edge
  if (y2 > 0 &&  y2 < 0 + 30 && x2 > 500-radius && x2 < 500 + 45) {
    x2 = 500-radius;
    speedX *= -1;
  }

  // Right Edge
  if (y2 > 0 &&  y2 < 0 + 30 && x2 < 500 + 90+radius && x2 > 500 + 45) {
    speedX *= -1;
  }
  
  // Top Edge
  if (x2 > 500 &&  x2 < 500 + 90 && y2 > 0-radius && y2 < 0 + 15) {
    speedY *= -1;
  }
  
  // Bottom Edge
   if (x2 > 500 &&  x2 < 500 + 90 && y2 < 0 + 30+radius && y2 > 0 + 15) {
    speedY *= -1;
  }
 
 // Block 4
 // Left Edge
  if (y2 > 120 &&  y2 < 120 + 30 && x2 > 500-radius && x2 < 500 + 45) {
    x2 = 500-radius;
    speedX *= -1;
  }

  // Right Edge
  if (y2 > 120 &&  y2 < 120 + 30 && x2 < 500 + 90+radius && x2 > 500 + 45) {
    speedX *= -1;
  }
  
  // Top Edge
  if (x2 > 500 &&  x2 < 500 + 90 && y2 > 120-radius && y2 < 120 + 15) {
    speedY *= -1;
  }
  
  // Bottom Edge
   if (x2 > 500 &&  x2 < 500 + 90 && y2 < 120 + 30+radius && y2 > 120 + 15) {
    speedY *= -1;
  }
 
 //Block 5
 // Left Edge
  if (y2 > 185 &&  y2 < 185 + 30 && x2 > 300-radius && x2 < 300 + 25) {
    x2 = 300-radius;
    speedX *= -1;
  }

  // Right Edge
  if (y2 > 185 &&  y2 < 185 + 30 && x2 < 300 + 50+radius && x2 > 300 + 25) {
    speedX *= -1;
  }
  
  // Top Edge
  if (x2 > 300 &&  x2 < 300 + 50 && y2 > 185-radius && y2 < 185 + 25) {
    speedY *= -1;
  }
  
  // Bottom Edge
   if (x2 > 300 &&  x2 < 300 + 50 && y2 < 185 + 50+radius && y2 > 185 + 25) {
    speedY *= -1;
  }
  
}


