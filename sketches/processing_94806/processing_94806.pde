
PImage b;
PImage c;
int x;
int y;
float i;

void setup() {
  background(255);
  size(800, 500);
  noStroke();
}

void draw () {
  background(119, 229, 60);
  finish(0, 0);
  finish(0, 60);
  finish(0, 120);
  finish(0, 180);
  finish(0, 240);
  finish(0, 300);
  finish(0, 360);
  finish(0, 420);
  x = (x+1)%1000;
  b = loadImage("Snail.gif");
  image(b, 0+x, 0);
  c = loadImage("Snail2.gif");
  image(c, 0+x, 250);  
}
 

void finish(int x, int y) {
  fill(255);
  rect(700+x, 0+y, 30, 30);
  rect(730+x, 30+y, 30, 30);
  rect(760+x, 60+y, 30, 30);
  rect(760+x, 0+y, 30, 30);
  rect(700+x, 60+y, 30, 30);
  fill(0);
  rect(730+x, 0+y, 30, 30);
  rect(700+x, 30+y, 30, 30);
  rect(760+x, 30+y, 30, 30);
  rect(730+x, 60+y, 30, 30);
  
}


