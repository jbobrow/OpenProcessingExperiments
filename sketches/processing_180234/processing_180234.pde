
PImage img = null;

 /* @pjs preload="fuzzy.jpg"; */ 

void setup() {
  size(600, 600);
  smooth();
  img = loadImage("fuzzy.jpg");
}

void draw () {
  background(#57385c);
  
  stroke(#ffedbc);
  int steps = 7;

  int y = 0;
  img.loadPixels();
  while (y < height) {
    int x = 0;
    while (x < height) {
      
      int index = y * img.width + x;
      color c = img.pixels[index];
      float angle = map (brightness(c), 0, 255, 0, TWO_PI);
      float sw = map(brightness(c), 0, 255, 0.25, 2);
      
      strokeWeight (sw);
      line (x, y, x+cos(angle)*steps, y+sin(angle)*steps);
      x = x + steps;
    }
    y = y + steps;
  }
}



