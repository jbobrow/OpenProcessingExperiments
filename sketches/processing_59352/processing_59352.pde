
PImage img;

void setup() {

  img = loadImage ("anime.jpg");
  size (384, 600);
}

void draw() {
  image (img, 0, 0, 384, 600);
  copy(mouseX-40, mouseY-40, 80, 80, mouseX-75, mouseY-75, 150, 150);
  
}



