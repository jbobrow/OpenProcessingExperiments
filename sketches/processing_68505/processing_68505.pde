
// Homework 1
// Hyunjoo Kim, hyunjook
// Copyright 2012 Hyunjoo Kim

size(400, 400 );

// Style
background(128, 87, 137);
smooth();

// Background
int y = 10;

while(y <= 380) {
  stroke(255);
  strokeWeight(0.5);
  line(y, 0, 0, y);
  y = y + 10;
}

y = 400;

while(y >= 0) {
  stroke(255);
  strokeWeight(0.5);
  line(0, y, 400-y, 400);
  y = y - 10;
}

// Letter H
y = 100;

while (y < 270) {
  stroke(255);
  strokeWeight(4); 
  line(70, y, 100, y); 
  y = y + 8;
}

int x = 108;

while (x < 170) {
  stroke(255);
  strokeWeight(4); 
  line(x, 170, x, 200); 
  x = x + 8;
}

y = 100;

while (y < 270) {
  stroke(255);
  strokeWeight(4); 
  line(170, y, 200, y); 
  y = y + 8;
}

// Letter K
y = 180;
x = 200;

while (y > 0 && x >= 200) {
  stroke(255);
  strokeWeight(4);
  line(x, y, x+30, y);
  y = y - 8;
  x = x + 8;
}

y = 188;
x = 200;

while (y < 400 && x >= 200) {
  stroke(255);
  strokeWeight(4);
  line(x, y, x+30, y);
  y = y + 8;
  x = x + 8;
}

// saveFrame( "hw1.jpg" );

