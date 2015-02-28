
size (200,200);
background (100,110,145);

smooth();
noStroke ();
fill (255,255,255,100);
for (int y = 0; y <= height; y += 15) {
  for (int x = 0; x <= width; x += 15) {
     ellipse(x, y, 15, 15);
  }
}
