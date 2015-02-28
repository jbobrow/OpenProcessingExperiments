
size(100,100);
smooth();
background(255);
 
for (int y = 10; y < 100; y += 5) {
  for (int x = 10; x < 100; x += 5) {
    noStroke();
    fill(x*5+y*2,x,y);
    ellipse(x, y, 5, 5);
  }
}



