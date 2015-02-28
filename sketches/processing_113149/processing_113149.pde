
int circleX = 100;
int circleY = 100;
int speedX = 4;
int speedY = 6;

int circleA = 500;
int circleB = 100;
int speedA = 3;
int speedB = 4;

int circleC = 400;
int circleD = 400;
int speedC = 6;
int speedD = 4;

void setup() {
  size(600, 600);
  frameRate(600);
}


void draw () {
  background(0);

  noStroke();
  fill(200, 20, 30);
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  ellipse(circleX, circleY, 150, 150);

  if (circleX>width) {
    speedX=-speedX;
  }
  if (circleX<=0) {
    speedX=-speedX;
  }
  if (circleY>height) {
    speedY=-speedY;
  }
  if (circleY<=0) {
    speedY=-speedY;
  }
  if (circleX>width) {
    fill (255, 115, 0);
    ellipse(circleX/2, circleY/2, 200, 200);
    fill(162,255,0);
    ellipse(200,200,150,150);
  }
  if (circleX<=0) {
    fill (255, 115, 0);
    ellipse(400, 400, 500, 500);
    fill(25,255,0);
    ellipse(100,100,200,200);
  }
  if (circleX>width) {
    fill (0, 255, 103);
    ellipse(500, 500, 300, 300);
    fill(65,218,239);
    ellipse(400,400,150,150);
  }
  
  if (circleX<=0) {
    fill (0, 255, 103);
    ellipse(60, 60, 100, 100);
    fill(255,181,92);
    ellipse(300, 300, 100, 100);
  }



  noStroke();
  fill(240, 255, 0);
  circleA = circleA - speedA;
  circleB = circleB - speedB;
  ellipse (circleA, circleB, 250, 250);
  if (circleA>width) {
    speedA=-speedA;
  }
  if (circleA<=0) {
    speedA=-speedA;
  }
  if (circleB>height) {
    speedB=-speedB;
  }
  if (circleB<=0) {
    speedB=-speedB;
  }


  if (circleA>width) {
    fill (255, 115, 0);
    ellipse(200, 200, 100, 100);
    ellipse(400,400,100,100);
  }
  if (circleA<=0) {
    fill (255, 115, 0);
    ellipse(100, 100, 100, 100);
    ellipse(150,150,300,300);
  }
  if (circleA>width) {
    fill (0, 49, 255);
    ellipse(500, 500, 100, 100);
    ellipse(240,400,150,150);
  }
  if (circleA<=0) {
    fill (0, 49, 255);
    ellipse(300, 300, 200, 200);
    ellipse(150,500,400,400);
  }





  noStroke();
  fill(63, 173, 5);
  circleC = circleC + speedC;
  circleD = circleD + speedD;
  ellipse(circleC, circleD, 200, 200);
  if (circleC>width) {
    speedC=-speedC;
  }
  if (circleC<=0) {
    speedC=-speedC;
  }
  if (circleD>height) {
    speedD=-speedD;
  }
  if (circleD<=0) {
    speedD=-speedD;
  }

  if (circleC>width) {
    fill (211, 0, 255);
    ellipse(400, 250, 250, 250);
    fill (211, 200, 20);
    ellipse(50, 350, 100, 100);
  }
  if (circleC<=0) {
    fill (56, 255, 0);
    ellipse(500, 450, 200, 200);
    fill(255,236,0);
    ellipse(300,500,250,250);
  }
  if (circleC>width) {
    fill (255, 121, 0);
    ellipse(circleC/3, circleD/3, 100, 100);
    fill(0,231,255);
    ellipse(600,400,600,600);
  }
  if (circleC<=0) {
    fill (0, 255, 103);
    ellipse(400, 500, 500, 500);
    fill(25,0,189);
    ellipse(circleC/2,circleD/2,300,300);
  }
}



