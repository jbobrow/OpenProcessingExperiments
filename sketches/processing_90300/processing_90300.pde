
PImage img;
PFont font;
String quote = "Put Out The Fire!";


void setup() {
  size(600, 600);
  smooth();
  fill(0);
  img = loadImage("FireExtinguisherWithFire.jpg");
  font = loadFont("mensch.ttf");
  textFont(font);  
}

void draw() {
  background(255);
  image(img, 0, 0);
  fill(255,89,0);
  textSize(36);
  text(quote, 290, 225);
}


