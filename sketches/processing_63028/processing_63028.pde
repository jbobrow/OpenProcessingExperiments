
size(500, 500);
background(237, 38, 85);
smooth();


stroke(115, 255, 41);
for (int x = 10; x < 500; x += 40) {
  for (int y = 10; y < 500; y += 40) {
    point(x + 5, y);
  }
}

stroke(212, 250, 164);
for (int x = 15; x < 200; x += 5) {
  for (int y = 10; y < 500; y += 40) {
    point(x, y);
  }
}

stroke(255);
for (int x = 15; x < 600; x += 5) {
  for (int y = 30; y < 500; y += 40) {
    point(x + 20, y);
  }
}



