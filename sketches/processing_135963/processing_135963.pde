
size (200, 200);
int a = 15;
for (int y = 20; y < 200; y += 20) {
  for (int x = 40; x < 200; x += 40) {
    if ( a < 7 ) {
    ellipse (x, y, 40, 80);
    }
    if (( a >= 7) && ( a < 14)) {
    ellipse (y, x, 80, 40);
    }
    else {
    ellipse (y, x + y, 40, 40);
    ellipse (y, x - y, 40, 40);
    }
  }
}


