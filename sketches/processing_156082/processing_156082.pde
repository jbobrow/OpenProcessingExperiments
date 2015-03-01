
PImage toaster;
PImage bird;
float scale;
float speed;
int posX = 1000;

PFont myFont;

void setup() {
  size(1000, 1000);
  toaster = loadImage("toaster1.jpg");
  bird = loadImage("bird.png");
  myFont = loadFont("Lobster1.3-48.vlw");
}

void draw() {
  background(255);
  imageMode(CENTER);
  speed = 5;
  scale = map(sin(frameCount/5), -1, 1, 1, 1.2);
  image(toaster, width/2, height/2, scale*toaster.width, scale*toaster.height);
  image(bird, posX, toaster.height/2 - bird.height);
  posX -=10;

  textAlign(CENTER);
  textFont(myFont, scale*48);
  fill(0, 247, 245);
  text("I'm Flying", width/2, height/2);
}


