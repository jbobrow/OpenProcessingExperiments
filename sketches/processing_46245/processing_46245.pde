
int x = 0;
int y = 300;

int x2=500;
int y2=150;

PImage right;
PImage left;


void setup() {
  size(500,500);
  background (255);
  smooth();
  noStroke();
  right = loadImage ("pawprint.gif");
  left = loadImage ("pawprint2.gif");
  frameRate(2);
}

void draw () {
  image (right,x,y);
  image (right, x+60, y+60);
  x = x+100;
  
  if ((x>500) && (y>150)) {
    image (left,x2,y2);
    image (left, x2-60, y2+60);
    x2=x2-100;
  }
}

