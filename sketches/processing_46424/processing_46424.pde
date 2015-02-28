
int x = 0;
int y = 300;

int x2=500;
int y2=150;
PImage back;
PImage right;
PImage left;


void setup() {
  size(500,500);
  background (255);
  smooth();
  noStroke();
  right = loadImage ("pawprint.png");
  left = loadImage ("pawprint2.png");
  back = loadImage ("backprints.png");
  frameRate(2);
  image (back,0,0);
}

void draw () {
  image (right,x,y);
  image (right, x+60, y+60);
  x = x+100;
  
  if (x>500) {
    image (left,x2,y2);
    image (left, x2-60, y2+60);
    x2=x2-100;
  }
}

