
int appleY;
int speed;
PImage tree;
PImage apple;
boolean harvestTime;

void setup() {
  size(500, 500);
  appleY = 40;
  speed = 2;
  tree = loadImage("tree.png");
  apple=loadImage("apple.png");
  harvestTime = false;
}

void draw() {
  // draw background every frame
  background(40, 200, 245);
  // draw both images every frame
  image(tree, 0, 0, 358, 500);
  image(apple, 250, appleY, 155, 160);
  // determine whether you need to change the variable appleY
  if (harvestTime == true) {
    appleY = appleY + speed;
  }
  if (harvestTime == false) {
    // do nothing
    // this if-statement is not actually necessary
  }
}

void mouseClicked() {
  harvestTime = true;
}



