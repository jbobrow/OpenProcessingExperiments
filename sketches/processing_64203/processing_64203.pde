
size(800, 800);
smooth();
background(0);
  
strokeWeight(20);
stroke(255);
  
for (float y = random(0.1,height); y <= height - 30; y = y + 30) {
  for (float x = random(0.1,width); x <= width - 30; x = x + 30) {
    ellipse(x,y,3,3);
  }
}


