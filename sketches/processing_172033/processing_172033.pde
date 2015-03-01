

size(600, 600);
background(255, 255, 255);
translate(200, 75);
noStroke();
fill(90, 90, 90, 150);
int a = 10;
int b = 0;
for (int i = 0; i < 40; i++) {
  for (int j = 0; j < 63; j++) {
    int c = a+20;
    int d = b+20;
    triangle(a, a, b, c, d, c);
    rotate(.1);
  }
  a += i;
  b += i;
}

translate(90, 620);
fill(160, 160, 160, 150);
a = 10;
b = 0;
for (int i = 0; i < 29; i++) {
  for (int j = 0; j < 63; j++) {
    int c = a+20;
    int d = b+20;
    triangle(a, a, b, c, d, c);
    rotate(.1);
  }
  a += i;
  b += i;
}

translate(100, -700);
fill(0, 128, 255, 150);
a = 0;
b = -10;
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 1; j++) {
    int c = a+20;
    int d = b+20;
    triangle(a, a, b, c, d, c);
    rotate(-.2);
  }
  a += i/10;
  b += i/10;
}



