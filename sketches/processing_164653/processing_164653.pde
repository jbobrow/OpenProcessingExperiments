
noStroke();
smooth();
for (int i=8; i<255; i=i+5)
fill(10, 76, i-20, 80);
for (int y = -10; y <= 100; y += 10) {
for (int x = -10; x <= 100; x += 10) {
ellipse(x + y/8.0, y + x/8.0, 15 + x/2, 10);
}
}



