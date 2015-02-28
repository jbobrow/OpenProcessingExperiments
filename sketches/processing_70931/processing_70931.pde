
size(500,500);
colorMode(HSB);
for (int i =0;i<width;i++) {
  float myHue = 255/4 + i*255.0/(2*width);
  stroke(myHue,150,150);
  println(i*255.0/width);
  line(i, 0, i, height);
}


