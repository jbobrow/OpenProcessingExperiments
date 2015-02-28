
size(300, 800);
smooth();
background(180, 249, 255);


//point
stroke(255, 41, 220);
for (int x = 20; x < 400; x += 60) {
  for (int y = 40; y < 700; y += 10) {
    point(x + 100, y + 100);
  }
}

stroke(255, 0, 0);
for (int x = 3; x < 300; x += 4) {
  for (int y = 1; y < 300; y += 2) {
    point(x + 3, y - 50);
  }
}


stroke(21, 237, 255);
for (int x = 3; x < 300; x += 4) {
  for (int y = 1; y < 500; y += 10) {
    point(x + 3, y - 50);
  }
}

stroke(75, 80, 35);
for (int x = 3; x < 300; x += 4) {
  for (int y = 2; y < 700; y += 50) {
    point(x + 3, y*2.75);
  }
}

