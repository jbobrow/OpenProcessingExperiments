

size(500, 500);
background(255);
smooth();
fill(250, 10);
stroke(50, 2);
for (int y = 0; y <= 500; y += 10) {
  for (int x = 0; x <= 500; x += 10) {
    ellipse(x + y, x + y, x + y, x + y);
   ellipse(x - y, x - y, x - y, x - y);
   ellipse(x*y, x*y, x - y, x - y);
    
  }
}




  //  saveFrame("comp1.png");
 

