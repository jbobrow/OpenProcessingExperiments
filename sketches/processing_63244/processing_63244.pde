

int xPosRoy = 0;
int yPosRoy = 0;
int xPosMoss = 600;
int yPosMoss = 300;
int xPosJen = 1150;
int yPosJen = 550;

int xDirRoy =5;
int yDirRoy = 5;
int xDirMoss = 5;
int yDirMoss = 5;
int xDirJen =5;
int yDirJen = 5;




PImage roy;
PImage jen;
PImage moss;
PImage tne;

void setup() {
  size(1280, 720);
  roy = loadImage("roy.png");
  roy.resize(0, 150);
  moss = loadImage("moss.png");
  moss.resize(0, 150);
  jen=loadImage("jen.png");
  jen.resize(0, 140);
  tne= loadImage("TNETENNBA.png");
  tne.resize(400,0);
}



void draw() {
  background (0, 127, 10);  



  if (xPosRoy <0 || xPosRoy > width-50) {
    xDirRoy = xDirRoy*-1;
  }
  if (yPosRoy <0 || yPosRoy > height-150) {
    yDirRoy = yDirRoy*-1;
  }

  if (xPosMoss <0 || xPosMoss > width-50) {
    xDirMoss = xDirMoss*-1;
  }
  if (yPosMoss <0 || yPosMoss > height-150) {
    yDirMoss = yDirMoss*-1;
  }

  if (xPosJen <0 || xPosJen > width-50) {
    xDirJen = xDirJen*-1;
  }
  if (yPosJen <0 || yPosJen > height-140) {
    yDirJen = yDirJen*-1;
  }

  if ((xPosRoy >= xPosMoss) && (xPosRoy <= xPosMoss+50) && (yPosRoy >= yPosMoss-50) && (yPosRoy <= yPosMoss+200)) {
    xDirRoy= xDirRoy*-1;
    xDirMoss= xDirMoss*-1;
  }

  if ((xPosRoy >= xPosJen) && (xPosRoy <= xPosJen+40) && (yPosRoy >= yPosJen-50) && (yPosRoy <= yPosJen+160)) {
    xDirRoy= xDirRoy*-1;
    xDirJen= xDirJen*-1;
  }

  if ((xPosJen >= xPosMoss) && (xPosJen <= xPosMoss+50) && (yPosJen >= yPosMoss-50) && (yPosJen <= yPosMoss+200)) {
    xDirJen= xDirJen*-1;
    xDirMoss= xDirMoss*-1;
  }

  image(roy, xPosRoy, yPosRoy);
  xPosRoy = xPosRoy + xDirRoy;
  yPosRoy = yPosRoy + yDirRoy;

  image(moss, xPosMoss, yPosMoss);
  xPosMoss = xPosMoss + xDirMoss;
  yPosMoss = yPosMoss + yDirMoss;


  image(jen, xPosJen, yPosJen);
  xPosJen = xPosJen + xDirJen;
  yPosJen = yPosJen + yDirJen;

if(mousePressed){
  background(0,127,10);
  image(roy, xPosRoy, yPosRoy);
  xPosRoy = xPosRoy + 5*xDirRoy;
   yPosRoy = yPosRoy + 5*yDirRoy; 

  image(moss, xPosMoss, yPosMoss);
  xPosMoss = xPosMoss + 5*xDirMoss;
    yPosMoss = yPosMoss + 5*yDirMoss;


  image(jen, xPosJen, yPosJen);
  xPosJen = xPosJen + 5*xDirJen;
   yPosJen = yPosJen + 5*yDirJen;
}

image(tne,width/2-200, height/2-26);
}



