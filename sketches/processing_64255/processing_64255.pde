
size(300, 300);
smooth();
background(255);
    
strokeWeight(1);
stroke(0);
    
for (float y = 20; y <= height - 20; y = y + 20) {
  for (float x = 20; x <= width - 20; x = x + 20) {
    point(x,y);
  }
}


