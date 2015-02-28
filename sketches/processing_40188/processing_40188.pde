
PImage img;

void setup() {
  size(400, 400);
  img = loadImage("arch.jpg");
}

void draw(){
  tint(102); // Tint gray
  image(img, 0, 0);
  noTint(); // Disable tint
  image(img, img.width, 0);
}

