
size (600, 600);
background(50);
noFill();
stroke(HSB, 300);


for (int x = 0; x < width; x += 90) {
  for (int y = 0; y < height; y += 60) {
    stroke(x, x, y);
    ellipse(width/2, height/2, y, x);
  }
}


