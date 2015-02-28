
size(600, 600);
smooth();
background(255);

int i = 20;

noFill();
for (int x = -300; x< 3600; x += 20) {
  for (int y = -300; y< 3600 * 4; y += 20) {
    arc( x + 20, y + 20 , i * 5, i * 5, radians(0), radians(180));
  }
}



