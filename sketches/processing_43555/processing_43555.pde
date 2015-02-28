
size(500, 500);
background(255);
smooth();
 
  //repetition
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
  fill(0);
  noStroke();
  ellipse(x, y, 40, 40);
}
}

for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
  fill(0);
  noStroke();
  ellipse(x, y, 30, 30);

 
  
}
}

 
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
  fill(255);
  noStroke();
  ellipse(x, y, 20, 20);
}
}
 
for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
  fill(0);
  noStroke();
  ellipse(x, y, 10, 10);
}
}

for (int y = 0; y <= height; y += 30) {
for (int x = 0; x <= width; x += 30) {
  fill(255);
  noStroke();
  ellipse(x, y, 5, 5);
}
}
