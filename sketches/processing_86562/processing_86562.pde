
// Homework 1, 01-15-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu January 2013 Pittsburgh PA 15232

size(400, 400);
background(150);
smooth();

int i = 0;
int x = 30;
int y = 30;

while (i<=390) {
  stroke(255);
  line(0, i, 400, i);
  i = i + 10;
}

while (x <= 190 && y<= 190) {
  noStroke();
  rect(x, y, 10, 10);
  x = x + 10;
  y = y + 10;
}

noStroke();
fill(255, 100);
rect(200, 200, 20, 150);
rect(200, 350, 170, 20);

fill(200, 100);
triangle(0, 0, 400, 0, 400, 400);

stroke(250, 200, 0);
strokeWeight(5);
line(200, 30, 30, 200);
