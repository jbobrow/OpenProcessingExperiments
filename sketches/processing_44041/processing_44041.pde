


size(500, 500);
background(250,209,61);
smooth();
noStroke();

for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x += 40) {
    
    fill(random (255));
    ellipse(x, y, 40, 40);
  }
}


