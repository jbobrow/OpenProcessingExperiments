

int ballSize = 20;
float ballX = 0;
float ballY = 0;
float dX;
float dY;


void setup(){
  size (600,600);
  ballX = width/2;
  ballY = height/2;
}

void draw() {
  background(0);
  noStroke();
  fill(#7DEACB);
  ellipse(ballX,ballY, ballSize,ballSize);

  dX = mouseX - ballX;
  ballX = ballX + dX/25.0;
  dY = mouseY - ballY;
  ballY = ballY + dY/25.0;
 
  } 


