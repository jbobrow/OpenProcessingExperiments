
size(480,120);
background(140,35,100);
smooth();
for (int y = 42; y<= height; y+= 10) {
for (int x = 22; x <= width; x += 17) {
ellipse(x + y, y, 22 - y/10.0, 22 - y/10.0);
}
}

