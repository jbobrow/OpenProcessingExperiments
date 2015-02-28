
PImage img;

void setup() {
  size(840, 860, P3D);
  img = loadImage("gbor01.jpg");
}

void draw() {
  image(img, 0,0,mouseX,mouseY);
  
}


