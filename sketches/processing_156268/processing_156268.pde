
float x;
float y;
float xFart;
float yFart;
float size;
ArrayList<Ball> baller;
int antallBaller;
int antall;
int r, g, b;

void setup() {
  size(800, 800);
  baller = new ArrayList<Ball>();
  background(0);
}

void draw() {
  for (int i = 0; i < baller.size (); i++) {
    baller.get(i).tegnBallen();
    baller.get(i).bevegelse();
    baller.get(i).utenfor(i);
  }
}

void fyrverkeri(int antall, float x, float y, float minFart, float maxFart, float minSize, float maxSize) {
  for (int i = 0; i < antall; i++) {
    size = random(minSize, maxSize);
    xFart = random(minFart, maxFart);
    yFart = random(minFart, maxFart);
    r = int(random(200, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
    baller.add(new Ball(x, y, xFart, yFart, size, r, g, b));
  }
}

void mousePressed() {
  println(baller.size());
  if (mouseButton == RIGHT) {
    baller.clear();
  } else if (mouseButton == LEFT) {
    fyrverkeri(200, mouseX, mouseY, -4, 4, 2, 10);
  }
}

void keyPressed() {
  if (key == 'c') {
    background(0);
  }
}

class Ball {
  float x;
  float y;
  float xFart;
  float yFart;
  float size;
  int farge;
  int r, g, b;
  Ball(float tx, float ty, float txFart, float tyFart, float tsize, int tr, int tg, int tb) {
    x = tx;
    y = ty;
    xFart = txFart;
    yFart = tyFart;
    size = tsize;
    r = tr;
    g = tg;
    b = tb;
  }
  void tegnBallen() {
    fill(r, g, b);
    ellipse(x, y, size, size);
  }

  void bevegelse() {
    x = x + xFart;
    y = y + yFart;
  }

  void utenfor(int i) {
    if (x > width + size/2 || x < 0 - size/2  || y > height + size/2 || y < 0 - size/2) {
      baller.remove(i);
    }
  }
}

