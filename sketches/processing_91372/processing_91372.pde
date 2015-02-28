
PImage img;
PFont font;

void setup() {
  size(500, 350);
  img = loadImage("background.jpg");
  font = loadFont("Leelawadee-Bold-48.vlw");
  textFont(font);
}
void draw() {
  image(img, 0,0);
  textSize(50);
  text("Unicorn Blitz", 100, 60);
}  


