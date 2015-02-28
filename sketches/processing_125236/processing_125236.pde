
size(400, 400);
background(255);

rectMode(CENTER);
fill(0);

float x = 10;
float y = 10;
float w = 10;

for (int i = 0; i < 12; i++) {
  w = sin( (100-x) / 50) * 20 + 22;
  for (int j = 0; j<10; j++) {
    y = j * 30 + 60;
    rect(x, y, w, 20);
  }
  x = x + w + 5;
}

float x2 = 20;
float y2 = 20;
float w2 = 20;

for (int i2 = 0; i2 < 12; i2++) {
  w2 = sin( (150-x2) / 10) * 5 + 3;
  for (int j2 = 0; j2<10; j2++) {
    y2 = j2 * 10 + 60;
    rect(x2+250, y2, w2, 10);
  }
  x2 = x2 + w2 + 35;
}

// test

float x3 = 5;
float y3 = 5;
float w3 = 5;

while (x3 < 400) {
  while (y3 < 145) {
   w3 = sin( (200-x3) / 10) * 2 + 12;
    ellipse(x3+265, y3+210, w3, 5);
    y3 = y3 + 20;
  }
  x3 = x3 + 20;
  y3 = 5;
}
