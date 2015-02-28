
// inspiration
// https://class.coursera.org/cdt208-001/forum/thread?thread_id=107#post-988

int base = 2;
int h = 10;

void setup() {
  size(400, 300);
  background(0);
  
  noStroke();

  for (int y = h; y < height; y += h) {
    for (int x = 0; x < width; x += base) {
      triangle(x, y, x + base / 2, y - h, x + base, y + h);
    }
    base *= 1.5;
  }
}

void draw() {
  
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("screenshot_##.png");
  }
}


