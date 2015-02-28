
size(800, 800); 
background(0); 
smooth(); 
for (int y = 0; y <= height; y += 10) {
  for (int x = 0; x <= width; x += 10) { 
    ellipse(x - y, y, y/10, y/10);
    ellipse(x + y, y, y/10, y/10);
  }
}


