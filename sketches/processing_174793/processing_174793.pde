
//By Christina Orcutt
//Create fun abstract art.  Click and Drag for a fun surprise.

float cirWidth = 80;
float cirHeight = 80;

float ballX = random(500);
float ballY = random(500);
float xSpeed = 3;
float ySpeed = 5;

float radius = 50;
int radius2 = 50;
boolean increase = true;

void setup() {
  size(1280, 720); 
  rectMode(CORNER);
  ellipseMode(CENTER);
  ellipseMode(RADIUS);
}

void draw() {

  //background(0);

  float boxLeft = mouseX;
  float boxRight = mouseX + cirWidth;
  float boxTop = mouseY;
  float boxBottom = mouseY + cirHeight;

  float currentBallLeft = ballX - radius;
  float currentBallRight = ballX + radius;
  float currentBallTop = ballY - radius;
  float currentBallBottom = ballY + radius;

  float nextBallLeft = currentBallLeft + xSpeed;
  float nextBallRight = currentBallRight + xSpeed;
  float nextBallTop = currentBallTop + ySpeed;
  float nextBallBottom = currentBallBottom + ySpeed;


  if (doBoxesIntersect(boxLeft, boxRight, boxTop, boxBottom, nextBallLeft, nextBallRight, currentBallTop, currentBallBottom)) {
    xSpeed *= -1;
    fill(random(25), random(255), random(255));
    //ellipse(ballX*xSpeed, ballY*ySpeed, radius, radius);
  } else if (ballX+xSpeed < 0 || ballX+xSpeed > width) {
    xSpeed *= -1;
  }


  if (doBoxesIntersect(boxLeft, boxRight, boxTop, boxBottom, currentBallLeft, currentBallRight, nextBallTop, nextBallBottom)) {
    ySpeed *= -1;
    fill(random(25), random(255), random(255));
    //ellipse(0, 0, radius, radius);
    //println(ballX);
  } else if (ballY+ySpeed < 0 || ballY+ySpeed > height) {
    ySpeed *= -1;
  }

  ballX += xSpeed;
  ballY += ySpeed;

  stroke(mouseX*3%10, mouseY*5%20, (mouseX+mouseY)*9%255);
  ellipse(ballX, ballY, radius, radius);

  //ellipse(ballX, -ballY, radius, radius);
  stroke(mouseX*3%40, mouseY*5%255, (mouseX+mouseY)*9%255);
  ellipse(mouseX, mouseY, cirWidth, cirHeight);

  stroke(mouseX*3%40, mouseY*5%255, (mouseX+mouseY)*9%255);
  strokeWeight(10);
  fill(0, 0, 0, 0);
}


boolean doBoxesIntersect(float aBoxLeft, float aBoxRight, float aBoxTop, float aBoxBottom, 
float bBoxLeft, float bBoxRight, float bBoxTop, float bBoxBottom) {

  return bBoxRight > aBoxLeft && bBoxBottom > aBoxTop && aBoxRight > bBoxLeft && aBoxBottom > bBoxTop;
}
void mouseDragged() {
  ellipse(mouseX, mouseY, radius2, radius2);


  if (radius2 < 50) {
    increase = true;
  } else if (radius2 > 150) {
    increase = false;
  }

  if (increase == true) {
    radius2+=2;
  } else {
    radius2 -=2;
  }
}
