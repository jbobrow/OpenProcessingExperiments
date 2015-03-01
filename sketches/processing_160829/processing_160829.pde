
size(300,300);

colorMode(HSB, 360, 100, 100);
for (int i = 0; i < 300; i++) {
float newHue = 200 - (i*.1);
stroke(newHue, 90, 80);
line(i, 0, i, 300);
}




