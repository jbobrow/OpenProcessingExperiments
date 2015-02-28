
PImage img;
PImage img2;
PImage img3;
PImage img4;
float predposX = random(0,700);
float predposY = random(0,600);
float arnposX = random(0,800);
float arnposY = random(0,625);
float heliposX = random(0,700);
float heliposY = random(0,600);

void setup() {
  size(1000,700);
  img = loadImage("predator.png");
  img2 = loadImage("arnold.png");
  img3 = loadImage("forest.jpg");
  img4 = loadImage("heli3.png");
}

void draw() {
  image(img3,0,0);
  image(img,predposX,predposY,125,225);
  image(img2,arnposX,arnposY,125,180);
  image(img4,heliposX,heliposY,250,175);
  if (frameCount%240 == 0){
    heliposX = random(0,700);
    heliposY = random(0,600);
  }
  
  if (heliposX>arnposX) {
    arnposX = arnposX +2.5;
  }
  if (heliposX<arnposX) {
    arnposX = arnposX-2.5;
  }
  if (heliposY>arnposY) {
    arnposY = arnposY +2.5;
  }
  if (heliposY<arnposY) {
    arnposY = arnposY-2.5;
  }
  
  
  if (predposX>arnposX) {
    predposX = predposX - 3;
  }
  if (predposX<arnposX) {
    predposX = predposX + 3;
  }
  if (predposY>arnposY) {
    predposY = predposY - 3;
  }
  if (predposY<arnposY) {
    predposY = predposY + 3;
  }
  
  
  if (predposX>arnposX && predposX-arnposX<10 && predposY>arnposY && predposY-arnposY<10) {
    arnposX = arnposX - 10;
    arnposY = arnposY - 10;
    predposX = predposX - 5;
    predposY = predposY - 5;
  }
   if (arnposX>predposX && arnposX-predposX<10 && predposY>arnposY && predposY-arnposY<10) {
    arnposX = arnposX + 15;
    arnposY = arnposY - 10;
    predposX = predposX + 5;
    predposY = predposY - 5;
  }
  if (arnposX>predposX && arnposX-predposX<10 && arnposY>predposY && arnposY-predposY<10) {
    arnposX = arnposX + 15;
    arnposY = arnposY + 15;
    predposX = predposX + 5;
    predposY = predposY + 5;
  }
  if (predposX>arnposX && predposX-arnposX<10 && arnposY>predposY && arnposY-predposY<10) {
    arnposX = arnposX - 10;
    arnposY = arnposY + 10;
    predposX = predposX - 5;
    predposY = predposY + 5;
  }
  
 
  if (arnposX > 1000) {
    arnposX = 0;
  }
  if (predposX > 1000) {
    predposX = 0;
  }
  if (arnposY > 700) {
    arnposY = 0;
  }
  if (predposY > 700) {
    predposY = 0;
  }
  if (arnposX < 0) {
    arnposX = 999;
  }
  if (arnposY < 0) {
    arnposY = 699;
  }
   if (predposX < 0) {
    predposX = 999;
  }
  if (predposY < 0) {
    predposY = 699;
  }
}


