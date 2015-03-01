

size(500, 500);
background(0);

for (int x = 0; x <= width; x += 50) {
  for (int y = 0; y <= height; y += 50) {
    smooth();
    colorMode(HSB);
    strokeWeight(100);
    stroke(random(255), y, random(255), 125);
    noFill();
    ellipse(x, y+x, 200, 200);
    strokeWeight(10);
    ellipse(x+y, y, 200, 200);
  }
}



