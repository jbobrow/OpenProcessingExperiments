
size(100,100);
smooth();

for (int y = 10; y < 100; y += 20) {
  for (int x = 10; x < 100; x += 20) {
    
    fill(255);
    strokeWeight(1);
    fill(251,171,30);
    ellipse(x, y, 30, 30);
  }
}

