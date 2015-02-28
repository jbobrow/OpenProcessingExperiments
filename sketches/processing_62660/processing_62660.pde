
int breite = 50;

void setup() {
  size(300, 300);
}

void draw() {
  for (int x = 0; x < 300; x++) {
    fill(255);

    if (x %2 == 0) {
      fill(0);
    }
    rect(x * breite, 0, breite, breite);
  }
}
