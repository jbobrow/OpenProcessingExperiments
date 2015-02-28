
size(500, 500);

int x = 15;
int y = 15;

for (int j = 0; j < 24; j++) {
  for (int i = 0; i < 24; i++) {
    rect(x, y, 10, 10);
    x = x+20;
  }
  y = y+20; // every time i is done write another line below
  x = 15; // well, you need to start from the left
}

