
PImage b;
void setup() {
  size(450, 338);
  smooth();
}

void draw() {
  b = loadImage("fotoArticolo_2596.jpg");
  tint(0, 153, 204); // Tint blue
  image(b, 0, 0);
  noTint(); // Disable tint
  image(b, 225, 0);
} 


