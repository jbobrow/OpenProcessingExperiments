
size(400, 400);
background(0);
smooth();
fill(255);
stroke(75);
for (int y = 15; y <= height-15; y += 4) {
 for (int x = 15; x <= width-15; x += 4) {
  ellipse(x, y, 2, 2);
  line(x, y, 200, 200);
 }
}


