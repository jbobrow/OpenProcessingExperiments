
size(500, 500);
smooth();
background(255);
 
strokeWeight(2);
for (int y=20; y<height; y+= 6) {
  for (int x = 60; x<width; x += 5) {
    point (x+90, y/4);
    point (x, y/6);
    point (x+300, y-90);
    stroke(255);
    point (x^8, y);
    
    stroke(72, 1,1, 4);
    line (x/4, y*2, x+y, 300);
  }}


