

size(500, 400);
background(0);
smooth();
stroke(255);
strokeWeight(5);

int colorDot;

for (int i = 20; i < height; i+=10) {
  if (i < 390) {
    colorDot = i;
    stroke(colorDot/3, colorDot/3, colorDot/3);
    for (int j = 0; j < width; j += 50) {
      colorDot = i;
      stroke(colorDot/3, colorDot/3, colorDot/3);
      line(i, i, i+100, i);
      if (j < 390 && j > 10) {
        colorDot = j;
        fill(colorDot/3, colorDot/3, colorDot/3);
        noStroke();
        ellipse(j, j, 50, 50);
      }
    }
  }
}

