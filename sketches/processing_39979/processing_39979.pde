
size (500, 500);
background (255);
smooth();


for (int x = 0; x < width; x+=30) {
  for (int y = 0; y < height; y+=30) {
    stroke(0);
    strokeWeight(0.75);
    noFill();
    ellipse(x, y, 400, 400);
  }
}


