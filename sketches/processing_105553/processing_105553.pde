


void setup() {
  size (500, 500);
}

void draw() {
    background (0,0,0);
  for (int i = 0; i < 500; i++) {
    fill(dist(mouseX+5, mouseY-5, i*5, 100), dist(mouseX, mouseY, i*25, 100), 255);
    rect(0, i*25, i*100, i*100);
  }

}



