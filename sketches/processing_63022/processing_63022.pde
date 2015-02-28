
size(500, 600);
background(255);
smooth();

strokeWeight(3);
stroke(91, 181, 188, 100);
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    fill(8, 236, 255, 80);
    ellipse(x, y, 120, 120);
  }
}

strokeWeight(1);
stroke(255);
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    noFill();
    ellipse(x, y, 120, 120);
  }
}

strokeWeight(1);
stroke(255, 39, 201,50);
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    noFill();
    ellipse(x, y, 70, 70);
  }
}



