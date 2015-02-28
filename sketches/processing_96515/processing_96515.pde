
size (200, 200);
background (255);
for (int i=1; i<70; i=i+15) {
  if (i>45) {
    stroke (0, 255, 0);
  }
  else {
    stroke (0);
    }
    line (20, i*3, 80, i*2);
}
