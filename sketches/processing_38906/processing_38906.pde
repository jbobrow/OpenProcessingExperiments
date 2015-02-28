
void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  crazyCircles(); //drawing function
}

void crazyCircles() {
  for (int y = 20; y < height; y+=20) { //creates the grid pattern
    for (int x = 20; x < width; x+=20) {
      fill(random(0, 255));
      ellipse(x + random(-3, 3), y + random(-3, 3), 15, 15); //draws circles with offset
    }
  }
}






