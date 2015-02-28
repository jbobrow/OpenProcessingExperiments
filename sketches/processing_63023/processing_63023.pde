
size(500, 500);
background(162, 191, 163);
smooth();

noStroke();
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    fill(57, 255, 64, 200);
    ellipse(x, y, 20, 20);
  }
}

strokeWeight(1);
stroke(255);
for (int y = 0; y <= height; y += 20) {
  for (int x = 0; x <= width; x +=20) {
    noFill();
    ellipse(x, y, 100, 100);
  }
}

noStroke();
for (int y = 0; y <= height; y += 30) {
  for (int x = 0; x <= width; x += 30) {
    fill(126, 255, 131);
    ellipse(x+y, y+1, 2-y/10.0, 2-y/10.0);
  }
}

strokeWeight(8);
stroke(91, 181, 188, 20);
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    noFill();
    ellipse(x, y, 120, 120);
  }
}


