
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
}

void draw() {
  fill(255, 40);
  rect(0, 0, width, height);


  for (int x = 100; x < 800; x = x+100) {
    for (int y = 50; y < 800; y = y+100) {
      fill(#356D81, 20);
      noStroke();
      ellipse(x-50, y, 100, 100);
    }
  }


  for (int x = 0; x < 800; x = x+100) {
    for (int y = 0; y < 800; y = y+100) {
      fill(#F57979, 20);
      noStroke();
      ellipse(x, y, 100, 100);
    }
  }


  for (int x = 0; x < 800; x = x+100) {
    for (int y = 0; y < 800; y = y+100) {
      fill(#4565D6, 20);
      noStroke();
      ellipse(x, y, 40, 40);
    }
  }

  for (int x = 0; x < 800; x = x+200) {
    for (int y = 0; y < 800; y = y+200) {
      fill(255,50);
      ellipse(x, y, 260, 260);
    }
  }
}


