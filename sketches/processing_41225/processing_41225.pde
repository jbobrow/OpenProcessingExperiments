
size(800, 800);
smooth();
background(255);

strokeWeight(2);
for (int y=20; y<height; y+= 6) {
  for (int x = 20; x<width; x += 5) {
    point (x, y/4);
    point (x, y/6);
    point (x+40, y-90);
    point (x^8, y);
    point (x/2, y-50);
    point (x/4, y*2);
  }
}





