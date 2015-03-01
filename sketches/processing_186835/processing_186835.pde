
PImage img;

void setup() {
  size(1024, 768);
  background(255);
  img = loadImage("https://bridor.com/wp-content/uploads/product-images/59101-11.png");
}

void draw() {
  image(img, mouseX-500, mouseY-400);
  }
