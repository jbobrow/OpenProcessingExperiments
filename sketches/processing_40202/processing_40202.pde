
PImage img;

void setup() {
  img= loadImage("flower-07.jpg"); 
  size (img.width, img.height);
  smooth();
}
void draw() {
  image(img, 0, 0);
}

