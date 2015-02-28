
PImage img;

void setup() {
  size(400,340);
  img= loadImage("Diamante.gif");
}

void draw() {
  background(255);
  image(img,0,0);
  image(img,0,mouseY * -1);
}

