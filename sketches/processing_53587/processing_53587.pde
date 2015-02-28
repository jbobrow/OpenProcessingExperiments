
PImage meMouse;
PImage bckgrnd;

void setup() {
  bckgrnd = loadImage("glitch.png");
  bckgrnd.resize(500,500);
  size(500,500);
  background(bckgrnd);
  

  noCursor();
  meMouse = loadImage("ME.png");
  cursor(meMouse, 0, 0);
}


