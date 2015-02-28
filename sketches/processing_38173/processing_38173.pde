
size(400, 400);
background(50, 50, 255);
smooth();

for (int y = 0; y < 400; y++) {
  for (int x = 0; x < 400; x++) {
    stroke(100, y, 100);
    point(x, y);
  }
}


fill( 10, 60, 120, 50);
noStroke();



for (int y=0; y<height; y+=50) {
  for (int x=0; x<width; x+=100) {
    triangle(x, y, 60, 30, 200, 200);
  }
}


