
size(800, 800);
smooth();
background(0);
  
strokeWeight(20);
stroke(255);
  
for (float y = 80; y <= height - 80; y = y + 80) {
  for (float x = 80; x <= width - 80; x = x + 80) {
    point(x,y);
  }
}


