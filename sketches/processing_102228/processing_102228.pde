
final int DX = 16, DY = DX;
final color DEFAULT_BG = color(50, 50, 50);
final color[] COLORS = {
  color(#ff3333),
  color(#4fff55),
  color(#585eff),
  color(#ebff55),
  color(#FF55D5),
};
 
void setup() {
  size(800, 480);
  background(DEFAULT_BG);
  noSmooth();
  for (int x = 0; x < width; x += DX) {
    for (int y = 0; y < height; y += DY) {
      line(x, y, x + 16, y + 16);
      line(x + 16, y, x, y + 16);
    }
  }
 
  for (int x = 0; x < width; x += 4) {
    for (int y = 0; y < height; y += 4) {
      if (get(x, y) == DEFAULT_BG) {
        color f = COLORS[(int)random(COLORS.length)];
        println(red(f));
        floodFill(x, y, DEFAULT_BG, color(red(f), green(f), blue(f)));
      }
    }
  }
}
 
void floodFill(final int x, final int y, final color from, final color to) {
 
  if (x < 0 || y < 0 || x >= width || y >= height || from == to || get(x, y) != from) {
    return;
  }
  else {
    set(x, y, to);
    floodFill(x    , y + 1, from, to);
    floodFill(x    , y - 1, from, to);
    floodFill(x + 1, y    , from, to);
    floodFill(x - 1, y    , from, to);
  }
}
