
void setup() {
  size(600, 600);
  background(#000000);
}
void draw() {
  noStroke();
  for (int i = 0; i < 10; i++) {
    // Drawing a rectangle that using map to nicely reduce 0-600 to 0-100
    fill(0, map(mouseY, 0, 600, 1, 200), 100,100);
    rect(50, 50*i+50, map(mouseX, 0, 600, 1, random(300,600)), 50);

    // draw backwards
    fill(0,100, map(mouseX, 0, 600, 1, 2),100);
    rect(550, 50*i+50, -map(mouseX, 0, 600, 1, random(300,600)), 50);
  }
}

