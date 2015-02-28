

PImage img;

void setup() {
  img = loadImage("foto.jpg");
  size(630, 419);
  frameRate(30);
}

void draw() {
  //image(img, 0, 0);
  for (int i=0;i<1000;i++) {
    int x = int(random(width));
    int y = int(random(height));
  color elColor = img.get (x, y);
  float brillo = brightness(elColor);
  fill(elColor,20);
  noStroke();
  ellipse(x,y,brillo/4,brillo/4);
  }
}


