

int purpX = 0;
int purpY = 200;
int orangeX = -250;
int orangeY = 200;
int breenX = -500;
int breenY = 200;
int pinkX = -750;
int pinkY = 200;
int yellowX = -1000;
int yellowY = 200;
int cmonX = -900;
int cmonY = 75;
int vel = 5;
int vel2 = 3;
PImage purp;
PImage orange;
PImage breen;
PImage pink;
PImage yellow;
PImage cmon;

void setup(){
  size(800,600);
  background(0);
  smooth();
  
  
  frameRate(30);
}


void draw(){
  background(0);
  noStroke();
  fill(155,155,155);
  beginShape();
  vertex(-2,350);
  vertex(802,375);
  vertex(802,425);
  vertex(-2,500);
  endShape();
  purp = loadImage("purp.png");
  image(purp,purpX,purpY);
  
  purpX = purpX + vel;
  
  orange = loadImage("orange.png");
  image(orange,orangeX,orangeY);
  
  orangeX = orangeX + vel;
  
  breen = loadImage("breen.png");
  image(breen,breenX,breenY);
  
  breenX = breenX + vel;
  
  pink = loadImage("pink.png");
  image(pink,pinkX,pinkY);
  
  pinkX = pinkX + vel;
  
  yellow = loadImage("yellow.png");
  image(yellow,yellowX,yellowY);
  
  yellowX = yellowX + vel2;
  
  cmon = loadImage("cmon.png");
  image(cmon,cmonX,cmonY);
  
  cmonX = cmonX + vel;
  
}



