
colorMode(HSB, 360, 100, 100);
for (int i=0; i<100; i++) {
  float newHue = 360 - (i*1.2);
  stroke (newHue, 70, 80);
  line(i, 0, i, 100);
}
