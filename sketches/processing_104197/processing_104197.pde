
int ballX=350;
int ballY=350;
int ballWidth=25;
int speedX=9;
int speedY=9;
int speedA=7;
int speedB=7;
int ballR=ballWidth/2;
int ballA=200;
int ballB=100;


void setup()  {
  size(800,800);
  background(0,0,255);
}
  void draw() {
    drawBall();
    update();
    checkCollisionsX();
    checkCollisionsA();
  

    
  }
  
    void drawBall() {
      //redBall
    background(255,255,255);
    fill(255,0,0);
    ellipse(ballX, ballY, ballWidth, ballWidth);
    //blueBall
    fill(0,0,255);
    ellipse(ballA, ballB, ballWidth, ballWidth);
    //paddle
    fill(0,255,0);
    rect(700,700,75,100);
    }
    void update() {
      
    ballX=ballX+speedX;
    println(ballX);
    ballY=ballY+speedY;
    println(ballY);
    ballA=ballA+speedA;
    println(ballA);
    ballB=ballB+speedB;
    println(ballB);
    }
    void checkCollisionsX() {
    if (ballX>width) {
      speedX=speedX*-1;
    }
   else if(ballX<0) {
     speedX=speedX*-1;
   }
    if(ballY>height){
     speedY=speedY*-1;
   }
   else if(ballY<0){
     speedY=speedY*-1;
   }
    }
    
    
    void checkCollisionsA() {
    if(ballA>width) {
     speedA=speedA*-1;
   }
   else if(ballA<0) {
     speedA=speedA*-1;
   }
   if(ballB>height) {
     speedB=speedB*-1;
   }
   else if(ballB<0) {
     speedB=speedB*-1;
   }


}
