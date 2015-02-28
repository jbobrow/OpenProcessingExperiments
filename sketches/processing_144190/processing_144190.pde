
PImage img;

void setup() {
  size(558, 465);
  img = loadImage("lbsunset.jpg");
  background(200);
}

void draw() {
  img.loadPixels();

  int location = mouseX + mouseY * width;
  float r = red(img.pixels[location]);
  float g = green(img.pixels[location]);
  float b = blue(img.pixels[location]);


  noStroke();
  stroke(r, g, b);
  line(mouseX + random (1, 5), mouseY + random(1, 5), mouseX + random((-60), 60), mouseY + random((-60), 60));
}



