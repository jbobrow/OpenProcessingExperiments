
PImage img;

void setup() {
  img = loadImage("george.jpg");
  size(500, 500);
  noStroke();
}

void draw() {
  //image(img, 0, 0);
  background(255);
  for (int a = 0; a < width; a=a+10) {
    for (int b = 0; b < height; b=b+10) {
      color elColor = img.get(a, b);
      float brillo = brightness(elColor);
      fill(elColor);
      //fill(0);
      ellipse(a, b, (255-brillo)/20, (255-brillo)/20);
    }
  }
}



