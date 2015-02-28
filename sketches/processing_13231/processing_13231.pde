
PImage alchemical;
PImage Background;

int x;
int y;

void setup() {
  size (563,357);
  x = 0;
  y = 0;
  Background = loadImage("Background.jpg");
  alchemical = loadImage("alchemical.png");
  background (Background);
}//setup

void draw() {
  if (keyPressed) {
    x = int(random(563));
    y = int(random(357));
  }//if
  else {
  }//else
  image(alchemical,x,y);
}//draw

