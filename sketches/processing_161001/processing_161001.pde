
//.09 was calculated by the difference of the two hues/600)

size (600, 600);
smooth ();
colorMode (HSB, 360, 100, 100);
for (int i = 0; i < 600; i++) {
  float newHue =  248 - (i * .09);
  stroke (newHue, 43, 88);
  line (i, 0, i, 600);
  
}



