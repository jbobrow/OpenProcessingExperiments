
size(450,450);
background(45, 89, 43);
smooth();
stroke(15);

for (int y = 0; y <= height; y += 50) {
for (int x = 0; x <= width; x += 50) {
  fill(63, 34, 98);
  ellipse(x, y, 25, 25);
}
}

for (int y = 0; y <= height; y+=100) {
  for (int x = 0; x <= width; x +=100) {
    fill(200, 1, 244);
    rect(x, y, 50, 50);
  }
}

