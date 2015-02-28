
size(500, 600);
background(255);
smooth();

stroke(46, 255, 152);
for (int y = 100; y <=500; y += 4) {
  for (int x = 100; x <= 410; x += 10) {
    line (x, y, x - 10, y - 10);
  }
}

strokeWeight(2);
stroke(255);
for (int y = 1; y <=600; y += 100) {
  for (int x = 2; x <= 500; x += 10) {
    line (x, y, x + 20, y + 100);
  }
}
strokeWeight(5);
for (int y = 100; y <=500; y += 50) {
  for (int x = 105; x <= 400; x += 80) {
    line (x, y, x + 50, y - 10);
  }
}

strokeWeight(2);
stroke(65, 25, 250, 50);
for (int y = 1; y <=600; y += 4) {
  for (int x = 1; x <= 500; x += 10) {
    line (x, y, x + 1, y - 1);
  }
}


