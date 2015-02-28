
size(600, 600);
background(200);
smooth();

for (int x=0; x<height; x+=50) {
  for (int y=0; y<width; y+=50) {
      fill(255, 0, 30);
      rect(x, y, random(20), random(20));
  }
}


