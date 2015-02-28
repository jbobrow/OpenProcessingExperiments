
float ballX, ballY, speedX, speedY;
float gravity, inertia;

void setup() {
  background(150);
  size(600, 400);
  smooth();
  frameRate(30);
  
  gravity = 2;
  inertia = 0.09;
  
  //starting point
  ballX = 400;
  ballY = 30; 
  //initial speed
  speedX = 30;
  speedY = 5;
    
}

void draw() {
  noStroke();
  fill(150);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  ellipse(ballX, ballY, 30, 30);
  
    ballX += speedX;
    ballY += speedY;
  
  
  // decrease X speed
  if(ballX >= 600) {
    speedX *= -0.95;
    speedX += inertia;
  }
  
  if(ballX <= 0)  {
    speedX *= -0.95;
    speedX += inertia;
  }

  //
  
  if(ballY >= 400-15 || ballY <= 0) {
    speedY *= -0.95;
  }
  //fix error y
  if(ballY >= 400-15) {
    ballY = 400-15;
    speedX += inertia;
  }
  
  //stop ball
  
  
  if(abs(speedX) <= 10) {
    noLoop();
  }
  
  speedY += gravity;
  
  println(ballX + " , " + ballY + " , " + "speed = " + speedX);
  
}



