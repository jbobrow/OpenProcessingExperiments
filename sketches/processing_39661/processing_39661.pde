
size(400, 400);


int d=50;

for (int y=0;y<height;y+=d) {
  for (int x=0;x<width;x+=d) {
    rect(x, y, d, d);
  }
}


