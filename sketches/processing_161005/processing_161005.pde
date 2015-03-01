
colorMode(HSB, 323, 87, 97);
for (int i = 0; i < 100; i++) {
  float newHue = 360 - (i*1.2);
  stroke(newHue, 100, 100);
  line(i, 0, i, 100);
}



