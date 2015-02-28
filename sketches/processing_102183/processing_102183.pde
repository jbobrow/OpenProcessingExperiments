
size(500,500);
fill(0, 76);
noStroke();
smooth();
for (int y = -10; y <= 500; y += 10) {
for (int x = -10; x <= 300; x += 10) {
ellipse(x + y/8.0, y + x/8.0, 15 + x/2, 10);
}
}
