
size(500, 200);
background(170, 198, 170);
smooth();
for (int y = 32; y <= height; y += 8) {
for (int x = 12; x <= width; x += 15) {
ellipse(x + y, y, 16 - y/10.0, 16 - y/10.0);
}
}

