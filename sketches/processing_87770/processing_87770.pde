
size(500, 500);
smooth();
background(0);

strokeWeight(10);
for (int y=10; y<height; y+= 8) {
  for (int x = 10; x<width; x += 5) { 

stroke(23);
point (x+90, y);
strokeWeight(2);
fill(56, 53, 9);

ellipse (x+300, y-90, 500, 300);
  }}


