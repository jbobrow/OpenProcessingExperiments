
int ballX;
int ballY;
int ballSpeedX = 5;
int ballSpeedY = 5;
int paddleWidth = 200;
int paddleHeight = 30;
int paddleColor;

void setup() {
  size(800, 600);
  noCursor();//hides cursor
  ballX = width/2;//sets the ball to be drawn
  ballY = height/2;//in the middle
}

void draw() {
  background(128);
  moveBall();
  checkCollide();
  drawPaddle();
  drawBall();
  ballColor();
  drawPaddle2();
  drawBall2();
}

void moveBall() {
  ballX = ballX + ballSpeedX;//takes the x and the y of the ball
  ballY = ballY + ballSpeedY;//and adds ballSpeedX/Y to the value
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {//checks if the X of the ellipse
    ballSpeedX = ballSpeedX * -1;// to make it change direction, wether itÃ¢ï¿½ï¿½s at 0 or the maximum to make it bounce off the left/right edges.
  }
  if (ballY < 0) {//checks the Y of the ellipse(itÃ¢ï¿½ï¿½s also the top edge)
    ballSpeedY = ballSpeedY * -1;//changes the direction of the Y depending on the value of ballY
  }
 if (ballY > height-paddleHeight) {//checks where the Y of the ball is and if its greater than the height of the paddle.
    if (ballX > mouseX && ballX < mouseX + paddleWidth) {//checks the Y & the X of the ellipse, if the ballX is greater than the X of the mouse and less than the width it will change the speed of ballSpeedY reversing its direction.
      ballSpeedY = ballSpeedY * -1;
    } else {
      text("GAME OVER!", width/2, height/2);//If the condition is false the text Ã¢ï¿½ï¿½GAME OVER!Ã¢ï¿½ï¿½ will be printed

      noLoop();    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() {//creates the Ã¢ï¿½ï¿½paddlesÃ¢ï¿½ï¿½ AKA rectangles 
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, paddleWidth, paddleHeight);
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));//sets the value of the color of the rectangle, depending on where the X of the mouse is, the color will change when the mouse is pressed.
}


void ballColor(){
  if(ballY<height && ballX<width){
  fill(random(255,0));
  }
  else {
  fill(0);
  }
  }
  void paddleWidth(){
  if(ballY>=paddleWidth){
  paddleWidth = paddleWidth -10;
  }
  else {
  paddleWidth = paddleWidth - 5;
  }  
 }
 void moveBall() {
  ballX = ballX + ballSpeedX;//takes the x and the y of the ball
  ballY = ballY + ballSpeedY;//and adds ballSpeedX/Y to the value
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {//checks if the X of the ellipse
    ballSpeedX = ballSpeedX * -1;// to make it change direction, wether itÃ¢ï¿½ï¿½s at 0 or the maximum to make it bounce off the left/right edges.
  }
  if (ballY < 0) {//checks the Y of the ellipse(itÃ¢ï¿½ï¿½s also the top edge)
    ballSpeedY = ballSpeedY * -1;//changes the direction of the Y depending on the value of ballY
  }
 if (ballY > height-paddleHeight) {//checks where the Y of the ball is and if its greater than the height of the paddle.
    if (ballX > mouseX && ballX < mouseX + paddleWidth) {//checks the Y & the X of the ellipse, if the ballX is greater than the X of the mouse and less than the width it will change the speed of ballSpeedY reversing its direction.
      ballSpeedY = ballSpeedY * -1;
    } else {
      text("GAME OVER!", width/2, height/2);//If the condition is false the text Ã¢ï¿½ï¿½GAME OVER!Ã¢ï¿½ï¿½ will be printed

      noLoop();    }
  }
}

void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() {//creates the Ã¢ï¿½ï¿½paddlesÃ¢ï¿½ï¿½ AKA rectangles 
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, paddleWidth, paddleHeight);
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)))
}


void ballColor(){
  if(ballY<height && ballX<width){
  fill(random(255,0));
  }
  else {
  fill(0);
  }
  }
  void paddleWidth(){
  if(ballY>=paddleWidth){
  paddleWidth = paddleWidth -10;
  }
  else {
  paddleWidth = paddleWidth - 5;
  }  
 }
void moveBall() {
  ballX = ballX + ballSpeedX;
  ballY = ballY + ballSpeedY;
  println("ballSpeedX: " + ballSpeedX + ", ballSpeedY: " + ballSpeedY);
}

void checkCollide() {
  if (ballX < 0 || ballX > width) {//checks if the X of the ellipse
    ballSpeedX = ballSpeedX * -1
  }
  if (ballY < 0) {
    ballSpeedY = ballSpeedY * -1;
  }
 if (ballY > height-paddleHeight) {
    if (ballX > mouseX && ballX < mouseX + paddleWidth) {
      ballSpeedY = ballSpeedY * -1;
    } else {
      text("GAME OVER!", width/2, height/2);
      noLoop();    }
  }
}
void drawBall() {
  noStroke();
  ellipse(ballX, ballY, 20, 20);
}

void drawPaddle() { 
  stroke(paddleColor);
  strokeWeight(4);
  rect(mouseX, height-paddleHeight-4, paddleWidth, paddleHeight);
}

void mousePressed() {
  paddleColor = int((map(mouseX, 0, width, 0, 255)));
}


void ballColor(){
  if(ballY<height && ballX<width){
  fill(random(255,0));
  }
  else {
  fill(0);
  }
  }
  void paddleWidth(){
  if(ballY>=paddleWidth){
  paddleWidth = paddleWidth -10;
  }
  else {
  paddleWidth = paddleWidth - 5;
  }  
 }
 void drawPaddle2() {//creates the â��paddlesâ�� AKA rectangles 
  stroke(paddleColor);
  strokeWeight(4);
  rect(200,paddleHeight, paddleWidth, paddleHeight);
}
void drawBall2() {
  noStroke();
  ellipse(ballX, ballY-200, 20, 20);
}
if(key == 'a') {
drawPaddle2 -10;
}
