
PImage ship, space, rock, Gas, fail, win;
int vari = 0;
int varil = 1;
int varip = 885;
int sur = 3200;
float shipX = 450;
float shipY = 700;
float posX = 0, posY = 0;
int vic = 0;
int los = 0;

void setup() {
  size(900, 900);
  space = loadImage("space.jpg");
  ship = loadImage("ship.png");
  rock = loadImage("rock.png");
  Gas = loadImage("Gas.png");
  fail = loadImage("failure.jpg");
  win = loadImage("win.jpg");
}

void draw() {
  vari=vari+8;
  varil=varil+7;
  varip=varip-9;
  sur=sur-10;
  shipX += posX;
  shipY += posY;
  image(space, 0, 0);
  image(ship, shipX, shipY);
  Gas.resize(50, 50);
  image(Gas, 800, 50);
  image(rock, vari, 200);
  image(rock, varil, 535);
  image(rock, varip, 455);
  image(rock, sur, 80);
  if (vari >= 900) {
    vari = -15;
  }
  if (varil >= 900) {
    varil = -10;
  }
  if (varip <= -45) {
    varip = 880;
  }
  if (sur <= -70) {
    sur = random(1300-100, 1300+300);
  }
  if (shipX >= 750 && shipY <= 50) {
    vic = 1;
  }
  if (vic == 1) {
    win.resize(900, 900);
    image(win, 0, 0);
  }
  if (shipX-vari <10 && shipX-vari >-10 && shipY <= 240 && shipY >= 160) {
    los = 1;
  }
  if (shipX-varil <10 && shipX-varil >-10 && shipY <= 575 && shipY >= 495) {
    los = 1;
  }
  if (shipX-varip <10 && shipX-varip >-10 && shipY <= 495 && shipY >= 415) {
    los = 1;
  }
  if (shipX-sur <10 && shipX-sur >-10 && shipY <= 120 && shipY >= 40) {
    los = 1;
  }
  if (los == 1) {
    fail.resize(900, 900);
    image(fail, 0, 0);
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      posY =- 6;
    }
    if (keyCode == DOWN){
      posY =+ 6;
    }
    if (keyCode == LEFT){
      posX =- 6;
    }
    if (keyCode == RIGHT){
      posX =+ 6;
    }
  }
}
   
void keyReleased(){
  if (key == CODED){
    if (keyCode == UP || keyCode == DOWN){
      posY = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT){
      posX = 0;
    }
  }
}




