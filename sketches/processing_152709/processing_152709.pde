
int i, x, y, c=0;

void setup(){
  size(470, 280);
  smooth();
}

void draw(){
    for (x = 30; x < 425; x += 50) {
      ellipse(x, 20, 20, 20);
    }
    for (x = 90; x < 450; x += 50) {
      ellipse(x, 60, 20, 20);
    }
    for (x = 70; x < 450; x += 50) {
      ellipse(x, 100, 20, 20);
    }
    for (x = 30; x < 425; x += 50) {
      ellipse(x, 140, 20, 20);
    }
    for (x = 90; x < 450; x += 50) {
      ellipse(x, 180, 20, 20);
    }
    for (x = 70; x < 450; x += 50) {
      ellipse(x, 220, 20, 20);
    }
    for (x = 30; x < 425; x += 50) {
      ellipse(x, 260, 20, 20);
    }
}


