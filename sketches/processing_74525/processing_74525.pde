
float SquareX = 20;
float SquareY = 20;
float SquareSize = 100;
float SquareSpeed = 1;
float SquareSaturation = 1;
float SpeedCoinX = 500;
float SpeedCoinY = 300;
float SpeedCoinSize = 40;
float SpeedCoinXDir = 1;
float SpeedCoinYDir = -1;
float SlowCoinX = 200;
float SlowCoinY = 300;
float SlowCoinSize = 40;
float SlowCoinXDir = 1;
float SlowCoinYDir = -1;
int Luminance = 500;

void setup() {
  size(700, 450);
}

void draw() {
  colorMode(HSB, 1000);
  background(SquareX+SquareY, SquareSaturation, Luminance);

  colorMode(RGB, 255);
  fill(255);
  textSize(10);
  textAlign(LEFT);
  text(SquareSpeed, SquareX+SquareSize+10, SquareY-10); 



  //Strips

  colorMode(HSB, 1000);
  noStroke();

  fill(SquareX+SquareY, SquareSaturation, Luminance+200, 100);
  rect(SquareX, 0, SquareSize, height);
  rect(0, SquareY, width, SquareSize);



  //SpeedCoin

  colorMode(RGB, 255);
  fill(255);
  ellipse(SpeedCoinX, SpeedCoinY, SpeedCoinSize, SpeedCoinSize);
  SpeedCoinX = SpeedCoinX + SpeedCoinXDir;
  SpeedCoinY = SpeedCoinY + SpeedCoinYDir;

  //SlowCoin

  colorMode(RGB, 255);
  fill(0);
  ellipse(SlowCoinX, SlowCoinY, SlowCoinSize, SlowCoinSize);
  SlowCoinX = SlowCoinX + SlowCoinXDir;
  SlowCoinY = SlowCoinY + SlowCoinYDir;


  //Square

  colorMode(HSB, 1000);
  noStroke();

  fill(SquareX+SquareY, SquareSaturation, Luminance+200, 900);
  rect(SquareX, SquareY, SquareSize, SquareSize);


  //Touch

  if (SpeedCoinX+SpeedCoinSize/2>SquareX && SpeedCoinX-SpeedCoinSize/2<SquareX+SquareSize && SpeedCoinY+SpeedCoinSize/2>SquareY && SpeedCoinY-SpeedCoinSize/2<SquareY+SquareSize)
  {
    SquareSpeed = SquareSpeed + 0.01;
    SquareSaturation = SquareSaturation + 1;
    colorMode(RGB, 255);
    fill(255);
    textSize(10);
    textAlign(RIGHT);
    text("POWER UP...", SquareX-10, SquareY-10); 

    Luminance = 600;

    if (SpeedCoinX-SpeedCoinSize/2<SquareX || SpeedCoinX+SpeedCoinSize/2>SquareX+SquareSize) {
      SpeedCoinXDir = -SpeedCoinXDir;
    }
    if (SpeedCoinY-SpeedCoinSize/2<SquareY || SpeedCoinY+SpeedCoinSize/2>SquareY+SquareSize) {
      SpeedCoinYDir = -SpeedCoinYDir;
    }
  } 

  else if (SlowCoinX+SlowCoinSize/2>SquareX && SlowCoinX-SlowCoinSize/2<SquareX+SquareSize && SlowCoinY+SlowCoinSize/2>SquareY && SlowCoinY-SlowCoinSize/2<SquareY+SquareSize)
  {
    SquareSpeed = SquareSpeed - 0.01;
    SquareSaturation = SquareSaturation - 1;
    colorMode(RGB, 255);
    fill(255);
    textSize(10);
    textAlign(RIGHT);
    text("POWER DOWN...", SquareX-10, SquareY-10);

    Luminance = 400;

    if (SlowCoinX-SlowCoinSize/2<SquareX || SlowCoinX+SlowCoinSize/2>SquareX+SquareSize) {
      SlowCoinXDir = -SlowCoinXDir;
    }
    if (SlowCoinY-SlowCoinSize/2<SquareY || SlowCoinY+SlowCoinSize/2>SquareY+SquareSize) {
      SlowCoinYDir = -SlowCoinYDir;
    }
  } else Luminance = 500;



  //right border || left border
  if (SpeedCoinX > width-SpeedCoinSize/2 || SpeedCoinX < SpeedCoinSize/2) { 
    SpeedCoinXDir = -SpeedCoinXDir;
  }

  //top border || bottom border
  if (SpeedCoinY < SpeedCoinSize/2 || SpeedCoinY > height-SpeedCoinSize/2) {
    SpeedCoinYDir = -SpeedCoinYDir;
  }

  //right border || left border
  if (SlowCoinX > width-SlowCoinSize/2 || SlowCoinX < SlowCoinSize/2) { 
    SlowCoinXDir = -SlowCoinXDir;
  }

  //top border || bottom border
  if (SlowCoinY < SlowCoinSize/2 || SlowCoinY > height-SlowCoinSize/2) {
    SlowCoinYDir = -SlowCoinYDir;
  }

  //Commands

  if (keyPressed) {
    if (key == 'w' | keyCode==UP && SquareY>0) { 
      SquareY = SquareY-SquareSpeed;
    }
    if (key == 'a' | keyCode==LEFT && SquareX>0) { 
      SquareX = SquareX-SquareSpeed;
    }
    if (key == 's' | keyCode==DOWN && SquareY+SquareSize<height) { 
      SquareY = SquareY+SquareSpeed;
    }
    if (key == 'd' | keyCode==RIGHT && SquareX+SquareSize<width) { 
      SquareX = SquareX+SquareSpeed;
    }
  }

}
