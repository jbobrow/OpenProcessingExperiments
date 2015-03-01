
PImage img;

void setup() {
  size(600,600);
  img = loadImage("octopus.jpg");
  imageMode(CENTER);
}

void draw() {
  image(img,mouseX,mouseY);
}


