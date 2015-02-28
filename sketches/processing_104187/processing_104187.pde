
int ballX=187;
 int ballY=52;
 int ballX2=65;
 int ballY2=12;
 int ballWidth=25;
 int ballRadius=ballWidth/2;
 int speedX=2;
 int speedY=3;
 int speedX2=4;
 int speedY2=2;
 
 void setup() {
   size(400, 400);
   background(0);
 }
 
 void draw() {
   drawBall();
   drawBox();
   update();
   avoidWalls();
   avoidBox();
 }
 //the two balls
 void drawBall() {
   background(0);
   fill(ballX*7, ballY*3, ballX/2);
   ellipse(ballX, ballY, ballWidth, ballWidth);
   ellipse(ballX2, ballY2, ballWidth, ballWidth); 
 }
 //this is the paddle
 void drawBox() {
   fill( 142, 101, 24);
   rectMode(CENTER);
   rect(mouseX, 390, 100,20);
 }
 //manipulates speed of ball
 void update() {
   ballX=ballX+speedX;
   ballY=ballY+speedY;
   
   ballX2=ballX2+speedX2;
   ballY2=ballY2+speedY2;
 }
 // makes balls bounce off wall
 void avoidWalls() {
   if (ballX>width-ballRadius || ballX<0+ballRadius) {
     speedX*=-1;
   } 
 
   if (ballY>height-ballRadius || ballY<0+ballRadius) {
     speedY*=-1;
   }
   
   
   if (ballX2>width-ballRadius || ballX2<0+ballRadius) {
     speedX2*=-1;
   } 
 
   if (ballY2>height-ballRadius || ballY2<0+ballRadius) {
     speedY2*=-1;
   }
 }
 
   void avoidBox() {
     if (ballX>mouseX-50-ballRadius && ballX<mouseX+50+ballRadius && ballY>380-ballRadius) {
       speedX*=-1;
       speedY*=-1;
     }
     
      if (ballX2>mouseX-50-ballRadius && ballX2<mouseX+50+ballRadius && ballY2>380-ballRadius) {
       speedX2*=-1;
       speedY2*=-1;
     }
   }
