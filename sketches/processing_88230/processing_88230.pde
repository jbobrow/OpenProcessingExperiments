
PImage img;
float  x = 50;
float y = 50;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  background(255);
  smooth();
  img = loadImage("1.png");
}

void draw() {
  int seconds = millis()/300;
  x = random(100, 500);
  y = random(100, 500);
  rotate(seconds+radians(30));
  fill(random(10, 255), random(0, 50));
  strokeWeight(random(0, 1));
  rect(x, y, random(50), random(50));
  println(frameCount);

  if (frameCountP0==0) {
    saveFrame("1.png");
    rotateY(PI/3.0);
  }
  
  if (frameCountP2==0) {
    pushMatrix();
    scale(0.5);
    image(img, 0, 0);
    popMatrix();
  }
  
  if (frameCount==10000){
    background(255);
    frameCount=0;
  }
}
