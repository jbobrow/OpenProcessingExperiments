
/* 1.Lösung

size(200, 200);
background(255);
int x = 20;

while (x <= height-20) {
  stroke(0);
  line(x, 20, x, width-20);
  x = x + 10 ;
}

*/

/* 2. Lösung

size(200, 200);
background(255);
int y = 20;

while (y <= height-20) {
  stroke(0);
  line(20, y, width-20, y);
  y = y + 10 ;
}

*/

/* 3. Lösung

size(200, 200);
background(255);
int x1 = 80;
int x2 = 40;

while (x1 <= height-5) {
  stroke(0);
  line(x1, 20, x2, width-20);
  x1 = x1 + 10 ;
  x2 = x2 + 10 ;
}

*/

/* 4. Lösung

size(200, 200);
background(255);
int y1 = 80;
int y2 = 40;

while (y1 <= height) {
  stroke(0);
  line(40, y1, width-40, y2);
  y1 = y1 + 10 ;
  y2 = y2 + 10 ;
}

*/

/* 5. Lösung

size(200, 200);
background(255);
float x = 20;

while (x <= height-20) {
  stroke(0);
  line(x, 20, x, width-20);
  x = x * 1.35 ;
}

*/

/* 6. Lösung

size(200, 200);
background(255);
float y = 20;

while (y <= height-20) {
  stroke(0);
  line(20, y, width-20, y);
  y = y * 1.35 ;
}

*/

/* 7. Lösung

size(200, 200);
background(255);

for (int x = 40; x <= width-40; x = x + 9) {
  if (x < 100) {
    line(x, 40, x, 120);
  } 
  if (x > 100) {
    line(x, 80, x, 160);
  }
}

*/

// 8. Lösung

size(200, 200);
background(255);

float x = 50;

for (int y = 40; y <= width-40; y = y + 20) {
  line(x, y, x+50, y);
}

x = 100;

for (int y = 50; y <= width-40; y = y + 20) {
  line(x, y, x+50, y);
}

