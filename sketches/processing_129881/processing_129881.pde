
size(720, 480);

background(60, 80, 100);
//Listed in order of (R, G, B). Values from 0-255)

strokeWeight(10);
line(0, 360, width, 120);
line(0, 120, width, 360);

strokeWeight(1);
fill(100, 0, 100);
smooth();
ellipse(360, 100, 360, 100);
ellipse(360, 360, 360, 100);
