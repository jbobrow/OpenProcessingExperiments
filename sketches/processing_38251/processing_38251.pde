
size(400, 400);  
background(255);

int increment =20;

for (int y = 0; y<height; y+=increment) {
  for (int x = 0; x<width; x+=increment) {
    line(2*(x+y), 0, 2*(y+y), height);
  }

  
}



