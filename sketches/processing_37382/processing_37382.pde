
size(500, 500);
background(0);
smooth();

//points spaced every 50. 
for (int x = 50; x < width; x+=50) {
  for  (int y = 50; y<width; y+=50) {
    strokeWeight(5);
    stroke(255);
    point(x, y);
  }
}

//lines starting at 2. spacing increases by 1.5 each time x or y changes.
for (int x = 2; x < width; x*=1.5) {
  for (int y=2; y<width; y*=1.5) {
    strokeWeight(1);
    stroke(0, 150, 0);
    line(x, 0, x, width);
    line(0, y, height, y);
  }
}



