
PImage myPic;

void setup() {
  size(543, 720);
  noStroke();
  smooth();

  myPic = loadImage("dog.jpg");
}

int cellSize = 10;
float size0 = 18;

void draw() {
  background(myPic);

  for (int y = cellSize; y < 720; y += cellSize) {   
    for (int x = cellSize; x < 543; x += cellSize) {

      color Colour = color(myPic.pixels[x + (y * width)]);
      fill(Colour);

      float radius = cellSize * (brightness(myPic.pixels[x + (y * width)]) / size0);
      rectMode(CENTER);
      rect(x, y, radius, radius);  //places rectangles
    }
  }
}


