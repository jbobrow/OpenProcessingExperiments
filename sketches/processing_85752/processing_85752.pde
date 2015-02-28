
/**
Philippe Moore's morning stretch January 17th, 2013
**/

PImage img;
PVector pos;
int change;

void setup() {
  img = loadImage("cookie-monster.jpg");
  size(650, 366);
  img.loadPixels();
  noStroke();
  smooth();
  pos = new PVector(floor(random(width)), floor(random(height)));
  change = floor(random(1, 50));
}

void draw() {
  color c = img.get(floor(pos.x), floor(pos.y));
  fill(c, 50);
  ellipse(pos.x, pos.y, change, change);
  int dir = floor(random(4));
  makeNewPos(dir);
   change = floor(random(1, 50));
}

void makeNewPos(int n) {
  if (n == 0) {
    pos.y = pos.y-change;
  }  
  if (n == 1) {
    pos.x = pos.x+change;
  }
  if (n == 2) {
    pos.y = pos.y+change;
  }
  if (n == 3) {
    pos.x = pos.x-change;
  }
  checkOOB(pos);
}

void checkOOB(PVector vect) {
  if (vect.x<0) {pos.x=width;}
  if (vect.x>width) {pos.x=0;}
  if (vect.y<0) {pos.y=height;}
  if (vect.y>height) {pos.y=0;}  
}


