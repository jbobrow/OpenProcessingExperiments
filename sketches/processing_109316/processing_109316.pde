
void setup() {
  size(800, 800);
  background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100);


  for (int x = 10; x < height; x += 20) {
    for (int y = 10; y < width; y += 20) {
      color rando = color(random(360), 40, 80);
      fill(rando);
      ellipse(x, y, 10, 10);
//is this cheating?
      for (int updown = 20; updown < width; updown += 40) {
        ellipse(390, updown+9, 10, 10);
        fill(0);
        for (int leftright = 20; leftright < height; leftright += 40) {
          ellipse(leftright+9, 390, 10, 10);
          fill(0);
        }
      }
    }
  }
}
