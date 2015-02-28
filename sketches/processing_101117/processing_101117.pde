
float px = width/2;
float py = 220;
float dx = random(width);
float dy = -10;
float easing = 0.3;

int level = 0;

int caught = 0;
int missed = 0;

PImage startimg;
PImage bg;
PImage girl;
PImage grassline;
PImage bottle;
PImage frame;

void setup() {
  size(480, 340);
  bg = loadImage("background.png");
  girl = loadImage("up0001.png");
  grassline = loadImage("grass.PNG");
  bottle = loadImage("empty_bottle.png");
  startimg = loadImage("start.jpg");
  frame = loadImage("frame.png");
  smooth();
  noStroke();
  frameRate(24);
}
void draw() {  
  background(#A7C6F0);
  levelcheck();
}

void levelcheck(){
  if (level == 0) {
    startscreen();
  }
  if (level == 1) {
    level1();
  }
}

void startscreen(){
  image(startimg, 0, 0);
  if (mousePressed){
    level = 1;
  }
}

void level1(){
  image(bg, 0, 0);
  fill(22,125,36);
  drop();
  player();
  collision();
  image(grassline, 0, 50);
  image(frame, 301, 20);
  textSize(14);
  text("Bottles Caught: " + caught, 320, 55);
  text("Bottles Missed: " + missed, 320, 75);
}

void player() {
  float targetX = mouseX;
  px += (targetX - px) * (easing * 2);
  image(girl, (px - 32), py);

}

void drop() {
  image(bottle, dx, dy);
  float targetY = 600;
  dy += (targetY - dy) * easing/7;
  if (dy >=320) {
    missed += 1;
    dy = -120;
    dx = random(width);
  }
}

void collision() {
  float pDist = dist(px, dy, dx, dy);
  if (pDist <= 34) {
    if ((dy > 220) && (dy < 280)){
      caught += 1;
      dy = -50;
      dx = random(width);
    }
  }
}




