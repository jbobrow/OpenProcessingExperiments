
PImage eyeImage;

void setup() {
  size(500,500);
  fill(255, 40);
  background(0, 50, 100);
  eyeImage = loadImage("eyeImage.jpg");
}

void draw() {
  int ix = mouseX - eyeImage.width/2;
  int iy = mouseY - eyeImage.height/2;
  image(eyeImage, ix, iy);
}

  


