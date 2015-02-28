

PImage img;
int step = 5;

void setup() {
  size(800,600,P2D);
  img = loadImage("Hydrangeas.jpg");
}

void draw() {

step = int(map(mouseX,0,width,2,100));
  for (float x = 0; x < img.width; x = x+step+(random(2,100))) {
    for (float y = 0; y < img.height; y = y+step+(random(2,100))) {
      color c = img.get(int(x), int(y));

      fill(c);
      noStroke();

      rect(map(x, 0, img.width, 0, width), map(y, 0, img.height, 0, height), step, step);
    }
  }
}



