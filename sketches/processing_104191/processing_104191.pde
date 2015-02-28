
int ballX=23;
int ballY=50;
int ball2X=564;
int ball2Y=456;
int ballWidth=25;
int speedX = 5;
int speedY = 5;
int speed2X = 5;
int speed2Y = 5;
int rectX;
int rectY;
int rectWidth = 50;
int rectHeight = 100;

void setup() {
  size(800, 700);
  background(255, 175, 0);
  fill(255);
  rect(rectX, rectY, rectWidth, rectHeight);
}

void draw() {
    drawBalls();
    update();
    checkForCollisions();
    checkForStaticColls();
}

void drawBalls() {
  background(255, 175, 0);
  ellipse(ballX, ballY, ballWidth, ballWidth);
  ellipse(ball2X, ball2Y, ballWidth, ballWidth);
  rect(mouseX, mouseY, rectWidth, rectHeight);
}

void update() {
  ballX+=speedX;
  println(ballX);
  ballY+=speedY;
  println(ballY);
  ball2X+=speed2X;
  println(ball2X);
  ball2Y+=speed2Y;
  println(ball2Y);
  
  rectX=mouseX;
  rectY=mouseY;
}

void checkForCollisions() {
  if(ballX+ballWidth/2>width)
  {
      speedX*=-1;
  }
  if(ballY+ballWidth/2>height) {
      speedY*=-1;
  }
  else if(ballX-ballWidth/2<0)
  {
      speedX*=-1;
  }
  else if(ballY-ballWidth/2<0) {
      speedY*=-1;
  }
  
  if(ball2X>width)
  {
      speed2X*=-1;
  }
  if(ball2Y>height) {
      speed2Y*=-1;
  }
  else if(ball2X<0)
  {
      speed2X*=-1;
  }
  else if(ball2Y<0) {
      speed2Y*=-1;
  }
}

void checkForStaticColls() {
  if(ballX+ballWidth/2>rectX && ballX+ballWidth/2<rectX+rectHeight && ballY>rectY && ballY<rectY+rectHeight)
  {
    speedX*=-1;
  }
  
  if(ballX+ballWidth/2>rectX && ballX-ballWidth/2<rectX+rectWidth && ballY>rectY && ballY<rectY+ballWidth)
  {
    speedY*=-1;
  }
  
  
  if(ball2X+ballWidth/2>rectX && ball2X+ballWidth/2<rectX+rectHeight && ball2Y>rectY && ball2Y<rectY+rectHeight)
  {
    speed2X*=-1;
  }
  
  if(ball2X+ballWidth/2>rectX && ball2X+ballWidth/2<rectX+rectWidth && ball2Y>rectY && ball2Y<rectY+ballWidth)
  {
    speed2Y*=-1;
  }
  
  if(ballX==ball2X && ballY==ball2Y)
  {
    speedX*=-1;
  }
}
