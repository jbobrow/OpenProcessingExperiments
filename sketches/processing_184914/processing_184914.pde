
size(500, 500);
background(0);
noStroke();
for (int x = 0; x < 500; x = x + 10) {
  for (int y = 0; y < 500; y = y + 10) {
    fill(random(255), random(255), random(255));
    rect(x, y, 10, 10);
  }
}
