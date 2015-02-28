
size(1200, 800);
smooth();
background(255);
noStroke();
colorMode(HSB, 360, 100, 100);

//HIRST CIRCLES
for (int i =50; i < width; i = i + 70) { //x
  for (int j = 50; j < height; j = j + 70) { //y
    color cool = color(random(360), 60, 80);
    fill(cool);
    ellipse(i, j, 40, 40);

//HORIZONTAL
    for (int zon = 50; zon < width; zon = zon + 70) {
      ellipse(zon, 120, 40, 40);
      fill(0);
//VERTICAL
      for (int vert = 50; vert < height; vert = vert + 70) {
        ellipse(50, vert, 40, 40);
        fill(0);
      }
    }
  }
}
