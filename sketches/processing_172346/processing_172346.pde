
float ballX = 30;
float ballY = 30;
float dX = random(1,2);
float dY = random(1, 2);
 
void setup() {
  size(500,500);
}
void draw() {
  background(0);
  fill(255,255,0);
rect(450,mouseY,20,100);
fill(255,0,255);
  ellipse(ballX, ballY, 20, 20);
    if (ballX > width) {
    dX = -dX; 
  }
 
  if (ballX < 0) {
    dX = -dX;
  }
 
  if (ballY > height) {
    dY = -dY; 
  }
 
  if (ballY < 0) {
    dY = -dY; 
   
  }
 
  ballX = ballX + dX;
  ballY = ballY + dY;
}

