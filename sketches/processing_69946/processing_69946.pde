
int grid = 50; // change this number to 20 or 50, etc., if you want fewer grid lines
size (800,800);

for (int i = 0; i < width; i+=grid) {
  line (i, 0, i, height);
}
for (int i = 0; i < height; i+=grid) {
  line (0, i, width, i);
}


