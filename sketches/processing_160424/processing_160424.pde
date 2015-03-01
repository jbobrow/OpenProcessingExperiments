
/* Homework 2: Dynamic Code 
 by Leiah Fournier */

// *UPDATED* Variables
int posX = width/2;
int speedX = 3;
int circleSize = 20;

int posY = height/2;
int speedY = 5;
int rectSize = 10;

int rpX = 15;
int lpX = width-15;
 
int rpY = height/2;
int lpY = height/2;
 
 
  rectMode(CENTER);


void setup () {
  size (800, 800);
}

void draw () {
  background (0);

  /*
  //Border
  fill(255);
  strokeWeight(5);
  rect(400, 50, 10, 25);
  rect(400, 100, 10, 25);
  rect(400, 150, 10, 25);
  rect(400, 200, 10, 25);
  rect(400, 250, 10, 25);
  rect(400, 300, 10, 25);
  rect(400, 350, 10, 25);
  rect(400, 400, 10, 25);
  rect(400, 450, 10, 25);
  rect(400, 500, 10, 25);
  rect(400, 550, 10, 25);
  rect(400, 600, 10, 25);
  rect(400, 650, 10, 25);
  rect(400, 700, 10, 25);
  rect(400, 750, 10, 25);
  rect(400, 800, 10, 25);
  */
  
  // *UPDATED* Border
  fill(255);
  strokeWeight(5);
  for (int i = 0; i<25; i++) {
    rect(width/2, 28+i*30, 10, 25);
  }

  //Score Left
  textSize(75);
  text("0", 200, 100);

  //Score Right
  textSize(75);
  text("0", 550, 100);

  //Bar Left
  fill (255);
  noStroke();
  rect(lpX, lpY, 10, 80);

  // *UPDATE* Circle
  ellipseMode(CENTER);
  ellipse(posX, posY, circleSize, circleSize);

  //Impact
  posX+=speedX;
  if (posX>=rpx-circleSize/2 || posX<=lpx-circleSize/2) {
    speedX*=-1;
  }

  //Bar Right  
  rect(rpX, rpY, 10, 80);
  
  //Bar Movement 
  posY+=speedY;
  if (posY>=730-rectSize/2 || posY<=0-rectSize/2) {
    speedY*=-1;
  }
} 
