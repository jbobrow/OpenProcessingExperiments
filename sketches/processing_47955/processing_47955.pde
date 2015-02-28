
import alexandre.math.*;


int IMAGE_SAVE_TIME = 650;
String randomHash = "";
int imageCount = 0;
int timer = IMAGE_SAVE_TIME-IMAGE_SAVE_TIME/2;
Particula p1;


void setup() {
  initSketch();
  initObjects();
}

void initSketch() {
  size(800, 600);
  frameRate(500);
  smooth();
  background(255);
  strokeWeight(1);
}

void initObjects() {
   background(255);
  p1 = new Particula();
  for (int i=0; i<5; i++) {
    randomHash += (char)(int(random(66, 89)));
  }
  println(randomHash);
}


void draw() {
  stroke(p1.pos.i/10, p1.pos.j/6, p1.vel.i/5, 200);
  p1.timeStep();
  p1.draw();
  if (timer++>=IMAGE_SAVE_TIME) {
    timer=0;
    //saveFrame("images/image_"+randomHash + "_"+ imageCount+".jpg");
    //println("sameImage: "+imageCount);
    imageCount++;
    if (imageCount==2) {
      reset();
    }
  }
  //println("particula: " + p1.pos.i);
}

public void reset() {
  println("---------reset---------");
  background(255);
  p1 = new Particula();
  randomHash = "";
  for (int i=0; i<5; i++) {
    randomHash += (char)(int(random(66, 89)));
  }
  println(randomHash);
  imageCount = 0;
}

void mouseClicked() {
  initObjects();
}


