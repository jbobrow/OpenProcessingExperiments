
// if on edge, bounce

int ballX= 23;
int ballY= 57;
int ballWidth=25;
int speedX=10;
int speedY=10;
int ballX2= 45;
int ballY2= 23;
int speedX2= 9;
int speedY2= 9;

void setup() {
  size(400,400);
  background(0);
}

void drawBall() {
  background (0);
  fill(255,0,0);
  ellipse(ballX,ballY,ballWidth,ballWidth);
  fill(0,0,255);
  ellipse(ballX2,ballY2,ballWidth,ballWidth);
}  
 
void checkCollisions() {
    if (ballX>width || ballX<0) {
      speedX=speedX*-1;
    }
     if (ballY>height || ballY<0) {
      speedY=speedY*-1;
     }
     if (ballX2>width || ballX2<0) {
      speedX2=speedX2*-1;}
     if (ballY2>height || ballY2<0) {
      speedY2=speedY2*-1;}
}

void update() {
  ballX=ballX+speedX;
  ballY=ballY+speedY;
  ballX2= ballX2+speedX2;
  ballY2= ballY2+speedY2;
  println(ballX);
}

void draw() {
  drawBall() ;
  update();
  checkCollisions();
  fill(255,0,0);
  rect(300,350,100,100);
 
}




