
size(300, 300);
smooth();
background(255);
  
strokeWeight(10);
stroke(0);
  
for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    point(x,y);
  }
}


