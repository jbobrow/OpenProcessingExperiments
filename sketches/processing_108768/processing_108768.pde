
void setup() {
  size(1280, 800);
  background(220, 185, 255);
}

void draw() {
  for (int x = 0; x < 800; x = x + 5) {
    for (int y = 0; y < 1280; y = y + 20) {
      //strokeWeight();
      line(y + 5, x, y, x + 5);
    }
  }
  for (int a = 0; a < 600; a = a + 10) {
    if (a < 200) {
      noStroke();
    }
    if (a > 200) {
      stroke(1);
    }
    fill(220, 185, 255 - a/3);
    ellipse(0, 655, 700 - a, 700 -a);
    ellipse(800, 400, 400 - a, 400 - a);
    ellipse(1280, 655, 400 - a, 400 - a);
    ellipse(500, 655, 800 - a, 800 - a);
    ellipse(900, 755, 600 - a, 600 - a);
    ellipse(150, 400, 600 - a, 600 - a);
    
  }
  for (int x = 0; x < 800; x = x + 5) {
    for (int y = 0; y < 1280; y = y + 20) {
      //strokeWeight();
      line(y, x, y + 5, x + 5);
    }
  }
}
