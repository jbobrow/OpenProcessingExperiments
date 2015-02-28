
/*
@autor Ziqu Zou, 07/31/2013, Homework3.0-Moving ball
*/

int ballPosX; //ball's X position 
int ballPosY; //ball's Y position 
int ballW;

int speed;//speed of ball
int backGroundColor;//backgroundcolor

void setup() {
  size(700, 500);
  background(0);

  ballW=30;
  ballPosX=int(random(0, width));
  ballPosY=height/2;

  speed=5;

  fill(255);
}

void draw() {

  background(backGroundColor);


  ellipse(ballPosX, ballPosY, ballW, ballW);

  ballPosX+=speed;
  //ballPosY+=speed;

  if (ballPosX<25||ballPosX>(width-25)) //hit test
  {
    if (ballPosX<25)
    {
      backGroundColor=0;
      fill(255);
    }
    else if (ballPosX>(width-25)) {
      backGroundColor=255;
      fill(255, 0, 0);
    }

    speed=speed*-1;
    print("hit L&R");
  }
}



