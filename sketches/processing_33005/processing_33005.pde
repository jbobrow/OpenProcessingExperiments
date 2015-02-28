
//for loop that draws 5 balls across the middle of screen on x axis

int centerX = 100;

void setup() {
  size(600, 400);
  background(60, 120, 220);
}

void draw() {
  for (int i = 0; i<500; i = i+100) {
    noStroke();
    fill(150, 180, 50);
    ellipse(centerX + i, 200, 70, 70);
  }
}



