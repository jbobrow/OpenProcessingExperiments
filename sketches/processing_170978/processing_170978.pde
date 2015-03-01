
void setup() {
  size(500, 500);
  background(240);
}

void draw() {
  background(255);
  for (int x=70; x<423; x=x+38) {
    for (int y=70; y<423; y=y+38) {
      for (int i=0; i<60; i++) {
        stroke(x/2, y/2, 0, random(50));
        line(x+random(30), y+0, x+random(30), y+30);
        line(x+0, y+random(30), x+30, y+random(30));
      }
    }
  }
}

