
/* @pjs preload="face.jpg"; */

PImage myimage;
float ticker;
boolean goingup;
int maxblur;
float bluramount;
int lineInterval;

void setup() {
  size(640, 480);
  myimage = loadImage("face.jpg");
  ticker = 0;
  goingup = true;
  maxblur = 14;
  bluramount = 0.5;
  lineInterval = 32;
}

void draw() {
  int i;

  if (myimage.width > 0) {
    image(myimage, 0, 0, width, height);
    myimage.filter(BLUR, ticker);
    println(ticker);
    if (ticker<maxblur && goingup == true) {
      ticker+=bluramount;
    }
    if (ticker == maxblur) {
      goingup=false;
    }
    if (ticker <= maxblur && goingup==false) {
      ticker-=bluramount;
    }
    if (ticker==0 && goingup == false) {
      goingup = true;
    }
    for (i=0;i<height;i+=lineInterval) {
      stroke(255);
      line(0, i, width, i);
    }
    for (i=0;i<width;i+=lineInterval) {
      stroke(255);
      line(i, 0, i, height);
    }
  }
}



