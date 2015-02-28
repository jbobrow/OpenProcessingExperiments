
size(500, 500);
background(255);
smooth();

strokeWeight(1);
stroke(100);
for (float y = 20; y <= 500; y += 4) {
  for (float x = 20; x <= 500; x += 10) {
    if (x<=500);
    line (x, y, x + 1, y - 5);
    line (x, y, x - 20, y + 20);
  }
}

strokeCap(SQUARE);
strokeWeight(2);
stroke(32, 188, 132);
for (int y = 20; y <= 500; y += 1) {
  for (int x = 20; x <= 500; x += 10) {
    line (x, y, x + 1, y - 1);
  }
}

strokeWeight(2);
stroke(234, 190, 175);
for (int y = 20; y <= 500; y += 4) {
  for (int x = 20; x <= 500; x += 10) {
    if (x<=500);
    line (x, y, x + 1, y - 5);
    line (x, y, x - 10, y +3);
  }
}

strokeWeight(2);
stroke(255);
for (float x = 500; x > 5; x /= 1.1) {
  line (100, x, 500, x);
}

strokeWeight(3);
stroke(255);
for (float y = 500; y > 5; y /= 1.5) {
  line (y, 100, y, 500);
}

strokeWeight(1);
stroke(243, 250,48);
for (float y = 500; y > 5; y /= 1.5) {
  line (y+10, 500, y*y/2, 300);
}


