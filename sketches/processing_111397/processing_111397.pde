
size(600, 600);
smooth();
background(255);

noFill();
for (int x = 0; x < width; x += 20) {
  for (int y = 0; y< height; y += 20) {
    arc( x, y, 20, 20, radians(0), radians(90));
    arc( x, y, 20, 20, radians(180), radians(270));
  }
}



