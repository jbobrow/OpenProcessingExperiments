
size(500, 500);
smooth();
background(255);

for (int i = 0; i <= width/2; i += 20) {
  for (int j = 0; j <= height; j += 40) {
    stroke(255);
    fill(255, 67, 42);
    strokeWeight(2);
    rect(i/2, j, 20, 20);
  }
}



