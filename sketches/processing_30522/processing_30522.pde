
size(600,600);
background(142,23,23);
smooth();



for (int x = 0; x <= 600; x += 5) {
line(x, 0, x, 600);
}

for (int y = 0; y <= 600; y += 5) {
line(0, y, 600, y);
}




saveFrame("grelhalinhas.jpg");

