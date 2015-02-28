
PFont font;
String txt = "Turn the left!";

float x;
float y;

void setup() {
  size(300, 300);
  
  font = loadFont("Corbel-18.vlw");
  textFont(font);
  
}

void draw(){
  background(126, 250, 183);
  
  textSize(30);
  //text(string, x, y);
  text("Turn the left, please!", x, y, 200, 300);
  x = x + 1;
}
