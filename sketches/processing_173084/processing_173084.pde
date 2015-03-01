
PImage ghost, house, fire, cake, fail, win, title;
int vari = 0;
int varil = 1;
int varip = 885;
int sur = 3200;
float ghostX = 450;
float ghostY = 700;
float posX = 0, posY = 0;
int scene = 0;
int vic = 0;
int los = 0;
 
void setup() {
  size(900, 900);
  house = loadImage("house.jpg");
  ghost = loadImage("ghost.png");
  fire = loadImage("fire.png");
  cake = loadImage("cake.png");
  fail = loadImage("fail.jpg");
  win = loadImage("win.jpg");
  title = loadImage("title.jpg");
}
 
void draw() {
  if(scene == 0){
    title.resize(900, 900);
    image(title,0,0);
    if(keyPressed==true && key == 's'){
      scene = 1;
    }
  } else if(scene == 1){
  vari=vari+8;
  varil=varil+7;
  varip=varip-9;
  sur=sur-10;
  ghostX += posX;
  ghostY += posY;
  image(house, 0, 0);
  ghost.resize(104, 116);
  image(ghost, ghostX, ghostY);
  cake.resize(50, 50);
  image(cake, 800, 50);
  fire.resize(68, 68);
  image(fire, vari, 200);
  image(fire, varil, 535);
  image(fire, varip, 455);
  image(fire, sur, 80);
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
  if (ghostX >= 750 && ghostY <= 50) {
    vic = 1;
  }
  if (vic == 1) {
    win.resize(900, 900);
    image(win, 0, 0);
  }
  if (ghostX-vari <10 && ghostX-vari >-10 && ghostY <= 240 && ghostY >= 160) {
    los = 1;
  }
  if (ghostX-varil <10 && ghostX-varil >-10 && ghostY <= 575 && ghostY >= 495) {
    los = 1;
  }
  if (ghostX-varip <10 && ghostX-varip >-10 && ghostY <= 495 && ghostY >= 415) {
    los = 1;
  }
  if (ghostX-sur <10 && ghostX-sur >-10 && ghostY <= 120 && ghostY >= 40) {
    los = 1;
  }
  if (los == 1) {
    fail.resize(900, 900);
    image(fail, 0, 0);
  }
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


