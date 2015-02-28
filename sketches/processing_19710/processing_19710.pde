
PFont font;

void setup(){
  size(250, 250);
  background(0);
  smooth();
  font = loadFont("Lot-48.vlw");
  textFont(font);
}
  
void draw(){
  background(0);
  text("H9X 2E6", mouseX, 90, pmouseY, 150);
}

