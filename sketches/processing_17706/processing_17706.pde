
PImage wok;
float posX = 80;
float posY = 60;
float wokWidth, wokHeight;
/* note: no spaces or capital letters for image file names
asking for trouble in html*/


void setup() {
  size(800,600);
  wok = loadImage("01_wokshovel.jpg");
  wokWidth = wok.width;
  wokHeight = wok.height;
}

void draw() {
  background(150);
  if(mousePressed) {
    wokWidth++;
    wokHeight++;
    posX = mouseX;
    posY = mouseY;
  }
  imageMode(CENTER);
  image(wok,posX,posY,wokWidth,wokHeight);
  if(mousePressed) {
    noFill();
    stroke(255,0,0);
    rectMode(CENTER);
    rect(posX,posY,wokWidth,wokHeight);
  }
  if(!mousePressed) {
    if(wokWidth>wok.width){
      wokWidth--;
    }
    if(wokHeight>wok.height){
      wokHeight--;
    }
  }
}

