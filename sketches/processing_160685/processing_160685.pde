

int y = 0;
int x = 0;
size(500, 500);

while (x < width) {
  while (y < height) {
    fill(random(y), 33, 75);
    rect(x, y, 10, 10);

    y = y + 10;
  } 
  x = x + 10;
  y = 0;
}

