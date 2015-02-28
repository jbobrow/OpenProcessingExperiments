
/*
  Ka Kit Cheong
 Type Character V3
 02/21/2012
 */

// objects
PFont myFont;

// global variable
String myText ="blah.";
int typeWidth = 60;
int xHeight = 22;

int column = 10;
int row = 24;

int x, y;

void setup() {
  size(typeWidth*column, xHeight*row);
  background(0);
  colorMode(RGB, 255, 255, 255, 255);
  smooth();

  myFont = loadFont("ComicSansMS_Bold.vlw");
  textFont(myFont, 24);
  textAlign(LEFT, BASELINE);
}

void draw() {
  fill(0,1);
  rect(0, 0, width, height);

  float prob = ( mouseX / (float) width);
  float r = random(1);

  if (r<prob) {
    fill(255);
    text(myText, x, y);
  }

  x = (x+typeWidth)%width;
  if (x == 0) {
    y = (y+xHeight)%height;
  }
}


