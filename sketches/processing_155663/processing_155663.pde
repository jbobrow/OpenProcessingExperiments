
noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}
ellipse(55, 26, 55, 55); // it doesnt really do anything
rect(15, 20, 55, 55); // it really doesnt do anything
quad(38, 31, 86, 20, 69, 63, 30, 76);
triangle(30, 75, 58, 20, 86, 75);
noSmooth();
line(0, 10, 35, 35);


