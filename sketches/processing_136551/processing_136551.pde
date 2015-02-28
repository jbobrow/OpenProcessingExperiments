
size(600, 600);
for (int t = 1 ; t < 60; t++) {
  for (int s = 1 ; s < 60; s++) {
    stroke(255);
    fill(random(250),(s*t*0.1),(250),(s*t*0.1));
    smooth();
    ellipse(t*10, s*10, 20, 20);
  }
}

