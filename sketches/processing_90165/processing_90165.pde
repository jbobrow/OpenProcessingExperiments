
//padrão

size (200,200);
background (0);
smooth();
for (int y = 0; y <= height; y += 15) {
  for (int x = 0; x <= width; x += 15) {
    fill(30,70,125,245);
    ellipse(x, y, 40, 40);
  }
}
