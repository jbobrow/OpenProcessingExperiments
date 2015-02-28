
size(300, 300);
smooth();
background(255);


   
for (float y = 10; y <= height - 20; y = y + 80) {
  for (float x = 20; x <= height - 20; x = x + 20) {
    point(x,y);
    
    strokeWeight(10);
stroke(0);
rectMode(CENTER);
      rect(x, y, 20, 30);
  }
}


