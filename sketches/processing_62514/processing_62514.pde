
size(300, 300);
smooth();
background(152,206,187);

float sizePoint = 10;
  
stroke(255, 100);
  
for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    point(x,y);
    
    strokeWeight(sizePoint);
    sizePoint = random (50);
  }
}


