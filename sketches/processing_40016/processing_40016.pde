
size(800,800);
background(255);
smooth();
 
 
for (float x = 5; x<width; x*=1.5) {
  for (float y = 5; y<height; y*=1.125) {
    strokeWeight(5);
    stroke(255,0,0);
    point(x, y);
  }
}

