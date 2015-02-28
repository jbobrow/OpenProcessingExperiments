
int ballX=23;
int ballY=57;
int ballWidth=25;
int ballR= ballWidth/2;
int speedX=2;
int speedY=4;
int speedA=2;
int speedB=4;
int ballA=50;
int ballB=0;

void setup(){
 size(400, 400);
 background (0);
}

void draw() {
  drawBall();
  update();
  checkCollisions();
  recdraw();

  }

void drawBall() {
  background(12,186,247);
  fill (229, 7, 29);
  ellipse(ballX, ballY, ballWidth, ballWidth);
  fill (229, 76, 219);
  ellipse(ballA, ballB, ballWidth, ballWidth);
  /*  
  if (ballA>width-ballR) {
    speedA=speedA*-1;
  }
  else if (ballA<0-ballR) {
    speedX=speedX*-1;
}
*/
}
void update() {
  ballX=ballX+speedX;
  ballY=ballY+speedY;
  println(ballX);
   ballA=ballA+speedA;
  ballB=ballB+speedB;
  println(ballX);
}
void checkCollisions() {
  if (ballX>width || ballX<0) {
  speedX=speedX*-1;
}
 if (ballY>height || ballY<0) {
   speedY= speedY*-1;
 }
   if (ballA>width || ballA<0) {
  speedA=speedA*-1;
}
 if (ballB>height || ballB<0) {
   speedB= speedB*-1;
 }
} 
void recdraw() {
     fill(250, 243, 13);
     rect(50, height-10, 250, 250);
     
     
 }
