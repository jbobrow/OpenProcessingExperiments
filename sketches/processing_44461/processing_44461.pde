
class ball {
  float ballX;
  float ballY;
  float ballSize;
  //int r;
  //int g;
  //int b;
  PImage block1;
  float ySpeed;
  float xSpeed;
  float gravity;
  float speedDecrease;
  boolean moveBalls=false;
  
   ball() {
     ballX=random(0,2500);
     ballY=height-40;
     ballSize=40;
     //r=int(random(0,255));
     //g=int(random(0,255));
     //b=int(random(0,255));
     ySpeed=random(4,5);
     xSpeed=0;
     gravity=.1;
     speedDecrease=-.75;
     block1=loadImage("block.png");
   }
   
   void display() {
     smooth();
     noStroke();
     //fill(r,g,b);
     //ellipse(ballX,ballY,ballSize,ballSize);
     image(block1,ballX,ballY,ballSize,ballSize);
     if(ballX<-50) {
       ballX=2550;
     } else if(ballX>2550) {
       ballX=-50;
       
     }
     println(speedDecrease);
   }
   
   void move() {
     if(spriteYpos>height-100 && spriteYspeed>0 && spriteXlocation>ballX-150 && spriteXlocation<ballX+150) {
       
       moveBalls=true;
     }
     else if (speedDecrease>-.74) {
       moveBalls=false;
       speedDecrease=-.75;
       ySpeed=random(4,5);
       xSpeed=0;
     }
     
     if(moveBalls==true) {
       ballMove();
     }
     
     ballX=ballX-spriteXspeed;
   }
   
   void ballMove() {
     
     if(spriteXlocation>ballX-150 && spriteXlocation<ballX) {
       ballX=ballX+xSpeed;
       xSpeed=random(.5,1);
     } else if (spriteXlocation<ballX+150 && spriteXlocation>ballX) {
       ballX=ballX+xSpeed;
       xSpeed=random(-5, -1);
     }
     
     ballY=ballY+ySpeed;
     ySpeed=ySpeed+gravity;
     
     if (ballY>height-40) {
       ySpeed=ySpeed*speedDecrease;
       speedDecrease=speedDecrease+.01*gravity;
       ballY=height-40;
     }
   }
} 


