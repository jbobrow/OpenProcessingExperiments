
size(500,500);
background(47,47,47);

translate (0,-100);

for (int i = 10; i < height; i += 10) {
  stroke(255);
  if (i < 30) {
    fill(255,65,65,100);
  }
  strokeWeight (20);
  ellipse (i/2,i,200,100);
  
}





