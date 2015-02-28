
size(400 , 400);
background(255);
smooth();

for (int x = 0; x < width; x += 2) {
  for (int y = 5; y < height; y += 20) {
    stroke(11);
    strokeWeight(5);
    line (x, y, x, y);
  }
}
 
 
for (int x = 0; x < width; x += 4) {
  for (int y = 5; y < height; y += 20) {
    stroke(4);
    strokeWeight(1);
    line (x, y, x, y);
  }
}
 
 
for (int x = 0; x < width; x += 20) {
  for (int y = 0; y < height; y += 20) {
    fill(123,234,222);
    stroke(11);
    strokeWeight(11);
    line (x, y, x, y);
  }
}
 
 
 

