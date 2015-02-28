
PImage img;

void setup() {
  size(600, 600);
  img = loadImage("cloudes01.png");
  
  noStroke();
  background(255);
  for (int x = 0; x < width; x=x+10 ) {
    for (int y = 0; y < height; y=y+5) {
      color c = img.get(x, y);
      fill(c);
      ellipse(x, y, 10, 10);
    }
  }
}


