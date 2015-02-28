
// Asignment 6: Initials Function
//Max Perim, Andrew ID: mperim copyright 2012
float posX, posY, speedX, speedY;
float pX, pY, pSize, pSpeed;
PImage p;
void setup() { 
  size(600, 600);
  smooth();
  noStroke();
  posX=0;
  posY= random(height);
  speedX=1;
  speedY=2;
  p=loadImage ("cats-can-see-invisible-things-8.jpg");
  imageMode (CENTER);
  pX=100;
  pY=random (height);
  pSize=60;
  pSpeed=1;
}

void draw() {
  background (255);
  moveSymbol();
  symbol(posX, posY);
  prepWindow();
  drawImage();
  moveImage();
  //saveFrame( "hw6.jpg");
}
void moveSymbol() {
  posX=posX+speedX;
  posY=posY+speedY;
  if (posX>width) {
    speedX=-speedX;
  }
  if (posX<0) {
    speedX=-speedX;
  }
  if (posY>height) {
    speedY=-speedY;
  }
  if (posY<0) {
    speedY=-speedY;
  }
}

void symbol(float x, float y) {
  fill (#6FEDFA);
  ellipse (x, y-35, 400, 200);
  fill(#FF8F1F);
  arc (x-115, y, 100, 200, radians(180), radians(360));
  arc (x-65, y, 100, 200, radians(180), radians(360));
  arc (x+10, y-65, 100, 65, radians (270), radians (450));
  quad (x-10, y-98, x+10, y-98, x+75, y, x-10, y);
  arc (x+110, y-65, 100, 65, radians (270), radians (450));
  rect (x+77, y-97.5, 40, 98);
}
void moveImage() {
  pX=pX+pSpeed;
  if (pX>width) {
    pSpeed=-pSpeed;
  }
  if (pX<0) {
    pSpeed*=pSpeed;
  }
}
void drawImage() {
  fill (0, 0, 255);
  ellipse (pX, pY, pSize*1.5, pSize*1.5);
  image (p, pX, pY, pSize, pSize);
}
void prepWindow () {
  fill (200, 200, 0, 10);
  rect(0, 0, width, height);
}


