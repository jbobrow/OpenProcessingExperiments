
//3.2 Verschachtelte Schleifen

size(300, 300);
smooth();
background(255);
   
strokeWeight(25);
stroke(0);
   
for (float y = 30; y <= height - 30; y = y + 30) {
  for (float x = 30; x <= width - 30; x = x + 30) {
    point(x,y);
  }
}






