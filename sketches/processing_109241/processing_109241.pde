
size (2000, 1500);
smooth();
colorMode(HSB, 360, 100, 100);
background(0, 0, 96);
noStroke();


for (int i = 20; i < width; i = i + 40) {
  for (int j = 20; j < height; j+=40) {
    color weee = color(random(360), 66, 66);
    ellipse(i, j, 20, 20);
    fill(weee);

    if ((i == 300 || j == 300)) {//black rows and columns
      fill(0);
    }
    else {
      fill (weee);
    }
  }
}
