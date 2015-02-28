
void setup() {
  size(1000, 650);
  smooth();
  background(255);
  noStroke();
  frameRate(0);

  for (int x = 20; x < width; x += 40) {
    for (int y = 20; y < height; y +=40) { 
      fill((random(255)), (random(255)), (random(255)));

      if ((x == 140) || (y == 140)) {
        fill(0);
      }
      else {
        fill((random(255)), (random(255)), (random(255)));
      }
      ellipse(x, y, 30, 30);
    }
  }
}
