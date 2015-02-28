

PImage img;

void setup() {
  size(400,400);
  img = loadImage("iheart.jpg");  
  background(255);
  tint(255,75);
  //the image ten times to the right
  for (int i = 0; i < 20; i++) {
    image(img, i*5, 0);
  }
}

