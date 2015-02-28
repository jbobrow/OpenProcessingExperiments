
class ball {


  //declare class variables

  float ballY;
  float ballX;
  float ballSize;
  PImage block1;
  float ySpeed;
  float xSpeed;
  float gravity;
  float speedDecrease;
  boolean moveBalls=false;

  //initialize and give value to variables

  ball() {
    ballX=random(0, 2500);
    ballY=height-40;
    ballSize=40;
    ySpeed=random(4, 5);
    xSpeed=0;
    gravity=.1;
    speedDecrease=-.75;
    block1=loadImage("block.png");
  }

  //continuously load blocks

  void display() {
    smooth();
    noStroke();
    image(block1, ballX, ballY, ballSize, ballSize);
    if (ballX<-50) {
      ballX=2550;
    } 
    else if (ballX>2550) {
      ballX=-50;
    }
  }

  void move() {

    //collision detection

    if (spriteYpos>height-100 && spriteYspeed>0 && spriteXlocation>ballX-150 && spriteXlocation<ballX+150) {

      //boolean to control whether balls are moving

      moveBalls=true;
    }
    else if (speedDecrease>-.74) {
      moveBalls=false;
      speedDecrease=-.75;
      ySpeed=random(4, 5);
      xSpeed=0;
    }

    if (moveBalls==true) {
      ballMove();
    }

    ballX=ballX-spriteXspeed;
  }

  void ballMove() {

    //how they move in groups once one ball has collided with sprite

      if (spriteXlocation>ballX-150 && spriteXlocation<ballX) {
      ballX=ballX+xSpeed;
      xSpeed=random(.5, 1);
    } 
    else if (spriteXlocation<ballX+150 && spriteXlocation>ballX) {
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

  //reset ball parameters

  void ballReset() {
    ballX=random(0, 2500);
    ballY=height-40;
    ballSize=40;
    xSpeed=0;
    gravity=.1;
    speedDecrease=-.75;
  }
} 


