
size (500, 500);

float r = 0; // red
float xdense = 0.02; // horizontal noise
float ydense = 0.02; // vertical noise

for (int y = 0; y < height; y++) {
  for (int x = 0; x < width; x++) {
    r = noise(x*xdense, y*ydense);
    stroke(r * 255, 0, 0);
    point(x, y);
  }
}
